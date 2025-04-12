class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'You Have Successfully created Account!', from: 'rmishra747728@gmail.com') do |format|
      format.html
    end
  end

  def send_email_for_approval(leave, admin)
    @teacher = Teacher.find(leave.approval_id) unless leave.user.role == 'Teacher'
    @admin = admin
    @leave = leave
    @student = leave.user
    @parent = @student.parent
    mail(to: [@teacher&.email, @admin.email], subject: 'Leave application received!', from: 'rmishra747728@gmail.com') do |format|
      format.html
    end
  end

  def send_email_update_status(leave, user)
    @leave = leave
    @user = user
    @parent = Parent.find_by(id: leave.user&.parent_id)
    mail(to: [@user.email, @parent&.email], subject: 'Your Leave status updated!', from: 'rmishra747728@gmail.com') do |format|
      format.html
    end
  end

  def send_email_for_early_leave_approval(leave)
    @leave = leave
    @user = leave.user
    @parent = @user.parent
    @securities = Security.pluck(:email) if @leave.status == 'approved'

    recipients = [@user.email, @parent&.email, *@securities].compact

    mail(to: recipients, subject: 'Leave application received!', from: 'rmishra747728@gmail.com') do |format|
      format.html
    end
  end
end
