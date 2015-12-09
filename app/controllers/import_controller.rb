class ImportController < ApplicationController
  #import using data from form
  def create 
    alpha2 = params["import"]["alpha2"]
    year = params["import"]["year"]
    local_country = Country.where(alpha2: alpha2.upcase)
    if local_country.size == 0 then
      redirect_to(import_new_path, notice: "Country does not exist in this servers database") and return
    elsif local_country.size > 1 then
      redirect_to(import_new_path, notice: "multiple countries match that alpha2") and return
    end
    local_country = local_country[0] # set it to that country (should only be one at this point)
    local_country_id = local_country.id 
    
    url = "http://holidayapi.com/v1/holidays?country=" + alpha2 + "&year=" + year.to_s #format url
    raw = HTTParty.get url
    #if raw.response.code != "200"                                                                        #block below does this much more verbosly however it will not handle errors on their http server
    #  redirect_to(import_new_path, notice: "http non oK (200) response from api") and return
    #end
    response = raw.parsed_response
    if response["status"] != 200
      redirect_to(import_new_path, notice: "api responded but cannot properly reply to the request: \n\t\" " + response["error"] + " \"") and return
    end 
    response["holidays"].each do |h|
      data = h[1][0]
      if Holiday.where(name: data["name"]).size != 0 
        next
      end
      Holiday.new(name: data["name"], date: Date.parse(data["date"]), country_id: local_country_id).save
    end
    redirect_to holiday_index_path
  end
end
