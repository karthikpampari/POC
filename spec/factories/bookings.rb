FactoryBot.define do 
    factory :booking  do 
      sequence(:name) { |n| "karthik#{n}"}
      sequence(:members) { |n| rand(2..8)}
      sequence(:day) { |n| Date.today}
      sequence(:time) { |n| "9:00"}
      sequence(:table) { |n| 1}
    end 
end 