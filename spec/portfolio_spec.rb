require 'rspec'
require_relative '../portfolio' # Adjust path as needed
require_relative '../stock'      # Adjust path as needed

RSpec.describe Portfolio do
  let(:nvda_prices) do
    {
      '2023-01-01' => 14.306805,
      '2023-12-31' => 49.515610
    }
  end

  let(:btc_prices) do
    {
      '2023-01-01' => 16625.080078,
      '2023-12-31' => 42265.187500
    }
  end

  let(:nvda_stock) { Stock.new(nvda_prices) }
  let(:btc_stock) { Stock.new(btc_prices) }
  let(:portfolio) { Portfolio.new([nvda_stock, btc_stock]) }

  describe '#profit' do
    it 'calculates the total profit correctly' do
      expect(portfolio.profit('2023-01-01', '2023-12-31')).to eq(25675.32)
    end

    it 'calculates the annualized return correctly' do
      expect(portfolio.profit('2023-01-01', '2023-12-31', annualized_return: true)).to eq(154.96)
    end
  end
end
