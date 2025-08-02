
module triangle
  implicit none

  interface equilateral
    module procedure equilateral_real
    module procedure equilateral_int
  end interface

  interface scalene
    module procedure scalene_real
    module procedure scalene_int
  end interface

  interface isosceles
    module procedure isosceles_real
    module procedure isosceles_int
  end interface

 contains

  logical function equilateral_real(edges)
    real,dimension(3) :: edges
    equilateral_real=(edges(1) .eq. edges(2) .and. edges(1) .eq. edges(3) .and. edges(1)>0 .and. edges(2)>0 .and. edges(3)>0)
  end function

  logical function equilateral_int(edges)
    integer,dimension(3) :: edges
    equilateral_int=(edges(1) .eq. edges(2) .and. edges(1) .eq. edges(3) .and. edges(1)>0 .and. edges(2)>0 .and. edges(3)>0)
  end function

  logical function isosceles_real(edges)
    real,dimension(3) :: edges
    isosceles_real = (edges(1)+edges(2)>=edges(3) .and. edges(2)+edges(3)>=edges(1) .and. edges(1)+edges(3)>=edges(2))
    isosceles_real = (isosceles_real .and. (edges(1) .eq. edges(2) .or. edges(1) .eq. edges(3) .or. edges(2) .eq. edges(3)))
  end function

  logical function isosceles_int(edges)
    integer,dimension(3) :: edges
    isosceles_int = (edges(1)+edges(2)>=edges(3) .and. edges(2)+edges(3)>=edges(1) .and. edges(1)+edges(3)>=edges(2))
    isosceles_int = (isosceles_int .and. (edges(1) .eq. edges(2) .or. edges(1) .eq. edges(3) .or. edges(2) .eq. edges(3)))
  end function


  logical function scalene_real(edges)
    real,dimension(3) :: edges
    scalene_real = (edges(1)+edges(2)>=edges(3) .and. edges(2)+edges(3)>=edges(1) .and. edges(1)+edges(3)>=edges(2))
    scalene_real = (scalene_real .and. .not. equilateral_real(edges) .and. .not. isosceles_real(edges))
  end function

  logical function scalene_int(edges)
    integer,dimension(3) :: edges
    scalene_int = (edges(1)+edges(2)>=edges(3) .and. edges(2)+edges(3)>=edges(1) .and. edges(1)+edges(3)>=edges(2))
    scalene_int = (scalene_int .and. .not. equilateral_int(edges) .and. .not. isosceles_int(edges))
  end function

end module
