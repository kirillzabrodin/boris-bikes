require 'docking_station'
require 'bike_container'


describe DockingStation do

  it_behaves_like BikeContainer

  it 'does not release broken bikes' do
    bike_broken = double(:bike, working?: false)
    subject.dock(bike_broken)
    expect { subject.release_working_bike }.to raise_error "#{described_class.name} has no working bikes"
  end

  it 'releases broken bikes for repair' do
    bike_broken = double(:bike, working?: false)
    subject.dock(bike_broken)
    expect(subject.release_broken_bike).to eq bike_broken
  end
  
end
