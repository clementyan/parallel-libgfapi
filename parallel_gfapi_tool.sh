#!/bin/bash

if["$1"=resetvalue];then
	echo "do reset all value"
	read -p "volume name: [default: rep3]" GFAPI_VOLNAME
	GFAPI_VOLNAME=${GFAPI_VOLNAME:-rep3}
	echo $GFAPI_VOLNAME

	read -p "host name: [default: localhost]" GFAPI_HOSTNAME
	GFAPI_HOSTNAME=${GFAPI_HOSTNAME:-localhost}
	echo $GFAPI_HOSTNAME

	read -p "workload: [default: seq-wr]" PGFAPI_LOAD
	PGFAPI_LOAD=${PGFAPI_LOAD:-seq-wr}
	echo $PGFAPI_LOAD

	read -p "record size(IO size) KB: [default: 64]" \
	PGFAPI_RECORDSIZE
	PGFAPI_RECORDSIZE=${PGFAPI_RECORDSIZE:-64}
	echo $PGFAPI_RECORDSIZE

	read -p "file size KB: [default: 4]" PGFAPI_FILESIZE
	PGFAPI_FILESIZE=${PGFAPI_FILESIZE:-4}
	echo $PGFAPI_FILESIZE

	read -p "number of files per thread: [default: 10]" \
	PGFAPI_FILES
	PGFAPI_FILES=${PGFAPI_FILES:-10}
	echo $PGFAPI_FILES

	read -p "number of thread per process: [default: 1]" \
	PGFAPI_THREADS_PER_PROC
	PGFAPI_THREADS_PER_PROC=${PGFAPI_THREADS_PER_PROC:-1}
	echo $PGFAPI_THREADS_PER_PROC

	read -p "number of process per client: [default: 16]" \
	PGFAPI_PROCESSES
	PGFAPI_PROCESSES=${PGFAPI_PROCESSES:-16}
	echo $PGFAPI_PROCESSES
	$TOTAL_FILES=$PGFAPI_FILES*$PGFAPI_THREADS_PER_PROC*\
	$PGFAPI_PROCESSES
	echo "Total w/r number of files: $TOTAL_FILES"

	read -p "use O_DIRECT at open time: [default: 0]" \
	PGFAPI_DIRECT
	PGFAPI_DIRECT=${PGFAPI_DIRECT:-0}
	echo $PGFAPI_DIRECT

	read -p "volume mount point path: [default: /volume/rep3/]" \
	PGFAPI_MOUNTPOINT
	PGFAPI_MOUNTPOINT=${PGFAPI_MOUNTPOINT:-/volume/rep3/}
	echo $PGFAPI_MOUNTPOINT

	read -p "r/w directory path within the volume mount point: [default: /gfapi-test]" \
	PGFAPI_TOPDIR
	PGFAPI_TOPDIR=${PGFAPI_TOPDIR:-/gfapi-test}
	echo $PGFAPI_TOPDIR
	echo "The files will w/r in $PGFAPI_MOUNTPOINT$PGFAPI_TOPDIR"

	read -p "append to file(1: don't create): [default: 0]" \
	PGFAPI_APPEND
	PGFAPI_APPEND=${PGFAPI_APPEND:-0}
	echo $PGFAPI_APPEND

	read -p "overwrite existing file(1: overwrite don't create): [default: 0]" \
	PGFAPI_OVERWRITE
	PGFAPI_OVERWRITE=${PGFAPI_OVERWRITE:-0}
	echo $PGFAPI_OVERWRITE

	read -p "excute times: [default: 1]" \
	EXCUTE_TIMES
	EXCUTE_TIMES=${EXCUTE_TIMES:-1}
	echo $EXCUTE_TIMES
fi

for i in `seq 1 $EXCUTE_TIMES`;
do
	bash ./parallel_gfapi_test.sh
done  




