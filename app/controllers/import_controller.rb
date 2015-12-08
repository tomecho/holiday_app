class ImportController < ApplicationController
  #import using data from form
  def create 
    alpha2 = params["import"]["alpha2"]
    year = params["import"]["year"]
    local_country = Country.where(alpha2: alpha2)
    if local_country.size == 0 then
      redirect_to import_new_path, notice: "Country does not exist in this servers database"
    elsif local_country.size > 1 then
      redirect_to import_new_path, notice: "multiple countries match that alpha2"
    end
    local_country = local_country[0] # set it to that country (should only be one at this point)
    local_country_id = local_country.id 
    

    url = "http://holidayapi.com/v1/holidays?country=" + alpha2 + "&year=" + year #format url
    import = HTTParty.get url
    import.holidays.each do |h|
      if Holiday.where(name: h.name)
        next
      end
      Holiday.new(name: h.name, date: Date.parse(h.date), country_id: local_country_id).save
    end
    byebug
    redirect_to holiday_index_path
  end
end
