# path = "test.txt"
path = "input.txt"

#   A & X -> Rock     (1 point)
#   B & Y -> Paper    (2 points)
#   C & Z -> Scissors (3 points)
#   Win -> 6
#   Loss -> 0
#   Draw -> 3

scenarios = {
  # Loss
  "B X" => 1,
  "C Y" => 2,
  "A Z" => 3,
  # Draw
  "A X" => 4,
  "B Y" => 5,
  "C Z" => 6,
  # Win
  "C X" => 7,
  "A Y" => 8,
  "B Z" => 9
}

round_scores = []

File.open(path, "r") do |reader|
  reader.each_line do |line|
    trimmed = line.gsub("\n", "")
    round_scores.push(scenarios[trimmed])
  end
end

puts "#{round_scores}"
puts round_scores.sum