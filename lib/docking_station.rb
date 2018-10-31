require_relative 'bike'

class DockingStation
  public
  attr_reader :bikes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'No working bikes' if @bikes.working.any? == true
    @bikes.delete_at(select_working_bike)
  end

  def dock(bike)
    fail 'Docking station full' if full?
  	@bikes << bike
  end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end

  def select_working_bike
    @bikes.detect { |bike| bike.working == true }
  end

end
