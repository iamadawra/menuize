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
