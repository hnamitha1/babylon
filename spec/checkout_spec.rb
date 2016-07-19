require 'checkout'

describe Checkout do
	subject(:checkout) { described_class.new(promo_rules) }
	let(:promo_rules) { double }
  let(:item) { double product_code: '001', name: 'Lavender heart', price: 9.99 }
  let(:item1) { double product_code: '002', name: 'Personalised cufflinks', price: 45.00 }

	describe '#scan' do
    it 'accepts an item and stores it' do
      expect(checkout.scan(item)).to be_truthy
    end

    it 'raises error for a nil item' do
      expect { checkout.scan(nil) }.to raise_error Checkout::ERR_NIL_ITEM
    end
  end

  describe '#total' do
    let(:checkout) { Checkout.new([promo_rules]) }
    before do
      checkout.scan(item)
      checkout.scan(item1)
    end

    it 'sums all products and returns the value' do
      expect(promo_rules).to receive(:discount).with([item, item1], 54.99)
        .and_return 0
      expect(checkout.total).to eq 54.99
    end
  end
	
end