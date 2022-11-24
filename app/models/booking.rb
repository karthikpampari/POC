class Booking < ApplicationRecord
#    validates :name, presence: true
#    validates :day, presence: true 
#    validates :time, presence: true  
#    after_validation :no_past_bookings 
#    after_validation :booking_overlap


#   def no_past_bookings 
#     if Date.today > self.day.to_date || Time.now > self.time.to_time
#         errors.add(:time, "you are selecting past time/day")
#     end 
#   end 

#   def booking_overlap
#     bookings= Booking.all
#     bookings.each do |booking|
#         if self.day.to_date == booking.day
#             errors.add(:overlap,"selected date has been booked, please select another date")
#         end 

#         if self.time.to_time == booking.time
#             errors.add(:overlap,"selected time has been booked, please select another time")
#         end 
#     end 
#   end
end

