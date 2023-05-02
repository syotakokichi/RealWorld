def print_names(names)
  names.each.with_index(1) do |name, i|
    puts "#{i}: #{name}"
  end
end

names = ["Alice", "Bob", "Charlie", "Dave"]
print_names(names)

