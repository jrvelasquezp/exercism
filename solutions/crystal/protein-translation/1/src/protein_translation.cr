module ProteinTranslation
  def self.proteins(strand : String) : Array(String)
    protein_list=[] of String
    index=0
    codon=strand[index,3]
    if strand.size>0
      until index>=strand.size || codon.includes?("UAG") || codon.includes?("UAA") || codon.includes?("UGA")
        if codon.includes?("AUG")
          protein_list.concat(["Methionine"])
        elsif codon.includes?("UUU") || codon.includes?("UUC")
          protein_list.concat(["Phenylalanine"])
        elsif codon.includes?("UUA") || codon.includes?("UUG")
          protein_list.concat(["Leucine"])
        elsif codon.includes?("UCU") || codon.includes?("UCC") || codon.includes?("UCA") || codon.includes?("UCG")
          protein_list.concat(["Serine"])
        elsif codon.includes?("UAU") || codon.includes?("UAC")
          protein_list.concat(["Tyrosine"])
        elsif codon.includes?("UGU") || codon.includes?("UGC")
          protein_list.concat(["Cysteine"])
        elsif codon.includes?("UGG")
          protein_list.concat(["Tryptophan"])
        else
          raise ArgumentError.new "not a valid sequence/codon"
        end
        index += 3
        codon=strand[index,3]
      end
    end
    p protein_list
  end
end