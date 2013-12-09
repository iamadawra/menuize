require "spec_helper"

describe OwnerRequestsController do
  describe "routing" do

    it "routes to #new" do
      get("/owner_requests/new").should route_to("owner_requests#new")
    end

    it "routes to #show" do
      get("/owner_requests/1").should route_to("owner_requests#show", :id => "1")
    end

    it "routes to #create" do
      post("/owner_requests").should route_to("owner_requests#create")
    end

  end
end
