# オブジェクト指向（クラス）を使わずに実装しましょう。オブジェクト指向を使わないことで、クラスを使わないことの不便さを実感します。

# 仕様変更が入りました。2枚の手札で行うツーカードポーカーに加え、3枚の手札で行うスリーカードポーカー、両方のルールに対応できるようにする必要が発生しました。

# 各プレイヤーに配られたカードの枚数が2枚ずつのときはツーカードポーカーとして処理し、配られたカードの枚数が3枚ずつのときはスリーカードポーカーとして処理します。

# ツーカードポーカーとスリーカードポーカーの両方に対応させてください。
# スリーカードポーカーにおける役は次の通りです。ツーカードポーカーの役はStep1のままです。

# ハイカード：以下の役が一つも成立していない
# ペア：2枚のカードが同じ数字
# ストレート：3枚のカードが連続している。A は 2 と K の両方と連続しているとみなし、A を含むストレート は、A-2-3 と Q-K-A の2つ。ただし、K-A-2 のランクの組み合わせはストレートとはみなさない
# スリーカード：3枚のカードが同じ数字
# ポーカーを開始します。カードを引く枚数を選択してください（2, 3）：

def create_deck
  suits = ["ハート", "ダイヤ", "クラブ", "スペード"]
  ranks = (1..13).to_a
  deck = []

  suits.each do |suit|
    ranks.each { |rank| deck << [suit, rank] }
  end
  deck.shuffle
end

def draw_cards(deck, n)
  deck.pop(n)
end

def hand_type(hand)
  sorted_ranks = hand.map { |card| card[1] }.sort

  if hand.size == 2
    if sorted_ranks[0] == sorted_ranks[1]
      return "ペア"
    elsif (sorted_ranks[0] - sorted_ranks[1]).abs == 1 || (sorted_ranks[0] - sorted_ranks[1]).abs == 12
      return "ストレート"
    else
      return "ハイカード"
    end
  elsif hand.size == 3
    if sorted_ranks.uniq.size == 1
      return "スリーカード"
    elsif sorted_ranks.uniq.size == 2
      return "ペア"
    elsif sorted_ranks == [1, 2, 3] || sorted_ranks == [1, 12, 13] || (sorted_ranks[0] - sorted_ranks[1] == -1 && sorted_ranks[1] - sorted_ranks[2] == -1)
      return "ストレート"
    else
      return "ハイカード"
    end
  end
end

puts "ポーカーを開始します。"
print "カードを引く枚数を選択してください（2, 3）："
num_cards = gets.chomp.to_i

deck = create_deck

player_hand = draw_cards(deck, num_cards)
dealer_hand = draw_cards(deck, num_cards)

player_hand.each_with_index do |card, i|
  puts "あなたの引いたカード#{i + 1}枚目は#{card[0]}の#{card[1]}です。"
end

dealer_hand.each_with_index do |card, i|
  puts "ディーラーの引いたカード#{i + 1}枚目は#{card[0]}の#{card[1]}です。"
end

player_hand_type = hand_type(player_hand)
dealer_hand_type = hand_type(dealer_hand)

puts "あなたの役は#{player_hand_type}です。"
puts "ディーラーの役は#{dealer_hand_type}です。"

if player_hand_type == dealer_hand_type
  if player_hand.map { |card| card[1] }.sum > dealer_hand.map { |card| card[1] }.sum
    puts "あなたの勝ちです！"
  elsif player_hand.map { |card| card[1] }.sum < dealer_hand.map { |card| card[1] }.sum
    puts "ディーラーの勝ちです。"
  else
    puts "引き分けです。"
  end
elsif ["ハイカード", "ストレート", "ペア", "スリーカード"].index(player_hand_type) > ["ハイカード", "ストレート", "ペア", "スリーカード"].
end
index(dealer_hand_type)
puts "あなたの勝ちです！"
elsif ["ハイカード", "ストレート", "ペア", "スリーカード"].index(player_hand_type) < ["ハイカード", "ストレート", "ペア", "スリーカード"].index(dealer_hand_type)
puts "ディーラーの勝ちです。"
end


# 3
# あなたの引いたカードはハートの7です。
# あなたの引いたカードはクラブの7です。
# あなたの引いたカードはスペードの7です。
# ディーラーの引いたカードはダイヤのQです。
# ディーラーの引いたカードはスペードのKです。
# ディーラーの引いたカードはスペードのAです。
# あなたの役はスリーカードです。
# ディーラーの役はストレートです。