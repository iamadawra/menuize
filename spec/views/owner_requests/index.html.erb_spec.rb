require 'spec_helper'

describe "owner_requests/index" do
  before(:each) do
    assign(:owner_requests, [
      stub_model(OwnerRequest,
        :user_id => 1,
        :restaurant_id => 2,
        :restaurant_name => "Restaurant Name",
        :granted => 3,
        :granted_by => 4
      ),
      stub_model(OwnerRequest,
        :user_id => 1,
        :restaurant_id => 2,
        :restaurant_name => "Restaurant Name",
        :granted => 3,
        :granted_by => 4
      )
    ])
  end

  it "renders a list of owner_requests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Restaurant Name".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
