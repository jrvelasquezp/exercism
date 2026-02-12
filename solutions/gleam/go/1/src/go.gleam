import gleam/result
import gleam/io

pub type Player {
  Black
  White
}

pub type Game {
  Game(
    white_captured_stones: Int,
    black_captured_stones: Int,
    player: Player,
    error: String,
  )
}

pub fn apply_rules(
  game: Game,
  rule1: fn(Game) -> Result(Game, String),
  rule2: fn(Game) -> Game,
  rule3: fn(Game) -> Result(Game, String),
  rule4: fn(Game) -> Result(Game, String),
) -> Game {
  case result.is_error(rule1(game)), result.is_error(rule3(game)), result.is_error(rule4(game)) {
    False, False, False -> {
      let game=Game(..game, player:Black)
      rule2(game)
    }
    True, _, _ -> {
      let game=Game(..game, error:result.unwrap_error(rule1(game), "xxx"))
      game
    }
    _, True, _ -> {
      let game=Game(..game, error:result.unwrap_error(rule3(game), "xxx"))
      game
    }
    _, _, True -> {
      let game=Game(..game, error:result.unwrap_error(rule4(game), "xxx"))
      game
    }
  }
}

