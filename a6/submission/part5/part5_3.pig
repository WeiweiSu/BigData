AA = LOAD '/Users/weiweisu/Desktop/ratings.dat' using PigStorage(':')  AS (userID,dump1,movieID,dump2,rating,dump3,timestamp);
A = FOREACH AA GENERATE $0, $2, $4, $6;
B = GROUP A BY userID;  
C = FOREACH B GENERATE $0 AS userID, COUNT(A) as count;
D = LIMIT C 10;
DUMP D; 