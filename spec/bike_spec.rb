require 'docking_station'

describe Bike do
  it { should respond_to :working}


  it 'can change bike attribute to broken' do
    bike  = Bike.new
    bike.report_broken
    expect(bike.working).to eq false
  end
end
