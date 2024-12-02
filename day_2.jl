lines_str = readlines("day_2_input.txt")

to_int = line -> map(i -> parse(Int, i), split(line))

lines_int = map(to_int, lines_str)

function accept(line, remove::Int = 0)
    v = line[1:end .!= remove]
    d = diff(v)
    in_bounds = 1 <= maximum(abs.(d)) <= 3
    asc_or_desc = all(>(0), d) || all(<(0), d)
    return asc_or_desc && in_bounds
end

function accept_with_one_removed(line)
    any(i -> accept(line, i), 0:length(line))
end

println(count(accept, lines_int))
println(count(accept_with_one_removed, lines_int))
