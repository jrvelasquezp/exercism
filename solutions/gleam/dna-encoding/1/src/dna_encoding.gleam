import gleam/list
import gleam/result

pub fn nucleotids(ba: BitArray) -> List(Result(Nucleotide,Nil)) {
  nucleotids_loop(ba, [])
}

fn nucleotids_loop(ba: BitArray, acc: List(Result(Nucleotide,Nil))) -> List(Result(Nucleotide,Nil)) {
  case ba {
    <<>> -> list.reverse(acc)
    <<_:1>> -> [Error(Nil)]
    _ -> {
          let assert <<value:2, rest:bits>>=ba
          nucleotids_loop(rest, [decode_nucleotide(value), ..acc])
          }
  }
}

pub type Nucleotide {
  Adenine
  Cytosine
  Guanine
  Thymine
}

pub fn encode_nucleotide(nucleotide: Nucleotide) -> Int {
  case nucleotide {
    Adenine -> 0b00
    Cytosine -> 0b01
    Guanine -> 0b10
    Thymine -> 0b11
  }
}

pub fn decode_nucleotide(nucleotide: Int) -> Result(Nucleotide, Nil) {
  case nucleotide {
    0 -> Ok(Adenine)
    1 -> Ok(Cytosine)
    2 -> Ok(Guanine)
    3 -> Ok(Thymine)
    _ -> Error(Nil)
  }
}

pub fn encode(dna: List(Nucleotide)) -> BitArray {
  list.map(dna, fn(x) {<<encode_nucleotide(x):2>>})
  |>list.fold(<<>>, fn(acc,a) {<<acc:bits, a:bits>>})
  |>echo
}

pub fn decode(dna: BitArray) -> Result(List(Nucleotide), Nil) {
  nucleotids(dna)
  |>result.all
}
