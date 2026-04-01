pub fn day(number: Int) -> String {
  case number {
    1 -> "first"
    2 -> "second"
    3 -> "third"
    4 -> "fourth"
    5 -> "fifth"
    6 -> "sixth"
    7 -> "seventh"
    8 -> "eighth"
    9 -> "ninth"
    10 -> "tenth"
    11 -> "eleventh"
    12 -> "twelfth"
    _ -> ""
  }
}

pub fn gift(number: Int) -> String {
  case number {
    1 -> "a Partridge in a Pear Tree."
    2 -> "two Turtle Doves"
    3 -> "three French Hens"
    4 -> "four Calling Birds"
    5 -> "five Gold Rings"
    6 -> "six Geese-a-Laying"
    7 -> "seven Swans-a-Swimming"
    8 -> "eight Maids-a-Milking"
    9 -> "nine Ladies Dancing"
    10 -> "ten Lords-a-Leaping"
    11 -> "eleven Pipers Piping"
    12 -> "twelve Drummers Drumming"
    _ -> ""
  }
}

pub fn last_verse(number: Int) -> String {
    case number {
    1 -> gift(1)
    2 -> gift(number) <> ", and " <> last_verse(number-1)
    _ -> gift(number) <> ", " <> last_verse(number-1)
    }
}

pub fn verse(number: Int) -> String {
  "On the " <> day(number) <> " day of Christmas my true love gave to me: " <> last_verse(number)  
}

pub fn lyrics(from starting_verse: Int, to ending_verse: Int) -> String {
  case starting_verse == ending_verse {
    True -> verse(ending_verse)
    False -> lyrics(starting_verse, ending_verse-1) <> "\n" <>verse(ending_verse) 
  }
}
