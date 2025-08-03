"""Functions used in preparing Guido's gorgeous lasagna.

Learn about Guido, the creator of the Python language:
https://en.wikipedia.org/wiki/Guido_van_Rossum

This is a module docstring, used to describe the functionality
of a module and its functions and/or classes.
"""


EXPECTED_BAKE_TIME=40
PREPARATION_TIME=2

def bake_time_remaining(elapsed_bake_time):
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - remaining bake time (in minutes) derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """
    return EXPECTED_BAKE_TIME - elapsed_bake_time


# You might also consider using 'PREPARATION_TIME' here, if you have it defined.
def preparation_time_in_minutes(number_of_layers):
    """Calculate the preparation time.

    :param number_of_layers: int - number of layers.
    :return: int - preparation time (in minutes).

    Function that takes the number of layers on the lasagna and multiply
    two times in order to return the total time to bake the layers.
    """
    return PREPARATION_TIME*number_of_layers

# Remember to add a docstring (you can copy and then alter the one from bake_time_remaining.)
def elapsed_time_in_minutes(number_of_layers,elapsed_bake_time):
    """Calculate the total elapsed time in minutes.

    :param number_of_layers: int - number of layers.
    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - return the sum of the elapsed time and the time of prepare
    all the layers.
    
    """
    return elapsed_bake_time+preparation_time_in_minutes(number_of_layers)

