"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    alphabet="abcdefghijklmnopqrstuvwxyz"
    is_pangram=true
    for i in 1:26
        is_pangram=occursin(alphabet[i],lowercase(input)) && is_pangram
    end
    is_pangram
end

