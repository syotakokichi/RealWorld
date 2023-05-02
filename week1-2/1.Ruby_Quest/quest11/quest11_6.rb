class VendingMachine
  def initialize(manufacturer)
    @manufacturer = manufacturer
    @balance = 0
    @cup_stock = 0
  end

  def deposit_coin(coin)
    return unless coin == 100
    @balance += coin
  end

  def press_button(item)
    if item.can_dispense?(@balance, @cup_stock)
      @balance -= item.price
      @cup_stock -= item.cup_usage
      item.name
    else
      ""
    end
  end

  def add_cup(num)
    @cup_stock += num
    @cup_stock = 100 if @cup_stock > 100
  end
end

class Item
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def can_dispense?(balance, cup_stock)
    balance >= price
  end

  def cup_usage
    0
  end
end

class Beverage < Item
end

class CupCoffee < Item
  def can_dispense?(balance, cup_stock)
    super && cup_stock > 0
  end

  def cup_usage
    1
  end
end

class Snack < Item
end

hot_cup_coffee = CupCoffee.new('hot cup coffee', 100)
cider = Beverage.new('cider', 100)
snack = Snack.new('potato chips', 150)

vending_machine = VendingMachine.new('サントリー')
vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cider) # => cider

puts vending_machine.press_button(hot_cup_coffee) # => ""
vending_machine.add_cup(1)
puts vending_machine.press_button(hot_cup_coffee) # => hot cup coffee

puts vending_machine.press_button(snack) # => ""
vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(snack) # => potato chips