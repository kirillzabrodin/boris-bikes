require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'gives us a working bike' do
    expect(Bike.new.working?).to eq true
  end

	it { is_expected.to respond_to(:dock_bike).with(1).argument }

	it "return docked bikes" do
		bike = Bike.new
		subject.dock_bike(bike)
		expect(subject.bike).to eq bike
	end

  describe 'release_bike' do
    it 'raises error when no bikes docked' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe 'dock' do
    it 'raises an error when full' do
      subject.dock_bike(Bike.new)
      expect { subject.dock_bike Bike.new }.to raise_error 'Docking station full'
    end
  end
end
