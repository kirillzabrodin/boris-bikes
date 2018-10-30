require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'gives us a working bike' do
    expect(Bike.new.working?).to eq true
  end

	it { is_expected.to respond_to(:dock).with(1).argument }

	it "return docked bikes" do
		bike = Bike.new
		subject.dock(bike)
		expect(subject.bikes).to eq bike
	end

  describe 'release_bike' do
    it 'raises error when no bikes docked' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe 'dock' do
    it 'raises an error when full' do
      20.times {subject.dock(Bike.new)}
      expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end
  end
end
