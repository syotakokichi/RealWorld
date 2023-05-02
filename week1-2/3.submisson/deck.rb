require_relative 'card'

class Deck # 山札の管理をするクラス
  attr_reader :cards
  def initialize
    @cards = [] 
    Card::SUITS.each do |suit| # カードを生成してcardsに追加
      Card::NUMBERS.each do |number|
        @cards << Card.new(suit, number)
      end
    end
    @cards.shuffle!
  end

  def draw(number) # 山札からカードを引く
    drawn_cards = @cards.pop(number) # 引いたカードを変数に代入
    drawn_cards
  end
end