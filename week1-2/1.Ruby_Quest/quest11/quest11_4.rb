# 押したボタンに応じて、サイダーかコーラが出るようにしましょう。サイダーは100円、コーラは150円とします。100円以外のコインは入れられない仕様はそのままです
# 自動販売機に関する責務とアイテムに関する責務は別のものになります。単一責任の原則に基づいてクラスを設計してください。

# ▼アウトプット
# press_button メソッドを実行すると、与えられた引数に応じたアイテムを返してください。

# ▼サンプルアウトプット
#  # 150円が貯まっていないので空文字が出力されます
# cola

class VendingMachine
  def initialize(manufacturer)
    @manufacturer = manufacturer
    @amount = 0
  end

  def press_button(item)
    if item.name == 'cider' && @amount >= 100
       @amount -= 100
       'cider'
    elsif item.name == 'cola' && @amount >= 150
       @amount -= 150
       'cola'
    end
  end

  def deposit_coin(coin100)
    if  coin100 == 100
        @amount += coin100
    end
  end

  private
  def press_manufacturer_name
    @manufacturer
  end
end

class Item 
  attr_reader :name 
  def initialize(name)
    @name = name
  end
end

cola = Item.new('cola')
cider = Item.new('cider')
vending_machine = VendingMachine.new('サントリー')
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cider)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cola) #50円足りないから空文字
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cola) #50円お釣り
vending_machine.deposit_coin(100) #150円になるからコーラ買える
puts vending_machine.press_button(cola)