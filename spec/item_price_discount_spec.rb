require 'item_price_discount'

describe ItemPriceDiscount do
  let(:item) { { name: 'Lavender heart', product_code: '001', price: 9.25 } }
  let(:items) { [double(item), double(item)] }
  let(:total_item) { ItemPriceDiscount.new product_code: '001',
          new_price: 8.50, quantity_threshold: 2 }


	describe '#discount' do
    it 'returns the discount amount' do
      expect(total_item.discount(items, 18.50)).to eq 1.50
    end
    
    it 'returns zero' do
      expect(total_item.discount([], 0)).to eq 0
    end
  end
end
