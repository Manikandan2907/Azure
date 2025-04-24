#This scritps contains output, input and standard error redirections with file decriptors. 

file="/tmp/data"

#Redirect stdin to a file using FD 0

read line 0< /etc/passwd
echo "the Line contains: $line"
#Redirect stdout to a file using FD 1

echo
head -n3 /etc/passwd 1> $file
echo "The file after o/p redirection is: "  
cat $file
#Redirect stderr to a file using FD 2

echo
head -n2 /nosuchfile 2> $file
echo "The file after error redirection is: "
cat $file
#Redirect both stderr and stdout to a file

echo
head -n2 /etc/passwd /nosuchfile > $file 2>&1
echo "The file after both error and output redirection is: "
cat $file

#Redirect stderr and stdout through pipe

echo
echo "The file after passing stderr and stdout as inputs is: "
head -n2 /etc/passwd /nosuchfile 2>&1 | cat -n

#Redirect stdout to stderr/ Force a command's output to be printed as error

echo "This is an error" > $file 1>&2
echo "The file after output redirection to error is: "
cat $file
#Discard stderr

echo
head -n2 /etc/passwd /nosuchfile 2> /dev/null 
#Discard stdout 

echo
head -n2 /etc/passwd /nosuchfile > /dev/null
#Discard both

echo
head -n2 /etc/passwd /nosuchfile > /dev/null 2>&1

#Remove the files

rm -rf $file


