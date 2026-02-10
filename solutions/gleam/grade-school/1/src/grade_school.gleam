import gleam/list
import gleam/string
import gleam/int

pub type Student {
  Student(name: String, grade: Int)
}

pub type School {
  School(to: List(Student))
}

pub fn grade_compare(a: Student, b: Student){
  int.compare(a.grade, b.grade)
}

pub fn name_compare(a: Student, b: Student){
  string.compare(a.name, b.name)
}

pub fn roster(school: School) -> List(String) {
 school.to
 |>list.sort(name_compare)
 |>list.sort(grade_compare)
 |>list.map(fn(x) {
    case x {
      Student(name, _grade) -> name
    }
  })
}

pub fn create() -> School {
  School([])
}

pub fn add(
  to school: School,
  student student: String,
  grade grade: Int,
) -> Result(School, Nil) {
  case list.any(school.to, fn(x) {x.name==student}) {
        True -> Error(Nil)
        False -> {
                  Ok(School([Student(student, grade), ..school.to]))
                 }
  }
}

pub fn grade(school: School, desired_grade: Int) -> List(String) {
 school.to
 |>list.sort(name_compare)
 |>list.sort(grade_compare)
 |>list.filter(fn(x) {x.grade == desired_grade})
 |>list.map(fn(x) {
    case x {
      Student(name, _grade) -> name
    }
  })
}
