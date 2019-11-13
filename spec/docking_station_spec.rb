require 'docking_station'

describe DockingStation do
  describe "#release_bike" do
    # context "release bike" do
    #   specify { subject.respond_to? (release_bike).should be_true }
    # end\
    it { expect(subject).to respond_to(:release_bike) }

    it 'releases working bikes' do
      bike = subject.release_bike
      expect(bike).to be_working
    end

  end
end
