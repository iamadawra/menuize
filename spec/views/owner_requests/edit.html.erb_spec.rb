require 'spec_helper'

describe "owner_requests/edit" do
  before(:each) do
    @owner_request = assign(:owner_request, stub_model(OwnerRequest,
      :user_id => 1,
      :restaurant_id => 1,
      :restaurant_name => "MyString",
      :granted => 1,
      :granted_by => 1
    ))
  end

  it "renders the edit owner_request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", owner_request_path(@owner_request), "post" do
      assert_select "input#owner_request_user_id[name=?]", "owner_request[user_id]"
      assert_select "input#owner_request_restaurant_id[name=?]", "owner_request[restaurant_id]"
      assert_select "input#owner_request_restaurant_name[name=?]", "owner_request[restaurant_name]"
      assert_select "input#owner_request_granted[name=?]", "owner_request[granted]"
      assert_select "input#owner_request_granted_by[name=?]", "owner_request[granted_by]"
    end
  end
end
