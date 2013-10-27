require 'spec_helper'

describe "restaurants/new" do
  before(:each) do
    assign(:restaurant, stub_model(Restaurant,
      :name => "MyString",
      :status => "MyString",
      :owned_by => 1,
      :restaurant_id => 1,
      :owner_name => "MyString"
    ).as_new_record)
  end

  it "renders new restaurant form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", restaurants_path, "post" do
      assert_select "input#restaurant_name[name=?]", "restaurant[name]"
      assert_select "input#restaurant_status[name=?]", "restaurant[status]"
      assert_select "input#restaurant_owned_by[name=?]", "restaurant[owned_by]"
      assert_select "input#restaurant_restaurant_id[name=?]", "restaurant[restaurant_id]"
      assert_select "input#restaurant_owner_name[name=?]", "restaurant[owner_name]"
    end
  end
end
