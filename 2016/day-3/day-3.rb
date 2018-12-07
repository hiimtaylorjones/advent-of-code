def compare_sides(a, b, c)
  return true if (a + b) > c && (b + c) > a && (a + c) > b
  false
end

def read_input
  array = []
  File.open("input.txt", "r") do |file|
    file.each_line do |line|
      array.push(line.strip())
    end
  end
  return array
end

possible_count = 0

for line in read_input
  values = line.split(' ')
  possible_count += 1 if compare_sides(values[0].to_i, values[1].to_i, values[2].to_i)
end

puts "Possible count: #{possible_count}"
