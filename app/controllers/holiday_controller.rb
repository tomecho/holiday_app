class HolidayController < ApplicationController
  before_action :set_holiday, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with :name => "user", :password => "password", except: :index
  def index
    @holidays = Holiday.all
  end

  def import
    #import from holidayapi
  end
  
  def destroy
    @holiday.destroy()
    respond_to do |format|
      format.html { redirect_to index_path, notice: 'Deleted!' }
      format.json { head :no_content }
    end
  end

  def show
  end

  def edit
  end

  def new
    @holiday = Holiday.new
  end

  def create
    @holiday = Holiday.new(holiday_params)

    respond_to do |format|
      if @holiday.save
        format.html { redirect_to @holiday, notice: 'Holiday was successfully created.' }
        format.json { render :show, status: :created, location: @holiday }
      else
        format.html { render :new }
        format.json { render json: @holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_holiday
      @holiday = Holiday.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def holiday_params
      params.require(:holiday).permit(:name, :date, :id)
    end

end
