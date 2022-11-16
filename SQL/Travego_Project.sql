create database travego;
use travego;


/* Showing results for 1.xlsx */

/* CREATE TABLE */
CREATE TABLE passenger(
Passenger_id DOUBLE,
Passenger_name__ VARCHAR(100),
Category VARCHAR(100),
Gender_ VARCHAR(100),
Boarding_City_ VARCHAR(100),
Destination_City__ VARCHAR(100),
Distance__ DOUBLE,
Bus_Type VARCHAR(100)
);

/* INSERT QUERY NO: 1 */
INSERT INTO passenger(Passenger_id, Passenger_name__, Category, Gender_, Boarding_City_, Destination_City__, Distance__, Bus_Type)
VALUES
(
1, 'Sejal', 'AC', 'F ', 'Bengaluru', 'Chennai', 350, 'Sleeper'
);

/* INSERT QUERY NO: 2 */
INSERT INTO passenger(Passenger_id, Passenger_name__, Category, Gender_, Boarding_City_, Destination_City__, Distance__, Bus_Type)
VALUES
(
2, 'Anmol', 'Non-AC', 'M', 'Mumbai ', 'Hyderabad', 700, 'Sitting'
);

/* INSERT QUERY NO: 3 */
INSERT INTO passenger(Passenger_id, Passenger_name__, Category, Gender_, Boarding_City_, Destination_City__, Distance__, Bus_Type)
VALUES
(
3, 'Pallavi', 'AC', 'F', 'Panaji                  ', 'Bengaluru', 600, 'Sleeper'
);

/* INSERT QUERY NO: 4 */
INSERT INTO passenger(Passenger_id, Passenger_name__, Category, Gender_, Boarding_City_, Destination_City__, Distance__, Bus_Type)
VALUES
(
4, 'Khusboo ', 'AC', 'F', 'Chennai', 'Mumbai', 1500, 'Sleeper'
);

/* INSERT QUERY NO: 5 */
INSERT INTO passenger(Passenger_id, Passenger_name__, Category, Gender_, Boarding_City_, Destination_City__, Distance__, Bus_Type)
VALUES
(
5, 'Udit', 'Non-AC ', 'M', 'Trivandrum', 'Panaji', 1000, 'Sleeper'
);

/* INSERT QUERY NO: 6 */
INSERT INTO passenger(Passenger_id, Passenger_name__, Category, Gender_, Boarding_City_, Destination_City__, Distance__, Bus_Type)
VALUES
(
6, 'Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500, 'Sitting'
);

/* INSERT QUERY NO: 7 */
INSERT INTO passenger(Passenger_id, Passenger_name__, Category, Gender_, Boarding_City_, Destination_City__, Distance__, Bus_Type)
VALUES
(
7, 'Hemant', 'Non-AC', 'M', 'Panaji', 'Mumbai ', 700, 'Sleeper'
);

/* INSERT QUERY NO: 8 */
INSERT INTO passenger(Passenger_id, Passenger_name__, Category, Gender_, Boarding_City_, Destination_City__, Distance__, Bus_Type)
VALUES
(
8, 'Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500, 'Sitting'
);

/* INSERT QUERY NO: 9 */
INSERT INTO passenger(Passenger_id, Passenger_name__, Category, Gender_, Boarding_City_, Destination_City__, Distance__, Bus_Type)
VALUES	
(
9, 'Piyush', 'AC', 'M', 'Pune', 'Nagpur', 700, 'Sitting'
);

/* Showing results for 2.xlsx */

/* CREATE TABLE */
CREATE TABLE price(
id DOUBLE,
Bus_type___ VARCHAR(100),
Distance DOUBLE,
Price DOUBLE
);

/* INSERT QUERY NO: 1 */
INSERT INTO price(id, Bus_type___, Distance, Price)
VALUES
(
1, 'Sleeper', 350, 770
);

