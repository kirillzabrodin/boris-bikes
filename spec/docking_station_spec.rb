require 'docking_station'

describe DockingStation do
  let(:bike) { double :bike }
  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    bike = double(:bike, working?: true)
    subject.dock bike
    expect(subject.release_bike).to be bike
  end

  it 'releases docked bikes' do
		subject.dock(bike)
		expect(subject.bikes).to eq [bike]
  end

  it 'does not release broken bikes' do
    bike_broken = double(:bike, working?: false)
    subject.dock(bike_broken)
    expect {subject.release_bike}.to raise_error 'No bikes available'
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  describe 'release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.dock bike }
      expect { subject.dock double(:bike) }.to raise_error 'Docking station full'
    end

    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end

  describe '#initialization' do
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end
  end
end
