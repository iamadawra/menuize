require "spec_helper"

describe ImagesController do
  describe "routing" do

    it "routes to #destroy" do
      delete("/images/1").should route_to("images#destroy", :id => "1")
    end

  end
end
