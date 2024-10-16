/*
Problem 1.3
List the names of all the subscribers who are originators of a call to someone who is also a subscriber on the same switch (i.e. a line to line call)
*/

SELECT subscribers.name 
FROM calls JOIN subscribers ON calls.orig = subscribers.portid
WHERE calls.term IN (SELECT portid FROM lines)

/*
Test Output:
Mats Sundin
Jason Allison
Homer Simpson
Michael Jordan
Ed Belfour
*/