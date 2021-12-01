using Test

# Read Data
println("AOC Day 01")
readings = map(line -> parse(Int, line), eachline("day01.txt"))

# Functions
function count_increase(readings)
    increase_count = 0
    for i = 2 : length(readings)
        if readings[i] > readings[i-1]
            increase_count += 1
        end
    end
    return increase_count
end

# Part 1
increase_count = count_increase(readings)
println("Part 1: $increase_count")
@test increase_count == 1583

# Part 2
reading_window_sums = Vector{Int}()
for i = 3 : length(readings)
    append!(reading_window_sums, readings[i] + readings[i-1] + readings[i-2])
end
sum_increase_count = count_increase(reading_window_sums)
println("Part 2: $sum_increase_count")
@test sum_increase_count == 1627
