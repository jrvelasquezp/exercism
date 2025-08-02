def abbreviate(words):
    words=words.replace('-',' ')
    words=words.replace('_','')
    word_list=words.split()
    print(word_list)
    acronym=""
    for x in word_list:
        acronym=acronym+x[0].upper()
    return acronym
