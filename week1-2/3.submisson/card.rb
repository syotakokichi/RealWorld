
#カードのスートと数字を保持し、カードの文字列表現を提供するクラス
class Card 
  SUITS = ["スペード", "ハート", "ダイヤ", "クローバー"].freeze
  NUMBERS = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10","J", "Q", "K"].freeze

  def initialize(suit, number) 
    @suit = suit
    @number = number
  end

  def number #numberを外部から参照できるようにするためのメソッド
    @number
  end

  def to_s
    "#{@suit}の#{@number}"
  end

  def value #カードの値を計算するためのメソッド
    case @number
    when "A"
      11
    when "J", "Q", "K"
      10
    else
      @number.to_i
    end
  end
end