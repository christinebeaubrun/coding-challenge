class Meal
  attr_accessor :title, :price, :orders

  def initialize(options = {})
    @title = options[:title]
    @price = options[:price]

    @orders = []
  end

  def revenue
    orders.inject(0) { |sum, order| sum + order.revenue }
  end
end
