Given (/^the following restaurant exists$/) do |restaurant_table|
  restaurant_table.hashes.each do |restaurant|
    Restaurant.create(restaurant)
  end
end

When (/^I fill in the following$/) do |table|
  r = Restaurant.where('name=?', table[0][0])
  r[:Open_Time] = table[0][3]
  r[:Close_Time] = table[0][4]
  r[:MenuItems] = table[0][5]
end

And (/^(.*) should have Close Time equals (.*)$/) do |name, time|
  r = Restaurant.where('name=?', name)
  r[:Close_Time].should eq(time)
end
