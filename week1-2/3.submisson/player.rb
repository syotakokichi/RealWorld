require_relative 'deck'
require_relative 'hand'
require_relative 'card'

class Player #プレイヤーを管理するクラス
attr_reader :name, :hand

  def initialize(name)
    @name = name
    @hand = Hand.new
  end

  def draw(deck, number) # 山札からカードを引く
    new_cards = deck.draw(number)
    number.times { @hand.add_card(deck.draw(1).first) }
  end

  def show_initial_card # 初期手札を表示する
    puts "#{@name}の引いたカードは#{@hand.cards[0].to_s}です。"
    puts "#{@name}の引いたカードは#{@hand.cards[1].to_s}です。"
  end

  def play_turn(deck) # ターンを実行する
    while true # 無限ループ
      puts "#{name}の現在の得点は#{@hand.calculate_value}です。カードを引きますか？（Y/N）"
      input = gets.chomp.upcase # YかNを入力する
      if input == "Y"
      draw(deck, 1) 
      puts "#{name}の引いたカードは#{@hand.cards.last}です。"
        if @hand.calculate_value > 21 # 21を超えたら終了
          puts "#{name}の得点が21を超えました。"
          break
        end
      elsif input == "N" # Nを入力したら終了
        break
      else
        puts "無効な入力です。YまたはNを入力してください。" # YでもNでもない場合はエラー
      end
    end
  end
end

class Dealer < Player #ディーラーを管理するクラス
  def show_initial_card 
    puts "#{@name}の引いたカードは#{@hand.cards[0].to_s}です。"
    puts "#{@name}の引いた2枚目のカードはわかりません。"
  end

  def play_turn(deck) 
    puts "#{@name}の引いた2枚目のカードは#{@hand.cards[1].to_s}でした。"
    while @hand.calculate_value < 17 # 17以上になるまで引き続ける
      draw(deck, 1)
      puts "#{@name}の引いたカードは#{@hand.cards.last}です。"
    end
    puts "#{@name}の現在の得点は#{@hand.calculate_value}です。"
  end
end