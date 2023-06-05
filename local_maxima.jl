function find_maxima(v_0, start=1, finish=length(v))
    v = v_0[start:finish]
    if length(v) == 1
        return v[1]
    elseif length(v) == 2
        if v[1] >= v[2]
            return v[1]
        else
            return v[2]
        end
    elseif length(v) == 3
        if v[1] <= v[2] & v[2] >= v[3]
            return v[2]
        elseif v[1] > v[2]
            return v[1]
        else
            return v[3]
        end
    else
        mid = length(v) ÷ 2
        if v[mid-1] <= v[mid] & v[mid] >= v[mid+1]
            return v[mid]
        elseif v[mid-1] > v[mid]
            find_maxima(v, 1, (mid-1))
        else
            find_maxima(v, (mid+1), length(v))
        end
    end
end

v=[1,8,3,11,5,3,7,9]
find_maxima(v)
