class Booking < ApplicationRecord
   validates :name, :day, :time, :table,  presence: true
end

