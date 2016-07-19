class TotalPriceDiscount
	def initialize(threshold, percentage)
    @threshold = threshold.to_f
    @percentage = percentage.to_f
  end

  def discount(total)
    if total.to_f > threshold
      discount_amount(total.to_f).round 2
    else
      0
    end
  end

  private

  attr_accessor :threshold, :percentage

  def discount_amount(total)
   total * (percentage / 100)
  end
end