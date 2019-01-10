require 'garage'
require 'bike_container'
require 'bike'

describe Garage do

  it_behaves_like BikeContainer

  it 'fixes broken bikes' do
    broken_bike = Bike.new
    broken_bike.report_broken
    expect(subject.fix_bike(broken_bike)).to be broken_bike.working?
  end

  it "doesn't release broken bikes" do
    bike_broken = double(:bike, working?: false)
    subject.dock(bike_broken)
    expect { subject.release_broken_bike }.to raise_error "#{described_class.name} can only release working bikes"
  end

end
