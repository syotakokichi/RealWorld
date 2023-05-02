# 自動販売機のプログラムに initialize メソッド を追加しましょう。下記の仕様を追加します。

# オブジェクトの生成時に自動販売機のメーカー名を記録できるように、initialize メソッドを追加します
# 自動販売機のメーカー名確認ボタンを押すと、メーカー名を返す press_manufacturer_name メソッドを追加する


# ▼アウトプット
# press_manufacturer_name メソッドを実行し、自動販売機のメーカー名を返してください。

# ▼サンプル呼び出し
# vending_machine = VendingMachine.new('サントリー')
# puts vending_machine.press_manufacturer_name

# ▼サンプルアウトプット
# サントリー


class VendingMachine
  def press_button
    'cider'
  end
  
  def initialize(manufacturer)
    @manufacturer = manufacturer
  end

  def press_manufacturer_name
    @manufacturer
  end
end

vending_machine = VendingMachine.new('サントリー')
puts vending_machine.press_manufacturer_name