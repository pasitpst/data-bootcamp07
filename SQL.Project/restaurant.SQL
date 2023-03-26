-- resturant database
-- 5 tables
-- write 3-5 queries
-- 1x with
-- 1x SUBQUERY
-- 1X Aggregate Function

.open restaurant.db

DROP TABLE type;
DROP TABLE menu;
DROP TABLE beverage;
DROP TABLE customer;
DROP TABLE invoice;

-- Create Table 1
CREATE TABLE IF NOT EXISTS type (
  type_id INT UNIQUE,
  type_food TEXT
);

INSERT INTO type VALUES 
  (001,'Stake'),
  (002,'Pasta'),
  (003,'Salad'),
  (004,'Soup'),
  (005,'Appetizer'),
  (006,'Beverage')
;

-- Create Table 2
CREATE TABLE IF NOT EXISTS menu (
    menu_id INT,
    menu_name TEXT,
    price REAL ,
    type_id INT 
);

INSERT INTO menu VALUES 
  (201, 'Porkshop', 129, 001),
  (202, 'Carbonara', 99, 002),
  (203, 'Caesar salad', 79, 003),
  (204, 'Corn soup', 59, 004),
  (205, 'French fries', 49, 005)
  ;

-- Create Table 3
CREATE TABLE IF NOT EXISTS beverage (
    bev_id INT,
    bev_name TEXT,
    price REAL,
    type_id INT 
  );

INSERT INTO beverage VALUES 
  (301, 'Water', 10, 006),
  (302, 'Coke', 20, 006) ,
  (303, 'Beer', 70, 006),
  (304, 'Whisky', 400, 006),
  (305, 'Wine',800,006)
  ;

-- Create Table 4
CREATE TABLE IF NOT EXISTS customer (
  cus_id INT,
  firstname TEXT,
  lastname TEXT
);

INSERT INTO customer VALUES 
  (401,'Mario','Kebhed'),
  (402,'Pasit','Chai'),
  (403,'Malong','Sija'),
  (404, 'Kin','Kung'),
  (405, 'Jojoe', 'Jubjub')
;  

-- Create Table 5
CREATE TABLE IF NOT EXISTS invoice(
  order_id INT,
  cus_name TEXT,
  menu_id INT,
  bev_id INT 
);

INSERT INTO invoice values
  (501,'Mario', 203,303),
  (502,'Pasit',202, 304 ),
  (503, 'Malong', 204,301),
  (504, 'Kin', 205, 302),
  (505, 'Jojoe', 201, 305)
  ;

.mode column
.header on

-- inner join & Group by & Order by 
SELECT 
  beverage.bev_id,
  beverage.bev_name,
  invoice.cus_name,
  beverage.price
FROM beverage
JOIN invoice ON beverage.bev_id = invoice.bev_id
GROUP BY beverage.bev_name
ORDER BY price desc;

-- Aggregate function
/*SELECT
  menu.menu_name,
  COUNT(*),
  AVG(menu.price) avg,
  SUM(menu.price) sum,
  MIN(menu.price) min,
  MAX(menu.price) max 
FROM menu
  GROUP BY menu.menu_name ;*/

-- SUB QUERIES --
 /* SELECT * From(
  SELECT 
  invoice.order_id ,
  invoice.cus_name,
  invoice.bev_id ,
  beverage.bev_name,
  beverage.price  
FROM invoice
JOIN beverage ON invoice.bev_id = beverage.bev_id
)
WHERE bev_name IN('Coke','Beer');*/

-- WITH --
  /*WITH sub AS(  
  SELECT
  invoice.order_id ,
  invoice.cus_name,
  beverage.bev_name,
  beverage.price AS bev_price,
  menu.menu_name,
  menu.price AS menu_price
FROM invoice
JOIN beverage ON invoice.bev_id = beverage.bev_id
JOIN menu ON invoice.menu_id = menu.menu_id
  )

SELECT 
  order_id,
  cus_name,
  bev_name,
  menu_name,
  (bev_price+menu_price) AS total_bill
FROM sub */
