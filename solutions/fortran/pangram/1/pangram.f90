module pangram
  implicit none
contains

  logical function is_pangram(sentence)
    character(*) :: sentence
    character(len=len(sentence)) :: s2
    integer :: i,j
    s2=""
    j=1
    if (sentence=="") then
        is_pangram=.false.
    else
      is_pangram=.true.
      do i=97,122
        is_pangram=is_pangram .and. (scan(sentence, char(i))/=0 .or. scan(sentence, char(i-32))/=0)
      end do 
    end if
   end function is_pangram

end module pangram
