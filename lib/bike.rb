class Bike
  attr_accessor :working
  def initialize
    @working = true
  end

  def broken
    @working = false
  end

end
