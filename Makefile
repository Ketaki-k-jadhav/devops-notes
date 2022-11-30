CC=gcc  #compiler
TARGET=out #target file name
 
all:jenkins_assgn.o
	$(CC) jenkins_assgn.o -o $(TARGET)

jenkins.o:
	$(CC) -c jenkins_assgn.c
 
clean:
	rm *.o $(TARGET)