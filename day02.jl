using Test

function parseline(line)
    (command, number) = split(line)
    command, parse(Int, number)
end

# Read Data
lines = map(parseline , eachline("day02.txt"))

# Part 1
function solve_part_one(lines)
    position = 0
    depth = 0
    
    for (command, units) in lines
        if command == "forward"
            position += units
        elseif command == "down"
            depth += units
        elseif command == "up"
            depth -= units
        else
            throw("Command $command not implemented!")
        end
    end
    position * depth
end

solution = solve_part_one(lines)
@test solution == 2102357
println("Part 1: $solution")

# Part 2

function solve_part_two(lines)
    position = 0
    depth = 0
    aim = 0
    
    for (command, units) in lines
        if command == "forward"
            position += units
            depth += aim * units
        elseif command == "down"
            aim += units
        elseif command == "up"
            aim -= units
        else
            throw("Command $command not implemented!")
        end
    end
    position * depth
end

solution = solve_part_two(lines)
@test solution == 2101031224
println("Part 2: $solution")
