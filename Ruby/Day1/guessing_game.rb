value = rand(10) + 1

while true
  puts "Enter a guess: "
  guess = gets().to_i()
  
  if guess > value
    puts "Too high!"
  elsif guess < value
    puts "Too low!"
  else
    puts "Correct!"
    break
  end
end