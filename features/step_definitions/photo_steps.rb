When /^I attach "(.*)"$/ do |image|
  path = Rails.root.join('test').to_s + "/" + image
  attach_file("restaurant[file]", path)
end

Then /^the page should have the "(.*)" image/ do |im|
  page.should have_selector("img[alt = \"#{im}\"]")
end
