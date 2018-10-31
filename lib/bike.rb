class Bike

  attr_reader :working

  def initialize
    @working = true
  end

  def report_broken
    @working = false
  end

  def report_fixed
    @working = true
  end

end
