require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'gives us a working bike' do
    expect(subject.release_bike.working?).to eq true
  end

	it { is_expected.to respond_to(:dock_bike).with(1).argument }

	it "return docked bikes" do
		bike = Bike.new
		subject.dock_bike(bike)
		expect(subject.bike).to eq bike
	end

end
