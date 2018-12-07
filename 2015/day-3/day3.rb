class Santa
  def initialize()
    @x = 0
    @y = 0
  end

  def self.x
    @x
  end

  def self.y
    @y
  end

  def move(input)
    if input == "^"
      @y += 1
      add_to_hash(@x,@y)
    elsif input == "<"
      @x -= 1
      add_to_hash(@x,@y)
    elsif input == "v"
      @y -= 1
      add_to_hash(@x,@y)
    elsif input == ">"
      @x += 1
      add_to_hash(@x,@y)
    else
      puts "Skipping input..."
    end
  end
end

class RoboSanta

  def initialize()
    @x = 0
    @y = 0
  end

  def self.x
    @x
  end

  def self.y
    @y
  end

  def move(input)
    if input == "^"
      @y += 1
      add_to_hash(@x,@y)
    elsif input == "<"
      @x -= 1
      add_to_hash(@x,@y)
    elsif input == "v"
      @y -= 1
      add_to_hash(@x,@y)
    elsif input == ">"
      @x += 1
      add_to_hash(@x,@y)
    else
      puts "Skipping input..."
    end
  end
end

def read_input
  # file = File.open("day_3_input.txt", "r")
  file = File.open("day_3_input.txt", "r")
  input = file.read
  file.close
  return input.chars
end

def add_to_hash(x, y)
  if $grid.key?([x,y]) == false
    $grid[[x,y]] = true
  end
end

steps = read_input()

$grid = Hash.new
$grid[[0, 0]] = true

@santa = Santa.new
@robot = RoboSanta.new

i = 0

for step in steps
  if (i % 2) == 0
    @santa.move(step)
  else
    @robot.move(step)
  end
  i += 1
end

puts "Unique visits: \n"
puts $grid.length.to_s
