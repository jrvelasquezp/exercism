def response(hey_bob):
    hey_bob=' '.join(hey_bob.split())
    if hey_bob.isupper() and hey_bob.endswith('?'):
        answer="Calm down, I know what I'm doing!"
    elif hey_bob.isupper():
        answer="Whoa, chill out!"
    elif hey_bob.endswith('?'):
        answer='Sure.'
    elif hey_bob=='':
        answer='Fine. Be that way!'
    else:
        answer = 'Whatever.'
    return answer
