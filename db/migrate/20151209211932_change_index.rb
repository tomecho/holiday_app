class ChangeIndex < ActiveRecord::Migration
  def change
    remove_index(:holidays, [:name, :date])
    add_index(:holidays, :name)
    add_index(:holidays, :date)
  end
end
