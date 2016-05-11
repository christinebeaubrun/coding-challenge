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
			@orders.each { |order|
				# check that the item in order matches self
				order.items.each { |item| 
					if item == self
						total_revenue = self.price * order.quantity
					end
				}
			}
		total_revenue
	end
end