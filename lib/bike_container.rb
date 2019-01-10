module BikeContainer
  DEFAULT_CAPACITY = 20
  attr_reader :bikes
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_working_bike
    fail "#{self.class.name} has no working bikes" if empty? || select_working_bike == nil
    @bikes.delete(select_working_bike)
  end

  def dock(bike)
    fail "#{self.class.name} full" if full?
    @bikes << bike
  end

  private

  def select_working_bike
    @bikes.detect { |bike| bike.working? }
  end

  def select_broken_bike
    @bikes.detect { |bike| !bike.working? }
  end

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end
