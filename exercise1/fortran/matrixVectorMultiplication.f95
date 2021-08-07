program hello
implicit none

integer size, n
real*8, dimension(:), allocatable :: vector, resultIJ, resultJI
real*8, dimension(:,:), allocatable :: matrix
real start_t, end_t, total_t
call random_seed()

open(1, file = '../documents/fortran/csv/matrixVectorMultiplicationIJ.csv', action = 'write')
open(2, file = '../documents/fortran/csv/matrixVectorMultiplicationJI.csv', action = 'write')

do n = 1, 6, 1
    size = 4500 * n
    allocate(vector(size))
    allocate(matrix(size,size))

    call fillVector(vector,size)
    call fillMatrix(matrix,size)

    allocate(resultIJ(size))
    call fillResultsVector(resultIJ,size)

    call cpu_time(start_t)
    call matrixVectorMultiplicationIJ(matrix,vector,resultIJ,size)
    call cpu_time(end_t)

    total_t =  end_t - start_t
    print *, 'It took the computer', total_t, 'to compute a ',size,'degree matrix on IJ; i = ',n
    write(1,*) size,",",total_t
    deallocate(resultIJ)

    allocate(resultJI(size))
    call fillResultsVector(resultJI,size)

    call cpu_time(start_t )
    call matrixVectorMultiplicationJI(matrix,vector,resultJI,size)
    call cpu_time(end_t )

    total_t  =  end_t  - start_t
    print *, "It took the computer", total_t, "to compute a ",size,"degree matrix on JI; i = ",n
    write(2,*) size,",",total_t
    deallocate(resultJI)

    deallocate(matrix)
    deallocate(vector)
end do

close(1)
close(2)

contains

subroutine fillVector(vector, size)
    implicit none

    real*8, dimension(:) :: vector
    integer :: size, i
    real*8 :: u

    do i = 1, size
            call random_number(u)
            vector(i) = u
    end do
end

subroutine fillResultsVector(vector, size)
    implicit none

    real*8, dimension(:) :: vector
    integer :: size, i

    do i = 1, size
            vector(i) = 0
    end do
end

subroutine fillMatrix(matrix, size)
    implicit none

    real*8, dimension(:,:) :: matrix
    integer :: size, i, j
    real*8 :: u

    do i = 1, size
        do j = 1, size
            call random_number(u)
            matrix(i, j) = u
        end do
    end do
end

subroutine matrixVectorMultiplicationIJ(matrix, vector, result, size)
    implicit none

    real*8, dimension(:,:) :: matrix
    real*8, dimension(:) :: vector, result
    integer :: size, i, j

    do i = 1, size
        do j = 1, size
            result(i) = result(i) + (matrix(i, j) * vector(j))
        end do
    end do
end

subroutine matrixVectorMultiplicationJI(matrix, vector, result, size)
    implicit none

    real*8, dimension(:,:) :: matrix
    real*8, dimension(:) :: vector, result
    integer :: size, i, j

    do j = 1, size
        do i = 1, size
            result(i) = result(i) + (matrix(i, j) * vector(j))
        end do
    end do
end

end program hello