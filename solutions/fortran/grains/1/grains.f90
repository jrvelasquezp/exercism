
module grains

  implicit none

contains

  double precision function square(n)
    integer :: n
    if (n < 1 .or. n > 64) then
      square = -1.d0
    else
      square = 2.0**(n-1)
    end if
  end function

  double precision function total()
    integer :: n
    total=0
    do n=1,64
      total=total+square(n)
    end do
  end function

end module
