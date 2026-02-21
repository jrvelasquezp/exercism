pub fn get_animal(verse: Int) -> String {
  case verse {
    1 -> ""
    2 -> "malt"
    3 -> "rat"
    4 -> "cat"
    5 -> "dog"
    6 -> "cow with the crumpled horn"
    7 -> "maiden all forlorn"
    8 -> "man all tattered and torn"
    9 -> "priest all shaven and shorn"
    10 -> "rooster that crowed in the morn"
    11 -> "farmer sowing his corn"
    12 -> "horse and the hound and the horn"
    _ -> "None"
  }
}

pub fn get_action(verse: Int) -> String {
  case verse {
    1 -> ""
    2 -> "lay in"
    3 -> "ate"
    4 -> "killed"
    5 -> "worried"
    6 -> "tossed"
    7 -> "milked"
    8 -> "kissed"
    9 -> "married"
    10 -> "woke"
    11 -> "kept"
    12 -> "belonged to"
    _ -> "None"
  }
}

pub fn get_sequence(verse: Int)-> String {
  case verse {
    1 -> "the house that Jack built."
    _ -> "the " <> get_animal(verse) <> " that " <> get_action(verse) <> " " <>get_sequence(verse-1)
  }
  
}

pub fn verse(verse: Int) -> String {
  "This is " <> get_sequence(verse)
}

pub fn multi_verse(start_verse: Int, final_verse: Int) -> String {
  case final_verse {
    n if n==start_verse -> verse(final_verse)
    _ -> multi_verse(start_verse, final_verse-1) <> "\n" <> verse(final_verse)
  }
}

pub fn recite(start_verse start_verse: Int, end_verse end_verse: Int) -> String {
  case start_verse == end_verse {
    True -> verse(start_verse)
    _ -> multi_verse(start_verse, end_verse)
  }
}
