class Item
	attr_accessor :name, :price, :orders

	def initialize(options = {})
		@name = options[:name]
		@price = options[:price]
		options[:meal].add_item( self )
		@orders = []
	end

	def add_order( order )
		@orders << order
	end

	def revenue
		total_revenue = 0
		if @orders.count >= 1
			@orders.each  { |order_item| if order_item[:item] == self then total_revenue += (self.price * order_item[:quantity]) end}
		end
		total_revenue
	end
end