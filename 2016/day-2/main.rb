grid_1= [1, 2, 3]
grid_2 = [4, 5, 6]
grid_3 = [7, 8, 9]

def read_input
  array = []
  File.open("input.txt", "r") do |file|
    file.each_line do |line|
      array.push(line)
    end
  end
  return array
end

main_grid = [grid_1, grid_2, grid_3]
input = read_input()
final_code = []

x = 1
y = 1

for instructions in input
  commands = instructions.chars
  for cmd in commands
    if cmd == "U"
      x -= 1 unless x == 0
    elsif cmd == "D"
      x += 1 unless x == 2
    elsif cmd == "R"
      y += 1 unless y == 2
    elsif cmd == "L"
      y -= 1 unless y == 0
    end
  end
  final_code.push(main_grid[x][y])
end
