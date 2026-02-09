import gleam/dict.{type Dict} 
import gleam/string
import gleam/list

pub fn is_valid_nucleotide(nucleotide: String)->Bool {
  nucleotide == "A" || nucleotide == "C" || nucleotide == "T" || nucleotide == "G"
}

pub fn nucleotide_count(dna: String) -> Result(Dict(String, Int), Nil) {
  let list_strand=dna
  |>string.split("")
  case list.all(list_strand, fn(a) {is_valid_nucleotide(a)}) {
    True -> {
            let counter=[]
            |>list.append([#("A",list.count(list_strand, fn(x) {x=="A"}))])
            |>list.append([#("G",list.count(list_strand, fn(x) {x=="G"}))])
            |>list.append([#("C",list.count(list_strand, fn(x) {x=="C"}))])
            |>list.append([#("T",list.count(list_strand, fn(x) {x=="T"}))])
            Ok(dict.from_list(counter))
            }
    False -> Error(Nil)
  }
}
