how to use

#Note this list of hosts should not inculde two hosts that have same shared mount as will count data twice. Paths passed in should be to location of daily partitions
for i in <list_of_hosts> ; do sh dbSummary.sh ecunnin $i '\"/path/to/hdb/*/*/db/ /path/to/other/*/*/dbs/\"' ; done

#Note for now this only looks at gzipped log files anestimates guessed on seen compression 
for i in <lis_of_hosts> ; do sh tpSummary.sh ecunnin $i "/path/to/log/archive/" ; done
