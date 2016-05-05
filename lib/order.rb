require 'pry'

class Order
  attr_accessor :quantity, :meal, :line_items, :items

  def initialize(options = {})
    @quantity = 0
    @meal = options[:meal]
    @meal.add_order( self )
    @line_items = options[:line_items] || []
    @items = []

    add_self_to_line_items_order

    calculate_line_items_quantity
    add_item_to_items_array
  end

  def revenue
  	if @line_items.count >= 1
  		calculate_line_items_revenue
  	end
  end

  private
  def add_item_to_items_array
  	@line_items.each { |line_item| self.items << line_item[:item] }	
  end

  def calculate_line_items_quantity
  	@line_items.each { |line_item| self.quantity += line_item[:quantity] }
  end

  def calculate_line_items_revenue
  	total_revenue = 0
  	@line_items.each { |line_item| total_revenue += line_item[:item].price * line_item[:quantity] }
  	total_revenue
  end

  def add_self_to_line_items_order
  	@line_items.each { |line_item| line_item[:item].add_order( self ) }
  end
end
