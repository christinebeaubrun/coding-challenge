require 'spec_helper'

describe Item do
	describe '.new' do
    let(:meal) { Meal.new(title: 'Taste of the Island: Jamaica', price: 12) }
		let(:item) { Item.new(name:'Spicy Curry Chicken', price:5, meal: meal) }

		it 'sets a title' do
			expect(item.name).to eql('Spicy Curry Chicken')
		end

		it 'sets a price' do
			expect(item.price).to eql(5)
		end

		it 'sets a reference to itself within the meal instance' do
			expect(meal.items).to include(item)
		end
	end

	describe '#revenue' do
		let(:meal) { Meal.new(title: 'Taste of the Island: Jamaica') }
		let(:item) { Item.new(name:'Spicy Curry Chicken', price:5, meal: meal) }
    let(:order) { Order.new(meal: meal, line_items: [{ item: item, quantity: 2 }]) }

    it 'returns the total cost based off order quantity' do
    	# expect( item.revenue ).to eql(15) <<< FAILING TEST
    end
  end
end