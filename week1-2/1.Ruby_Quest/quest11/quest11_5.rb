# 自動販売機プログラムで以下の仕様変更がありました。
# カップコーヒー（カップに注ぐコーヒー）のアイスとホットも選択できるようにします。値段はどちらも100円です
# カップの在庫管理も行ってください。カップコーヒーが一つ注文されるとカップも在庫から一つ減ります。自動販売機が保持できるカップ数は最大100個とします
# カップを追加できるようにしてください
# 継承を使って実装してください。

class VendingMachine
  def initialize(name)
    @name = name
    @cup_count = 0
    @amount = 0
  end

  def press_button(item)
    if item.name == 'cider' && @amount >= 100
       @amount -= 100
       'cider'
    elsif item.name == 'cola' && @amount >= 150
       @amount -= 150
       'cola'
    elsif item.name == 'hot' && @amount >= 100 && @cup_count >= 1
       @amount -= 100
       @cup_count -= 1
        'hot_cup_coffee'
    elsif item.name == 'ice' && @amount >= 100 && @cup_count >= 1
       @amount -= 100
       @cup_count -= 1
        'ice_cup_coffee'
    end
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

class Item
  attr_accessor :name
end

class Drink < Item
  def initialize(name)
    @name = name
  end
end

class Coffee < Item 
  def initialize(name)
    @name = name
  end
end

hot_cup_coffee = Coffee.new('hot')
cider = Drink.new('cider')
vending_machine = VendingMachine.new('サントリー')
vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cider)
puts vending_machine.press_button(hot_cup_coffee)
vending_machine.add_cup(1)
puts vending_machine.press_button(hot_cup_coffee)

# ▼サンプルアウトプット
#cider
#空文字
# hot cup coffee