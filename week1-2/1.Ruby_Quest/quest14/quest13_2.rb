# 例外処理の付いた電卓プログラムを作成してください。このプログラムでは、2つの数値と演算子（+、-、*、/）を引数として受け取り、演算を実行して結果を出力します。ゼロで割ったり、無効な演算子を入力したりといった潜在的なエラーを処理するために、例外処理を追加します。
# num1、num2(整数)、operator(文字列)の3つのパラメータを受け取るcalculateという関数を作成する。この関数は、対応する演算を実行し、結果を返す必要があります。

#(例外①)num2 が 0 で割り算が実行されたときには ZeroDivisionError が発生し、"ゼロによる割り算は許可されていません" と出力。
#[num2のみの例外]

#(例外②)num1、num2 が整数以外は "num1、 num2 には整数を入力してください" と出力。 
#[num1, num2の例外]

#(例外③)operator が +、-、、/ の場合は、"演算子には +、-、、/ のいずれかを使用してください" と出力。 


#④それ以外の演算を実行し、結果を出力。

# プログラムを完成させるために、calculate 関数内で適切な例外処理を追加し、begin と rescue ブロック内で例外を捕捉する方法を説明します。以下に完成したプログラムの例を示します。

def calculate(num1, num2, operator)
  raise ArgumentError, "num1、 num2 には整数を入力してください" unless num1.is_a?(Integer) && num2.is_a?(Integer)
  raise ArgumentError, "演算子には +、-、*、/ のいずれかを使用してください" unless ['+', '-', '*', '/'].include?(operator)

  if operator == '+'
    num1 + num2
  elsif operator == '-'
    num1 - num2
  elsif operator == '*'
    num1 * num2
  elsif operator == '/'
    if num2 == 0
      raise "ゼロによる割り算は許可されていません"
      # num2は整数の定義をすでにされているので、ArgumentErrorは不要
    else
      num1 / num2
    end
  end
end
  
puts "1番目の整数を入力してください:"
num1 = Integer(gets) rescue nil

puts "2番目の整数を入力してください:"
num2 = Integer(gets) rescue nil

puts "演算子(+, -, *, /)を入力してください:"
operator = gets.chomp

begin
  result = calculate(num1, num2, operator)
  puts result
rescue => e
  puts e.message
end

# calculate(1, 0, '/')
# calculate(1.5, 2, '+')
# calculate(1.5, 2, '**')
# calculate(5, 2, '*')

# ・出力
# ゼロによる割り算は許可されていません
# num1、 num2 には整数を入力してください
# 演算子には  +、-、*、/ のいずれかを使用してください
# 10

# 上記のプログラムには、以下の変更と追加が含まれています。
# 入力を整数に変換するために、Integer(gets) を使用し、それが失敗した場合は nil を返すようにします。これにより、整数以外の入力があった場合、calculate 関数内で ArgumentError が発生します。
# calculate 関数内で、num1 および num2 が整数であることを確認し、そうでない場合は ArgumentError を発生させます。
# calculate 関数内で、operator が有効な演算子（+、-、*、/）であることを確認し、そうでない場合は ArgumentError を発生させます。
# begin と rescue ブロック内で、発生した ArgumentError の例外を捕捉し、エラーメッセージを出力します。
# このプログラムは、入力が正しい場合に演算を実行し、異なる種類の例外に対処できるようになっています。プログラムの実行中に例外が発生すると、対応する rescue 節が実行され、適切なエラーメッセージが表示されます。例外処理を適切に使用することで、プログラムがエラーに対処しやすくなり、ユーザーにとってより使いやすいものになります。
#例外処理の概念と、上記のプログラムでの具体的な使用方法を理解することで、プログラミング初心者でもエラー処理に対応したコードを書くことができるようになります。この知識を他のプロジェクトにも適用して、エラーに対処する堅牢なアプリケーションを開発することができます。