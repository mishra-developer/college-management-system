class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'You Have Successfully created Account!', from: 'rmishra747728@gmail.com') do |format|
      format.html
    end
  end
end
