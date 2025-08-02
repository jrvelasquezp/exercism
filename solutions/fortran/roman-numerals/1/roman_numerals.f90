module roman_numerals
  implicit none

contains

  function roman(num) result(s)
    integer, value :: num
    integer :: a, nnum
    character(16) :: s
    nnum=num
    s=''
    a=1
    do while (nnum>0)
      if (nnum>=1000) then
        s=s(1:a)//'M'
        a=a+1
        nnum=nnum-1000
      else if (nnum >=900) then
        s=s(1:a)//'C'
        a=a+1
        nnum=nnum+100
      else if (nnum >=500) then
        s=s(1:a)//'D'
        a=a+1
        nnum=nnum-500
      else if (nnum >=400) then
        s=s(1:a)//'C'
        a=a+1
        nnum=nnum+100
      else if (nnum >=100) then
        s=s(1:a)//'C'
        a=a+1
        nnum=nnum-100
      else if (nnum >=90) then
        s=s(1:a)//'X'
        a=a+1
        nnum=nnum+10
      else if (nnum >=50) then
        s=s(1:a)//'L'
        a=a+1
        nnum=nnum-50
      else if (nnum >=40) then
        s=s(1:a)//'X'
        a=a+1
        nnum=nnum+10
      else if (nnum >=10) then
        s=s(1:a)//'X'
        a=a+1
        nnum=nnum-10
      else if (nnum == 9) then
        s=s(1:a)//'I'
        a=a+1
        nnum=nnum+1
      else if (nnum >=5) then
        s=s(1:a)//'V'
        a=a+1
        nnum=nnum-5
      else if (nnum == 4) then
        s=s(1:a)//'I'
        a=a+1
        nnum=nnum+1
      else if (nnum<4) then
        s=s(1:a)//'I'
        a=a+1
        nnum=nnum-1
      else
        nnum=0
      end if
    end do
    s=adjustl(s)
  end function roman

end module roman_numerals
