import gleam/int

pub type Clock {
  Clock(hour: Int, minute: Int)
}

pub fn create(hour hour: Int, minute minute: Int) -> Clock {
  echo hour
  let hr = case { hour + minute/60 } % 24 >= 0 , minute % 60 >=0 {
            True, True -> { hour + minute/60 } % 24
            False, False -> 23 + { { hour + minute/60 } % 24 }
            False, True -> 24 + { { hour + minute/60 } % 24 }
            True, False -> 23 + { { hour + minute/60 } % 24 }
          }
  let hr=case hr >= 24 {
    True -> hr - 24
    False -> hr
  }
  let mn = case minute % 60 >= 0 {
            True -> minute % 60
            False -> 60 + { minute % 60 }
          }
  Clock(hr, mn)
}

pub fn add(clock: Clock, minutes minutes: Int) -> Clock {
  create(clock.hour, clock.minute + minutes)
}

pub fn subtract(clock: Clock, minutes minutes: Int) -> Clock {
  create(clock.hour, clock.minute - minutes)
}

pub fn display(clock: Clock) -> String {
  let min_string= case clock.minute > 9 {
                  True -> int.to_string(clock.minute)
                  False -> "0" <> int.to_string(clock.minute)
                }
  let hour_string=case clock.hour > 9 {
                  True -> int.to_string(clock.hour)
                  False -> "0" <> int.to_string(clock.hour)
                }
  hour_string <> ":" <> min_string
}
