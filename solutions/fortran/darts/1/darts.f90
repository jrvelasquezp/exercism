module darts
  implicit none

contains

  function score(x, y) result(points)
    real, intent(in):: x, y
    integer :: points
    if (x**2+y**2<=1) then
      points=10
    else if (x**2+y**2<=25) then
      points=5 
    else if (x**2+y**2<=100) then
      points=1
    else
      points=0
    end if
  end function score

end module darts
