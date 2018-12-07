class Elevator

  def initialize(floor)
    @floor = floor
    @index = 0
  end

  def self.floor
    @floor
  end

  def self.index
    @index
  end

  def up
    @floor = @floor + 1
    @index = @index + 1
  end

  def down
    @floor = @floor - 1
    @index = @index + 1
  end

  def read_input
    file = File.open("day_1_input.txt", "r")
    input = file.read
    file.close
    return input.chars
  end

  def process_input
    instructions = read_input

    for i in instructions
      if i == "("
        up()
      elsif i == ")"
        down()
        if @floor == -1
          puts "Entering basement at index #" + @index.to_s
        end
      else
        puts "skipping input at index " + @index.to_s
      end
    end

    puts "Final Floor: " + @floor.to_s
  end
end

elevate = Elevator.new(0)
elevate.process_input
