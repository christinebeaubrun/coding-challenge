require 'spec_helper'

describe Order do
  describe '.new' do
    let(:meal) { Meal.new(title: 'Salmon Croquet', price: 8) }
    let(:item1) { Item.new(name: 'Eggs', price: 5, meal: meal) }
    let(:item2) { Item.new(name: 'Turkey Bacon', price: 5, meal: meal) }

    let(:order1) { Order.new(meal: meal, line_items: [{ item: item1, quantity: 2 }, { item: item2, quantity: 3 }]) }
    let(:order2) { Order.new(meal: meal, line_items: [{ item: item2, quantity: 3 }]) }

    it 'sets a quantity' do
      expect(order1.quantity).to eql(5)
    end

    it 'sets a reference to the meal' do
      expect(order1.meal).to eql(meal)
    end

    it 'sets a reference to the item or items' do
      expect(order1.items).to include(item2)
    end

    it "adds the order to the meal's list of orders" do
      expect(meal.orders).to include(order1)
    end

    it "adds the order to the item's list of orders" do
      expect(item1.orders).to include(order1)
      expect(item2.orders).to include(order1, order2)
    end
  end

  describe '#revenue' do
    let(:meal) { Meal.new(title: 'Eggs Any Time') }
    let(:item) { Item.new(name: 'Eggs', price: 5, meal: meal) }

    let(:evening_order) { Order.new(meal: meal, line_items: [{ item: item, quantity: 3 }]) }


    it 'order revenue calculates and returns item price multiplied by quantity' do
      expect(evening_order.revenue).to eql(15)
    end
  end
end
