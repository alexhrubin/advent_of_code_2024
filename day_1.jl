lines = readlines("day_1_input.txt")
numbers = map(split, lines)
left = sort(map(s -> parse(Int, first(s)), numbers))
right = sort(map(s -> parse(Int, last(s)), numbers))

difference = abs.(right .- left) |> sum
println(difference)

similarity_score = map(i -> i * count(j -> i == j, right), left) |> sum
println(similarity_score)
