class BookingsController < ApplicationController
    def index 
        @bookings=Booking.all
    end 

    def new 
        @booking=Booking.new
    end
    
    def create
        @booking = Booking.new(booking_params)
        if @booking.save
            redirect_to root_path, notice: "table booked  successfully. Thank you" 
        else
            render :new, status: :unprocessable_entity 
        end
    end 
    
    def destroy
        @booking = Booking.find(params[:id])
        if @booking.destroy
            redirect_to bookings_path 
            flash[:notice] = "booking cancelled successfully "
        end 
    end 
    
    def select_date 
        @target=select_date_params[:target]
        @booking = Booking.where(day: select_date_params[:date])
        @time_slots_available=["9:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00"]
        temp=[]

        @booking.each do |i|
            temp << i.time.hour
        end 

        @temp1=temp.tally.select{|k,v| v==5}.keys.map(&:to_s).map{|i| i+":00"}
        @time_slots_available -= @temp1
        respond_to do |format|
            format.turbo_stream
        end 
    end

    def select_time
        @target=select_time_params[:target]
        @table=[1,2,3,4,5]
        booking = Booking.where(day: select_time_params[:date].to_date , time: select_time_params[:time].to_datetime)
        booking.each do |i|
            @table.delete(i.table)
        end 
        @tables_available=@table 
        respond_to do |format|
            format.turbo_stream
        end
    end  

    private
    def booking_params
        params.require(:booking).permit(:name,:day, :time,:members,:table)
    end  
     
    def select_date_params
        params.permit(:target,:date)
    end 
    def select_time_params
        params.permit(:target,:date,:time)
    end 
end
