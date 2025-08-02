
module acronym
  implicit none
contains

  function abbreviate(s)
    character(len=*), intent(in) :: s
    character(len=len(s)) :: abbreviate, s2
    integer :: i, j
    s2=s
    abbreviate=""
    j=1
    do i=1,len(s2)
      ! Replace undesired characters
      if (s2(i:i)=="_" .or. s2(i:i)=="-") then
        s2(i:i)=" "
      end if
      ! test
      if (i==1) then
        abbreviate(j:j)=s2(i:i)
        j=j+1
      else if (s2(i-1:i-1)==" " .and. s2(i:i)/=" ") then
        abbreviate(j:j)=s2(i:i)
        j=j+1
      else if (s2(i-1:i-1)=="-" .and. s2(i:i)/=" ") then
        abbreviate(j:j)=s2(i:i)
        j=j+1
      end if
    end do
    !upperscore conversion
    do i=1,j
      if (ichar(abbreviate(i:i))>=97 .and. ichar(abbreviate(i:i))<=122) then
        abbreviate(i:i)=char(ichar(abbreviate(i:i))-32)
      end if
    end do
  end function

end module
