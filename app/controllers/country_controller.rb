class CountryController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with :name => "user", :password => "pass", except: :index
  def index
    @countries = Country.all
  end

  def import
  end
  
  def destroy
    @country.destroy()
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
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)

    respond_to do |format|
      if @country.save
        format.html { redirect_to @country, notice: 'Country was successfully created.' }
        format.json { render :show, status: :created, location: @country }
      else
        format.html { render :new }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def country_params
      params.require(:country).permit(:name, :alpha2, :id)
    end

end
