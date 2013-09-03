numbers = (1..16).to_a()
print_stack = []

puts "Four at a time using each"
numbers.each do |number|
  print_stack.push(number)
  
  if print_stack.length == 4
    print print_stack
    puts
    print_stack.clear()
  end
end

puts "********"
puts "Four at a time using each_slice"
numbers.each_slice(4) do |slice| 
  print slice
  puts
end