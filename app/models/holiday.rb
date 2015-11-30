class Holiday < ActiveRecord::Base
  default_scope { order(:date) }
  validates :name, presence: true 
  validates :date, presence: true
end
