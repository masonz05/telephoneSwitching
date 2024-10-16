/*
Problem 1.4
Find the names and address of all subscribers who subscribe to all of the available services.
*/


SELECT subscribers.name, subscribers.address
FROM subscribers
WHERE NOT EXISTS (
    SELECT scode
    FROM services
    WHERE scode NOT IN (
        SELECT service
        FROM service_subscribers
        WHERE portid = subscribers.portid
    )
);

/*
Test Output:
[nothing]
*/