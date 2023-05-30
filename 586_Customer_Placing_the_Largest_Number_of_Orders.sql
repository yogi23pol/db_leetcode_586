# NOTE :- In this context, it's important to note that the table names used in the examples include underscores and numbers, 
# which differ from the naming conventions used in the LeetCode problem.

Create table If Not Exists Orders_10 
(
order_number int, 
customer_number int
);

Truncate table Orders_10;

insert into Orders_10 (order_number, customer_number) values ('1', '1');
insert into Orders_10 (order_number, customer_number) values ('2', '2');
insert into Orders_10 (order_number, customer_number) values ('3', '3');
insert into Orders_10 (order_number, customer_number) values ('4', '3');

/*
Write an SQL query to find the customer_number for the customer who has placed the largest number of orders.
The test cases are generated so that exactly one customer will have placed more orders than any other customer.
The query result format is in the following example.

Example 1:

Input: 
Orders table:
+--------------+-----------------+
| order_number | customer_number |
+--------------+-----------------+
| 1            | 1               |
| 2            | 2               |
| 3            | 3               |
| 4            | 3               |
+--------------+-----------------+
Output: 
+-----------------+
| customer_number |
+-----------------+
| 3               |
+-----------------+
Explanation: 
The customer with number 3 has two orders, which is greater than either customer 1 or 2 because each of them only has one order. 
So the result is customer_number 3.
*/

SELECT * FROM Orders_10;

# TYPE 1 :- 
SELECT customer_number
FROM Orders_10
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC
LIMIT 1;

# TYPE 2 :- 
WITH temp AS
(SELECT customer_number, COUNT(order_number) AS OrderNum
FROM Orders_10
GROUP BY customer_number)

SELECT customer_number
FROM temp 
WHERE OrderNum = (SELECT MAX(OrderNum) FROM temp);
