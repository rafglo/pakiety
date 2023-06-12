function missing_element(v)
    index = 1
    while index < length(v) - 1
        if v[index] == v[index + 1] - 1
            index += 1
        else
            return v[index] + 1
            break
        end
    end
    return true
end

v = [1,2,3,4,6,7]
missing_element(v)

function missing_element2(v, start=1, fin=length(v))

    if start > fin #jeśli nie brakuje elementu o lewy indeks wyskoczy przed prawy więc brakujący element jest większy o jeden od końcowego
        return fin + 1
    end
    if start != v[start] #z prawej sprawdzamy do momentu aż stary środek (nowy start) będzie różny od indeksu startującego
        return start
    end
    #wybieramy środek
    mid = (start + fin) ÷ 2
    #sprawdzamy czy środkowy element jest równy środkowemu indeksowi, jeśli tak, to po lewej stronie musi się zgadzać, więc brakujący elementt jest po prawej
    if v[mid] == mid
        return missing_element2(v, mid + 1, fin) #więc sprawdzamy z prawej strony
    end
    return missing_element2(v, start, mid) #jeśli środek się nie zgadza to musi być źle po lewej stronie i sprawdzamy po lewej
end

missing_element2(v)
