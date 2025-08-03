
module high_scores
  implicit none
contains

function scores(score_list)
  integer, dimension(:) :: score_list
  integer, dimension(size(score_list)) :: scores
  scores=score_list
end function

function latest(score_list)
  integer, dimension(:) :: score_list
  integer :: latest
  latest=score_list(size(score_list))
end function

function personalBest(score_list)
  integer, dimension(:) :: score_list
  integer, dimension(size(score_list)) :: scores
  integer :: personalBest
  scores=sorted(score_list)
  personalBest=scores(1)
end function

function personalTopThree(score_list)
  integer, dimension(:) :: score_list
  integer, dimension(3) :: personalTopThree
  personalTopThree=(/0,0,0/)
  personalTopThree=sorted(score_list)
end function

function sorted(score_list)
  integer, dimension(:) :: score_list
  integer, dimension(size(score_list)) :: sorted
  integer :: i, j, temp

  sorted=score_list
  do i=1, size(sorted)
    do j=i+1, size(sorted)
      if (sorted(i)<sorted(j)) then
        temp=sorted(j)
        sorted(j)=sorted(i)
        sorted(i)=temp
      end if
    end do
  end do

end function

end module
