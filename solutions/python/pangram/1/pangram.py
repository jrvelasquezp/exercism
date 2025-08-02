def is_pangram(sentence):
    is_pangram=True
    alphabet="abcdefghijklmnopqrstuvwxyz"

    for ch in alphabet:
        is_pangram=is_pangram and (sentence.lower().__contains__(ch))

    return is_pangram