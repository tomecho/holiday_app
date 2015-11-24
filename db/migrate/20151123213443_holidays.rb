class Holidays < ActiveRecord::Migration
  def change
    create_table :Holidays do |t|
      t.column :name, :string
    end
  end
end
