def recite(start_verse, end_verse):
    carol_lyrics=[
        ['first','a Partridge in a Pear Tree'],
        ['second','two Turtle Doves'],
        ['third', 'three French Hens'],
        ['fourth', 'four Calling Birds'],
        ['fifth','five Gold Rings'],
        ['sixth','six Geese-a-Laying'],
        ['seventh', 'seven Swans-a-Swimming'],
        ['eighth', 'eight Maids-a-Milking'],
        ['ninth','nine Ladies Dancing'],
        ['tenth','ten Lords-a-Leaping'],
        ['eleventh', 'eleven Pipers Piping'],
        ['twelfth', 'twelve Drummers Drumming']
    ]
    
    song=[]
    for j in range(start_verse,end_verse+1):
        number_of_days=j
        day=carol_lyrics[j-1][0]
        verse=f"On the {day} day of Christmas my true love gave to me: "
        for i in range(0,number_of_days):
            gift=carol_lyrics[number_of_days-i-1][1]
            line=f"{'and ' if i==number_of_days-1 and number_of_days>1 else ''}{gift}{', ' if i<number_of_days-1 else ''}{'.' if i==number_of_days-1 else ''}"
            verse=verse+line
        song.append(verse)
    return song
            