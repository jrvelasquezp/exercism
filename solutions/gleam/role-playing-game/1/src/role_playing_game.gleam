import gleam/option.{type Option, None, Some}
import gleam/int

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
   option.unwrap(player.name, "Mighty Magician")
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health > 0 {
    False -> case player.level >= 10 {
      False -> Some(Player(None, player.level, 100, player.mana))
      True -> Some(Player(None, player.level, 100, Some(100)))
    }
    True -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    None -> #(Player(player.name, player.level, int.max(0, player.health-cost), None),0)
    Some(x) -> case x >= cost {
      True-> #(Player(player.name, player.level, player.health, Some(x-cost)),2*cost) 
      False-> #(Player(player.name, player.level, player.health, Some(x)),0) 
    }
  }
}
