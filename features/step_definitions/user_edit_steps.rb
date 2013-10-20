And /^the View Business Page should show (.*) as (.*)$/ do |info, content|
  r = Restaurant.where(info+'=?', content)
  r[:info].should eq(content)
end