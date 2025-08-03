import gleam/order.{type Order}
import gleam/float
import gleam/list

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  {f -. 32.0} /. 1.8
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  let f_left=handle_temperature(left)
  let f_right=handle_temperature(right)
  float.compare(f_left,f_right)
}

pub fn compare_temperature_city(left: City, right: City) -> Order {
  let f_left=case left {
    City(_,t)->handle_temperature(t)
  }
  let f_right=case right {
    City(_,t)->handle_temperature(t)
  }
  float.compare(f_left,f_right)
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
   list.sort(cities, compare_temperature_city)
}

pub fn handle_temperature(t: Temperature) -> Float {
  let f = case t {
    Celsius(x) -> x
    Fahrenheit(x) -> fahrenheit_to_celsius(x)  
  }
}