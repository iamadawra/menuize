require 'spec_helper'

describe "owner_requests/show" do
  before(:each) do
    @owner_request = assign(:owner_request, stub_model(OwnerRequest,
      :user_id => 1,
      :restaurant_id => 2,
      :restaurant_name => "Restaurant Name",
      :granted => -1,
      :granted_by => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Restaurant Name/)
    rendered.should match(/-1/)
    rendered.should match(/4/)
  end
end
