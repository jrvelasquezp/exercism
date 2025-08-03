module difference_of_squares
  implicit none
contains

  integer function square_of_sum(n)
    integer :: n, i
    square_of_sum=0
    do i=1,n
      square_of_sum=square_of_sum+i
    end do
    square_of_sum=square_of_sum**2
  end function square_of_sum

  integer function sum_of_squares(n)
    integer :: n, k, l
    sum_of_squares=0
    do k=1,n
      l=k**2
      sum_of_squares=sum_of_squares+l
    end do
  end function sum_of_squares

  integer function difference(n)
    integer :: n
    difference=square_of_sum(n)-sum_of_squares(n)
  end function difference

end module difference_of_squares
