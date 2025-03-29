class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'You Have Successfully created Account!', from: 'rmishra747728@gmail.com') do |format|
      format.html
    end
  end

  def send_email_for_approval(leave, admin)
    @teacher = Teacher.find(leave.approval_id)
    @admin = admin
    @leave = leave
    mail(to: [@teacher.email, @admin.email], subject: 'Leave application received!', from: 'rmishra747728@gmail.com') do |format|
      format.html
    end
  end

  def send_email_update_status(leave, user)
    @leave = leave
    @user = user
    @parent = Parent.find_by(id: leave.user&.parent_id)
    mail(to: [@user.email, @parent&.email], subject: 'Leave application received!', from: 'rmishra747728@gmail.com') do |format|
      format.html
    end
  end
end
