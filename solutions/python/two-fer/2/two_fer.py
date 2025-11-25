def two_fer(name=None):
    text=""
    if name is None:
        text="One for you, one for me."
    else:
        text="One for "+ name + ", one for me."
    return text
