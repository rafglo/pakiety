function quicksort!(v, left=1, right=length(v))
    if right > left
        pivot = v[rand(left:right)]
        left_index = left
        right_index = right

        while left_index <= right_index

            while v[left_index] < pivot
                left_index += 1
            end

            while v[right_index] > pivot
                right_index -= 1
            end

            if left_index <= right_index
                v[left_index], v[right_index] = v[right_index], v[left_index]
                left_index += 1
                right_index -= 1
            end
        end
        quicksort!(v, left, right_index)
        quicksort!(v, left_index, right)
    end
    return v
end

function compression(v)
    result = []
    v = quicksort!(Int.(v))
    v = Char.(v)
    how_many = length(v)
    index = 1
    while how_many - index + 1 != 0
        counter = count(i -> (i == v[index]), v)
        push!(result, (v[index], counter))
        index += counter
    end
    return result
end
compression(v)

v=['a', 'a', 'b', 'c', 'c', 'g', 'a']
function compress_vector(vector)
    compressed_vector = []
    counts = Dict{Any, Int}()

    for element in vector
        if haskey(counts, element)
            counts[element] += 1
        else
            counts[element] = 1
        end
    end

    for (element, count) in counts
        push!(compressed_vector, (element, count))
    end

    return compressed_vector
end

compress_vector(v)

function compress_vector2(vector)
    unique_elements = unique(vector)  # Znajdujemy unikalne elementy
    compressed_vector = []
    
    for element in unique_elements
        count = count(x -> x == element, vector)  # Liczymy krotność elementu
        push!(compressed_vector, (element, count))  # Dodajemy element i jego krotność do skompresowanego wektora
    end
    
    return compressed_vector
end
