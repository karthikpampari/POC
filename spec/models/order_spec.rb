require 'rails_helper'

describe Order do  
    it "should have many teams" do    
        temp = Order.reflect_on_association(:order_items)
        expect(temp.macro).to eq(:has_many)
    end
    it "should create order" do 
        abc = Order.create(total: 250)
        expect(abc).to be_valid
    end 
end

