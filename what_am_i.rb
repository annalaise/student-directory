filename = $0

puts "The source code for the current file, #{filename}, is:"
open(filename, "r") do |f|
  f.each_line { |line| puts line }
end 
