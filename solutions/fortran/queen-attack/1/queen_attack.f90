
module queen_attack
  implicit none
contains

  logical function isValid(pos)
    integer, dimension(2) :: pos
    isValid=(pos(1)>0 .and. pos(1)<9 .and. pos(2)>0 .and. pos(2)<9)
  end function

  logical function canAttack(white_pos, black_pos)
    integer, dimension(2) :: white_pos, black_pos
    canAttack = .false.
    if (white_pos(1) == black_pos(1)) then
      canAttack = .true.
    end if
    if (white_pos(2) == black_pos(2)) then
      canAttack = .true.
    end if
    if (abs(white_pos(1)-black_pos(1)) == abs(white_pos(2)-black_pos(2))) then
      canAttack = .true.
    end if
  end function

end module
