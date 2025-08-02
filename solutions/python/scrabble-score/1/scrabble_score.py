def score(word):
    word=word.lower()
    score=0
    for ch in word:
        print(ch)
        match ch:
            case 'a' | 'e' | 'i' | 'o' | 'u' | 'l' | 'n' | 'r' | 's' | 't' :
                score=score+1
            case 'd' | 'g' :
                score=score+2
            case 'b' | 'c' | 'm' | 'p' :
                score=score+3
            case 'f' | 'h' | 'v' | 'w' | 'y' :
                score=score+4
            case 'k' :
                score=score+5
            case 'j' | 'x' :
                score=score+8
            case 'q' | 'z' :
                score=score+10
            case default:
                score=score
   
    return score