#!/bin/bash

if [ "$1" = resetvalue ]; then
	echo "do reset all value"
	read -p "volume name: [default: rep3]" GFAPI_VOLNAME
	export GFAPI_VOLNAME=${GFAPI_VOLNAME:-rep3}
	echo $GFAPI_VOLNAME >> paralle_tool.config

	read -p "host name: [default: localhost]" GFAPI_HOSTNAME
	export GFAPI_HOSTNAME=${GFAPI_HOSTNAME:-localhost}
	echo $GFAPI_HOSTNAME >> paralle_tool.config

	read -p "workload: [default: seq-wr]" PGFAPI_LOAD
	export PGFAPI_LOAD=${PGFAPI_LOAD:-seq-wr}
	echo $PGFAPI_LOAD >> paralle_tool.config

	read -p "record size(IO size) KB: [default: 64]" \
	PGFAPI_RECORDSIZE
	export PGFAPI_RECORDSIZE=${PGFAPI_RECORDSIZE:-64}
	echo $PGFAPI_RECORDSIZE >> paralle_tool.config

	read -p "file size KB: [default: 4]" PGFAPI_FILESIZE
	export PGFAPI_FILESIZE=${PGFAPI_FILESIZE:-4}
	echo $PGFAPI_FILESIZE >> paralle_tool.config

	read -p "number of files per thread: [default: 10]" \
	PGFAPI_FILES
	export PGFAPI_FILES=${PGFAPI_FILES:-10}
	echo $PGFAPI_FILES >> paralle_tool.config

	read -p "number of thread per process: [default: 1]" \
	PGFAPI_THREADS_PER_PROC
	export PGFAPI_THREADS_PER_PROC=${PGFAPI_THREADS_PER_PROC:-1}
	echo $PGFAPI_THREADS_PER_PROC >> paralle_tool.config

	read -p "number of process per client: [default: 16]" \
	PGFAPI_PROCESSES
	export PGFAPI_PROCESSES=${PGFAPI_PROCESSES:-16}
	echo $PGFAPI_PROCESSES >> paralle_tool.config
	$TOTAL_FILES=$PGFAPI_FILES*$PGFAPI_THREADS_PER_PROC*\
	$PGFAPI_PROCESSES
	echo "Total w/r number of files: $TOTAL_FILES"

	read -p "use O_DIRECT at open time: [default: 0]" \
	PGFAPI_DIRECT
	export PGFAPI_DIRECT=${PGFAPI_DIRECT:-0}
	echo $PGFAPI_DIRECT >> paralle_tool.config

	read -p "volume mount point path: [default: /volume/rep3/]" \
	PGFAPI_MOUNTPOINT
	export PGFAPI_MOUNTPOINT=${PGFAPI_MOUNTPOINT:-/volume/rep3/}
	echo $PGFAPI_MOUNTPOINT >> paralle_tool.config

	read -p "r/w directory path within the volume mount point: [default: /gfapi-test]" \
	PGFAPI_TOPDIR
	export PGFAPI_TOPDIR=${PGFAPI_TOPDIR:-/gfapi-test}
	echo $PGFAPI_TOPDIR >> paralle_tool.config
	echo "The files will w/r in $PGFAPI_MOUNTPOINT$PGFAPI_TOPDIR"

	read -p "append to file(1: don't create): [default: 0]" \
	PGFAPI_APPEND
	export PGFAPI_APPEND=${PGFAPI_APPEND:-0}
	echo $PGFAPI_APPEND >> paralle_tool.config

	read -p "overwrite existing file(1: overwrite don't create): [default: 0]" \
	PGFAPI_OVERWRITE
	export PGFAPI_OVERWRITE=${PGFAPI_OVERWRITE:-0}
	echo $PGFAPI_OVERWRITE >> paralle_tool.config

	read -p "excute times: [default: 1]" \
	EXCUTE_TIMES
	EXCUTE_TIMES=${EXCUTE_TIMES:-1}
	echo $EXCUTE_TIMES
	
fi


for i in `seq 1 $EXCUTE_TIMES`;
do
	PGFAPI_FILES=$PGFAPI_FILES bash ./parallel_gfapi_test.sh
done  




