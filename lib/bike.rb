class Bike

  attr_reader :working

  def initialize
    @working = true
  end

  def report_broken
    @working = false
  end

  def report_working
    @working = true
  end

  def working?
    @working
  end

end
