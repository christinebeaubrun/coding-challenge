
# Josephine Coding Challenge

Hi! Welcome to the Josephine Coding Challenge.

This challenge will test your ability to write clean, intuitive, and well-tested object oriented code – all things we care about deeply at Josephine!

Please set aside **two hours** to complete this exercise. If you have any questions, don't hesitate to send us an email at jobs@josephine.com. Good luck!

Pssst – [we're hiring](http://josephine.com/jobs)!


## Getting Started

Start by cloning this repository:

```
$ git clone git@github.com:josephine/coding-challenge.git
$ cd coding-challenge
```

Then run `bundle install` (if you don't have it, run `gem install bundler`)

```
$ bundle install
```

This project comes with an RSpec test suite. Run it to make sure everything works!

```
$ rspec spec

Meal
  .new
    sets a title
    sets a price
    sets an empty list of orders
  #revenue
    is zero when there are no orders
    is equal to the sum of the revenue of all the orders

Order
  etc. ...

Finished in 0.00304 seconds (files took 0.08894 seconds to load)
9 examples, 0 failures
```

If you get 9 passing tests, you're ready to start the challenge :)

## Exploring Our Code

This repository comes with two classes, `Meal` and `Order`. Each class has a set of unit tests.

- [lib/meal.rb](lib/meal.rb)
- [lib/order.rb](lib/order.rb)
- [spec/meal_spec.rb](spec/meal_spec.rb)
- [spec/order_spec.rb](spec/order_spec.rb)

A `Meal` has a `title` and a `price`. Each new meal also starts with an empty array of orders. For example:

```ruby
>> meal = Meal.new(title: 'Lasagna With Love', price: 10)
=> <Meal: ... >

>> meal.title
=> "Lasagna With Love"

>> meal.price
=> 10

>> meal.orders
=> []
```

We create an `Order` for a meal by simply passing in a `quantity` and a `meal` reference:

```ruby
>> order = Order.new(quantity: 3, meal: meal)
=> <Order: ... >

>> order.quantity
=> 3

>> order.meal
=> <Meal: ... >
```

We can also calculate revenue for orders and meals. Order's `revenue` method multiplies the order's quantity by the meal's price:

```ruby
>> order.revenue
=> 30
```

Meal's `revenue` method sums up all of the revenue for that meal's orders:

```ruby
>> meal.orders.count
=> 1

>> meal.revenue
=> 30

>> Order.new(quantity: 2, meal: meal)
=> <Order: ... >

>> meal.orders.count
=> 2

>> meal.revenue
=> 50
```

All of the above behavior is tested in the two files in the `spec/` directory. Have a close look at those tests, as well as the implementation code in `lib/`.

In the next section we'll add more behavior to our app, but we'll want to ensure that **100% of our implementation code is still tested.**

## Meals, Orders, and Items. Oh My!

In the example above, each meal can only have one item. This inherently means that orders can only be for one item. What if we wanted to support multiple items for meals and orders?

Let's imagine our code actually worked like this:

```ruby
>> meal = Meal.new(title: 'A Thanksgiving Feast')
=> <Meal: ... >

>> meal.items
=> []

>> meal.items.count
=> 0

>> turkey = Item.new(name: 'Tantalizing Turkey', price: 10, meal: meal)
=> <Item: ... >

>> stuffing = Item.new(name: 'Scrumptious Stuffing', price: 3, meal: meal)
=> <Item: ... >

>> meal.items
=> [<Item: ... >, <Item: ... >]

>> meal.items.count
=> 2
```

Orders would now have multiple line items:

```ruby
>> order = Order.new(
  meal: meal,
  line_items: [
    { item: turkey, quantity: 4 },
    { item: stuffing, quantity: 1 }
  ]
)
=> <Order: ... >
```

We'd be able to compute the revenue for this order:

```ruby
>> order.revenue
=> 43
```

As well as see the different items it's comprised of:

```ruby
>> order.items
=> [<Item: ... >, <Item: ... >]

>> order.items.count
=> 2
```

We could use the same item in multiple orders...

```ruby
>> meal = Meal.new(title: 'Eggs Any Time')
>> item = Item.new(name: 'Eggs', price: 5, meal: meal)

>> morning_order = Order.new(meal: meal, line_items: [{ item: item, quantity: 2 }])
>> evening_order = Order.new(meal: meal, line_items: [{ item: item, quantity: 3 }])
```

... and then see which orders that item has been included in.

```ruby
>> item.orders
=> [<Order: ... >, <Order: ... >]

>> item.orders.count
=> 2
```

Finally, we'd be able to see the total revenue for that item across all orders:

```ruby
>> item.revenue
=> 25
```

Voilà!

## Your Challenge

That code above seems wonderful, doesn't it? If only we had someone to implement it... hm... :)

Your job is to implement all of the new behavior above. You'll also want to ensure that each method (new and existing) is **still 100% unit tested**

When you're done, make a *local* commit and zip/tar up your repository. Then send us an email at jobs@josephine.com. We're looking forward to hearing from you!

## Appendix – Reading List

The challenge above assumes some knowledge of Ruby and RSpec. If you need to brush up on either, here are a few great resources:

- [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide)
- [RSpec Style Guide](https://github.com/reachlocal/rspec-style-guide)
- [RSpec Best Practices](https://github.com/abinoda/rspec-best-practices)
- [Better Specs](http://betterspecs.org/)
- [Relish](https://www.relishapp.com/rspec)

We *may soon* write a second version of this challenge in Javascript. If you think you'd be a great candidate but the Ruby's getting in the way, feel free to shoot us a line at jobs@josephine.com and make your case :)
