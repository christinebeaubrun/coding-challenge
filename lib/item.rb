class Item
	attr_accessor :name, :price, :meal

	def initialize(options = {})
		@name = options[:name]
		@price = options[:price]
		@meal = options[:meal]
		@meal.items << self
	end
end