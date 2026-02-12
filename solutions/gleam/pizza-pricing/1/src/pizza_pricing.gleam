import gleam/list
import gleam/result

pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  case pizza {
    ExtraSauce(x) -> 1 + pizza_price(x)
    ExtraToppings(x) -> 2 + pizza_price(x)
    Margherita -> 7
    Caprese -> 9
    Formaggio -> 10
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  case list.length(order) {
    1 -> calculate_order_price(order, 0) + 3
    2 -> calculate_order_price(order, 0) + 2
    _ -> calculate_order_price(order, 0)
  }
}

pub fn calculate_order_price (order: List(Pizza), accumulator: Int) -> Int {
  case order {
      [] -> accumulator
      [first, ..rest] -> {
        let accumulator = accumulator + pizza_price(first)
        calculate_order_price(rest,accumulator)
    }
  }
}
