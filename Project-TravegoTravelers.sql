-- Task-1
use travego;
CREATE TABLE passenger (
    passenger_id INT PRIMARY KEY,
    passenger_name VARCHAR(50),
    category VARCHAR(20),
    gender VARCHAR(10),
    boarding_city VARCHAR(50),
    destination_city VARCHAR(50),
    distance INT, 
    bus_type VARCHAR(20)
    );
    CREATE INDEX idx_distance ON passenger (distance);
    CREATE TABLE price (
    id INT PRIMARY KEY,
    bus_type VARCHAR(20),
    distance INT,
    price INT,
	FOREIGN KEY (distance) REFERENCES passenger(distance)
);
drop table passenger;
INSERT INTO passenger (passenger_id, passenger_name, category, gender, boarding_city, destination_city, distance, bus_type)
VALUES
    (1, 'Sejal', 'AC', 'Female', 'Bengaluru', 'Chennai', 350, 'Sleeper'),
    (2, 'Anmol', 'Non-AC', 'Male', 'Mumbai', 'Hyderabad', 700, 'Sitting'),
    (3, 'Pallavi', 'AC', 'Female', 'Panaji', 'Bengaluru', 600, 'Sleeper'),
    (4, 'Khusboo', 'AC', 'Female', 'Chennai', 'Mumbai', 1500, 'Sleeper'),
    (5, 'Udit', 'Non-AC', 'Male', 'Trivandrum', 'Panaji', 1000, 'Sleeper'),
    (6, 'Ankur', 'AC', 'Male', 'Nagpur', 'Hyderabad', 500, 'Sitting'),
    (7, 'Hemant', 'Non-AC', 'Male', 'Panaji', 'Mumbai', 700, 'Sleeper'),
    (8, 'Manish', 'Non-AC', 'Male', 'Hyderabad', 'Bengaluru', 500, 'Sitting'),
    (9, 'Piyush', 'AC', 'Male', 'Pune', 'Nagpur', 700, 'Sitting');
    
    INSERT ignore INTO price (id, bus_type, distance, price)
VALUES
    (1, 'Sleeper', 350, 770),
    (2, 'Sleeper', 500, 1100),
    (3, 'Sleeper', 600, 1320),
    (4, 'Sleeper', 700, 1540),
    (5, 'Sleeper', 1000, 2200),
    (6, 'Sleeper', 1200, 2640),
    (7, 'Sleeper', 1500, 2700),
    (8, 'Sitting', 500, 620),
    (9, 'Sitting', 600, 744),
    (10, 'Sitting', 700, 868),
    (11, 'Sitting', 1000, 1240),
    (12, 'Sitting', 1200, 1488),
    (13, 'Sitting', 1500, 1860);
    select * from price;
	select * from passenger;

  --  Task-2
    -- a. How many female passengers traveled a minimum distance of 600 KMs? 
select *  from passenger where gender = 'Female'and distance >599;
select count(gender)  from passenger where gender = 'Female'and distance >599;

    -- b. Write a query to display the passenger details whose travel distance is greater than 500 and who are traveling in a sleeper bus. 
select * from passenger where distance > 500 and bus_type = 'sleeper';
    -- c. Select passenger names whose names start with the character 'S'. 
select passenger_name from passenger where passenger_name like 'S%';    
   --  d. Calculate the price charged for each passenger, displaying the Passenger name, Boarding City, Destination City, Bus type, and Price in the output. 
select p.passenger_name,p.boarding_city,p.destination_city,p.bus_type,pr.price from passenger p join price pr on p.distance = pr.distance;
  --  e. What are the passenger name(s) and the ticket price for those who traveled 1000 KMs sitting in a bus? 
select p.passenger_name,p.bus_type,pr.price from passenger p join price pr on p.distance = pr.distance  where p.distance = 1000 and p.bus_type ='Sitting';  
 
 -- f. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?  
 select * from passenger p join price pr on p.distance = pr.distance where passenger_name like 'Pa%';

   --  g. Alter the column category with the value "Non-AC" where the Bus_Type is sleeper 
 update passenger set category = 'NON AC' where bus_type = 'Sleeper';
 select * from passenger;
   --  h. Delete an entry from the table where the passenger name is Piyush and commit this change in the database. 
   -- Adjusting the foreign key constraint to cascade on delete


 delete from passenger
 where passenger_name = 'Piyush';
 
DELETE FROM passenger WHERE passenger_name = 'Piyush';
 select * from passenger where passenger_name ='Piyush';

   --  i. Truncate the table passenger and comment on the number of rows in the table (explain if required).
   -- Save the current number of rows in a variable (optional)
SELECT COUNT(*) AS current_row_count FROM passenger;

-- Truncate the passenger table
TRUNCATE TABLE passenger;

-- Provide a comment on the number of rows after truncation
SELECT 'Table passenger truncated. Number of rows before truncation: ' AS comment,
       current_row_count AS rows_before_truncation
FROM (SELECT COUNT(*) AS current_row_count FROM passenger) AS row_count;
   --  j. Delete the table passenger from the database. 
   drop table passenger;
   
   set sql_safe_updates = 0;