import gleam/string
import gleam/list

pub fn message(log_line: String) -> String {
  case log_line{
    "[ERROR]: " <> rest -> string.trim(rest)
    "[INFO]: " <> rest -> string.trim(rest)
    "[WARNING]: " <> rest -> string.trim(rest)
    _ -> "Fail"
  }
}

pub fn log_level(log_line: String) -> String {
  string.lowercase(string.replace(string.replace(string.replace(string.trim(string.replace(log_line, each: message(log_line), with: "")),each: ":", with: ""),each: "[", with: ""),each: "]", with: ""))
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
