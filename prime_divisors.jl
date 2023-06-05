function prime_divisors(n)
    result = []
    while n % 2 == 0
        n /= 2
        push!(result, 2)
    end
    for i in 3:2:Integer(ceil(sqrt(n)))
        while n % i == 0
            n /= i
            push!(result, i)
        end
    end
    if n > 2
        push!(result, Integer(n))
    end
    return result
end

prime_divisors(226)
