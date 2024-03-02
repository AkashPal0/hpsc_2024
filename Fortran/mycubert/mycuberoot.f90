program mycuberoot
    implicit none
    real(kind=8) :: x, my_cuberoot, cuberoot_fortran, error
    real(kind=8), external :: cubert2
    x = 27.d0
    my_cuberoot = cubert2(x)
    cuberoot_fortran = x**(1.d0/3.d0)
    error = abs(my_cuberoot - cuberoot_fortran)
    print *, 'x = ', x
    print *, 'my_cuberoot = ', my_cuberoot
    print *, 'cuberoot_fortran = ', cuberoot_fortran
    print *, 'error = ', error
end program mycuberoot

function cubert2(x)
    implicit none
    real(kind=8), intent(in) :: x
    real(kind=8) :: cubert2
    real(kind=8) :: s, s0, error
    real(kind=8) :: tol
    integer :: kmax, k
    s = 1.d0
    tol = 1.d-14
    k = 0
    kmax = 1000
    do
        if (k > kmax) then
            print *, "exceeded maximum iterations"
            exit
        end if
        s0 = s
        s = (2.d0*s + x/(s**2))/3.d0
        error = abs(s - s0)
        if (error < tol) then
            print *, "stopping at ", k, " iteration"
            exit
        end if
        k = k + 1
    end do
    cubert2 = s
end function cubert2