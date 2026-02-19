import gleam/list
import gleam/string
import gleam/int
import gleam/result

pub type Matrix{
  Matrix(
    row: Int,
    col: Int,
    m: List(List(Int))
  )
}

pub fn string_to_matrix(str: String)->Matrix{
  let ll=string.split(str, "\n")
  |>list.map(fn(x) {string.split(x," ")})
  |>list.map(fn(x) {list.map(x, fn(k) {int.parse(k)})})
  |>list.map(result.values)
  let mm=Matrix(1,1,ll)
}

pub fn get_row(m: Matrix, row: Int)->Result(List(Int),Nil){
  case row<1 {
    True -> Error(Nil)
    False -> {
              m.m
              |>list.drop(row-1)
              |>list.first
              }
  }

}

pub fn get_col(m: Matrix, col: Int)->Result(List(Int),Nil){
  case col<1 {
    True -> Error(Nil)
    False -> {
              m.m
              |>list.transpose
              |>list.drop(col-1)
              |>list.first
              }
  }
}

pub fn row(index: Int, string: String) -> Result(List(Int), Nil) {
  let matrix=string_to_matrix(string)
  get_row(matrix,index)
}

pub fn column(index: Int, string: String) -> Result(List(Int), Nil) {
  let matrix=string_to_matrix(string)
  get_col(matrix,index)
}
