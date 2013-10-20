Then /^the restaurant (.*) should be editable$/ do |restaurant|
  r = Restaurant.where("name = ?", restaurant)
  r[:editable].should eq(true)
end

Then /^the restaurant (.*) should not be editable$/ do |restaurant|
  r = Restaurant.where("name = ?", restaurant)
  r[:editable].should eq(false)
end
