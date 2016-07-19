class Checkout
	ERR_NIL_ITEM = "Item is nil".freeze

	def initialize(promo_rules)
		@promo_rules = promo_rules;
		@basket = [];
	end

	def scan(item)
		fail ERR_NIL_ITEM if item == nil
		@basket << item;
	end

	def total
    (total_price - total_discount).round 2
  end

  private

  attr_accessor :basket, :promo_rules

  def total_price
    basket.map(&:price).inject(:+)
  end

  def total_discount
    discounts.inject(:+)
  end

  def discounts
    promo_rules.map do |rule|
      rule.discount(basket, total_price)
    end
  end
end