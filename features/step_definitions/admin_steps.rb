Given /^"(.*?)" wants to legitimately claim "(.*?)"/ do |owner, rest|
  email("Business Owner", :with => owner)
  email("Restaurant", :with => rest)
  submit("email")
end

Given /^"(.*?)" wants to illegitimately claim "(.*?)"/ do |owner, rest|

end

Given /^"(.*?)" creates "(.*?)" as an owner/ do |owner, rest|
  email("Business Owner", :with => owner)
  email("Restaurant", :with => rest)
  submit("email")
end
