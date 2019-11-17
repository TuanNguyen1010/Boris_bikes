require 'bike'

describe Bike do
  it { expect(subject).to respond_to(:working) }
  describe '#working' do
    it "bike is working" do
      bike = Bike.new
      expect(bike.working).to eq(true)
    end
    it "bike is broken" do
      bike = Bike.new
      bike.report_defect
      expect(bike.working).to eq(false)
    end
  end
end
