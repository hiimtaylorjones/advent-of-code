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

leaders = {
  # First place
  1 => { 
    "index" => 0,
    "value" => 0
  },
  # Second place
  2 => { 
    "index" => 0,
    "value" => 0
  },
  # Third Place
  3 => { 
    "index" => 0,
    "value" => 0
  }
}

calorie_map.keys.each do |key|
  sum = calorie_map[key].sum

  if leaders[1]["value"] < sum
    leaders[3]["index"] = leaders[2]["index"]
    leaders[3]["value"] = leaders[2]["value"]

    leaders[2]["index"] = leaders[1]["value"]
    leaders[2]["value"] = leaders[1]["value"]

    leaders[1]["index"] = key
    leaders[1]["value"] = sum
  elsif leaders[2]["value"] < sum
    leaders[3]["index"] = leaders[2]["index"]
    leaders[3]["value"] = leaders[2]["value"]

    leaders[2]["index"] = key
    leaders[2]["value"] = sum
  elsif leaders[3]["value"] < sum
    leaders[3]["index"] = key
    leaders[3]["value"] = sum
  end
end

puts leaders
puts [leaders[1]["value"], leaders[2]["value"], leaders[3]["value"]].sum