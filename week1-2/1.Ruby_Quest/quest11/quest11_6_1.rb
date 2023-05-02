# 6. ポリモーフィズム
# 自動販売機プログラムにスナック菓子を追加しましょう。下記の仕様を追加します。
# ボタンを押すとポテトチップスが出るようにしましょう。ポテトチップスは150円とします。スナック菓子用のクラスを新規に作ることで対応してください。
# ポリモーフィズムを意識して設計してください。

# ▼アウトプット
# press_button メソッドを実行すると、与えられた引数に応じたアイテムを返してください。

# ▼サンプルアウトプット
# cider
#  # カップが貯まっていないので空文字が出力されます
# hot cup coffee
#  # お金が貯まっていないので空文字が出力されます
# potato chips

class VendingMachine
  def initialize(name)
    @name = name
    @cup_count = 0
    @amount = 0
  end

  def press_button(item)
    item.press_button
  end

  def deposit_coin(coin100)
    if  coin100 == 100
        @amount += coin100
    end
  end

  def add_cup(count)
    if @cup_count + count <= 100
      @cup_count += count
    end
  end

  private
  def press_manufacturer_name
  end
end

class Item < VendingMachine
  attr_accessor :name

  def press_button(item)
  end
end

class Drink < Item
  def initialize(name)
    @name = name
  end

  def press_button
    if @name == 'cider' && @amount >= 100
      @amount -= 100
      'cider'
    elsif @name == 'cola' && @amount >= 150
      @amount -= 150
      'cola'
    end
  end
end

class Coffee < Item 
  def initialize(name)
    @name = name
  end

  def press_button
    if @name == 'hot' && @amount >= 100 && @cup_count >= 1
      @amount -= 100
      @cup_count -= 1
      'hot_cup_coffee'
    elsif @name == 'ice' && @amount >= 100 && @cup_count >= 1
      @amount -= 100
      @cup_count -= 1
      'ice_cup_coffee'
    end
  end
end

class Snack < Item
  def initialize
  end

  def press_button
    if @amount >= 150
      @amount -= 150
      'potato chips'
    end
  end
end

hot_cup_coffee = Coffee.new('hot')
cider = Drink.new('cider')
snack = Snack.new
vending_machine = VendingMachine.new('サントリー')
vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cider)
puts vending_machine.press_button(hot_cup_coffee)
vending_machine.add_cup(1)
puts vending_machine.press_button(hot_cup_coffee)

puts vending_machine.press_button(snack)
vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(snack)