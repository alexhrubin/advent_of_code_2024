using LinearAlgebra


lines = readlines("day_4_input.txt")
matrix = permutedims(reduce(hcat, collect.(lines)))
nrow, ncol = size(matrix)

function contains_xmas(chars)
    return chars == ('X', 'M', 'A', 'S') || chars == ('S', 'A', 'M', 'X')
end

function quad(iterator)
    return zip(iterator, iterator[2:end], iterator[3:end], iterator[4:end])
end

function part_1(matrix)
    occurrences = 0

    for row in 1:nrow
        occurrences += count(contains_xmas, quad(matrix[row, :]))
    end

    for col in 1:ncol
        occurrences += count(contains_xmas, quad(matrix[:, col]))
    end

    rev_matrix = reverse(matrix, dims=1)

    for diag in -(nrow-4):(nrow-4)
        occurrences += count(contains_xmas, quad(matrix[diagind(matrix, diag)]))
        occurrences += count(contains_xmas, quad(rev_matrix[diagind(matrix, diag)]))
    end

    println(occurrences)
end


function check_for_x_mas(matrix, row, col)
    if matrix[row, col] != 'A'
        return false
    end

    surrounds = [
        matrix[row-1, col-1],
        matrix[row-1, col+1],
        matrix[row+1, col+1],
        matrix[row+1, col-1],
    ]

    return any(['S', 'S', 'M', 'M'] == circshift(surrounds, i) for i in 0:3)
end

function part_2(matrix)
    occurences = 0
    for row in 2:nrow-1, col in 2:ncol-1
        if check_for_x_mas(matrix, row, col)
            occurences += 1
        end
    end
    println(occurences)
end

part_1(matrix)
part_2(matrix)
