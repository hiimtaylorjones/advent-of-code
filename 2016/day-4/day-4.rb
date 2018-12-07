def read_input
  array = []
  File.open("small.txt", "r") do |file|
    file.each_line do |line|
      array.push(line)
    end
  end
  return array
end

def calculate_room_value(input, key)
  words = input.split("-")
  value = words.pop
  consistent_count = 0
  for word in words
    if consistent?(word)
      consistent_count += 1
    else
      return 0
    end
    return value if consistent_count == words.length
  end
  return nil
end

def get_letter_counts(word)
end

def consistent?(word)
  word.tr(word[0], "") == ""
end

input = read_input

for row in input do
  parts = row.tr("]", "").split("[")
  values = calculate_room_value(parts[0], parts[1])
  puts values
end
