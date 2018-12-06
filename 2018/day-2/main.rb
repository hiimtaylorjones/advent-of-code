lines = []

File.open("input.txt", "r") do |file|
    file.each_line do |line|
        lines.push(line)
    end
end

two_count = 0
three_count = 0

lines.each do |line| 
    characters = line.chars
    hash = {}
    characters.each do |char|
        next if char == "\n"
        if hash.key?(char)
            hash[char] += 1
        else
            hash[char] = 1
        end 
    end

    if hash.key(2)
        two_count += 1
    end

    if hash.key(3)
        three_count += 1
    end
end

puts "Two Count: #{two_count}"
puts "Three Count: #{three_count}"
puts "Checksum: #{two_count * three_count}"