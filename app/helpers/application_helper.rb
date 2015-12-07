module ApplicationHelper
  def site_name
    one = [ "Holiday ", "The Holiday ", "Festive Occurance ", "Christmas ", "Fiesta ", "Jubille ", "Vacation ", "Recess "]
    two = ["App", "Program", "Website", "Application","Countdown", "Webthing", "Calendar", "Site"]
    one.shuffle.first + two.shuffle.first
  end
  def country_name_to_id(n)
    Country.where(name: n).id
  end
end
