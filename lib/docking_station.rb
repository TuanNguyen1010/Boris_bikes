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
    fail 'No bikes available' if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    # Use an instance variable to store the bike
    # in the 'state' of this instance
    fail 'No spaces available' if @bikes.count >= 20
    @bikes << bike
  end

end
