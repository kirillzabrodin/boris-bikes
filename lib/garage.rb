require_relative 'bike_container'
require_relative 'bike'

class Garage

  include BikeContainer
  def fix_bike(bike)
    bike.report_working
  end

  def release_broken_bike
    fail "#{self.class.name} can only release working bikes"
  end

end
