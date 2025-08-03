"""
This exercise stub and the test suite contain several enumerated constants.

Enumerated constants can be done with a NAME assigned to an arbitrary,
but unique value. An integer is traditionally used because it’s memory
efficient.
It is a common practice to export both constants and functions that work with
those constants (ex. the constants in the os, subprocess and re modules).

You can learn more here: https://en.wikipedia.org/wiki/Enumerated_type
"""

# Possible sublist categories.
# Change the values as you see fit.
SUBLIST = 1
SUPERLIST = 2
EQUAL = 0
UNEQUAL = 3

def list_eq(list1,list2):
    equal = True
    if not len(list1) == len(list2):
        equal=False
    else:
        for i in range(0,len(list1)):
            if not list1[i] == list2[i]:
                equal=False
    
    return equal

def is_sublist(list1,list2):
    sublist=False
    for i in range(0,len(list2)):
        if list2[i]==list1[0] and sublist==False:
            sublist=True
            for j in range(1,len(list1)):
                if list1[j] == list2[i+j]:
                    sublist=True
                else:
                    sublist=False
    
    return sublist
    
def sublist(list_one, list_two):
    classif=None
    if list_eq(list_one,list_two):
        classif=EQUAL
    else:
        if len(list_two)==0:
            classif=SUPERLIST
        elif len(list_one)==0:
            classif=SUBLIST
        elif len(list_one)<len(list_two) and is_sublist(list_one,list_two):
            classif=SUBLIST
        elif len(list_two)<len(list_one) and is_sublist(list_two,list_one):
            classif=SUPERLIST
        else:
            classif=UNEQUAL
    return classif