import gleam/regex
import gleam/option
import exercism/test_runner.{ debug }

pub fn is_valid_line(line: String) -> Bool {
  let options = regex.Options(case_insensitive: False, multi_line: False)
  let assert Ok(re) = regex.compile("\\[ERROR|WARNING|DEBUG|INFO\\]", with: options)
  regex.check(re, line)
}

pub fn split_line(line: String) -> List(String) {
  let assert Ok(re) = regex.from_string("<[~\\*=-]*>")
  regex.split(with: re, content: line)
}

pub fn tag_with_user_name(line: String) -> String {
  let assert Ok(user_re) = regex.from_string("User")
  let assert Ok(username_re) = regex.from_string("User\\s{1,}(\\S*)")
  let value=regex.scan(with:username_re, content:line)
  let inside = case value {
    [first] -> first.submatches
    _ -> {regex.Match("0",[option.Some("")])}.submatches
  }
  let uname = case inside {
    [first] -> first
    _ -> option.None
  }
  case regex.check(user_re, line) {
    True -> "[USER] " <> option.unwrap(uname,"") <> " " <> line
    False -> line
  }
}
