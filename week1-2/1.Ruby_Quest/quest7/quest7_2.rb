# 与えられた整数の配列の要素を2乗した配列を返す square 関数を定義してください。なお、map メソッドを使うようにしてください。


def square(arr)
  arr.map {|i| i ** 2}
end

squared_numbers = square([5, 7, 10])
p squared_numbers

