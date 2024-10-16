/*
Problem 1.9
Do the same as question 1.7 but this time only include trunks that have at least one 'IDLE' channel. That is, write an SQL query that will produce in one table a list of all the acceptable trunks that can be used to route a call to the 416 area code, office code 334 have at least one idle channel. This query should list the trunks in the order of preference.
*/


SELECT trunks.portid, trunk_routes.area, trunk_routes.office
FROM trunks JOIN trunk_routes ON trunks.portid = trunk_routes.portid
WHERE (trunk_routes.area = '416' AND trunk_routes.office = '334')
   OR (trunk_routes.area = '416' AND trunk_routes.office = '000')
   OR (trunk_routes.area = '000' AND trunk_routes.office = '000')
AND EXISTS (SELECT 1 FROM channels WHERE state = 'IDLE')
ORDER BY CASE 
        WHEN trunk_routes.area = '416' AND trunk_routes.office = '334' THEN 1
        WHEN trunk_routes.area = '416' AND trunk_routes.office = '000' THEN 2
        WHEN trunk_routes.area = '000' AND trunk_routes.office = '000' THEN 3
    END;

/*
Test Output:
102|416|334
102|416|000
106|416|000
107|000|000
*/