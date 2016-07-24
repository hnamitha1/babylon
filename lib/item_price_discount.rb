class ItemPriceDiscount
  def initialize(product_code:, new_price:, quantity_threshold:)
    @product_code = product_code.to_s
    @new_price = new_price.to_f
    @quantity_threshold = quantity_threshold.to_i
  end

  def discount(items, _)
    return 0 unless items
    @items = items
    discount_amount.round 2
  end

  private

  attr_accessor :product_code, :new_price, :quantity_threshold, :items

  def products
    items.reject { |item| item.product_code != product_code }
  end

  def items_price
    products.map(&:price).inject(:+)
  end

  def discount_amount
    if products.count >= quantity_threshold
      items_price - (products.count * new_price)
    else
      0
    end
  end
end
