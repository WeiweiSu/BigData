AA = LOAD '/Users/weiweisu/Desktop/users.dat' using PigStorage(':')  AS (userID, dump1, gender, dump2, age, dump3, occupation, dump4, zip);
A = FOREACH AA GENERATE $0, $2, $4, $6, $8;
B =GROUP A BY gender;
C =FOREACH B GENERATE $0 AS gender, COUNT(A) as count;
DUMP C; 