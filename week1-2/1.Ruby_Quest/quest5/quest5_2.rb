def train_fare(age)
  if age > 12
    puts 200
  elsif age < 6
    puts 0
  else
    puts 100
  end
end

train_fare(3)
#0と表示
train_fare(8)
#100と表示
train_fare(15)
#200と表示