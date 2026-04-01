import gleam/result

pub fn to_rna(dna: String) -> Result(String, Nil) {
  case dna {
    "C" <> strain -> Ok("G" <> result.unwrap(to_rna(strain),""))
    "G" <> strain -> Ok("C" <> result.unwrap(to_rna(strain),""))
    "A" <> strain -> Ok("U" <> result.unwrap(to_rna(strain),""))
    "T" <> strain -> Ok("A" <> result.unwrap(to_rna(strain),""))
    ""  -> Ok("")
    _   -> Error(Nil)
  }
}
