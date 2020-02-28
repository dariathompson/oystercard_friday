require_relative 'journey'
class JourneyLog
  attr_reader :journeys, :journey_class
  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    journey_class.new(entry_station: station)
    @journeys << { in: @journey_class.journey.entry_station }
  end

  def push_journey
    
  end

end