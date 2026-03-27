import math
def cipher_text(plain_text):
    if plain_text=="":
        return plain_text
    else:
        new_text=plain_text.replace(" ","")
        for punctuation in "%,:.;-?!@":
            new_text=new_text.replace(punctuation,"")
        new_text=new_text.lower()
        if len(new_text)<=1:
            return new_text
        else:
            c=int(math.ceil(math.sqrt(len(new_text))))
            r=c
            if c*c>len(new_text):
                r=c-1
                if r*c<len(new_text):
                    r=r+1
            trail_spaces=r*c-len(new_text)
            chunks=[]
            for i in range(0,r):
                if(len(new_text[:c])<c):
                    chunks.append(new_text[:c]+' '*trail_spaces)
                else:
                    chunks.append(new_text[:c])
                new_text=new_text[c:]
                print(new_text)
            chunks_joint=""
            for j in range(0,c):
                for i in range(0,r):
                    chunks_joint=chunks_joint+chunks[i][j]
            new_chunks=[]
            for i in range(0,c):
                new_chunks.append(chunks_joint[:r])
                chunks_joint=chunks_joint[r:]
            return ' '.join(new_chunks)
