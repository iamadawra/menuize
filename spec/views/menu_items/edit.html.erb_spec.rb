require 'spec_helper'

describe "menu_items/edit" do
  before(:each) do
    @menu_item = assign(:menu_item, stub_model(MenuItem,
      :restaurant_id => 1,
      :content => "MyString",
      :added_by => 1
    ))
  end

  it "renders the edit menu_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", menu_item_path(@menu_item), "post" do
      assert_select "input#menu_item_restaurant_id[name=?]", "menu_item[restaurant_id]"
      assert_select "input#menu_item_content[name=?]", "menu_item[content]"
      assert_select "input#menu_item_added_by[name=?]", "menu_item[added_by]"
    end
  end
end
