require 'spec_helper'

describe "restaurants/index" do
  before(:each) do
    assign(:restaurants, [
      stub_model(Restaurant,
        :name => "Name",
        :status => "Status",
        :owned_by => 1,
        :restaurant_id => 2,
        :owner_name => "Owner Name"
      ),
      stub_model(Restaurant,
        :name => "Name",
        :status => "Status",
        :owned_by => 1,
        :restaurant_id => 2,
        :owner_name => "Owner Name"
      )
    ])
  end

  it "renders a list of restaurants" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Owner Name".to_s, :count => 2
  end
end
