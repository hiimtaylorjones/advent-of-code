path = "test.txt"
# path = "input.txt"

winning_moves = {
  # A & X -> Rock
  # B & Y -> Paper
  # C & Z -> Scissors
  "A" => "Y", # 1 point
  "B" => "Z", # 2 points
  "C" => "X"  # 3 points
}

rounds = []

File.open(path, "r") do |reader|
  reader.each_line do |line|
    moves = line.split(" ")
  end
end