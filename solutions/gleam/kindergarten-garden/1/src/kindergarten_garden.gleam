import gleam/list
import gleam/string
import gleam/result

pub type Student {
  Alice
  Bob
  Charlie
  David
  Eve
  Fred
  Ginny
  Harriet
  Ileana
  Joseph
  Kincaid
  Larry
}

pub type Plant {
  Radishes
  Clover
  Violets
  Grass
  None
}

pub fn index_student(student: Student) -> Int {
  let roster=[Alice, Bob, Charlie, David, Eve, Fred, Ginny, Harriet, Ileana, Joseph, Kincaid, Larry]
  |>list.index_map(fn(x,i) {#(i,x)})
  |>list.filter(fn(x) {x.1==student})
  |>list.map(fn(x) {x.0})
  |>list.first
  |>result.unwrap(-1)
}

pub fn plants(diagram: String, student: Student) -> List(Plant) {
  let index=index_student(student)
  diagram
  |>string.split("\n")
  |>list.map(string.to_graphemes)
  |>list.transpose
  |>list.index_map(fn(x,i) {case i%2 == 0 {True->#(i/2,x) False->#({i-1}/2,x)}})
  |>list.filter(fn(x) {x.0==index})
  |>list.map(fn(x) {x.1})
  |>list.transpose
  |>list.flatten
  |>list.map(fn(x) {case x {"C"->Clover "R"->Radishes "V"->Violets "G"->Grass _->None}})
}
