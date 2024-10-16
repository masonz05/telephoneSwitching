/*
Problem 1.6
Produce a table that lists the most popular service (or services). That is, give the name of the service that has the most subscribers.
*/


SELECT services.service, COUNT(service_subscribers.portid) 
FROM services JOIN service_subscribers ON services.scode = service_subscribers.service
GROUP BY services.service
HAVING COUNT(service_subscribers.portid) = (
    SELECT MAX(service_count)
    FROM (
        SELECT COUNT(portid) AS service_count
        FROM service_subscribers
        GROUP BY service
    )
);


/*
Test Output:
Message Answer|25
*/