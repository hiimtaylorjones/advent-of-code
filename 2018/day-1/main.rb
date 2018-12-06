def insert_into_count_map(count_map, count)
    if count_map.key?(count)
        count_map[count] += 1
    else
        count_map[count] = 1
    end
end

def check_for_two_times(count_map, count)
    if count_map[count] == 2
        two_times = count
        return true
    else
        return false
    end
end

def iterate_on_count_map(chunks, count_map, count)
    chunks.each do |chunk|
        insert_into_count_map(count_map, count)
        if chunk[0] == "+"
            count += chunk[1..-1].to_i
        else 
            count -= chunk[1..-1].to_i
        end
    end
    return [count_map, count]
end

chunks = []
count_map = {}
two_times = nil
count = 0

File.open("input.txt", "r") do |file|
  file.each_line do |line|
    chunks.push(line)
  end
end

results = iterate_on_count_map(chunks, count_map, count)
puts "Final count: #{results[1]}"

count_map = results[0]

while count_map.values.uniq == 1
    iterate_on_count_map(chunks, count_map, count)
end

puts "First value to appear twice: #{count_map.key(2)}"

puts "\n\n"
puts count_map.values.uniq