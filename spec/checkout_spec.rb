require 'checkout'

describe Checkout do
	subject(:checkout) { described_class.new(promo_rules) }
	let(:promo_rules) { double }

	describe '#scan' do
    let(:item) { double product_code: '001', name: 'Lavender heart', price: 9.99 }

    it 'accepts an item and stores it' do
      expect(checkout.scan(item)).to be_truthy
    end

    it 'raises error for a nil item' do
      expect { checkout.scan(nil) }.to raise_error Checkout::ERR_NIL_ITEM
    end
  end
	
end