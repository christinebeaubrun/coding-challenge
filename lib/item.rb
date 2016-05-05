require 'pry'

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
			@orders.each { |order_item|
				if order_item.items.count > 1
				# order has more than one item, so iterating over that array
				# check that the item in order matches self
					order_item.items.each { |item_obj| (item_obj == self ) ? (total_revenue = self.price * order_item.quantity) : (total_revenue = 0) }
				else
				# order has just one item
				# check that the item in order matches self
					( order_item.items.first == self ) ? (total_revenue = self.price * order_item.quantity) : (total_revenue = 0)
				end
			}
		total_revenue
	end
end