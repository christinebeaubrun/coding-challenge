require 'spec_helper'

describe Item do
	describe '.new' do
		let(:meal) {Meal.new(title: 'Caribbean Soul Food', price: 15)}
		let(:item) {Item.new(name:'Spicy Curry Chicken', price:12, meal: meal)}

		it 'sets a title' do
			expect(item.name).to eql('Spicy Curry Chicken')
		end

		it 'sets a price' do
			expect(item.price).to eql(12)
		end

		it 'sets a meal' do
			expect(item.meal).to eql(meal)
		end
	end
end