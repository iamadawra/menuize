class UserMailer < ActionMailer::Base
  from: "no-reply@menuize.herokuapp.com"

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Welcome to Menuize!")
  end
end

