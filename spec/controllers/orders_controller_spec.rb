require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
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

    context "GET all orders" do
        it "returns a successful response" do
            get :all_orders
            expect(response).to be_successful
            expect(response.status).to eq(200) 
        end

        it "returns all orders" do
            get :all_orders
            expect(assigns(:orders)).to eq(Order.all)
        end

        it "renders the all_orders template" do
            get :all_orders
            expect(response).to render_template("all_orders")
        end

    end 

    context "POST place_order" do
        
        it "returns a successful response" do
            post :place_order,params: {total: 220}
            expect(response).to be_successful  
            expect(response.status).to eq(204)
        end 

        it " places an order " do
            post :place_order,params: {total: 220}
            expect(assigns(:order)).to be_truthy  
        end

        it "make order_id nil if placed" do
            post :place_order,params: {total: 220}
            expect(session[:order_id]).to be_falsy  
        end

    end 
end