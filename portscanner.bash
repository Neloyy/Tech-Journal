#! /bin/bash

if [ $# -ne 2 ]; then #Checks to make sure that there are 2 inputs when running script
	echo -e "Missing file Either <hostfile> or <portfile>\nUsage: $0 <hostfile> <portfile>"
	exit 1
fi

hostfile=$1
portfile=$2

if [[ ! -r $hostfile ]]; then #error handling for issues reading either file
	echo "Error issue reading $hostfile"
	exit 1
fi
if [[ ! -r $portfile ]]; then
        echo "Error issue reading $portfile"
        exit 1
fi


#echo "host,port"
printf "%-15s %-6s\n" "HOST" "PORT" #using printf to more cleanly output into a table looking output

for host in $(sort -u $hostfile); do
	for port in $(sort -u $portfile); do
		timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null && printf "%-15s %-6s\n" "$host" "$port" 
	done
done
