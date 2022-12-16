FactoryBot.define do 
    factory :order_item  do 
      sequence(:productid) { |n| n}
      sequence(:product_name) { |n| "product#{n}"}
      sequence(:quantity) { |n| n}
      sequence(:subtotal) { |n| n*10}
    end 
end 