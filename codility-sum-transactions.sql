/*
 Write a query to get the sum or deposits and withdrawals for each user. This should be grouped by and ordered by name.
 If a user has no deposits or withdrawals, then the sum should be 0.

 Example:

     Table: transfers
        name    | money
        --------+------------------
        Charlie |  1000
        Charlie |  -100
        Alice   |  -1000
        Bob     |  200
        Alice   |  100
        Bob     |  -50
        David   |  550
        
     Expected Solution Output:
        name   | sum_of_deposits  |  sum_of_withdrawals
        -------+------------------+--------------------
        Alice  |  100             |  1000
        Bob    |  200             |  50
        Charlie|  1000            |  100
        David  |  550             |  0

*/

/* SQL Model for transfers Table */
CREATE TABLE transfers (
    name varchar(255),
    money int
);

/* SQL to seed the sample ino the transfers Table */
INSERT INTO transfers (name, money) VALUES ('Charlie', 1000), ('Charlie', -100), ('Alice', -1000), ('Bob', 200), ('Alice', 100), ('Bob', -50), ('David', 550);



/* Solution for PostgreSQL */
SELECT name,
        coalesce(sum(money) filter (where money > 0), 0) as sum_of_deposits,
        coalesce(sum(- money) filter (where money < 0),0) as sum_of_withdrawals
FROM transfers
GROUP BY name
ORDER BY name;

/* Solution for MySQL */
SELECT name,
        coalesce(sum(if(money > 0, money, 0)), 0) as sum_of_deposits,
        coalesce(sum(if(money < 0, - money, 0)),0) as sum_of_withdrawals
FROM transfers
GROUP BY name
ORDER BY name;

/* Solution for SQlite */
SELECT name,
        coalesce(sum(case when money > 0 then money else 0 end), 0) as sum_of_deposits,
        coalesce(sum(case when money < 0 then - money else 0 end),0) as sum_of_withdrawals
FROM transfers
GROUP BY name
ORDER BY name;