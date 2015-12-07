class Country < ActiveRecord::Base
  has_many :holidays
  validates :name, presence: true
  validates :alpha2, length: { is: 2 }, presence: true, uniqueness: true
end
