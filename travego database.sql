CREATE DATABASE travego;
USE travego;
drop table price;
CREATE TABLE passenger (
    passenger_id INT PRIMARY KEY,
    passenger_name VARCHAR(20),
    category VARCHAR(20),
    gender VARCHAR(20),
    boarding_city VARCHAR(20),
    destination_city VARCHAR(20),
    distance INT,  -- Distance should not be a primary key in this context
    bus_type VARCHAR(20)
);
CREATE INDEX idx_distance ON passenger (distance);
CREATE TABLE price (
    id INT PRIMARY KEY,  -- Assuming 'id' is the primary key for the 'price' table
    bus_type VARCHAR(20),
    distance INT,
    price INT,
    FOREIGN KEY (distance) REFERENCES passenger(distance)
);
select * from passenger;

INSERT INTO passenger (passenger_id, passenger_name, category, gender, boarding_city, destination_city, distance, bus_type)
VALUES
    (1, 'Sejal', 'ACF', 'Female', 'Bengaluru', 'Chennai', 350, 'Sleeper'),
    (2, 'Anmol', 'Non-AC', 'Male', 'Mumbai', 'Hyderabad', 700, 'Sitting'),
    (3, 'Pallavi', 'ACF', 'Female', 'Panaji', 'Bengaluru', 600, 'Sleeper'),
    (4, 'Khusboo', 'ACF', 'Female', 'Chennai', 'Mumbai', 1500, 'Sleeper'),
    (5, 'Udit', 'Non-AC', 'Male', 'Trivandrum', 'Panaji', 1000, 'Sleeper'),
    (6, 'Ankur', 'ACM', 'Male', 'Nagpur', 'Hyderabad', 500, 'Sitting'),
    (7, 'Hemant', 'Non-AC', 'Male', 'Panaji', 'Mumbai', 700, 'Sleeper'),
    (8, 'Manish', 'Non-AC', 'Male', 'Hyderabad', 'Bengaluru', 500, 'Sitting'),
    (9, 'Piyush', 'ACM', 'Male', 'Pune', 'Nagpur', 700, 'Sitting');
    
    insert into price (id, bus_type, distance, price)
    values (1,'Sleeper', 350, 770),
    (2,'Sleeper', 500, 1100),
    (3,'Sleeper', 600, 1320),
    (4,'Sleeper', 700, 1540),
    (5,'Sleeper', 1000, 2200),
    (6,'Sleeper', 1200, 2640),
    (7,'Sleeper', 1500, 2700),
    (8,'Sitting', 500, 620),
    (9,'Sitting', 600, 744),
    (10,'Sitting', 700, 868),
    (11,'Sitting', 1000, 1240),
    (12,'Sitting', 1200, 1488),
    (13,'Sitting', 1500, 1860);
    
    select * from price;