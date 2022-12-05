FactoryBot.define do 
    factory :booking  do 
      name {"karthik"}
      members {2}
      day {Date.today}
      time {Time.now}
      table {1}
    end 
end 