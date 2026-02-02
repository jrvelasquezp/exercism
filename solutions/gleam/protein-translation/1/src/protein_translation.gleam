import gleam/list
import gleam/result

pub fn decode_protein(rna: String) -> List(String) {
  case rna {
    "" -> [""]
    "AUG" <> rest -> ["Methionine", ..decode_protein(rest)]
    "UUU" <> rest -> ["Phenylalanine", ..decode_protein(rest)]
    "UUC" <> rest -> ["Phenylalanine", ..decode_protein(rest)]
    "UUA" <> rest -> ["Leucine", ..decode_protein(rest)]
    "UUG" <> rest -> ["Leucine", ..decode_protein(rest)]
    "UCU" <> rest -> ["Serine", ..decode_protein(rest)]
    "UCA" <> rest -> ["Serine", ..decode_protein(rest)]
    "UCC" <> rest -> ["Serine", ..decode_protein(rest)]
    "UCG" <> rest -> ["Serine", ..decode_protein(rest)]
    "UGG" <> rest -> ["Tryptophan", ..decode_protein(rest)]
    "UAU" <> rest -> ["Tyrosine", ..decode_protein(rest)]
    "UAC" <> rest -> ["Tyrosine", ..decode_protein(rest)]
    "UGU" <> rest -> ["Cysteine", ..decode_protein(rest)]
    "UGC" <> rest -> ["Cysteine", ..decode_protein(rest)]
    "UAA" <> _rest -> [""]
    "UAG" <> _rest -> [""]
    "UGA" <> _rest -> [""]
    "U" -> ["Error"]
    _ -> [""] 
  }
}

pub fn proteins(rna: String) -> Result(List(String), Nil) {
  case rna, decode_protein(rna) {
    "",[""] -> Ok([])
    "UAA" <> _, [""] -> Ok([])
    "UAG" <> _, [""] -> Ok([]) 
    "UGA" <> _, [""] -> Ok([]) 
    _,[""] -> Error(Nil)
    _,_ -> {
            let x=decode_protein(rna)
            |>list.filter(fn(x) {x != ""})
            case list.last(x) {
              Ok("Error") -> Error(Nil)
              _ -> Ok(x)
            }         
           }
  }
}

