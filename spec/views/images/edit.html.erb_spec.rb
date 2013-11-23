require 'spec_helper'

describe "images/edit" do
  before(:each) do
    @image = assign(:image, stub_model(Image,
      :restaurant_id => 1,
      :user_id => 1,
      :shown => false
    ))
  end

  it "renders the edit image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", image_path(@image), "post" do
      assert_select "input#image_restaurant_id[name=?]", "image[restaurant_id]"
      assert_select "input#image_user_id[name=?]", "image[user_id]"
      assert_select "input#image_shown[name=?]", "image[shown]"
    end
  end
end
