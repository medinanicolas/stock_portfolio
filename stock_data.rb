require 'csv'
require 'date'

module StockData
  def self.load_stock_data_from_csv(file_path)
    prices = {}
    begin
      CSV.foreach(file_path, headers: true) do |row|
        date = Date.parse(row['Date']).strftime('%Y-%m-%d')
        price = row['Adj Close'].to_f
        prices[date] = price
      end
    rescue Errno::ENOENT
      puts "Error: File not found - #{file_path}"
    rescue CSV::MalformedCSVError
      puts "Error: Malformed CSV - #{file_path}"
    rescue => e
      puts "Error: #{e.message}"
    end
    prices
  end
end
