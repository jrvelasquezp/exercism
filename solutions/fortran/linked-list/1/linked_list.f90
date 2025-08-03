module linked_list
  implicit none

  type :: node_t
    type (node_t), pointer :: prev, next
    integer :: value
  end type

  type :: list_t
    type (node_t), pointer :: first,last
    integer :: list_count
  end type

contains

  function new() result(list)
    type(list_t) :: list
    list%list_count=0 
    allocate(list%first)
    allocate(list%last)
    nullify(list%first%prev)
    nullify(list%first%next)
    nullify(list%last%prev)
    nullify(list%last%next)
  end function new

  subroutine push(list, val)
    type(list_t), intent(inout) :: list
    integer, intent(in) :: val
    if (list%list_count == 0) then
      allocate(list%first)
      list%last => list%first
      nullify(list%last%next)
      nullify(list%first%prev)
      list%last%value=val
    else
      allocate(list%last%next)
      list%last%next%prev=>list%last
      list%last => list%last%next
      nullify(list%last%next)
      list%last%value=val
    end if
    list%list_count=list%list_count+1
  end subroutine push

  function pop(list) result(val)
    type(list_t), intent(inout) :: list
    integer :: val
    if (list%list_count>0) then
      val=list%last%value
      list%list_count=list%list_count-1
      if (list%list_count == 0) then
        nullify(list%first)
        nullify(list%last)
      else
        list%last=>list%last%prev
        nullify(list%last%next)
      end if
    end if
  end function pop

  subroutine unshift(list, val)
    type(list_t), intent(inout) :: list
    integer, intent(in) :: val

    if (list%list_count == 0) then
        allocate(list%last)
        list%first => list%last
        nullify(list%last%next)
        nullify(list%first%prev)
        list%first%value=val
    else
        allocate(list%first%prev)
        list%first%prev%next=>list%first
        list%first => list%first%prev
        nullify(list%first%prev)
        list%first%value=val
    end if
    list%list_count=list%list_count+1
  end subroutine unshift

  function shift(list) result(val)
    type(list_t), intent(inout) :: list
    integer :: val
    if (list%list_count>0) then
      val=list%first%value
      list%list_count=list%list_count-1
      if (list%list_count == 0) then
        nullify(list%first)
        nullify(list%last)
      else
        list%first=>list%first%next
        nullify(list%first%prev)
      end if
    end if
  end function shift

  function length(list) result(n)
    type(list_t), intent(in) :: list
    integer :: n

    n = list%list_count
  end function length

  subroutine delete(list, val)
    type(list_t), intent(inout) :: list
    type(node_t), pointer :: ptr
    integer :: val
    logical :: found
    if (list%list_count>0) then
      found=.false.
      if (list%list_count==1) then
        if (list%first%value==val) then
          list%list_count=0
          nullify(list%first)
          nullify(list%last)
        end if
      else if (list%first%value == val) then
        list%list_count=list%list_count-1
        list%first=>list%first%next
        nullify(list%first%prev)
      else if (list%last%value == val) then
        list%list_count=list%list_count-1
        list%last=>list%last%prev
        nullify(list%last%next)
      else
        ptr=>list%first
        do while (found .eqv. .false. .and. associated(ptr%next) .eqv. .true.)
          if (ptr%value==val) then
            ptr%next%prev=>ptr%prev
            ptr%prev%next=>ptr%next
            list%list_count=list%list_count-1
            found=.true.
          else
            ptr=>ptr%next
          end if
        end do
      end if
    end if
  end subroutine delete

  subroutine destroy(list)
    type(list_t), intent(inout) :: list
    nullify(list%first)
    nullify(list%last)
    list%list_count=0
  end subroutine destroy

end module
