require 'date'
require_relative 'settings'

class Stock
  # Define accessor for @prices
  attr_reader :prices

  def initialize(prices)
    @prices = prices
  end

  def price(date)
    return @prices[date] if @prices.key?(date)
    parsed_date = Date.parse(date)
    # If the exact date doesn't exist in the data,
    # this will find the closest date within a limit of days
    closest_date = @prices.keys.select do |d|
        date_diff = (Date.parse(d) - parsed_date).abs
        date_diff <= MAX_DAYS_DIFF
    end.min_by { |d| (Date.parse(d) - parsed_date).abs }
    
    if closest_date
      @prices[closest_date]
    else
      raise "No data available within #{MAX_DAYS_DIFF} days of #{date}"
    end
  end
end
