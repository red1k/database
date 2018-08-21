1.
SELECT highschooler.NAME, 
       id 
FROM   highschooler 
WHERE  id IN (SELECT id1 
              FROM   friend 
              WHERE  id2 IN (SELECT id 
                             FROM   highschooler 
                             WHERE  highschooler.NAME = 'Gabriel')) 
		

2.
SELECT * 
FROM   highschooler 
       INNER JOIN highschooler AS h 
               ON highschooler.grade - h.grade >= 2 
       INNER JOIN likes 
               ON highschooler.id = likes.id1 
                  AND h.id = likes.id2; 

3.
SELECT h1.name, 
       h1.grade, 
       h2.name, 
       h2.grade 
FROM   likes l1, 
       likes l2, 
       highschooler h1, 
       highschooler h2 
WHERE  l1.id1 = l2.id2 
       AND l2.id1 = l1.id2 
       AND l1.id1 = h1.id 
       AND l1.id2 = h2.id 
ORDER  BY h1.NAME, 
          h2.NAME; 

4.
SELECT highschooler.NAME, 
       grade, 
       id 
FROM   highschooler 
WHERE  highschooler.id NOT IN (SELECT id1 
                               FROM   likes) 
ORDER  BY id ASC

