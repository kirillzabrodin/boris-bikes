require 'docking_station'

describe Bike do
  it { should respond_to :working}


  it 'can change bike attribute to broken' do
    expect(Bike.new.broken).to eq false
  end
end
