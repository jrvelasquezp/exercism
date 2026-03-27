import gleam/regexp
import gleam/list
import gleam/result
import gleam/string
import gleam/option
import exercism/test_runner.{ debug }

pub fn extract_match_capture(match: List(regexp.Match)) -> String {
  let m=case match{
    [x] -> x
    _ -> regexp.Match("",[])
  }
  let expr =case m.submatches {
    [x] -> x
    _ -> option.None
  }
  let out=case expr {
    option.Some(q) -> q
    _ -> ""
  }
}

pub fn translate_word(phrase: String) -> String {
  let assert Ok(rule_one) = regexp.from_string("(^(a|e|i|o|u|xr|yt).*)")
  let assert Ok(rule_two) = regexp.from_string("(^[^aeiou]+)[aeiouy].*")
  let assert Ok(rule_three) = regexp.from_string("(^[^aeiou]*)qu(.*)")
  let ans=case regexp.check(rule_one, phrase) {
    True -> {
      phrase
      |> regexp.match_map(rule_one, _, fn(m) { m.content <> "ay" })
    }
    False -> {
      phrase
      |> regexp.match_map(rule_three, _ , fn(m) { string.join(list.reverse(option.values(m.submatches)),"") <> "qu" <> "ay" })
      |> regexp.match_map(rule_two, _, fn(m) { string.replace(phrase, extract_match_capture([m]), "") <> extract_match_capture([m]) <> "ay" })
    }
  }
}

pub fn translate(phrase: String) -> String {
  string.split(phrase, " ")
  |>list.map(fn(x) { translate_word(x) })
  |>string.join(" ")
}
