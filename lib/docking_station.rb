require_relative 'bike'

class DockingStation

  attr_reader :bikes
  # def initialize(bike)
  #   @bike = bike
  # end

  def initialize
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
    @bikes.count == 20 ? true : false
  end
  def empty?
    @bikes.empty?
  end
end
