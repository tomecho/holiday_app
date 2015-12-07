class Country < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :alpha2
    end
  end
end
