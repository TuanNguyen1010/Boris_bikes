require 'docking_station'

describe DockingStation do
  describe "#release_bike" do
    # context "release bike" do
    #   specify { subject.respond_to? (release_bike).should be_true }
    # end\
    it { expect(subject).to respond_to(:release_bike) }

  end
end
