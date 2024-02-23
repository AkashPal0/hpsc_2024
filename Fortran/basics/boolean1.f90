program boolean1

    implicit none
    integer :: i,k
    logical :: ever_zero

    ever_zero = .false.
    do 69 i=1,10
        k = 3*i - 1
        ever_zero = (ever_zero .or. (k == 0))
    69    continue

    ! do i=1,10
    !     k = 3*i - 1
    !     ever_zero = (ever_zero .or. (k == 0))
    ! enddo

    if (ever_zero) then
        print *, "3*i - 1 takes the value 0 for some 10"
    else
        print *, "3*i - 1 is never 0 for 10 tested"
    endif

end program boolean1
