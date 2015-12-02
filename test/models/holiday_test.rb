require 'test_helper'

class HolidayTest < ActiveSupport::TestCase
  def setup
    @holiday = Holiday.new(name: "some holiday")
  end 
  test "date is nessesary" do
    assert_not @holiday.valid?
  end
  test "should be valid with date and name" do
    @holiday.date = Date.new(2015,1,1)
    assert @holiday.valid?, "a holiday with a date and a name should be valid"
  end
  test "name is nessesary" do
    @holiday.name = nil
    assert_not @holiday.valid?, "name cannot be nil"
    @holiday.name = "  "
    assert_not @holiday.valid?, "name cannot be composed of only blank spaces"
  end
end
