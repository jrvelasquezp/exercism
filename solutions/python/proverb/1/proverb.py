def proverb(*input_data, qualifier=None):
    rhyme=[]
    if input_data!=():
        if len(input_data)>1:
            for i in range(0,len(input_data)-1):
                print(input_data[i],input_data[i+1])
                w1=input_data[i]
                w2=input_data[i+1]
                verse=f"For want of a {w1} the {w2} was lost."
                rhyme.append(verse)
        cause=input_data[0]
        final_verse=f"And all for the want of a {qualifier if qualifier is not None else ''}{' ' if qualifier is not None else ''}{cause}."
        rhyme.append(final_verse)
    return rhyme
