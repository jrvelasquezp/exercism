'''
Two fer solution
'''
def two_fer(name="you"):
    #Check if the argument is none or default and return the proper value
    return "One for {}, one for me.".format("you" if name is None else name)