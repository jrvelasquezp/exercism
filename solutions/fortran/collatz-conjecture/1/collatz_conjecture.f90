module collatz_conjecture
  implicit none
contains

  integer function steps(i)
    integer :: i, j
    !check for neg or zero
    if (i<1) then
      steps = -1
    else
      j=i
      steps=0
      do while (j>1)
        if (mod(j,2)==0) then
          j=j/2
        else
          j=3*j+1
        end if
        steps=steps+1
      end do
    end if
  end function

end module
