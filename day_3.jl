lines = readlines("day_3_input.txt")


function handle_part(part)
    try
        arg1_str, remainder = split(part, ",")
        arg1_int = parse(Int, arg1_str)
        arg2_str, remainder = split(remainder, ")")
        arg2_int = parse(Int, arg2_str)
        return arg1_int * arg2_int
    catch
        return 0
    end
end


function part1(lines)
    result = 0
    for line in lines
        parts = split(line, "mul(")
        for part in parts
            result += handle_part(part)
        end
    end
    return result
end


function part2(lines)
    result = 0
    skipnext = false
    for line in lines
        parts = split(line, "mul(")
        for part in parts
            if !skipnext
                result += handle_part(part)
            end
            
            if occursin("don't()", part)
                skipnext = true
            elseif occursin("do()", part)
                skipnext = false
            end
        end
    end
    return result
end


println(part1(lines))
println(part2(lines))
