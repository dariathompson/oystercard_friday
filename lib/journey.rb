require_relative 'oyster_card'
class Journey
  attr_reader :entry_station, :exit_station
  PENALTY_FARE = 6
  def initialize(station)
    @entry_station = station
    @exit_station = nil
  end

  def finish(station)
    @exit_station = station
  end



  def fare
    exit_station && entry_station ? 1 : PENALTY_FARE
  end
end
