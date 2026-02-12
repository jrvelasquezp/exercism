def decode(string):
    if string == "":
        return string
    else:
        count=0
        answer=""
        for ch in string:
            if ch.isdigit() and count > 0:
                count=10*count+int(ch)
            elif ch.isdigit():
                count=int(ch)
            else:
                if count > 0:
                    answer=answer+ch * count
                else:
                    answer=answer+ch
                count=0
        return answer
        
def encode(string):
    if string == "":
        return string
    else:
        char=string[0]
        answer=""
        count=1
        for ch in string[1:]:
            if ch==char:
                count=count+1
            else:
                answer=answer+f"{str(count) if count>1 else ''}"+char
                char=ch
                count=1
        if count>1:
            answer=answer+str(count)
        answer=answer+char
        return answer