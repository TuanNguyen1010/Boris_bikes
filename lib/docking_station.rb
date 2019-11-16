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
    @bikes.pop
  end

  def dock(bike)
    # Use an instance variable to store the bike
    # in the 'state' of this instance
    fail 'No spaces available' if full?
    @bikes << bike
  end

  private
  def full?
    @bikes.count == DEFAULT_CAPACITY ? true : false
  end
  def empty?
    @bikes.empty?
  end
end
