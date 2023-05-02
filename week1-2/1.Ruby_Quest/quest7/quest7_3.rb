# 整数の配列から偶数を抽出した配列を返す関数 select_even_numbers を作成してください。なお、select メソッドを使うようにしてください。

# ▼インプット
# [i1, i2, i3, ...]：配列
# i：整数

# ▼アウトプット
# 偶数を抽出した配列。

# ▼サンプル呼び出し
# even_numbers = select_even_numbers([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
# print even_numbers

# ▼サンプルアウトプット
# [2, 4, 6, 8, 10]
# ▼回答例_Ruby

def select_even_numbers(numbers)
  numbers.select {|n| n % 2 == 0}
end

even_numbers = select_even_numbers([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
p even_numbers