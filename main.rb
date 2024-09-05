require_relative 'stock_data'
require_relative 'stock'
require_relative 'portfolio'
require_relative 'settings'

begin
  nvda_prices = StockData.load_stock_data_from_csv("#{FOLDER_PATH}/NVDA.csv")
  btc_prices = StockData.load_stock_data_from_csv("#{FOLDER_PATH}/BTC-USD.csv")

  nvda_stock = Stock.new(nvda_prices)
  btc_stock = Stock.new(btc_prices)

  portfolio = Portfolio.new([nvda_stock, btc_stock])

  start_date = '2023-01-01'
  end_date = '2023-12-31'
  puts "Total profit between #{start_date} and #{end_date}: #{portfolio.profit(start_date, end_date)}"
  puts "Annualized return between #{start_date} and #{end_date}: #{portfolio.profit(start_date, end_date, annualized_return: true)}"
rescue => e
  puts "Error: #{e.message}"
end
