#require_relativeは、同じディレクトリにあるファイルを読み込むための記述
require_relative 'deck' 
require_relative 'player'

class Game #ゲームを管理するクラス
  def initialize
    @deck = Deck.new
    @player = Player.new('あなた')
    @dealer = Dealer.new('ディーラー')
  end

  def start #ゲームを開始する
    puts "ブラックジャックを開始します。"
    @player.draw(@deck, 2)
    @player.show_initial_card
    @dealer.draw(@deck, 2)
    @dealer.show_initial_card
    @player.play_turn(@deck)
    if @player.hand.calculate_value > 21
      puts "#{@dealer.name}の勝ちです！"
    else
      @dealer.play_turn(@deck)
      if @dealer.hand.calculate_value > 21 || @player.hand.calculate_value > @dealer.hand.calculate_value
        puts "#{@player.name}の勝ちです！"
      elsif @player.hand.calculate_value == @dealer.hand.calculate_value
        puts "引き分けです。"
      else
        puts "#{@dealer.name}の勝ちです！"
      end
    end
    puts "ブラックジャックを終了します。"
  end
end

#オブジェクト指向で設計する際は、一つの物事に対する責務を一つのクラスに持たせることが重要です。(単一責任の原則)
# - Game：ゲームの進行管理をするクラス
# - Deck：山札の管理をするクラス
# - Player：プレイヤーを管理するクラス