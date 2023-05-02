require_relative 'card'

class Hand # 手札の管理をするクラス
  attr_reader :cards #
  def initialize
    @cards = []
  end

  def add_card(card) # カードを手札に加える
    @cards << card
  end

  def cards # 手札のカードを確認する
    @cards
  end

  def calculate_value # 手札の合計値を計算する
    total = 0
    ace_count = 0

    @cards.each do |card| 
      total += card.value
      ace_count += 1 if card.number == "A"  
    end

    ace_count.times do # Aを11として計算した場合、21を超えていたら1として計算する
      break if total > 21 || total + 10 > 21  
      total += 10
    end

    total 
  end

  def to_s # 手札のカードを文字列で表示する
    @cards.join(", ") # 手札のカードをカンマ区切りで表示する
  end
end