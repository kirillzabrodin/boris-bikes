require_relative 'bike_container'
require_relative 'bike'

class Garage

  include BikeContainer
  def fix_bike(bike)
    bike.report_working
  end
  
end
