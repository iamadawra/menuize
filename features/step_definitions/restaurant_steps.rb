Given /^the current user is "(.*?)" with password "(.*?)"/ do |user, pass|
  visit '/login/'
  fill_in("username", :with => user)
  fill_in("password", :with => pass)
  click_button("Submit")
end

Then /^the restaurant "(.*)" should be editable/ do |restaurant|
  r = Restaurant.find_by_name(restaurant)
  r.status.should eq("Collaborative")
end

Then /^the restaurant "(.*)" should not be editable/ do |restaurant|
  r = Restaurant.find_by_name(restaurant)
  r.status.should eq("Exclusive")
end

Then /^I should reach the show page for (.*)/ do |restaurant|
  restaurants_path(Restaurant.find_by_name(restaurant))
end

Given /the following restaurants exist/ do |restaurant_table|
  restaurant_table.hashes.each do |restaurant|
    Restaurant.create(restaurant)
  end
end
