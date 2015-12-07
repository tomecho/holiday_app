class HolidayController < ApplicationController
  before_action :set_holiday, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with :name => "user", :password => "password", only: [:import, :destroy, :edit, :new, :create] 
  
  def by_country_date
    @date = Date.parse(params[:date])
    country = params[:country]
    @country_id = country_name_to_id(country)
    @country_name = country
    @holidays = Holiday.where(date: @date, country_id: @country_id)
    @holidays.push(*Holiday.where(date: @date, country_id: nil))
  end
  def by_range

  end
  def by_range_country

  end
  def by_country
    @country = Country.find(params[:country_id])
  end
  def by_date
    @date = Date.parse(params[:date])
    @holidays = Holiday.where(date: @date)
  end
  def by_name
    @name = params[:name]
    @holidays = Holiday.where(name: @name)
  end
  def index
    @holidays = Holiday.all
  end

  def import
    #import from holidayapi
  end
  
  def destroy
    @holiday.destroy()
    respond_to do |format|
      format.html { redirect_to holiday_index_path, notice: 'Deleted!' }
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
      params.require(:holiday).permit(:name, :date, :id, :country_id)
    end
    def country_name_to_id(n)
      c = Country.where(name: n)
      if c.size != 1
        flash[:notice] = 'No Country by name ' + n
        redirect_to holiday_index_path
      else
        return c[0].id
      end
    end

end
