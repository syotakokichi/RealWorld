def fibonacci(n)
  if n == 0 || n == 1
    n
  else
    fibonacci(n-1) + fibonacci(n-2)
  end
end

puts fibonacci(10)  # 55
puts fibonacci(15)  # 610
puts fibonacci(20)  # 6765