/*
Problem 1.5
Find the names of all the subscribers who subscribe to at least three services.
*/

SELECT subscribers.name
FROM subscribers JOIN service_subscribers ON subscribers.portid = service_subscribers.portid
GROUP BY subscribers.name
HAVING COUNT(service_subscribers.service) >= 3;


/*
Test Output:
Chris Pronger
Frank Thomas
Homer Simpson
Joe Carter
Matt Stajan
Michael Jordan
Steve Sampras
Vince Carter

*/