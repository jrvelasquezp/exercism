import gleam/string
import gleam/order
import gleam/regex

pub fn hey(remark: String) -> String {
  let trim_text=string.trim(remark)
  let is_question=string.ends_with(trim_text,"?")
  let is_yelling=string.compare(trim_text,string.uppercase(trim_text))==order.Eq
  let is_empty_str=string.is_empty(trim_text)
  let assert Ok(re) = regex.from_string("[A-Za-z]")
  let is_alpha=regex.check(with: re, content: trim_text)
  case True{
    _ if is_empty_str -> "Fine. Be that way!"
    _ if is_yelling && is_question && is_alpha -> "Calm down, I know what I'm doing!"
    _ if is_yelling && is_alpha -> "Whoa, chill out!"
    _ if is_question -> "Sure." 
    _ -> "Whatever."
  }
}
