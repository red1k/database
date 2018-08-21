1.
CREATE TRIGGER trigger_1
ON highschooler
after INSERT
AS
  BEGIN
	INSERT INTO likes
	WHERE highschooler.name = "Friendly"...
  END;

2.
CREATE TRIGGER trigger_2a 
ON highschooler 
after INSERT 
AS 
  BEGIN 
      UPDATE highschooler 
      SET    grade = NULL 
      WHERE  grade > 12 
              OR grade < 9 
  END; 

CREATE TRIGGER trigger_2b 
ON highschooler 
after INSERT 
AS 
  BEGIN 
      UPDATE highschooler 
      SET    grade = 9 
      WHERE  grade = NULL  
  END; 

3.
CREATE TRIGGER trigger_3 
ON highschooler 
after UPDATE 
AS 
  BEGIN 
      INSERT INTO highschooler_history 
      SELECT id, 
             name
      FROM   highschooler 
      WHERE  grade > 12 
  END; 

4.
CREATE TRIGGER trigger_4 
ON friend 
after DELETE 
AS 
  BEGIN 
      DELETE FROM friend 
      WHERE  id1 = (SELECT id2 
                    FROM deleted) 
             AND id2 = (SELECT id1 
                        FROM deleted) 
  END; 
