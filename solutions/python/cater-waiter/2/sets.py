"""Functions for compiling dishes and ingredients for a catering company."""


from sets_categories_data import (VEGAN,
                                  VEGETARIAN,
                                  KETO,
                                  PALEO,
                                  OMNIVORE,
                                  ALCOHOLS,
                                  SPECIAL_INGREDIENTS)

def clean_ingredients(dish_name, dish_ingredients):
    cleaned_dish_ingredients=set(dish_ingredients)
    return (dish_name,cleaned_dish_ingredients)

def check_drinks(drink_name, drink_ingredients):
    drink_ingredients_set=set(drink_ingredients)
    if drink_ingredients_set.isdisjoint(ALCOHOLS):
        return drink_name+" Mocktail"
    else:
        return drink_name+" Cocktail"

def categorize_dish(dish_name, dish_ingredients):
    dish_ingredients_set=set(dish_ingredients)
    if dish_ingredients_set.issubset(VEGAN):
        return dish_name+": VEGAN"
    elif dish_ingredients_set.issubset(PALEO):
        return dish_name+": PALEO"
    elif dish_ingredients_set.issubset(VEGETARIAN):
        return dish_name+": VEGETARIAN"
    elif dish_ingredients_set.issubset(KETO):
        return dish_name+": KETO"
    elif dish_ingredients_set.issubset(OMNIVORE):
        return dish_name+": OMNIVORE"
    else:
        return dish_name+": OTHER"

def tag_special_ingredients(dish):
    return (dish[0], set(dish[1]).intersection(SPECIAL_INGREDIENTS))

def compile_ingredients(dishes):
    master_list=set()
    for dish in dishes:
        master_list=master_list | dish
    return master_list

def separate_appetizers(dishes, appetizers):
    return list(set(dishes)-set(appetizers))

def singleton_ingredients(dishes, intersection):
    all_ingredients=set()
    for dish in dishes:
        all_ingredients=all_ingredients | dish
    return all_ingredients.symmetric_difference(intersection)
