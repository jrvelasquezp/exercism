def translate(text):
    words=text.split()
    trans_text=[]
    for word in words:
        if word[0] in ('aeiou'):
            word=word+'ay'
        else:
            if word[0:2]=='xr' or word[0:2]=='yt':
                word=word+'ay'
            elif 'qu' in word:
                cut=word.index('qu')+2
                word=word[cut:]+word[0:cut]+'ay'
            elif word[0]=='y':
                word=word[1:]+word[0]+'ay'
            else:
                for char in word:
                    if char in ('aeiouy'):
                        word=word[word.index(char):]+word[0:word.index(char)]+'ay'
                        break
        trans_text.append(word)
    return ' '.join(trans_text)
