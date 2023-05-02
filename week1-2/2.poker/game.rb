class Game
  def initialize
    @deck = Deck.new
    @player = Player.new('あなた')
  end

  def play
    puts "ポーカーを開始します。"
    @player.draw(@deck)

    puts "あなたの引いたカードは#{@player.cards[0].to_s}です。"
  end
end

