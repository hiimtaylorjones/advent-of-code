main_grid = [['1'], ['2','3','4'], ['5','6','7','8','9'], ["A","B","C"], ["D"]]

def read_input
  array = []
  File.open("input.txt", "r") do |file|
    file.each_line do |line|
      array.push(line)
    end
  end
  return array
end

def can_go_up(x, y)
  case x
  when 0
    false
  when 1
    return true if y == 1
    false
  when 2
    return true if 0 < y && y < 4
    false
  when 3
    true
  when 4
    true
  end
end

def can_go_down(x, y)
  case x
  when 0
    true
  when 1
    true
  when 2
    return true if 0 < y && y < 4
    false
  when 3
    return true if y == 1
  when 4
    false
  end
end

input = read_input()
final_code = []

x = 2
y = 0

for instructions in input
  commands = instructions.chars
  for cmd in commands
    if cmd == "U" && can_go_up(x, y)
      case x
      when 1 || 2
        y -= 1
      when 3 || 4
        y += 1
      end
      x -= 1
    elsif cmd == "D" && can_go_down(x, y)
      case x
      when 0 || 1
        y += 1
      when 2 || 3
        y -= 1
      end
      x += 1
    elsif cmd == "R" && y < main_grid[x].size - 1
      y += 1
    elsif cmd == "L" && y != 0
      y -= 1
    end
    puts "CMD: #{cmd} - #{[x, y]}"
  end
  final_code.push(main_grid[x][y])
end

puts final_code
