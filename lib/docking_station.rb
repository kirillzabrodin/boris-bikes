require_relative 'bike'

class DockingStation
  attr_reader :bikes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.delete_at(select_working_bike)
  end

  def dock(bike, working = true)
    fail 'Docking station full' if full?
    bike.working = working
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
    @bikes.find_index { |bike| bike.working }
  end

end
