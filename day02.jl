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
    
    for line in lines
        (command, number) = line
        println("$command -> $number")
        if command == "forward"
            position += number
        elseif command == "down"
            depth += number
        elseif command == "up"
            depth -= number
        else
            throw("Command $command not implemented!")
        end
    end
    
    solution = position * depth
    @test solution == 2102357
    return solution
end

solution = solve_part_one(lines)
println("Part 1: $solution")

# Part 2

function solve_part_two(lines)
    position = 0
    depth = 0
    aim = 0
    
    for line in lines
        (command, number) = line
        println("$command -> $number")
        if command == "forward"
            position += number
            depth += aim * number
        elseif command == "down"
            aim += number
        elseif command == "up"
            aim -= number
        else
            throw("Command $command not implemented!")
        end
    end
    
    solution = position * depth
    @test solution == 2101031224
    return solution
end

solution = solve_part_two(lines)
println("Part 2: $solution")
