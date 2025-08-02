
module yacht
  implicit none

  ! | Ones | 1 × number of ones | Any combination	| 1 1 1 4 5 scores 3 |
  ! | Twos | 2 × number of twos | Any combination | 2 2 3 4 5 scores 4 |
  ! | Threes | 3 × number of threes | Any combination | 3 3 3 3 3 scores 15 |
  ! | Fours | 4 × number of fours | Any combination | 1 2 3 3 5 scores 0 |
  ! | Fives | 5 × number of fives| Any combination | 5 1 5 2 5 scores 15 |
  ! | Sixes | 6 × number of sixes | Any combination | 2 3 4 5 6 scores 6 |
  ! | Full House | Total of the dice | Three of one number and two of another | 3 3 3 5 5 scores 19 |
  ! | Four of a Kind | Total of the four dice | At least four dice showing the same face | 4 4 4 4 6 scores 16 |
  ! | Little Straight |  30 points | 1-2-3-4-5 | 1 2 3 4 5 scores 30 |
  ! | Big Straight | 30 points | 2-3-4-5-6 | 2 3 4 5 6 scores 30 |
  ! | Choice | Sum of the dice | Any combination | 2 3 3 4 6 scores 18 |
  ! | Yacht | 50 points | All five dice showing the same face | 4 4 4 4 4 scores 50 |


contains

  integer function score(dice, yacht_type)
    integer, dimension(5), intent(in) :: dice
    character(len=*), intent(in) :: yacht_type
    integer :: i
    score=0
    select case (yacht_type)
      case ("choice")
        score=sum(dice)
      case ("ones")
        do i=1,5
          if(dice(i)==1) then
            score=score+1
          end if
        end do
      case ("twos")
        do i=1,5
          if(dice(i)==2) then
            score=score+2
          end if
        end do
      case ("threes")
        do i=1,5
          if(dice(i)==3) then
            score=score+3
          end if
        end do
      case ("fours")
        do i=1,5
          if(dice(i)==4) then
            score=score+4
          end if
        end do
      case ("fives")
        do i=1,5
          if(dice(i)==5) then
            score=score+5
          end if
        end do
      case ("sixes")
        do i=1,5
          if(dice(i)==6) then
            score=score+6
          end if
        end do
      case ("yacht")
        if(all(dice==dice(1))) then
          score=50
        end if
      case ("little straight")
        if(minval(dice)==1 .and. maxval(dice)==5 .and. sum(dice)==15) then
          score=30
        end if
      case ("big straight")
        if(minval(dice)==2 .and. maxval(dice)==6 .and. sum(dice)==20) then
          score=30
        end if
      case ("full house")
        if(minval(dice)/=maxval(dice) .and. (sum(dice)==2*minval(dice)+3*maxval(dice) & 
        .or. sum(dice)==3*minval(dice)+2*maxval(dice))) then
          score=sum(dice)
        end if
      case("four of a kind")
        if(all(dice==dice(1))) then
          score=4*dice(1)
        else if(minval(dice)/=maxval(dice) .and. (sum(dice)==minval(dice)+4*maxval(dice) & 
        .or. sum(dice)==4*minval(dice)+maxval(dice))) then
          if (sum(dice)==minval(dice)+4*maxval(dice)) then
            score=4*maxval(dice)
          else
            score=4*minval(dice)
          end if
        end if
    end select
  end function


end module
