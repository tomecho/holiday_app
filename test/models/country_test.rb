require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  def setup
    @country = Country.new(name: "some country")
  end 
  test "alpha2 is nessesary" do
    assert_not @country.valid?
  end
  test "should be valid with alpha2 and name" do
    @country.alpha2 = "xx"
    assert @country.valid?, "a country with an alpha2 and a name should be valid"
  end
  test "name is nessesary" do
    @country.name = nil
    assert_not @country.valid?, "name cannot be nil"
    @country.name = "  "
    assert_not @country.valid?, "name cannot be composed of only blank spaces"
    @country.alpha2 = "eq"
    @country.name = "esquaria"
    assert @country.valid?, "should be valid with name and alpha2"
  end
  test "alpha2 can only be two chars" do
    @country.alpha2 = "a" * 3
    assert_not @country.valid?, "alpha2 as 3 chars should be rejected"
    @country.name = "asdfa"
    @country.alpha2 = "as"
    assert @country.valid?, "should be valid in this case"
  end
end
