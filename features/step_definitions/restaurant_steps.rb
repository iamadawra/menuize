Then /^the restaurant "(.*)" should be editable/ do |restaurant|
  r = Restaurant.find_by_name(restaurant)
  r.status.should eq("Collaborative")
end

Then /^the restaurant "(.*)" should be awaiting approval/ do |restaurant|
  r = Restaurant.find_by_name(restaurant)
  r.status.should eq("Pending Approval")
end

Then /^I should reach the show page for (.*)/ do |restaurant|
  restaurants_path(Restaurant.find_by_name(restaurant))
end

Given /the following restaurants exist/ do |restaurant_table|
  restaurant_table.hashes.each do |restaurant|
    Restaurant.create(restaurant)
  end
end

Given /^I browse restaurants without logging in/ do
  visit '/logout'
  visit '/restaurants'
end

And (/^"(.*)" should have Close Time equals "(.*)"$/) do |name, time|
  r = Restaurant.find_by_name(name)
  timeArr = time.split(" ")
  num = timeArr[0].to_i
  num = num + 12 if timeArr[1] == "pm"
  r.close_time.should eq(num)
end

Then /^I should see "(.*)" in the row for "(.*)"/ do |value, rowname|
  has_value_in_row = false
  all("tr").each do |tr|
    if tr.has_content?(rowname) && tr.has_content?(value)
      has_value_in_row = true
    end
  end
  assert has_value_in_row
end

Then /^I should not see "(.*)" in the row for "(.*)"/ do |value, rowname|
  has_value_in_row = false
  all("tr").each do |tr|
    if tr.has_content?(rowname) && tr.has_content?(value)
      has_value_in_row = true
    end
  end
  assert !has_value_in_row
end

When /^I delete "(.*)"/ do |restaurant|
  click_link "Delete This Restaurant"
end

Then /there should be "(.*)" menu item boxes/ do |number|
  x = Integer(number)
  count = 0
  all(".item-field").each do |item_field|
    count+=1
  end
  assert count == x
end

When /I hover over and click on remove link/ do
  links = all(".remove-link")
  links[0].click
end

