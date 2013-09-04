if ARGV.length != 2
  puts "Invalid arguments"
  exit 1
end

filename = ARGV[0]
search = ARGV[1]

line_num = 1
contents = File.open(filename).each do |line|
  puts "#{line_num}: #{line}" if line =~ /#{search}/
  line_num = line_num + 1
end