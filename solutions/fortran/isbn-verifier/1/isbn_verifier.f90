module isbn_verifier
  implicit none

contains

  function isValid(isbn) result(valid)
    character(*), intent(in) :: isbn
    logical :: valid
    integer :: i, j, digit, sums
    valid= .true.
    !check for invalid lengths
    if (len(isbn)/=10 .and. len(isbn)/=13) then
      valid=.false.
    !check for valid characters on a 10 digit string
    else if (scan(isbn,"ABCDEFGHIJKLMNOPQRSTUVWYZ-")>0 .and. len(isbn)==10) then
      valid=.false.
    !check for valid characters on a 13 digit string
    else if (scan(isbn,"ABCDEFGHIJKLMNOPQRSTUVWYZ")>0 .and. len(isbn)==13) then
      valid=.false.
    !check for invalid X in a different position
    else if (scan(isbn,"X")>0 .and. isbn(len(isbn):len(isbn))/="X") then
      valid=.false.
    else 
      !calculate checksum
      sums=0
      j=10
      do i=1,len(isbn)
        if (isbn(i:i)/="-") then
          if (isbn(i:i)=="X") then
            digit=10
          else
            read(isbn(i:i),'(i1)') digit
          end if
          sums=sums+digit*j 
          j=j-1
        end if
      end do
      valid = mod(sums,11)==0
    end if
  end function isValid

end module isbn_verifier
