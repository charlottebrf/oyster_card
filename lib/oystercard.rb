require_relative 'fare'
require_relative 'station'

class Oystercard

  attr_reader :balance, :entry_station
  Maximum_balance = 90

  def initialize
    @balance = 0
    @in_journey = false
    @entry_station = nil
  end

  def top_up(amount)
    fail "Cannot top_up above #{Maximum_balance}" if amount + @balance > Maximum_balance
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in(station)
    raise "Balance below minimum" if @balance < Fare::MIN_FARE
    @in_journey = true
    @entry_station = station
  end

  def touch_out
    deduct_fare(Fare::MIN_FARE)
    @in_journey = false
    @entry_station = nil
  end

  private

  def deduct_fare(fare)
    @balance -= fare
  end

end
