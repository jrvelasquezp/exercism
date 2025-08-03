alphabet="abcdefghijklmnopqrstuvwxyz"

def is_isogram(string):
    iso=True
    if not (string == ""):
        for char in string:
            if string.lower().count(char)>1 and char in alphabet:
                iso=False

    return iso
