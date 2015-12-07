class AddCountryIdToHoliday < ActiveRecord::Migration
  def change
    add_column(:holidays, :country_id,:integer)
  end
end
