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

	private 

	attr_accessor :promo_rules, :basket
end