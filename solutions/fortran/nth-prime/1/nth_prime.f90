module nth_prime
  implicit none
contains

  ! get nth prime
  integer function prime(n)
    integer, intent(in) :: n
    integer :: i, j, k, limit, size_sieve
    integer, dimension(105000) :: sieve, primes
    !integer, dimension(n-1) :: primes
    prime = -1
    if (n==1) then
      prime=2
    else if (n<1) then
      prime=-1
    else if (n==2) then
      prime=3
    else if (n<100) then
      j=1
      do i=1,100
        sieve(i)=i+1
        if (sieve(i)==2 .or. sieve(i)==3 .or. sieve(i)==5 .or. sieve(i)==7 .or. &
        .not. (mod(sieve(i),2)==0 .or. mod(sieve(i),3)==0 .or. mod(sieve(i),5)==0 & 
        .or. mod(sieve(i),7)==0)) then
            primes(j)=sieve(i)
            j=j+1
        end if
      end do
      prime=primes(n)
    else
      limit=105000
      j=1
      !generate the first numbers and filter multiples of 2, 3, 5 and 7
      do i=1, limit
        sieve(i)=i+1
        if (sieve(i)==2 .or. sieve(i)==3 .or. sieve(i)==5 .or. sieve(i)==7 .or. &
        .not. (mod(sieve(i),2)==0 .or. mod(sieve(i),3)==0 .or. mod(sieve(i),5)==0 & 
        .or. mod(sieve(i),7)==0)) then
          primes(j)=sieve(i)
          j=j+1
        end if
      end do
      size_sieve=j
      print *, size_sieve, primes(n), sieve(n)
      sieve=primes
      print *, size_sieve, primes(n), sieve(n)
      !delete the k-th multiples
      k=5 !it sets to n=11
      j=1
      do while (sieve(k)**2<limit)
        j=1
        do i=1,size_sieve
        !condition to validate
          if (mod(sieve(i),sieve(k))/=0 .or. sieve(i)<=sieve(k)) then
            primes(j)=sieve(i)
            j=j+1
          end if
        end do
        size_sieve=j
        sieve=primes
        k=k+1
      end do
      prime=primes(n)
    end if
  end function
end module
