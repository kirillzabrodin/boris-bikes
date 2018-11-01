class Van

  public

  attr_reader :bikes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_working_bike
    fail 'No working bikes available' if empty? || select_working_bike == nil
    @bikes.delete(select_working_bike)
  end

  def release_broken_bike
    fail 'No broken bikes available' if empty? || select_broken_bike == nil
    @bikes.delete(select_broken_bike)
  end

  def dock(bike)
    fail 'Van full' if full?
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
    @bikes.count >= capacity
  end

  def empty?
    @bikes.empty?
  end

end
