require 'rails_helper'

describe OrderItem do
      it "belongs_to order" do
        assc = described_class.reflect_on_association(:order)
        expect(assc.macro).to eq :belongs_to
      end
      context "creation of order item " do 
            it "without order_id " do 
                temp = OrderItem.create(productid: 2, product_name: "test", quantity: 2, subtotal: 22)
                expect(temp).to be_valid
            end 
      end 
end

