import sys

in_file = open("input.txt", 'r')
instructions = []

north = 0
south = 0
east = 0
west = 0

current = "north"
current_grid = [(north-south), (east-west)]

for lines in in_file.readlines():
    row = lines.split(',')
    for col in row:
        instructions.append(col.strip())

in_file.close()

for instruction in instructions:
    l_or_r = instruction[:1]
    steps = int(instruction[1:])

    if current == "north":
        if l_or_r == "L":
            current = "west"
            west = west + steps
        else:
            current = "east"
            east = east + steps
    elif current == "east":
        if l_or_r == "L":
            current = "north"
            north = north + steps
        else:
            current = "south"
            south = south + steps
    elif current == "west":
        if l_or_r == "L":
            current = "south"
            south = south + steps
        else:
            current = "north"
            north = north + steps
    elif current == "south":
        if l_or_r == "L":
            current = "west"
            west = west + steps
        else:
            current = "east"
            east = east + steps
    else:
        print "I have no idea what's going on."

    x = abs(north - south)
    y = abs(east - west)

    current_grid = [x, y]
    print "Taking %s, steps to the %s" % (steps, current)
    print "Current Grid: ", current_grid
    print "\n"

final_position = x + y
print final_position
