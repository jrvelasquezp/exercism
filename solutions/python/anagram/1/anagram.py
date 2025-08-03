greek_upper='ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩ'
greek_lower='αβγδεζηθικλμνξοπρστυφχψω'

def to_lower_greek(text):
    lower_greek=''
    for char in text:
        if ord(char)>=913 and ord(char)<=937:
            lower_greek=lower_greek+chr(ord(char)+32)
        else:
            lower_greek=lower_greek+char
    return lower_greek

def is_greek(text):
    is_greek=True
    for char in text:
        if not (char in greek_upper or char in greek_lower):
            is_greek=False
    return is_greek

def find_anagrams(word, candidates):
    anagram_list=[]
    is_anagram=True

    for w in candidates:
        is_anagram=True
        for char in to_lower_greek(word):
            if is_greek(char):
                if not to_lower_greek(word).count(char) == to_lower_greek(w).count(char):
                    is_anagram=False   
            elif not w.lower().count(char) == word.lower().count(char):
                is_anagram=False
        if is_anagram and is_greek(w) and not to_lower_greek(w)==to_lower_greek(word):
            anagram_list.append(w)
        elif is_anagram and not w.lower()==word.lower() and len(w)==len(word):
            anagram_list.append(w)

    return anagram_list