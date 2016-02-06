require 'spec_helper'

describe Order do
  describe '.new' do
    let(:meal) { Meal.new(title: 'Salmon Croquet', price: 8) }
    let(:order) { Order.new(meal: meal, quantity: 2) }

    it 'sets a quantity' do
      expect(order.quantity).to eql(2)
    end

    it 'sets a reference to the meal' do
      expect(order.meal).to eql(meal)
    end

    it "adds the order to the meal's list of orders" do
      expect(meal.orders).to include(order)
    end
  end

  describe '#revenue' do
    let(:meal) { Meal.new(title: 'Matzah Ball Soup', price: 5) }
    let(:order) { Order.new(meal: meal, quantity: 3) }

    it 'is equal to the quantity times the price' do
      expect(order.revenue).to eql(15)
    end
  end
end
