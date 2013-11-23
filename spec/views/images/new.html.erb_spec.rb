require 'spec_helper'

describe "images/new" do
  before(:each) do
    assign(:image, stub_model(Image,
      :restaurant_id => 1,
      :user_id => 1,
      :shown => false
    ).as_new_record)
  end

  it "renders new image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", images_path, "post" do
      assert_select "input#image_restaurant_id[name=?]", "image[restaurant_id]"
      assert_select "input#image_user_id[name=?]", "image[user_id]"
      assert_select "input#image_shown[name=?]", "image[shown]"
    end
  end
end
