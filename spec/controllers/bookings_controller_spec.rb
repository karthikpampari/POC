require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
    subject {FactoryBot.build(:booking)}
    context "GET index" do

        it "returns a successful response" do
          get :index
          expect(response).to be_successful
          expect(response.status).to eq(200) 
        end
        
        it "assigns @bookings" do
          get :index
          expect(assigns(:bookings)).to eq(Booking.all)
        end
  
        it "renders the index template" do
          get :index
          expect(response).to render_template("index")
        end

    end 

    context "GET new" do 
        
        it "returns a successful response" do
            get :new
            expect(response).to be_successful
            expect(response.status).to eq(200) 
        end

        it "assigns @booking" do
            get :new
            expect(assigns(:booking)).to be_a_new(Booking)
        end

        it "renders the new template" do
            get :new
            expect(response).to render_template("new")
            expect(response.body).to eq ""
        end

    end 

    context "POST create" do 
        it 'creates the new booking all details are given' do
            post :create, params: {booking: {
                    name: subject.name,
                    day: subject.day,
                    time: subject.time,
                    members: subject.members,
                    table: subject.table
            }}
            expect(assigns(:booking).save).to be_truthy
            expect(response).to redirect_to root_path
        end

        it 'raises 422 if booking not saved ' do
            post :create, params: {booking: {
                    name: nil,
                    day: subject.day,
                    time: subject.time,
                    members: subject.members,
                    table: subject.table
            }}
            expect(response).to render_template("new")
            expect(response.status).to eq(422) 
        end
    end 

    context "Delete booking" do 
        it "deletes the booking" do 
            subject.save
            delete :destroy,params: { id: subject.id}
            expect(assigns(:booking).destroy).to be_truthy
        end 
        it "redirects to bookings#index" do 
            subject.save
            delete :destroy,params: { id: subject.id}
            expect(response).to redirect_to bookings_path
        end 
    end 

    context " selects available time" do 
        it " available time slot for that day" do 
          for i in 1..5 do 
            Booking.create(
                name: "test",
                day: Date.today,
                time: "9:00",
                members: 2,
                table: i
            )
          end 
          get :select_date, params: {date: Date.today, target: "booking_time"},format: :turbo_stream
          expect(response).to have_http_status(:ok)
          expect(assigns(:time_slots_available)).to eq(["10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00"])
        end 
    end
    
    context " selects available table" do 
        it " available table for that day and for that time" do 
          for i in 1..4 do 
            Booking.create(
                name: "test",
                day: Date.today,
                time: "9:00",
                members: 2,
                table: i
            )
          end 
          get :select_time, params: {date: Date.today, time: "9:00", target: "booking_table"},format: :turbo_stream
          expect(response).to have_http_status(:ok)
          expect(assigns(:tables_available)).to eq([5])
        end 
    end
end