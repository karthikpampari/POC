require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do
    subject {FactoryBot.create(:order_item)}

    context "GET index" do
        it "returns a successful response" do
          get :index
          expect(response).to be_successful
          expect(response.status).to eq(200) 
        end

        it "return all order_items" do
          get :index
          order = Order.find(session[:order_id])
          order.order_items << subject 
          expect(assigns(:order_items)).to eq(order.order_items)
        end

    end

    context "post create" do
      it "returns a successful response" do
        item = FactoryBot.create(:item)
        order = Order.create()
        session[:order_id] = order.id
        post :create, params:{item_id: item.id, quantity: 2}
        expect(order.order_items).to_not be_empty
        expect(response).to redirect_to orders_path
      end
    end

    context "delete destroy " do
      it "deltes the order_item " do
        order = Order.create()
        session[:order_id] = order.id
        order.order_items << subject
        delete :destroy, params:{id: subject.id}
        expect(assigns(:order_item).destroy).to be_truthy
        expect(response).to redirect_to order_items_path
        
      end
    end

    context "get delete " do
      it "deletes all order_items " do
        order = Order.create()
        session[:order_id] = order.id
        order.order_items << subject
        get :delete
        expect(assigns(:order).order_items.destroy_all).to be_truthy
        expect(response).to redirect_to order_items_path
      end
    end
end