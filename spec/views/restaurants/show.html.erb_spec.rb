require 'spec_helper'

describe "restaurants/show" do
  before(:each) do
    @restaurant = assign(:restaurant, stub_model(Restaurant,
      :name => "Name",
      :status => "Status",
      :owned_by => 1,
      :restaurant_id => 2,
      :owner_name => "Owner Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Status/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Owner Name/)
  end
end
