module protein_translation
  implicit none

contains

  function proteins(rna) result(names)
    character(len=*), intent(in) :: rna
    character(len=13), allocatable :: names(:)
    character(len=13) :: cod
    integer :: i, first_stop
    
    first_stop=0
    allocate(names(len(rna)/3))
      do i=1,len(rna),3
        cod=translation(rna(i:i+2))
        if (cod=='STOP') then
          first_stop=((i-1)+3)/3
        end if
        names(((i-1)+3)/3)=cod
      end do
      if (first_stop/=0) then
        names=names(1:first_stop-1)
      end if
  end function proteins

  function translation(codon) result (match)
    character(len=13) :: match
    character(len=3) :: codon
   
    select case (codon)
        case ("AUG")
            match="Methionine"
        case ("UGG")
            match="Tryptophan"
        case ("UUU", "UUC")
            match="Phenylalanine"
        case ("UUA", "UUG")
            match="Leucine"
        case ("UAU", "UAC")
            match="Tyrosine"
        case ("UGU", "UGC")
            match="Cysteine"
        case ("UCU", "UCC","UCA", "UCG")
            match="Serine"
        case ("UAA", "UAG", "UGA")
            match="STOP"
        case default
            match=""
    end select
  end function translation

end module protein_translation

