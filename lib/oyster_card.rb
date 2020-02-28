require_relative 'journey'
require_relative 'journey_log'
class OysterCard
  attr_reader :balance, :fare, :journey, :journey_log
  MIN_BALANCE = 1
  MAX_BALANCE = 90
  MIN_CHARGE = 1

  def initialize
    @balance = 0
    @min_charge = MIN_CHARGE
    @journey = nil
    @journey_log = JourneyLog.new
  end

  def check_balance
    @balance
  end

  def top_up(num)
    fail "Over top-up limit" if over_limit?(num)
    @balance += num
  end

  def tap_in(station)
    fail "insufficient balance" if balance < MIN_BALANCE
      deduct(Journey::PENALTY_FARE) if @journey
      @journey_log.start(station)

  end

  def tap_out(station)
    #deduct(Journey::PENALTY_FARE) if !@journey
    if @journey_log
      @journey_log.finish(station)
      deduct(@journey_log.calculate_fare)
    else
      deduct(Journey::PENALTY_FARE)
    end
  end

  def in_journey?
    !!@journey
  end

  private

  def deduct(fare)
    @balance -= fare
  end

  def over_limit?(num)
    @balance + num > MAX_BALANCE
  end

end
