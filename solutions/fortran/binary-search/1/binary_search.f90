module binary_search
  implicit none
contains

  function find(array, val) result(idx)
    integer, dimension(:), intent(in) :: array
    integer, intent(in) :: val
    integer :: start, finish, idx, size_array
    logical :: stop_search

    idx=-1
    start=1
    finish=size(array)
    size_array=finish-start+1
    stop_search=.false.

    do while (idx==-1 .and. (stop_search .eqv. .false.))
        !check for special cases (once)
        !special case, size_array=1
        if (size(array)==0) then
            stop_search=.true.
        else if (val < array(1) .or. val>array(size_array)) then
            stop_search=.true.
        else if (start>finish) then
            stop_search=.true.
        else if (size(array)==1) then
            if (array(1)==val) then
                idx=1
            end if
            stop_search=.true.
        !special case, size_array=2
        else if (size(array)==2) then
            if (array(1)==val) then
                idx=1
            else if (array(2)==val) then
                idx=2
            end if
            stop_search=.true.
        !special - value at the beginning
        else if (array(start)==val) then
            idx=start
        !special - value at the end
        else if (array(finish)==val) then
            idx=finish
        !special - odd array
        else
            !value in the middle
            if (val==array((finish+start)/2)) then
                idx=(finish+start)/2
                stop_search=.true.
            !value low than the value in the middle
            else if (val<array((finish+start)/2)) then
                finish=((finish+start)/2)-1
            else
                start=((finish+start)/2)+1
            end if
        !special - even array
        end if
    end do
  end function
end module
