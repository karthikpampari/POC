class ItemsController < ApplicationController
  def index
    if params[:format].present?
      @items = Item.where(food_type: params[:format])
      if(params[:format]=="veg")
        @flag1,@flag2,@flag3 = "active"," "," ";
      else 
        @flag2,@flag1,@flag3 = "active"," "," ";
      end 
    else 
      @items = Item.all
      @flag3,@flag1,@flag2 = "active"," "," ";
    end 

  end
end



