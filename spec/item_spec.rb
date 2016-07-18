require 'item'

describe Item do
	subject(:item) {described_class.new('001', 'Lavender heart', 9.25) }

	describe '#product_code' do
    it 'returns the product code for the item' do
      expect(item.product_code).to eq '001'
    end
  end

  describe '#name' do
    it 'returns the name for the item' do
      expect(item.name).to eq 'Lavender heart'
    end
  end

  describe '#price' do
    it 'returns the price for the item' do
      expect(item.price).to eq 9.25
    end
  end
end