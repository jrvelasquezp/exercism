def transpose(text):
    if text == "":
        return text
    else:
        char_list=[]
        for line in text.splitlines():
            chars=[]
            for ch in line:
                chars.append(ch)
            char_list.append(chars)
        
        answer=[]
        for i in range(0,(max(len(i) for i in char_list))):
            ans_line=[]
            for j in range(0,len(char_list)):
                #print(i,len(char_list[j]))
                if i<len(char_list[j]):
                    ans_line.append(char_list[j][i])
                else:
                    ans_line.append('*')
            answer.append(ans_line)
        
      
        answer2=[]
        for line in answer:
            answer2.append(''.join(line))
        answer3=[]
        for line in answer2:
            newline=line.rstrip('*')
            newline=newline.replace('*',' ')
            answer3.append(newline)
        return '\n'.join(answer3)
