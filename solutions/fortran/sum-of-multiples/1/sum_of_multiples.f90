module sum_of_multiples
  implicit none

contains

  function sum_multiples(factors, limit) result(res)
    integer, intent(in) :: factors(:), limit
    integer :: res, n, j, k, num_factors
    logical :: is_already_factor
    res=42
    n=1
    num_factors=size(factors)
    if (size(factors)==0) then
      res=0
    else if(all(factors .eq. [0])) then
      res=0
    else if(size(factors)==1 .and. factors(1)==0) then
      res=0
    else if(size(factors)==1 .and. factors(1)==1) then
      res=(limit-1)*limit/2
    else if(size(factors)==1) then
      res=0
      do while(factors(1)*n<limit)
        res=res+n*factors(1)
        n=n+1
      end do
    else if(size(factors)==2) then
      !do for factor 1
      if (factors(1)>0) then
        res=factors(1)*(limit/factors(1))*(1+(limit/factors(1)))/2
      else
        res=res+0
      end if
      !do for factor 2
      n=1
      if (factors(2)>0) then
        do while(factors(2)*n<limit)
          if (mod(n*factors(2),factors(1))/=0) then
            res=res+n*factors(2)
          end if
          n=n+1
        end do
      else
        res=res+0
      end if
    else
      !do for bigger
      res=factors(1)*(limit/factors(1))*(1+(limit/factors(1)))/2
      if (mod(limit,factors(1))==0) then
          res=res-limit
      end if
      !perform the calculation for factors if dimension is > 1
      if (num_factors>1) then
          do j=2,num_factors
              n=1
              if (factors(j)>0) then
                  do while(factors(j)*n<limit)
                      !check if the factor is already detected
                      is_already_factor=.false.
                      do k=1,j-1
                          is_already_factor=mod(n*factors(j),factors(k))==0 .or. is_already_factor
                      end do
                      if (.not. is_already_factor) then
                          res=res+n*factors(j)
                      end if
                      n=n+1
                  end do
              else
                  res=res+0
              end if
          end do
      end if
    end if
  end function sum_multiples
end module sum_of_multiples
