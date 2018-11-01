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

end
