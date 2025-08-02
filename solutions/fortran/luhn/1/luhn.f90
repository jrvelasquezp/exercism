module luhn
  implicit none

contains

  function validate(number) result(valid)
    character(*), intent(in) :: number
    character(:),allocatable :: rcard
    integer :: i, digit, sums
    logical :: valid
    valid = .true.
    !check single digit 
    if (len(number)==1) then
      valid= .false.
    !check for invalid characters
    else if (scan(number, "ab-$#:%")>0) then
      valid= .false.
    !check for a space in a short string - len=2
    else if (scan(number, " ")>0 .and. len(number)==2) then
      valid= .false.
    !else
    else
    !reverse
      do i=1,len(number)
        if (number(len(number)-i+1:len(number)-i+1)/=" ") then
          rcard=rcard//number(len(number)-i+1:len(number)-i+1)
        end if
      end do
      do i=1,len(rcard)
        if (mod(i,2)==0) then
          read(rcard(i:i),'(i1)') digit
          digit=2*digit
          if(digit>9) then
            digit=digit-9
          end if
          write(rcard(i:i),'(i1)') digit
        end if
      end do
      sums=0
      do i=1,len(rcard)
        read(rcard(i:i),'(i1)') digit
        sums=sums+digit
      end do
      valid=mod(sums,10)==0
    end if
  end function validate

end module luhn
