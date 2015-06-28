A = LOAD ‘/Users/weiweisu/Desktop/ratings.dat’ using PigStorage(';')  AS (userID,movieID,rating,timestamp);
B = GROUP A BY movieID;
C = FOREACH B GENERATE $0 AS movieID, AVG(A.rating) AS avg;
D = ORDER C BY avg DESC;
E = LIMIT D 25;
DUMP E;