require 'garage'

describe Garage do

  let(:bike) { double :bike }

  describe '#dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.dock bike }
      expect { subject.dock double(:bike) }.to raise_error 'Van full'
    end

    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'has a default capacity' do
      expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
    end
  end

  describe '#initialization' do
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Van full'
    end
  end

  describe 'release_working_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_working_bike }.to raise_error 'No working bikes available'
    end
  end

  it 'fixes broken bikes' do
    broken_bike = Bike.new
    broken_bike.report_broken
    expect(subject.fix_bike(broken_bike)).to be broken_bike.working?
  end

end
