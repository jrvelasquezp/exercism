import gleam/string
import gleam/result
import gleam/list

pub fn first_letter(name: String) {
  name
  |> string.trim
  |> string.first
  |> result.unwrap("default")
}

pub fn initial(name: String) {
  name
  |> string.uppercase
  |> first_letter<>"."
}

pub fn initials(full_name: String) {
  full_name
  |> string.split(" ")
  |> list.reduce(fn(acc,x) {initial(acc) <> " " <> initial(x)})
  |> result.unwrap("default")
}

pub fn pair(full_name1: String, full_name2: String) {
  let heart="\n"
  |>string.append("     ******       ******\n")
  |>string.append("   **      **   **      **\n")
  |>string.append(" **         ** **         **\n")
  |>string.append("**            *            **\n")
  |>string.append("**                         **\n")
  |>string.append("**     ")
  |>string.append(initials(full_name1) <> "  +  " <> initials(full_name2))
  |>string.append("     **\n")
  |>string.append(" **                       **\n")
  |>string.append("   **                   **\n")
  |>string.append("     **               **\n")
  |>string.append("       **           **\n")
  |>string.append("         **       **\n")
  |>string.append("           **   **\n")
  |>string.append("             ***\n")
  |>string.append("              *\n")
}
