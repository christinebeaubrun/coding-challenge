require 'spec_helper'

describe Meal do
  describe '.new' do
    let(:meal) { Meal.new(title: 'Lasagna With Love', price: 10) }

    it 'sets a title' do
      expect(meal.title).to eql('Lasagna With Love')
    end

    it 'sets a price' do
      expect(meal.price).to eql(10)
    end

    it 'sets an empty list of orders' do
      expect(meal.orders).to eql([])
    end
  end

  describe '#revenue' do
    meal = Meal.new(title: 'Jamaican Jerk', price: 12)

    it 'is zero when there are no orders' do
      expect(meal.revenue).to eql(0)
    end

    it 'is equal to the sum of the revenue of all the orders' do
      item1 = Item.new(name: 'Fried Plantains', price: 8, meal: meal)
      item2 = Item.new(name: 'Fried Plantains', price: 8, meal: meal)

      Order.new(meal: meal, line_items: [ { item: item1, quantity: 1 }, { item: item2, quantity: 1 }])

      expect(meal.revenue).to eql(16)
    end
  end

  describe '.items' do
    let(:meal) { Meal.new(title: 'Taste of the Islands: Haiti', price: 15) }
    let(:item1) { Item.new(name: 'Fried Plantains', price: 8, meal: meal) }
    let(:item2) { Item.new(name:'Spicy Curry Chicken', price:5, meal: meal) }


    it 'has item instances' do
      expect(meal.items).to eql([item1,item2])
    end
  end
end
