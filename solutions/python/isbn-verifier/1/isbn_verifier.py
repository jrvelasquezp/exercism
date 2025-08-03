digit="0123456789"

def is_valid(isbn):
    valid=True
    isbn=isbn.replace("-","")
    if not len(isbn) == 10:
        valid = False
    elif isbn[:9].isnumeric() and (isbn[9:]=='X' or isbn[9:].isnumeric()):
        checksum=0
        for i in range(0,9):
            checksum=checksum+int(isbn[i])*(10-i)
        if isbn[9:]=='X':
            checksum=checksum+10
        else:
            checksum=checksum+int(isbn[9:])
        if not checksum % 11 == 0:
            valid = False
    else:
        valid = False
    return valid
    pass
