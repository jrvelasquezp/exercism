import gleam/int

pub type Position {
  Position(row: Int, column: Int)
}

pub type Error {
  RowTooSmall
  RowTooLarge
  ColumnTooSmall
  ColumnTooLarge
}

pub fn create(queen: Position) -> Result(Nil, Error) {
  case queen.row >= 0, queen.row < 8, queen.column >= 0, queen.column < 8 {
    True, True, True, True-> Ok(Nil)
    False,_,_,_ -> Error(RowTooSmall)
    _,False,_,_ -> Error(RowTooLarge)
    _,_,False,_ -> Error(ColumnTooSmall)
    _,_,_,False -> Error(ColumnTooLarge)
  } 
}

pub fn can_attack(
  black_queen black_queen: Position,
  white_queen white_queen: Position,
) -> Bool {
  black_queen.row == white_queen.row || black_queen.column == white_queen.column || int.absolute_value({black_queen.column - white_queen.column} / {black_queen.row - white_queen.row})==1
}
