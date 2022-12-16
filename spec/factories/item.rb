FactoryBot.define do 
    factory :item  do 
      sequence(:name) { |n| "product#{n}"}
      sequence(:price) { |n| n}
      sequence(:item_type) { |n| "Starter"}
      sequence(:description) { |n| "rich in vitamins and proteins"}
      sequence(:food_type) { |n| "veg"}
    end 
end 