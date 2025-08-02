
module rational_numbers
  implicit none
contains

  function add(r1,r2)
    integer,dimension(2) :: add, r1,r2
    add(1)=r1(1)*r2(2)+r2(1)*r1(2)
    add(2)=r1(2)*r2(2)
    add=reduce(add)
  end function

  function sub(r1,r2)
    integer,dimension(2) :: sub, r1,r2
    sub(1)=r1(1)*r2(2)-r2(1)*r1(2)
    sub(2)=r1(2)*r2(2)
    sub=reduce(sub)
  end function

  function mul(r1,r2)
    integer,dimension(2) :: mul, r1,r2
    mul(1)=r1(1)*r2(1)
    mul(2)=r1(2)*r2(2)
    mul=reduce(mul)
  end function

  function div(r1,r2)
    integer,dimension(2) :: div, r1,r2
    div(1)=r1(1)*r2(2)
    div(2)=r1(2)*r2(1)
    div=reduce(div)
  end function

  function rational_abs(r1)
    integer,dimension(2) :: rational_abs, r1
    rational_abs(1)=abs(r1(1))
    rational_abs(2)=abs(r1(2))
  end function

  function rational_to_pow(r1, ex)
    integer,dimension(2) :: rational_to_pow, r1
    integer :: ex
    ! special case, number equal to 0
    if (r1(1)==0) then
      rational_to_pow(1)=0
      rational_to_pow(2)=1
    ! special case, number equal to 1
    else if (r1(1)==1 .and. r1(2)==1) then
      rational_to_pow(1)=1
      rational_to_pow(2)=1
    ! special case, exponent zero
    else if (ex==0) then
      rational_to_pow(1)=1
      rational_to_pow(2)=1
    ! special case, negative exponent
    else if (ex<0) then
      rational_to_pow(1)=r1(2)**abs(ex)
      rational_to_pow(2)=r1(1)**abs(ex)
    else
      rational_to_pow(1)=r1(1)**ex
      rational_to_pow(2)=r1(2)**ex
    end if
  end function

  function real_to_rational_pow(ex,r1)
    integer,dimension(2) ::  r1
    real :: real_to_rational_pow,ex
    ! special case, exponent is 0
    if (r1(1)==0) then
      real_to_rational_pow=1.0
    else
      real_to_rational_pow=ex**(1.0*r1(1)/r1(2))
    end if
  end function

  function reduce(r1)
    integer,dimension(2) :: reduce, r1
    integer :: large, small, gcd, rem, res
    ! special case - numbers are equal
    if (r1(1)==r1(2)) then
      reduce(1)=1
      reduce(2)=1
    ! special case - numerator is 0
    else if (r1(1)==0) then
      reduce(1)=0
      reduce(2)=1
    else
    ! calculate GCD using Euclid method
      if (abs(r1(1))>=abs(r1(2))) then
        large=abs(r1(1))
        small=abs(r1(2))
      else
        large=abs(r1(2))
        small=abs(r1(1))
      end if
    ! Check if number has simple divider
      if (mod(large,small)==0) then
        gcd=small
      else
        rem=1
        do while(rem>0 .or. small/=0)
          res=large/small
          rem=mod(large,small)
          large=small
          small=rem
          gcd=large
        end do
      end if
      reduce(1)=r1(1)/gcd
      reduce(2)=r1(2)/gcd
      ! check for negative denominator and change the sign
      if (reduce(2)<0) then
        reduce(1)=-1*reduce(1)
        reduce(2)=-1*reduce(2)
      end if
    end if
  end function

end module
