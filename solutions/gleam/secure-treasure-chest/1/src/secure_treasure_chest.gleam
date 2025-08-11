import gleam/string

pub opaque type TreasureChest(treasure) {
  TreasureChest(treasure, String)
}

pub fn new(tr: treasure, pwd: String) -> TreasureChest(treasure) {
  TreasureChest(tr,pwd)
}

pub fn read_password(t: TreasureChest(treasure)) -> String {
  let TreasureChest(_, v) = t
  v
}

pub fn read_content(t: TreasureChest(treasure)) -> treasure {
  let TreasureChest(w, _) = t
  w
}

pub fn create(
  password: String,
  contents: treasure,
) -> Result(TreasureChest(treasure), String) {
  case string.length(password) < 8 {
    False -> Ok(new(contents, password))
    True -> Error("Password must be at least 8 characters long")
  }
}

pub fn open(
  chest: TreasureChest(treasure),
  password: String,
) -> Result(treasure, String) {
  case password == read_password(chest) {
    False -> Error("Incorrect password")
    True -> Ok(read_content(chest))
  }
}
