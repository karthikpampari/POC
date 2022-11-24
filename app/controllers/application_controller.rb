class ApplicationController < ActionController::Base
    before_action :order_present

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
