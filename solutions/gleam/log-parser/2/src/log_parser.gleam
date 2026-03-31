import gleam/regexp
import gleam/list
import gleam/result
import gleam/option
import exercism/test_runner.{ debug }

pub fn is_valid_line(line: String) -> Bool {
  let assert Ok(re) = regexp.from_string("\\[(INFO|ERROR|DEBUG|WARNING)\\]")
  regexp.check(re, line)
}

pub fn split_line(line: String) -> List(String) {
  let assert Ok(re_split) = regexp.from_string("<[~\\-+\\*=]*>")
  regexp.split(re_split, line)
}

pub fn tag_with_user_name(line: String) -> String {
  let assert Ok(re_user) = regexp.from_string("User\\s+(\\S+)")
  case regexp.check(re_user, line) {
    True -> {
              let match=regexp.scan(re_user, line)
              let match=list.first(match)
              let match=case match {
                Ok(m) -> m
                Error(e) -> regexp.Match("",[])
              }
              let username=case match.submatches {
                [a] -> a
                _ -> option.None
              }
              let username=option.unwrap(username,"")
              "[USER] " <> username <> " " <> line
            }
    False -> line
  }
}
