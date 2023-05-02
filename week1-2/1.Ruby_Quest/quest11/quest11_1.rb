# 自動販売機のプログラムをオブジェクト指向を使って書きましょう。今回実装する内容は下記の通りです。

# 自動販売機のクラス VendingMachine を宣言してください
# ボタンを押すとサイダーが出るようにします。press_button メソッドを実行すると 'cider' の文字列を返してください

# ▼アウトプット
# press_button メソッドを実行し、'cider' の文字列を返してください。

# ▼サンプル呼び出し
# vending_machine = VendingMachine.new
# puts vending_machine.press_button

# ▼サンプルアウトプット
# cider


class VendingMachine
  def press_button
    'cider'
  end
end

vending_machine = VendingMachine.new
puts vending_machine.press_button

