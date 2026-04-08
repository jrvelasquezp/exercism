pub fn to_rna(dna: String) -> Result(String, Nil) {
  case dna {
    "C" <> strain -> case to_rna(strain) {
                        Ok(c)->Ok("G" <> c)
                        Error(e) -> Error(e)
                      }
    "G" <> strain -> case to_rna(strain) {
                        Ok(c)->Ok("C" <> c)
                        Error(e) -> Error(e)
                      }
    "A" <> strain -> case to_rna(strain) {
                        Ok(c)->Ok("U" <> c)
                        Error(e) -> Error(e)
                      }
    "T" <> strain -> case to_rna(strain) {
                        Ok(c)->Ok("A" <> c)
                        Error(e) -> Error(e)
                      }
    ""  -> Ok("")
    _ -> Error(Nil)
  }
}
