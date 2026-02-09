def recurring_verse(number):
    animals=["fly","spider", "bird", "cat", "dog", "goat", "cow", "horse"]
    rhyme=[]
    animal=animals[number-1]
    prey=animals[number-2]
    if number==3:
        rhyme.append(f"She swallowed the {animal} to catch the spider that wriggled and jiggled and tickled inside her.")
        rhyme.append(f"She swallowed the spider to catch the fly.")
        rhyme.append(f"I don't know why she swallowed the fly. Perhaps she'll die.")
        return rhyme
    else:
        rhyme.append(f"She swallowed the {animal} to catch the {prey}.")
        rhyme=rhyme + recurring_verse(number-1)
        return rhyme
        

def verse(number):
    animals=["fly","spider", "bird", "cat", "dog", "goat", "cow", "horse"]
    second=[
                "How absurd to swallow a ",
                "Imagine that, to swallow a ",
                "What a hog, to swallow a ",
                "Just opened her throat and swallowed a ",
                "I don't know how she swallowed a "
           ]
    rhyme=[]
    animal=animals[number-1]
    rhyme.append(f"I know an old lady who swallowed a {animal}.")
        
    if number==1:
        rhyme.append(f"I don't know why she swallowed the fly. Perhaps she'll die.")
        return rhyme
    elif number==8:
        #animal=animals[number-1]
        #rhyme.append(f"I know an old lady who swallowed a {animal}.")
        rhyme.append(f"She's dead, of course!")
        return rhyme
    elif number==2:
        rhyme.append(f"It wriggled and jiggled and tickled inside her.")
        rhyme.append(f"She swallowed the {animal} to catch the fly.")
        rhyme.append(f"I don't know why she swallowed the fly. Perhaps she'll die.")
        return rhyme
    else:
        begin=second[number-3]
        #animal=animals[number-1]
        prey=animals[number-2]
        #rhyme.append(f"I know an old lady who swallowed a {animal}.")
        rhyme.append(f"{begin}{animal}!")
        rhyme=rhyme+recurring_verse(number)
        return rhyme
        
def recite(start_verse, end_verse):
    if start_verse==end_verse:
        return verse(start_verse)
    else:
        full_rhyme=[]
        for i in range(start_verse, end_verse+1):
            full_rhyme=full_rhyme+['']+verse(i)
        full_rhyme.pop(0)
        return full_rhyme
