class Country < ActiveRecord::Base
  has_many :holidays
  validates :name, presence: true
  validates :alpha2, length: { is: 2 }, presence: true, uniqueness: true
#  before_create :alpha2_upcase
#  def alpha2_upcase
#    self.alpha2.upcase!
#  end
end
