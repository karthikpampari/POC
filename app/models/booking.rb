class Booking < ApplicationRecord
   validates :name, :members, :day, :time, :table,  presence: true
end

