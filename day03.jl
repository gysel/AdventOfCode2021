using Test

# Read Data
lines = readlines("day03.txt")
@test length(lines) == 1000

# Part 1
function find_most_common_bit(chars)
    if count(c -> c == '0', chars) > 500
        '0'
    else
        '1'
    end
end

bits = []
for position = 1:length(lines[1])
    bit = map(line -> line[position], lines) |> find_most_common_bit
    append!(bits, bit)
end

gamma_rate = parse(Int, join(bits), base=2)
epsilon_rate = 2^12 - 1 - gamma_rate
solution_part1 = gamma_rate * epsilon_rate
println("Solution Part 1: $solution_part1")
@test solution_part1 == 3009600

