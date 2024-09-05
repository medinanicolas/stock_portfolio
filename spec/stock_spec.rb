require 'rspec'
require_relative '../stock' # Adjust path as needed

RSpec.describe Stock do
  let(:prices) do
    {
      '2022-12-31' => 99.0,
      '2023-01-01' => 100.0,
      '2023-01-02' => 105.0,
      '2023-01-03' => 110.0
    }
  end

  subject { Stock.new(prices) }

  describe '#price' do
    it 'returns the price for an exact date' do
      expect(subject.price('2023-01-01')).to eq(100.0)
    end

    it 'returns the closest price for a non-existent date within the allowed limit' do
      expect(subject.price('2022-12-30')).to eq(99.0)
    end
    
    it 'raises an error for a date outside the allowed limit' do
      expect { subject.price('2023-01-15') }.to raise_error(RuntimeError, /No data available/)
    end
  end
end
