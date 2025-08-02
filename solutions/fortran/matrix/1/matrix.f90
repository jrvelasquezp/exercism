
module matrix
  implicit none

contains

  function row(matrix, dims, i) result(r)
    integer, dimension(2), intent(in) :: dims
    !! Matrix dimensions (nrows, ncols)
    character(len=*), dimension(dims(1)), intent(in) :: matrix
    !! Matrix as a 1-d array of strings
    integer, intent(in) :: i
    !! Row index
    integer, dimension(dims(2)) :: r
    character(len=15) :: str
    integer :: mat(dims(1),dims(2))
    integer :: number, idx, m, n
    !! fill matrix from strings
    do m=1,dims(1)    
      n=1
      idx=1
      str=matrix(m)
      do while (idx>0)
        idx=index(str,",")
        if (idx>0) then
          read(str(1:idx-1), '(I10)') number
          str=trim(str(idx+1:))
          mat(m,n)=number
          n=n+1
        else
          read(str, '(I10)') number
          mat(m,n)=number
        end if
      end do
    end do
    do m=1,size(r)
      r(m)=mat(i,m)
    end do
  end function

  function column(matrix, dims, j) result(c)
    integer, dimension(2), intent(in) :: dims
    !! Matrix dimensions (nrows, ncols)
    character(len=*), dimension(dims(1)), intent(in) :: matrix
    !! Matrix as a 1-d array of strings
    integer, intent(in) :: j
    !! Column index
    integer, dimension(dims(1)) :: c
    character(len=15) :: str
    integer :: mat(dims(1),dims(2))
    integer :: number, idx, m, n
    !! fill matrix from strings
    do m=1,dims(1)    
      n=1
      idx=1
      str=matrix(m)
      do while (idx>0)
        idx=index(str,",")
        if (idx>0) then
          read(str(1:idx-1), '(I10)') number
          str=trim(str(idx+1:))
          mat(m,n)=number
          n=n+1
        else
          read(str, '(I10)') number
          mat(m,n)=number
        end if
      end do
    end do
    do m=1,size(c)
      c(m)=mat(m,j)
    end do
  end function

end module
