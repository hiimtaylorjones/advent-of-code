chunks = []
count_map = {}
two_times = nil
count = 0

File.open("input.txt", "r") do |file|
  file.each_line do |line|
    chunks.push(line)
  end
end


chunks.each do |chunk|

    if count_map.key?(count)
        count_map[count] += 1
    else 
        count_map[count] = 1
    end

    if chunk[0] == "+"
        count += chunk[1..-1].to_i
    else 
        count -= chunk[1..-1].to_i
    end
    
    
end

if count_map.key?(count)
    count_map[count] += 1
else 
    count_map[count] = 1
end

if two_times.nil? && count_map[count] == 2
    two_times = count 
end

puts count_map

puts "\n\n"
puts "Final count: #{count}"
puts "First result to come twice: #{two_times}"