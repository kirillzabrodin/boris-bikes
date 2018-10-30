require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'gives us a working bike' do
    expect(Bike.new.working).to eq true
  end

	it { is_expected.to respond_to(:dock).with(1).argument }

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

	it "return docked bikes" do
		bike = Bike.new
    bikes = [bike]
		subject.dock(bike)
		expect(subject.bikes).to eq bikes
	end

  describe 'release_bike' do
    it 'raises error when no bikes docked' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'does not release broken bikes' do
      station = DockingStation.new
      bike_broken = Bike.new
      bike_working = Bike.new
      station.dock(bike_working, true)
      station.dock(bike_broken, false)
      expect(station.release_bike.working).to eq true
    end
  end

  describe 'dock bike' do
    it 'raises an error when full' do
      subject.capacity.times {subject.dock Bike.new}
      expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end

    it 'lets you report broken' do
      station = DockingStation.new
      bike = Bike.new
      station.dock(bike, false)
      expect(bike.working).to eq false
    end
  end

  describe 'initialization' do
  subject { DockingStation.new }
  let(:bike) { Bike.new }
  it 'defaults capacity' do
    described_class::DEFAULT_CAPACITY.times do
      subject.dock(bike)
    end
    expect{ subject.dock(bike) }.to raise_error 'Docking station full'
  end
end


end
