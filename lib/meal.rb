class Meal
  attr_accessor :title, :price, :orders, :items

  def initialize(options = {})
    @title = options[:title]
    @price = options[:price]

    @orders = []
    @items = []
  end

  def add_item(item)
    @items << item
  end
  
  def revenue
    # orders.inject(0) { |sum, order| sum + order.revenue }
  end
end
