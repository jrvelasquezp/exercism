verse_1 = " green bottles hanging on the wall,"
verse_2 = "And if one green bottle should accidentally fall,"
verse_3 = "There'll be "
verse_4 = " green bottles hanging on the wall."

quantities = [0,1,2,3,4,5,6,7,8,9,10]
q_text_1 = ['no','one','two','three','four','five','six','seven','eight','nine','ten']

def recite(start, take=1):
    song=[]
    for line in range(0,take):
        verse=''
        verse=q_text_1[start-line]+verse_1
        if not verse.find('one') == -1:
            verse=verse.replace('bottles','bottle')
        song.append(verse.capitalize())
        song.append(verse.capitalize())
        song.append(verse_2)
        verse=verse_3+q_text_1[start-line-1]+verse_4
        if not verse.find('one') == -1:
            verse=verse.replace('bottles','bottle')
        song.append(verse)
        if line < take-1:
            song.append("")
    return song
