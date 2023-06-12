file = open("C:\\Users\\Rafal\\OneDrive\\Pulpit\\pakiety matematyczne\\lista 6\\tekst.txt", "r")
text = readlines(file)
print(text)

function convert_string(str)
    result = ""
    for line in str
        result_line = ""
        cs = collect(line)
        for (index, letter) in enumerate(cs)
            letter = lowercase(letter)
            letter_ascii = Int(letter[1])
            if !(97 <= letter_ascii <= 122) & !(letter_ascii in [32, 261, 281, 243, 322, 324, 347, 380, 378, 263])
                deleteat!(cs, index)
            end
        end
        for letter in cs
            result = result * lowercase(letter)
            result = chomp(result)
        end
        result = result * " " * result_line
    end
    return result
end

convert_string(text)
