def xor(x, y)
  (x && !y) || (!x && y)
end


puts xor(true, true)
puts xor(true, false)
puts xor(false, true)
puts xor(false, false)