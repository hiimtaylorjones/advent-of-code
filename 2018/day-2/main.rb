lines = []

File.open("test-2.txt", "r") do |file|
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

def compare_words(word_1, word_2)
    word_1.count(word_2)
end

compare = lines.first
high_score = 1
most_related = nil

lines.each do |line|
    next if line == lines.first
    common = compare_words(compare, line)
    if common > high_score
        most_related = line
    end
end

puts "Compare string: #{compare}"
puts "Most related string: #{most_related}"
puts (compare.chars & most_related.chars).join
