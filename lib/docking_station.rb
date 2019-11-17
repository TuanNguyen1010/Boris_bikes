require_relative 'bike'

class DockingStation

  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'No working bikes available' if none_work?
    @bikes.pop
  end

  def dock(bike)
    # Use an instance variable to store the bike
    # in the 'state' of this instance
    fail 'No spaces available' if full?
    bike.report_defect if rand() > 0.5
    @bikes << bike.working
  end

  private
  def full?
    @bikes.count == DEFAULT_CAPACITY ? true : false
  end
  def empty?
    @bikes.empty?
  end
  def none_work?
    @bikes.each { |bike| return false if bike == true }
    true
  end
end
