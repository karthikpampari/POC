class OrdersController < ApplicationController
  before_action :order_present  

  def index
    if params[:format].present?
      @items = Item.where(food_type: params[:format])
      if(params[:format]=="veg")
        @flag1,@flag2,@flag3 = "active"," "," ";
      else 
        @flag2,@flag1,@flag3 = "active"," "," ";
      end
    else 
      @flag3,@flag1,@flag2 = "active"," "," ";
      @items = Item.all
    end 
    @order = Order.find(session[:order_id])
    @order_items = @order.order_items
  end
  
  def all_orders 
   @orders = Order.all
  end 

  def place_order
    @order = Order.find(session[:order_id])
    @order_items = @order.order_items 
    @order.total=params[:total].to_i
    @order.save
    session[:order_id]=nil
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



