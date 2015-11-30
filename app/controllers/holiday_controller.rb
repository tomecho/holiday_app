class HolidayController < ApplicationController
  def index
    @holidays = Holiday.all
  end

  def import
    #import from holidayapi
  end
  
  def destroy
    http_basic_authenticate_with :name => "user", :password => "password" 
    @holiday.destroy
  end
end
