class Order
  attr_accessor :quantity, :meal

  def initialize(options = {})
    @quantity = options[:quantity]
    @meal = options[:meal]

    @meal.orders << self
  end

  def revenue
    quantity * meal.price
  end
end
