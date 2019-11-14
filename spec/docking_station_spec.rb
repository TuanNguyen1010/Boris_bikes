require 'docking_station'

describe DockingStation do
    station = DockingStation.new
    describe '#release_bike' do
      it 'raises an error when there are no bikes available' do
        # we want to release the bike we docked
        # the reason we use curly braces instead of parentheses can be explained here
        # https://stackoverflow.com/questions/21567838/when-to-use-curly-braces-vs-parenthesis-in-expect-rspec-method
        expect{ station.release_bike }.to raise_error(RuntimeError, 'No bikes available')
      end
    end

    describe '#dock' do
      it 'raises an error when there are no spaces available' do
        # bike = Bike.new
        20.times { station.dock Bike.new }
        expect{ station.dock Bike.new }.to raise_error(RuntimeError, 'No spaces available')
      end
    end

    # it { is_expected.to respond_to(:dock).with(1).argument }
    #
    # it 'docks something' do
    #   bike = Bike.new
    #   expect(subject.dock(bike)).to eq bike
    # end
end
