using Test
using Pkg
Pkg.add("DataStructures")
using DataStructures

# Read Data
lines = readlines("day10.txt")
@test length(lines) == 94

error_score = Dict(
    ')' => 3,
    ']' => 57,
    '}' => 1197,
    '>' => 25137
)

function check(line)
    stack = Stack{Char}()
    illegal_character = '_'
    for c in line
        if c == '('
            push!(stack, c)
        elseif c == '{'
            push!(stack, c)
        elseif c == '['
            push!(stack, c)
        elseif c == '<'
            push!(stack, c)
        elseif c == ')'
            if first(stack) == '('
                pop!(stack)
            else
                illegal_character = c
                break
            end
        elseif c == '}'
            if first(stack) == '{'
                pop!(stack)
            else
                illegal_character = c
                break
            end
        elseif c == ']'
            if first(stack) == '['
                pop!(stack)
            else
                illegal_character = c
                break
            end
        elseif c == '>'
            if first(stack) == '<'
                pop!(stack)
            else
                illegal_character = c
                break
            end
        else
            throw("Missing character $c implementation!")
        end
    end
    if illegal_character != '_'
        error_score[illegal_character]
    else
        if isempty(stack)
            0
        else
            #println("incomplete, ignoring for now $stack")
            0
        end
    end
end

@test check("{([(<{}[<>[]}>{[]{[(<()>") == error_score['}']

function solve_part_one(lines)
    notzero = function (number)
        number > 0
    end

    scores = map(line -> check(line), lines)

    solution = 0
    for n in values(error_score)
        x = count(i -> i == n, scores)
        solution += x * n
    end
    solution
end

@test solve_part_one(lines) == 318081

# filter(line -> check(line) == "", lines)