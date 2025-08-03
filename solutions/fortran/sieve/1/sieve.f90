module sieve
  implicit none

contains

  function primes(limit) result(m)
    integer, allocatable :: m(:)
    integer, allocatable :: temp(:)
    integer :: prime
    integer :: limit
    integer :: prime_count
    integer :: i, n
    
    prime=0
    
    allocate (m(limit-1))
    do n = 2, limit
       m(n-1)=n
    end do
    do i=1, limit-1
        if (prime**2 < limit) then
            prime = m(i)
            prime_count=count(mod(m,prime)/= 0 .or. m<=prime)
            allocate (temp(prime_count))
            temp=pack(m, mod(m,prime)/= 0 .or. m<=prime)
            deallocate (m)
            allocate (m(prime_count))
            m=temp
            deallocate (temp)
        end if
    end do
  end function primes

end module sieve
