class Holiday < ActiveRecord::Base
  belongs_to :country
  default_scope { order(:date) }
  validates :name, presence: true 
  validates :date, presence: true
end
