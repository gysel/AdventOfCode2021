using Test

# Read Data
lines = readlines("day03.txt")
@test length(lines) == 1000

# Part 1
function find_most_common_bit(chars, default='1')
    bit_count = count(c -> c == '0', chars)
    half = length(chars) / 2
    if bit_count == half
        default
    elseif bit_count > half
        '0'
    else
        '1'
    end
end
@test find_most_common_bit(['1','0']) == '1'
@test find_most_common_bit(['1','0'], '1') == '1'
@test find_most_common_bit(['1','0'], '0') == '0'

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

# Part 2

function find_oxygen_generator_rating(lines)
    options = lines
    for position = 1:length(lines[1])
        most_common_bit = map(line -> line[position], options) |> find_most_common_bit
        options = filter(line -> line[position] == most_common_bit, options)
        if length(options) == 1
            break
        end
    end
    @test length(options) == 1
    parse(Int, options[1], base=2)
end

function find_CO2_scrubber_rating(lines)
    options = lines
    for position = 1:length(lines[1])
        most_common_bit = map(line -> line[position], options) |> find_most_common_bit
        least_common_bit = most_common_bit == '1' ? '0' : '1'
        # IDEA: find better solution - sometimes the least_common_bit has 0 occurences which is wrong
        new_options = filter(line -> line[position] == least_common_bit, options)
        options = isempty(new_options) ? options : new_options
        if length(options) <= 1
            break
        end
    end
    @test length(options) == 1
    parse(Int, options[1], base=2)
end

# Tests Part 2
test_lines = [
    "00100",
    "11110",
    "10110",
    "10111",
    "10101",
    "01111",
    "00111",
    "11100",
    "10000",
    "11001",
    "00010",
    "01010",
]
@test find_oxygen_generator_rating(test_lines) == 23
@test find_CO2_scrubber_rating(test_lines) == 10

# Solve Part 2
solution_part2 = find_oxygen_generator_rating(lines) * find_CO2_scrubber_rating(lines)
@test solution_part2 == 6940518
println("Solution Part 2: $solution_part2")
