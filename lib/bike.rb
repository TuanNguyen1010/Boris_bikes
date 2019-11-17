class Bike
  attr_reader :working
  def initialize
    @working = true
  end
  def report_defect
    @working = false
  end
end
