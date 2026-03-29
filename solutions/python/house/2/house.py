def recite(start_verse, end_verse):
    rhymes_v2=[
        ['house','Jack built'],
        ['malt','lay in'],
        ['rat','ate'],
        ['cat','killed'],
        ['dog','worried'],
        ['cow with the crumpled horn','tossed'],
        ['maiden all forlorn','milked'],
        ['man all tattered and torn','kissed'],
        ['priest all shaven and shorn','married'],
        ['rooster that crowed in the morn','woke'],
        ['farmer sowing his corn','kept'],
        ['horse and the hound and the horn','belonged to']
    ]
    song=""
    answer=[]
    for j in range(start_verse,end_verse+1):
        verse=""
        for i in range(0,j):
            name=rhymes_v2[i][0]
            action=rhymes_v2[i][1]
            if i==0:
                complement=f"the {name} that {action}"
            else:
                complement=f"the {name} that {action} {complement}"
            verse=f"This is {complement}."
        if j==start_verse:
            song=f"{verse}"
        else:
            song=song+f" {verse}"
        answer.append(verse)
    return answer
        
