
module armstrong_numbers
  implicit none
contains

  logical function isArmstrongNumber(i)
    integer, intent(in) :: i
    integer :: k, m, l, n, sum
    if (i==0) then
      isArmstrongNumber = .true.
    else
      n=i
      m=7
      l=m
      sum=0
      do k=1,l
      if (n/10**(7-k)==0) then
          m=m-1
      end if
      sum=sum+(n/10**(7-k))**m
      n=mod(n,10**(7-k))
      end do
      
      isArmstrongNumber = (sum==i)
    end if
  end function

end module
