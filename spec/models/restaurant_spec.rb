# == Schema Information
#
# Table name: restaurants
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  status        :string(255)
#  owned_by      :integer
#  restaurant_id :integer
#  owner_name    :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  description   :string(255)
#  address       :string(255)
#  city          :string(255)
#  zip           :integer
#  category      :string(255)
#  menu          :string(255)
#  open_time     :integer
#  close_time    :integer
#

require 'spec_helper'

describe Restaurant do
  before(:each) do
    @test1 = Restaurant.create!("name" => "Subway", "zip" => "94720")
    @test2 = Restaurant.create!("name" => "Thai Basil", "zip" => "94720")
    @test3 = Restaurant.create!("name" => "Oscar's Hot Dogs", "zip" => "94709")
  end

  describe "search by name" do
    it "should return all restaurants matching the name" do
      #test_restaurant = Restaurant.create("name" => "Oscar's Hot Dogs", "zip" => "94709")
      test_by_name = Restaurant.search("Hot Dogs", nil)
      test_by_name.should have(1).items
      test_by_name.should include(@test3)
    end
    it "should return all restaurants if no name specified" do
      test_no_name = Restaurant.search(nil, nil)
      test_no_name.should have(3).items
      test_no_name.should include(@test1, @test2, @test3)
    end
    it "should return no restaurants if none match" do
      test_none = Restaurant.search("McDonalds", nil)
      test_none.should have(0).items
    end
  end

  describe "search by zip" do
    it "should return all restaurants matching name and zip" do
      test_by_zip = Restaurant.search("Subway", "94720")
      test_by_zip.should have(1).items
      test_by_zip.should include(@test1)
    end
    it "should return all restaurants matching zip if no name" do
      test_no_name = Restaurant.search(nil, "94709")
      test_no_name.should have(1).items
      test_no_name.should include(@test3)
    end
    it "should return no restaurants if none match" do
      test_none = Restaurant.search("Subway", "94709")
      test_none.should have(0).items
    end
  end
end
