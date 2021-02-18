how to use
```
#Note this list of hosts should not inculde two hosts that have same shared mount as will count data twice. Paths passed in should be to location of daily partitions
for i in <list_of_hosts> ; do sh dbSummary.sh ecunnin $i '\"/path/to/hdb/*/*/db/ /path/to/other/*/*/dbs/\"' ; done

#Note for now this only looks at gzipped log files anestimates guessed on seen compression 
for i in <lis_of_hosts> ; do sh tpSummary.sh ecunnin $i "/path/to/log/archive/" ; done

#above files write to data/ now read in and provide stats 
q summary.q

#example output
Daily Average size across all servers is: 98.3499 GB
Monthly Average size across all servers is: 1615.748 GB
The peak daily size is: 205.9168 GB
Daily average uncompressed data from tplogs across all servers is: 163.2765 GB
Monthly average uncompressed data from tplogs across all servers is: 2523.365 GB


#to get server info cpus and ram
listofallhosts="host 1 host2 host3"
for i in $listofallhosts ; do echo $i ; ssh -o BatchMode=yes -q p_tic@$i "lscpu | grep '^CPU(s):' ; free -h | grep  Mem " ; done


