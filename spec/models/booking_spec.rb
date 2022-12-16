require 'rails_helper'

RSpec.describe Booking, type: :model do 
    subject {FactoryBot.create(:booking)}

    context "creating a new booking" do   

        it "creates new booking with dummy data" do 
            abc = Booking.create(name: "karthik", day: Date.today, time: Time.now, table: 2, members: 3)
            expect(abc).to be_valid
        end 
        
        it "using factorybot" do 
            expect(subject).to be_valid
        end
        
    end 

    context "booking not to be valid" do 
        
        it " should have table no" do 
            subject.table = nil
            subject.save
            expect(subject).to_not be_valid
        end

        it " should have time " do 
            subject.time = nil
            subject.save
            expect(subject).to_not be_valid
        end

        it " should have date " do 
            subject.day = nil
            subject.save
            expect(subject).to_not be_valid
        end

        it " should have name " do 
            subject.name = nil
            subject.save
            expect(subject).to_not be_valid
        end

        it " should have members " do 
            subject.members = nil
            subject.save
            expect(subject).to_not be_valid
        end
    end 

end 