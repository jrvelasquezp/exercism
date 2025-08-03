module saddle_points
  implicit none

  type :: point_t
    integer :: row
    integer :: column
  end type point_t

contains

  function saddlePoints(matrix) result(points)
    integer, intent(in) :: matrix(:, :)
    type(point_t), allocatable :: points(:), max_p(:), min_p(:)
    integer :: i, j, m, n, p
    integer :: sz(2)
    m=0
    n=0
    p=0
    ! Replace the following line in your implementation
    allocate(points(size(matrix)))
    allocate(max_p(size(matrix)))
    allocate(min_p(size(matrix)))
    if (size(matrix)>0) then
      sz=shape(matrix)
      do i=1,sz(1)
        !find maximum
        do j=1,sz(2)
          if (matrix(i,j)==maxval(matrix(i,:),1)) then
            m=m+1
            max_p(m)=point_t(row = i,column = j)
          end if
        end do
      end do
      !find minimum points
      do i=1,sz(2)
        !find minimum
        do j=1,sz(1)
          if (matrix(j,i)==minval(matrix(:,i),1)) then
            n=n+1
            min_p(n)=point_t(row=j, column=i)
          end if
        end do
      end do
      !find saddle points
      do i=1,m 
        do j=1,n
          if(max_p(i)%row == min_p(j)%row .and. max_p(i)%column == min_p(j)%column) then
            p=p+1
            points(p)=min_p(j)
          end if
        end do
      end do
    end if
    points=points(1:p)
  end function saddlePoints

end module saddle_points
