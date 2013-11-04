Given (/^the following restaurant exists$/) do |restaurant_table|
  restaurant_table.hashes.each do |restaurant|
    Restaurant.create(restaurant)
  end
end

And (/^"(.*)" should have Close Time equals "(.*)"$/) do |name, time|
  r = Restaurant.find_by_name(name)
  timeArr = time.split(" ")
  num = timeArr[0].to_i
  num = num + 12 if timeArr[1] == "pm"
  r.close_time.should eq(num)
end
