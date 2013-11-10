class UserMailer < ActionMailer::Base
  default from: "no-reply@menuize.herokuapp.com"

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Welcome to Menuize!")
  end
  def access_request(user, restaurant)
  	@user = user
  	@restaurant = restaurant
    mail(:to => "Menuize Team <menuize@gmail.com>", :subject => "Approval Request for #{restaurant.name}")
  end
end

