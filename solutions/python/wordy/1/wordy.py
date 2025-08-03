operators='+-*/'

def answer(question):
    value=0
    equation=[]
    type=""
    if not 'What' in question:
        raise ValueError("unknown operation")
    else:
        question=question.replace('What is ','')
        question=question.replace('What is','')
        question=question.replace('plus','+')
        question=question.replace('multiplied by','*')
        question=question.replace('divided by','/')
        question=question.replace('minus','-')
        question=question.replace('?','')
        if question.isnumeric():
            value=int(question)
        else:
            equation=question.split()
            if len(equation)==0:
                raise ValueError("syntax error")
            for i in equation:
                if i.isnumeric():
                    type=type+'n'
                elif '-' in i[:1] and i[1:].isnumeric():
                    type=type+'n'
                elif i in operators:
                    type=type+'o'
                else:
                    type=type+'x'
            if 'oo' in type:
                raise ValueError("syntax error")
            elif 'nn' in type:
                raise ValueError("syntax error")
            elif 'x' in type:
                raise ValueError("unknown operation")
            elif 'no' in type and not 'non' in type:
                raise ValueError("syntax error")
            else:
                while len(equation)>1:
                    if equation[1]=='+':
                        sum=int(equation[0])+int(equation[2])
                    elif equation[1]=='-':
                        sum=int(equation[0])-int(equation[2])
                    elif equation[1]=='*':
                        sum=int(equation[0])*int(equation[2])
                    elif equation[1]=='/':
                        sum=int(equation[0])/int(equation[2])
                    if len(equation)>3:
                        equation=[sum]+equation[3:]
                    else:
                        equation=[sum]
                value=int(equation[0])         
        return value
        
        
        
