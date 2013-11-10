require "spec_helper"

describe OwnerRequestsController do
  describe "routing" do

    it "routes to #index" do
      get("/owner_requests").should route_to("owner_requests#index")
    end

    it "routes to #new" do
      get("/owner_requests/new").should route_to("owner_requests#new")
    end

    it "routes to #show" do
      get("/owner_requests/1").should route_to("owner_requests#show", :id => "1")
    end

    it "routes to #edit" do
      get("/owner_requests/1/edit").should route_to("owner_requests#edit", :id => "1")
    end

    it "routes to #create" do
      post("/owner_requests").should route_to("owner_requests#create")
    end

    it "routes to #update" do
      put("/owner_requests/1").should route_to("owner_requests#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/owner_requests/1").should route_to("owner_requests#destroy", :id => "1")
    end

  end
end
