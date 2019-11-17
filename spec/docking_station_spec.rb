require 'docking_station'

describe DockingStation do
  it "create docking station with a max capacity of 1" do
    station1 = DockingStation.new(1)
    expect( station1.capacity ).to eq(1)
  end

  it 'create docking station with a default max capacity 20' do
    station20 = DockingStation.new
    expect( station20.capacity ).to eq(20)
  end

  describe '#release_bike' do
    station = DockingStation.new
    let(:bike) { double :bike }
    it 'raises an error when there are no bikes available' do
      # we want to release the bike we docked
      # the reason we use curly braces instead of parentheses can be explained here
      # https://stackoverflow.com/questions/21567838/when-to-use-curly-braces-vs-parenthesis-in-expect-rspec-method
      expect{ station.release_bike }.to raise_error(RuntimeError, 'No bikes available')
    end
    it 'raises an error when there are no working bikes available' do
      allow(bike).to receive(:report_defect).and_return(false)
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error(RuntimeError, 'No working bikes available')
    end
  end

  describe '#dock' do
    let(:bike) { double :bike }
    it 'raises an error when there are no spaces available' do
      allow(bike).to receive(:report_defect).and_return(false)
      20.times { subject.dock bike }
      expect{ subject.dock bike }.to raise_error(RuntimeError, 'No spaces available')
    end
    it 'can store broken bikes' do
      station = DockingStation.new
      allow(bike).to receive(:report_defect).and_return(false)
      station.dock(bike)
      bike.report_defect
      expect( station.bikes).to eq([bike])
    end
  end

  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to(:bikes) }
  it { is_expected.to respond_to(:release_bike)}
  #
  # it 'docks something' do
  #   bike = Bike.new
  #   expect(subject.dock(bike)).to eq bike
  # end
end
