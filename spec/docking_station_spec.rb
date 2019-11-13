require 'docking_station'

describe DockingStation do
    it { expect(subject).to respond_to(:release_bike) }
    describe '#release_bike' do
      it 'raises an error when there are no bikes available' do
        # we want to release the bike we docked
        # the reason we use curly braces instead of parentheses can be explained here
        # https://stackoverflow.com/questions/21567838/when-to-use-curly-braces-vs-parenthesis-in-expect-rspec-method
        expect{ subject.release_bike }.to raise_error(RuntimeError, 'No bikes available')
      end
    end

    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'docks something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end
end
