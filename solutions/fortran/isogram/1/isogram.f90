module isogram
  implicit none

contains

  function isIsogram(phrase) result(no_repeats)
    character(len=*), intent(in) :: phrase
    character(len=len(phrase)) :: sentence
    integer :: i,j
    logical :: no_repeats
    no_repeats=.true.
    sentence=phrase
    if (sentence=="") then
      no_repeats=.true.
    else
      do i=1,len(sentence)
        do j=i+1,len(sentence)
          if (sentence(i:i)/="-" .and. sentence(i:i)/=" ") then
            if (ichar(sentence(i:i))>=65 .and. ichar(sentence(i:i))<=90) then
              sentence(i:i)=char(ichar(sentence(i:i))+32)
            else if (ichar(sentence(j:j))>=65 .and. ichar(sentence(j:j))<=90) then
              sentence(j:j)=char(ichar(sentence(j:j))+32)
            end if
              no_repeats=no_repeats .and. (sentence(i:i)/=sentence(j:j))
          end if
        end do
      end do
    end if
  end function isIsogram

end module isogram
