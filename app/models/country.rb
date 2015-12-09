class Country < ActiveRecord::Base
  before_save { self.alpha2.upcase! }
  has_many :holidays
  validates :name, presence: true
  validates :alpha2, length: { is: 2 }, presence: true, uniqueness: true
end
