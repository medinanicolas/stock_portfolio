require 'date'

class Portfolio
  # Define accessor for @stocks
  attr_reader :stocks

  def initialize(stocks)
    @stocks = stocks
  end

  def profit(start_date, end_date, annualized_return: false)
    begin
      total_start_value = @stocks.sum { |stock| stock.price(start_date) }
      total_end_value = @stocks.sum { |stock| stock.price(end_date) }
      total_profit = total_end_value - total_start_value
      if annualized_return
        years = (Date.parse(end_date) - Date.parse(start_date)) / 365.0
        annualized_return = (1 + total_profit / total_start_value) ** (1 / years) - 1
        (annualized_return * 100).round(2)
      else
        total_profit.round(2)
      end
    rescue ArgumentError => e
      puts "Error: Invalid date format - #{e.message}"
    rescue ZeroDivisionError
      puts "Error: Division by zero - Check start and end dates"
    rescue => e
      puts "Error: #{e.message}"
    end
  end
end
