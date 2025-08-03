type
  Allergen* = enum
    Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats

proc allergies*(score: int): set[Allergen] =
  var allerSet: set[Allergen] = {}
  var count = score
  var aller: int = 128
  var aNum = 7
  if count > 256:
    count = count - 256
  while count > 1:
    if count >= aller:
      count = count - aller
      allerSet.incl(Allergen(aNum))
    aller = int(aller / 2)
    aNum = aNum - 1
  if count == 1:
    allerSet.incl(Allergen(0))
  return allerSet

proc isAllergicTo*(score: int, allergen: Allergen): bool =
  var allerSet: set[Allergen] = allergies(score)
  return allergen in allerSet