/* INSERT QUERY NO: 2 */
INSERT INTO price(id, Bus_type___, Distance, Price)
VALUES
(
2, 'Sleeper', 500, 1100
);

/* INSERT QUERY NO: 3 */
INSERT INTO price(id, Bus_type___, Distance, Price)
VALUES
(
3, 'Sleeper', 600, 1320
);

/* INSERT QUERY NO: 4 */
INSERT INTO price(id, Bus_type___, Distance, Price)
VALUES
(
4, 'Sleeper', 700, 1540
);

/* INSERT QUERY NO: 5 */
INSERT INTO price(id, Bus_type___, Distance, Price)
VALUES
(
5, 'Sleeper', 1000, 2200
);

/* INSERT QUERY NO: 6 */
INSERT INTO price(id, Bus_type___, Distance, Price)
VALUES
(
6, 'Sleeper', 1200, 2640
);

/* INSERT QUERY NO: 7 */
INSERT INTO price(id, Bus_type___, Distance, Price)
VALUES
(
7, 'Sleeper', 1500, 2700
);

/* INSERT QUERY NO: 8 */
INSERT INTO price(id, Bus_type___, Distance, Price)
VALUES
(
8, 'Sitting', 500, 620
);

/* INSERT QUERY NO: 9 */
INSERT INTO price(id, Bus_type___, Distance, Price)
VALUES
(
9, 'Sitting', 600, 744
);

/* INSERT QUERY NO: 10 */
INSERT INTO price(id, Bus_type___, Distance, Price)
VALUES
(
10, 'Sitting', 700, 868
);

/* INSERT QUERY NO: 11 */
INSERT INTO price(id, Bus_type___, Distance, Price)
VALUES
(
11, 'Sitting', 1000, 1240
);

/* INSERT QUERY NO: 12 */
INSERT INTO price(id, Bus_type___, Distance, Price)
VALUES
(
12, 'Sitting', 1200, 1488
);

/* INSERT QUERY NO: 13 */
INSERT INTO price(id, Bus_type___, Distance, Price)
VALUES
(
13, 'Sitting', 1500, 1860
);

select * from passenger;
select * from price;


#2. a.	How many females and how many male passengers traveled a minimum distance of 600 KMs?

select Gender_, Distance___
from passenger
where Distance___ >= 600;


#2. b.	Find the minimum ticket price of a Sleeper Bus. 


select Bus_type___, min(Price)
from price 
where Bus_type___ in("sleeper"); 



#2. c.	Select passenger names whose names start with character 'S'


select Passenger_name__ from passenger
where Passenger_name__ like ('s%');



#2. d.	Calculate price charged for each passenger displaying Passenger name, Boarding City,
# Destination City, Bus_Type, Price in the output


select distinct a.Passenger_name__, a.Boarding_City_, a.Destination_City___,
a.Distance___, a.Bus_Type, b.price
from passenger a
inner join
price b
on a.Bus_Type = b.Bus_type___;

#2. e. What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?  


select a.Passenger_name__, a.Distance___, a.Bus_Type, b.price
from passenger a
inner join
price b
on a.Bus_Type = b.Bus_type___
where a.Passenger_name__ like ('%s') 
and a.Distance___ >= 1000
and a.Bus_Type in ("sitting");


#2. f.	What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?

select a.Passenger_name__, a.Bus_Type, a.Destination_City__ as Boarding_City, a.Boarding_City_ , a.Distance___, b.price, b.distance
from passenger a
join
price b

on a.Distance___ = b.distance
where a.Passenger_name__ = 'pallavi';



#2. g. 	List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order. 
select Distance__ as 'distinct distances' from passenger order by Distance__ desc;



#2. h.	Display the passenger name and percentage of distance traveled by that passenger
# from the total distance traveled by all passengers without using user variables.


select Passenger_name__, Distance__ as 'distance_travelled',
Distance__* 100/(select sum(Distance__) from passenger) as '% of distance_travelled from total distance'
from passenger;