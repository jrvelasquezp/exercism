import gleam/string
import gleam/list
import simplifile

pub fn read_emails(path: String) -> Result(List(String), Nil) {
  case simplifile.read(path) {
    Ok(v) ->
      Ok(string.split(string.trim_end(v), "\n"))

    Error(_) ->
      Error(Nil)
  }
}

pub fn create_log_file(path: String) -> Result(Nil, Nil) {
  case simplifile.write(path, "") {
    Ok(_) -> Ok(Nil)
    Error(_) -> Error(Nil)
  }
}

pub fn log_sent_email(path: String, email: String) -> Result(Nil, Nil) {
  case simplifile.append(path, email <> "\n") {
    Ok(_) -> Ok(Nil)
    Error(_) -> Error(Nil)
  }
}

pub fn send_newsletter(
  emails_path: String,
  log_path: String,
  send_email: fn(String) -> Result(Nil, Nil),
) -> Result(Nil, Nil) {

  case create_log_file(log_path) {
    Error(_) ->
      Error(Nil)

    Ok(_) ->
      case read_emails(emails_path) {
        Error(_) ->
          Error(Nil)

        Ok(emails) ->
          list.fold(emails, Ok(Nil), fn(acc, email) {

            case acc {
              Error(_) ->
                acc

              Ok(_) ->
                case send_email(email) {

                  Ok(_) ->
                    log_sent_email(log_path, email)

                  Error(_) ->
                    Ok(Nil)
                }
            }
          })
      }
  }
}