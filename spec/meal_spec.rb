require 'spec_helper'

describe Meal do
  # describe '.new' do
  #   let(:meal) { Meal.new(title: 'Lasagna With Love', price: 10) }

  #   it 'sets a title' do
  #     expect(meal.title).to eql('Lasagna With Love')
  #   end

  #   it 'sets a price' do
  #     expect(meal.price).to eql(10)
  #   end

  #   it 'sets an empty list of orders' do
  #     expect(meal.orders).to eql([])
  #   end
  # end

  # describe '#revenue' do
  #   let(:meal) { Meal.new(title: 'Jamaican Jerk Chicken', price: 12) }

  #   it 'is zero when there are no orders' do
  #     expect(meal.revenue).to eql(0)
  #   end

  #   it 'is equal to the sum of the revenue of all the orders' do
  #     Order.new(quantity: 3, meal: meal)
  #     Order.new(quantity: 2, meal: meal)

  #     expect(meal.revenue).to eql(60)
  #   end
  # end

  describe '.items' do
    let(:meal) { Meal.new(title: 'Taste of the Islands: Haiti', price: 15) }
    let(:item) { Item.new(name: 'Fried Plantains', price: 8, meal: meal) }

    it 'has item instances' do
      expect(meal.items).to include(item)
    end
  end
end
