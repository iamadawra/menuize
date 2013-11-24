Given /^the following users exist/ do |table|
  table.hashes.each do |user|
    User.create(user)
  end
end

Given /^the current user is "(.*)" with password "(.*)"/ do |user, pass|
  visit '/login/'
  fill_in("email", :with => user)
  fill_in("password", :with => pass)
  click_button("Log in")
end

Given /^I sign up as "(.*)" with password "(.*)"/ do |username, password|
  visit '/signup/'
  fill_in("user[email]", :with => username)
  fill_in("user[password]", :with => password)
  fill_in("user[password_confirmation]", :with => password)
  click_button("Signup")
end

