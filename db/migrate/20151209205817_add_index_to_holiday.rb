class AddIndexToHoliday < ActiveRecord::Migration
  def change
    add_index :holidays, [:name, :date], :unique => true
  end
end
