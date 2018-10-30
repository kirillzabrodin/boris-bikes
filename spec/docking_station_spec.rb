require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'gives us a working bike' do
    expect(subject.release_bike.working?).to eq true
  end
end
