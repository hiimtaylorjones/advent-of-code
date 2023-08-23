calorie_map = { 1 => [] }
index = 1
# path = "test.txt"
path = "input.txt"

File.open(path, "r") do |reader|
  reader.each_line do |line|
    if line == "\n"
      index = index + 1
      calorie_map[index] = []
    else
      calorie_map[index].push (line.to_i)
    end
  end
end

puts calorie_map

leading_index = 1
leading_value = 0

calorie_map.keys.each do |key|
  sum_to_compare = calorie_map[key].sum
  if leading_value < sum_to_compare 
    leading_index = key
    leading_value = sum_to_compare
  end
end

puts leading_index
puts leading_value