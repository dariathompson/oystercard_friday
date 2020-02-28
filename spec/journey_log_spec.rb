require 'journey_log'
describe JourneyLog do
  #  let(:journey){ double :journey}
  let(:station){ double :station, zone: 1 }
  let(:journey) {journey = Journey.new(:station)}
  let(:journey_class){ double :journey_class, new: journey}
  subject(:journey_log) {described_class.new}

  it {is_expected.to respond_to(:start).with(1).argument}
end
