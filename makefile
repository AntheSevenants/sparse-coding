CC = g++
INCLUDES = -I /opt/tools/eigen 
CFLAGS = -std=c++11 -O3 -ffast-math
LIBS = -fopenmp
SRCS = sparse.cc utils.cc
SRCS_NO = sparse-nonneg.cc utils.cc
OUTPUT = sparse.o
NONNEG = nonneg.o

make:
	$(CC) $(INCLUDES) $(CFLAGS) $(SRCS) -o $(OUTPUT) $(LIBS)
nonneg:
	$(CC) $(INCLUDES) $(CFLAGS) $(SRCS_NO) -o $(NONNEG) $(LIBS)
clean:
	$(RM) *.o *~
