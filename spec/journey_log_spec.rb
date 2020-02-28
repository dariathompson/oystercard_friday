require 'journey_log'
describe JourneyLog do
  #  let(:journey){ double :journey}
  let(:station){ double :station, zone: 1 }
  let(:journey) {journey = Journey.new(:station)}
  let(:journey_class){ double :journey_class, new: journey}
  subject(:journey_log) {described_class.new(journey_class: journey_class)}

  describe '#start' do
    it 'starts a journey with entry station' do
      expect(journey_class).to receive(:new).with(entry_station: station)
      subject.start(station)
    end

    it 'records a journey' do
      journey_log.start(station)
      
      expect(journey_log.journeys).to include(journey)
    end
  end
end