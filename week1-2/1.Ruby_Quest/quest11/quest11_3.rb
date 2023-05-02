# 3. メソッドの可視性
# 自動販売機のプログラムのメソッドに可視性を追記します。下記の仕様を追加します。

# コインを入れることのできる deposit_coin メソッドを作成します。100円以外のコインは入れられず、100円コインが入れられると自動販売機に金額が貯まります
# 100円以上貯まった状態でボタンを押すとサイダーが出るようにします。サイダーが出ると入れた金額から100円が減ります
# press_manufacturer_name メソッドは外部に公開しない非公開メソッドにしてください。private キーワードを使用します

# ▼アウトプット
# 100円以上貯まった状態で press_button メソッドを実行すると、'cider' の文字列を返してください。 press_manufacturer_name メソッドを実行すると、NoMethodError エラーが起こるようにしてください。

# ▼サンプル呼び出し
# vending_machine = VendingMachine.new('サントリー')
# puts vending_machine.press_button

# vending_machine.deposit_coin(150)
# puts vending_machine.press_button

# vending_machine.deposit_coin(100)
# puts vending_machine.press_button

# puts vending_machine.press_manufacturer_name

# ▼サンプルアウトプット
#  # 100円が貯まっていないので空文字が出力されます
#  # 100円しかコインは入れられず、100円が貯まっていないので空文字が出力されます
# cider
# vending_machine.press_manufacturer_name #=> private method 'press_manufacturer_name' called for ... (NoMethodError)


class VendingMachine
  def initialize(manufacturer)
    @manufacturer = manufacturer
    @quantity = 0
  end

  def press_button
    if @quantity >= 100
       @quantity -= 100
       'cider'
    end
  end
  
  

  def deposit_coin(amount)
    if  amount == 100
        @quantity += amount
    end
  end

  private
  def press_manufacturer_name
    @manufacturer
  end
end

vending_machine = VendingMachine.new('サントリー')
# puts vending_machine.press_manufacturer_name エラーが起きる
vending_machine.deposit_coin(150)
puts vending_machine.press_button
vending_machine.deposit_coin(100)
puts vending_machine.press_button