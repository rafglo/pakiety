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

quicksort!([1,4,2,6,8,5,13,16,12,100,11,1])





