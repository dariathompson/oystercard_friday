require_relative 'journey'
class JourneyLog
  attr_reader :journeys
  def initialize
    @journey = nil
    @journeys = []

  end

  def start(station)
    @journey = Journey.new(station)
  end

def finish(station)
  @journey.finish(station)
  push_journey
end

  def push_journey
    @journeys << { in: @journey.entry_station, exit: @journey.exit_station }
  end

  def calculate_fare
    @journey.fare
  end

end
