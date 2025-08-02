module hamming
  implicit none
contains

  function compute(strand1, strand2, distance)
      character(*) :: strand1, strand2
      integer :: distance , n
      logical :: compute

      if (strand1 == strand2) then
        distance=0
        compute=.true.
      else if (strand1=="" .or. strand2=="") then
        distance=0
        compute=.false.
      else if (len(strand1)/=len(strand2)) then
        distance=0
        compute=.false.
      else 
        distance=0
        do n=1,len(strand1)
          if (strand1(n:n)/=strand2(n:n)) then
            distance=distance+1
          end if
        end do
      end if
      
  end function compute

end module hamming
