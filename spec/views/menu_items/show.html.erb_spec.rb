require 'spec_helper'

describe "menu_items/show" do
  before(:each) do
    @menu_item = assign(:menu_item, stub_model(MenuItem,
      :restaurant_id => 1,
      :content => "Content",
      :added_by => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Content/)
    rendered.should match(/2/)
  end
end
