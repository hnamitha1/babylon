require 'total_price_discount' 

describe TotalPriceDiscount do 
  subject(:total_price) {described_class.new(60, 10)}
  let(:items) { [double, double] }

  describe '#discount' do
    it 'calculates the discount if above the threshold' do
      expect(total_price.discount(items, 61)).to eq 6.1
    end

    it 'returns zero if the total is below the threshold' do
      expect(total_price.discount(items, 59)).to eq 0
    end
  end
end

