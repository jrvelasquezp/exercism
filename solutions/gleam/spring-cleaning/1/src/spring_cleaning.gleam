import gleam/result
import gleam/string
import gleam/list

pub fn extract_error(problem: Result(a, b)) -> b {
  let assert Error(b)=problem
  b
}

pub fn remove_team_prefix(team: String) -> String {
  case team {
    "Team " <> value -> value
    x -> x
  }
}

pub fn split_region_and_team(combined: String) -> #(String, String) {
  #(result.unwrap(list.first(string.split(combined, ",")), "xyy"),remove_team_prefix(result.unwrap(list.last(string.split(combined, ",")), "xyy")))
}
