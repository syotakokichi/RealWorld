def sum(x, y)
  sum = 0
  for i in x..y do
    sum += i
  end
  puts sum
end

sum(1, 100) #quest6_3と同じ結果
sum(5, 10) #45