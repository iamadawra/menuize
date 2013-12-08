require 'spec_helper'

describe "menu_items/new" do
  before(:each) do
    assign(:menu_item, stub_model(MenuItem,
      :restaurant_id => 1,
      :content => "MyString",
      :added_by => 1
    ).as_new_record)
  end

  it "renders new menu_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", menu_items_path, "post" do
      assert_select "input#menu_item_restaurant_id[name=?]", "menu_item[restaurant_id]"
      assert_select "input#menu_item_content[name=?]", "menu_item[content]"
      assert_select "input#menu_item_added_by[name=?]", "menu_item[added_by]"
    end
  end
end
