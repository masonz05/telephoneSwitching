/*
Problem 1.10
Do the same as question 1.7 but this time only include trunks that have at least one 'IDLE' channel. That is, write an SQL query that will produce in one table a list of all the acceptable trunks that can be used to route a call to the 416 area code, office code 334 have at least one idle channel. This query should list the trunks in the order of preference.
*/


SELECT subscribers.name
FROM subscribers 
WHERE NOT EXISTS (
    SELECT service_subscribers.service
    FROM service_subscribers 
    WHERE service_subscribers .portid = 2  
    AND service_subscribers.service NOT IN (
        SELECT service_subscribers.service
        FROM service_subscribers 
        WHERE service_subscribers.portid = subscribers.portid
    )
);
/*
Test Output:
Jason Allison
Michael Jordan
Joe Carter
Homer Simpson
Matt Stajan
*/