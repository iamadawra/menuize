def login(username, password)
  visit "/login"
  fill_in("email", :with => username)
  fill_in("password", :with => password)
  click_button("Log in")
end

Given /^"(.*)" with password "(.*)" should be able to edit "(.*)"/ do |username, password, rest|
  login(username, password)
  visit "restaurants/" + Restaurant.find_by_name(rest).id.to_s
  Then "I should see \"Edit Restaurant\""
end

Given /^"(.*)" with password "(.*)" should not be able to edit "(.*)"/ do |username, password, rest|
  login(username, password)
  visit "restaurants/" + Restaurant.find_by_name(rest).id.to_s
  Then "I should not see \"Edit Restaurant\""
end

Given /^I follow "(.*)" for "(.*)"/ do |action, restaurant|
  id = Restaurant.find_by_name(restaurant).id
  all("tr").each do |tr|
    if tr.has_content?(restaurant)
      tr.find_link(action).click
      break
    end
  end
end

Given /^I visit the admin page for pending approvals/ do
  visit "/admin/restaurants?order=id_desc&page=1&scope=pending_approval"
end

Given /^"(.*)" with password "(.*)" has requested ownership of "(.*)"/ do |user, password, restaurant|
  login(user, password)
  restaurant_id = Restaurant.find_by_name(restaurant).id
  visit("/restaurants/" + restaurant_id.to_s + "/edit")
  Given "I select \"Exclusive\" from \"restaurant[status]\""
  And "I press \"Update Restaurant\""
end

Given /^I am logged in as admin$/ do
  create_admin_user_and_logout_if_needed
  user = AdminUser.find_by_email "admin@example.com"
  visit "/admin/login"
  fill_in "Email", :with => "admin@example.com"
  fill_in "Password", :with => "password"
  click_button "Login"
  Then "I should see \"Signed in successfully.\""
end

def create_admin_user_and_logout_if_needed
  step 'an admin user "admin@example.com" exists'

  if page.all(:css, "a", :text => "Logout").size > 0
    click_link "Logout"
  end
end

Given /^an admin user "(.*)" exists$/ do |admin_email|
  user = AdminUser.find_or_create_by_email :email => admin_email,
                                           :password => "password",
                                           :password_confirmation => "password"

  unless user.persisted?
    puts "Coult not create an admin user #{admin_email}: #{user.errors.full_messages}"
    raise "Could not create an admin user"
  end
end
