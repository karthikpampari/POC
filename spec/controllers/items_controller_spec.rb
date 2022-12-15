require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
    context "GET index" do
        it "returns a successful response" do
          get :index
          expect(response).to be_successful
          expect(response.status).to eq(200) 
        end
        it " veg filtering " do
            get :index, params: {format: "veg"}
            expect(assigns(:flag1)).to eq("active")
        end
        it " non-veg filtering " do
            get :index, params: {format: "non-veg"}
            expect(assigns(:flag2)).to eq("active")
        end
        it " all filtering " do
            get :index
            expect(assigns(:flag3)).to eq("active")
        end
    end
end 