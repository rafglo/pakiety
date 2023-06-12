using CSV
file = CSV.File("C:\\Users\\Rafal\\OneDrive\\Pulpit\\pakiety matematyczne\\jedzenie.csv")

function sr_waga_m(dane)
    suma = 0
    ile = 0
    for row in dane
        if (row.Płeć == "M") & !(ismissing(row.Waga))
            suma += row.Waga
            ile += 1
        end
    end
    return suma/ile, ile
end

sr_waga_m(file)[1]

function sr_waga_k(dane)
    suma = 0
    ile = 0
    for row in dane
        if (row.Płeć == "K") & !(ismissing(row.Waga))
            suma += row.Waga
            ile += 1
        end
    end
    return suma/ile, ile
end

sr_waga_k(file)[1]

function paczki(dane)
    ile = 0
    ile_wszystkich = 0
    for row in dane
        if row.Pączki == "T"
            ile += 1
        end
        ile_wszystkich += 1
    end
    return ile/ile_wszystkich * 100
end

paczki(file)

function burrito(dane)
    ile = 0
    ile_wszystkich = 0
    for row in dane
        if row.Burrito == "T"
            ile += 1
        end
        ile_wszystkich += 1
    end
    return ile/ile_wszystkich * 100
end

burrito(file)

function owoce(dane)
    lista = []
    for row in dane
        if row.Owoc ∉ lista
            push!(lista, row.Owoc)
        end
    end
    return lista
end

owoce(file)

function sr_waga(dane)
    suma = 0
    ile = 0
    for row in dane
        if !(ismissing(row.Waga))
            suma += row.Waga
            ile += 1
        end
    end
    return suma/ile
end

sr_waga(file)

function wplyw_paczkow(dane)
    w = 0
    k = 0
    m = 0
    for row in dane
        if !(ismissing(row.Waga)) & (row.Pączki == "T")
            if (row.Pączki == "T") & (row.Płeć == "K") & (row.Waga > sr_waga_k(dane)[1])
                k += 1
            end
            if (row.Pączki == "T") & (row.Płeć == "M") & (row.Waga > sr_waga_m(dane)[1])
                m += 1
            end
            w += 1
        end
    end
    return w/length(dane), k/sr_waga_k(dane)[2], m/sr_waga_m(dane)[2]
end

wplyw_paczkow(file)

function wplyw_burrito(dane)
    w = 0
    k = 0
    m = 0
    for row in dane
        if !(ismissing(row.Waga)) & (row.Burrito == "T")
            if (row.Burrito == "T") & (row.Płeć == "K") & (row.Waga > sr_waga_k(dane)[1])
                k += 1
            end
            if (row.Burrito == "T") & (row.Płeć == "M") & (row.Waga > sr_waga_m(dane)[1])
                m += 1
            end
            w += 1
        end
    end
    return w/length(dane), k/sr_waga_k(dane)[2], m/sr_waga_m(dane)[2]
end

wplyw_burrito(file)
