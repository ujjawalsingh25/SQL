
tablename - person

col1	col2	col3	col4
 a		 b		  c		  d	
 a		 c		  d		  b
 b		 d		  c		  a
 c		 b		  d		  c

 SELECT
    SUM(CASE WHEN col1 = 'a' THEN 1 ELSE 0 END) AS a_count,
    SUM(CASE WHEN col2 = 'b' THEN 1 ELSE 0 END) AS b_count,
    SUM(CASE WHEN col3 = 'c' THEN 1 ELSE 0 END) AS c_count,
    SUM(CASE WHEN col4 = 'd' THEN 1 ELSE 0 END) AS d_count
FROM person;

SELECT
    SUM(CASE WHEN col1 = 'a' THEN 1 ELSE 0 END
        + CASE WHEN col2 = 'a' THEN 1 ELSE 0 END
        + CASE WHEN col3 = 'a' THEN 1 ELSE 0 END
        + CASE WHEN col4 = 'a' THEN 1 ELSE 0 END) AS a_count,
    
    SUM(CASE WHEN col1 = 'b' THEN 1 ELSE 0 END
        + CASE WHEN col2 = 'b' THEN 1 ELSE 0 END
        + CASE WHEN col3 = 'b' THEN 1 ELSE 0 END
        + CASE WHEN col4 = 'b' THEN 1 ELSE 0 END) AS b_count,
    
    SUM(CASE WHEN col1 = 'c' THEN 1 ELSE 0 END
        + CASE WHEN col2 = 'c' THEN 1 ELSE 0 END
        + CASE WHEN col3 = 'c' THEN 1 ELSE 0 END
        + CASE WHEN col4 = 'c' THEN 1 ELSE 0 END) AS c_count,
    
    SUM(CASE WHEN col1 = 'd' THEN 1 ELSE 0 END
        + CASE WHEN col2 = 'd' THEN 1 ELSE 0 END
        + CASE WHEN col3 = 'd' THEN 1 ELSE 0 END
        + CASE WHEN col4 = 'd' THEN 1 ELSE 0 END) AS d_count
FROM person;

