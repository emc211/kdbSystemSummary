db:flip `du`fp`h`t!("JSSS";" ")0: `:data/dbInfo.txt
db:update hsym fp from db
db:update dt:"D"$string last each ` vs/:fp from db

//sum up across various types of data bases etc
dbByDt:select sum du by dt from db where not null dt,dt>2020.01.01,2<dt mod 7
-1 raze ("Daily Average size across all servers is: ";;" GB") exec string 1e-9*avg du from dbByDt;
-1 raze ("Monthly Average size across all servers is: ";;" GB") exec string 1e-9*avg du from select sum du by dt.month from dbByDt;

//improve by analysising hoe this has increased to project forward
-1 raze ("The peak daily size is: ";;" GB") exec string 1e-9*max du from dbByDt;


tp:`c`uc`fp`h`t xcol ("JJ SSS";enlist" ")0:({ssr[;"  ";" "] each x}/)trim read0 `:data/tpInfo.txt
tp:update dt:"D"$string last each ` vs/:fp from tp;

//Multiplying by 8.5 as compressed figure is too un reliable so 9 is estimation of the compression being acheived. Check and update with zcat /path/to/tplog | wc -l
tpByDt:select c:8.5*sum c by dt from tp where not null dt,dt>2020.01.01,2<dt mod 7;
-1 raze ("Daily average uncompressed data from tplogs across all servers is: ";;" GB") exec string 1e-9*avg c from tpByDt;
-1 raze ("Monthly average uncompressed data from tplogs across all servers is: ";;" GB") exec string 1e-9*avg c from select sum c by dt.month from tpByDt;
