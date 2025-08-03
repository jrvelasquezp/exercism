module reverse_string
  implicit none
contains

  function reverse(input) result(reversed)
    character(*), intent(in) :: input
    character(len=len(input)+1) :: reversed
    integer :: i
    reversed=""
    do i=1,len(input)
      reversed = reversed(1:i)//input(len(input)-i+1:len(input)-i+1)
    end do
    reversed=adjustr(reversed)
    reversed=adjustl(reversed)
  end function

end module
