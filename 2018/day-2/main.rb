lines = []

File.open("input.txt", "r") do |file|
    file.each_line do |line|
        lines.push(line.delete("\n"))
    end
end

two_count = 0
three_count = 0

lines.each do |line| 
    characters = line.chars
    hash = {}
    characters.each do |char|
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

high_score = 1
found_matches = []

lines.each do |line|
    compare = line
    lines.each do |line|
        next if line == lines.first
        common = compare_words(compare, line)
        next if common == compare.length
        if common >=  high_score 
            high_score = common
            match = [compare, line]
            found_matches.push(match)
        end
    end
end

puts found_matches
best_match = found_matches.last

puts "Best Match (#{high_score} in common):"
puts "#{best_match[0]} & #{best_match[1]}"
puts (best_match[0].chars & best_match[1].chars).join
