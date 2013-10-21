Then /^the restaurant (.*) should be editable$/ do |restaurant|
  r = Restaurant.where("name = ?", restaurant)
  r[:editable].should eq(true)
end

Then /^the restaurant (.*) should not be editable$/ do |restaurant|
  r = Restaurant.where("name = ?", restaurant)
  r[:editable].should eq(false)
end

Given /the following restaurants exist/ do |restaurant_table|
  restaurant_table.hashes.each do |restaurant|
    Restaurant.create(restaurant)
  end
end