require_relative 'bike'
require 'pry'

class DockingStation
  public
  attr_reader :bikes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 2

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'No working bikes' unless select_working_bike != nil
    @bikes.delete(select_working_bike)
  end

  def dock(bike)
    fail 'Docking station full' if full?
  	@bikes << bike
  end

  private

  def full?
    @bikes.count >= capacity
  end

  def empty?
    @bikes.empty?
  end

  def select_working_bike
    @bikes.detect { |bike| bike.working }
  end

end

# station = DockingStation.new
# bike1 = Bike.new
# bike2 = Bike.new
# bike1.report_broken
# station.dock(bike1)
# station.dock(bike2)
# station.release_bike
