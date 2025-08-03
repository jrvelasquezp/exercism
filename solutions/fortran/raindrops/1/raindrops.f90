module raindrops
  implicit none
contains

  function convert(i)
    integer :: i, last
    character(20) :: convert
    convert=''
    last=1
    if (mod(i,3)==0) then
      convert=convert(1:last)//'Pling'
      last=last+5
    end if
    if (mod(i,5)==0) then
      convert=convert(1:last)//'Plang'
      last=last+5
    end if
    if (mod(i,7)==0) then
      convert=convert(1:last)//'Plong'
      last=last+5
    end if
    if (last==1) then
      write(convert, '(I10)') i 
    end if
    convert=adjustl(convert)
  end function convert

end module raindrops
