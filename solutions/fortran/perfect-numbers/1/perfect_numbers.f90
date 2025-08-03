
module perfect_numbers
  implicit none

contains

  character(len=9) function classify(num)
    integer, intent(in) :: num 
    integer :: sum, limit, i
    sum=1
    if (num < 1) then
      classify = "ERROR"
    else if (num < 6) then
      classify = "deficient"
    else
      if (mod(num,2)==0) then
        limit = num/2
      else
        limit = 1+num/2
      end if
      i=2
      do while (i<limit)
        if (mod(num,i)==0) then
          sum=sum+i
          sum=sum+num/i
          limit=num/i
        end if
        i=i+1
      end do
      if (sum==num) then
        classify = "perfect"
      else if (sum<num) then
        classify = "deficient"
      else
        classify = "abundant"
      end if
    end if
  end function

end module
