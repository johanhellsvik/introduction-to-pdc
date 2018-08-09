CFLAGS=-fopenmp
TARGET=hello_world

tegner:
	$(eval CC := gcc)
	$(eval OPENMP_CC := mpicc)

beskow:
	$(eval CC := cc)
	$(eval OPENMP_CC := cc)

all: hello_world openmp mpi

hello_world:
	$(CC) -o $(TARGET) $(TARGET).c
	
openmp:
	$(OPENMP_CC) $(CFLAGS) -o $(TARGET)_openmp $(TARGET)_openmp.c
	
mpi:
	$(OPENMP_CC) $(CFLAGS) -o $(TARGET)_mpi $(TARGET)_mpi.c	

clean:
	rm -f $(TARGET) $(TARGET)_mpi $(TARGET)_openmp
