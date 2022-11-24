class OrderItemsController < ApplicationController
    before_action :order_present

    def index 
      @order = Order.find(session[:order_id])
      @order_items = @order.order_items
    end

    def create     
        @order = Order.find(session[:order_id])  
        @item  = Item.find(params[:item_id].to_i)
        @quantity = params[:quantity].to_i

        if @order.order_items.find_by(productid: @item.id)
          @order_item = @order.order_items.find_by(productid: @item.id)
          @order_item.quantity = @quantity
          @order_item.subtotal = @item.price * @order_item.quantity
          @order_item.save
        else 
          @orderitem=@order.order_items.create(productid: @item.id,product_name: @item.name,quantity: @quantity, subtotal: @item.price*@quantity)
        end 
        redirect_to request.referer
    end 
    
    def destroy
      @order = Order.find(session[:order_id])
      @order_item=@order.order_items.find(params[:id])
      @order_item.destroy
      flash[:notice] = "successfully deleted"
      redirect_to request.referer
    end 

    def delete
        @order = Order.find(session[:order_id])
        @order.order_items.destroy_all
        redirect_to request.referer
    end 

    private

    def order_present 
      if session[:order_id]
        session[:order_id]
      else 
        @order=Order.create
        session[:order_id]=@order.id
      end 
    end    
end
