require_relative 'bike'
require_relative 'bike_container'

class DockingStation

  include BikeContainer

  def release_broken_bike
    fail "#{self.class.name} has no broken bikes" if empty? || select_broken_bike == nil
    @bikes.delete(select_broken_bike)
  end
  
end
