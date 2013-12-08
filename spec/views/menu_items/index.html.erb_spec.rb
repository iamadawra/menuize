require 'spec_helper'

describe "menu_items/index" do
  before(:each) do
    assign(:menu_items, [
      stub_model(MenuItem,
        :restaurant_id => 1,
        :content => "Content",
        :added_by => 2
      ),
      stub_model(MenuItem,
        :restaurant_id => 1,
        :content => "Content",
        :added_by => 2
      )
    ])
  end

  it "renders a list of menu_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
