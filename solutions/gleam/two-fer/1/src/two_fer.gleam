import gleam/option.{type Option}
import gleam/string

pub fn two_fer(name: Option(String)) -> String {
  let phrase="One for you, one for me."
  |> string.replace(each: "you", with:option.unwrap(name, "you"))
}
