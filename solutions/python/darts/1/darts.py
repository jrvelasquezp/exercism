def score(x, y):
    scor=0;
    if x**2 + y**2 <= 1:
        scor=10
    elif x**2 + y**2 <= 25:
        scor=5
    elif x**2 + y**2 <= 100:
        scor=1
    else:
        scor=0
    return scor