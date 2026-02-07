CREATE TABLE features 
LIKE `features data set`;
INSERT features
SELECT * FROM `features data set`;

SELECT * FROM FEATURES;

SELECT * FROM features
WHERE MarkDown1 ='NA' AND 
MarkDown2 ='NA' AND
MarkDown3 ='NA' AND 
MarkDown4 ='NA'AND
MarkDown5='NA';

DELETE from features
WHERE MarkDown1 ='NA' AND 
MarkDown2 ='NA' AND
MarkDown3 ='NA' AND 
MarkDown4 ='NA'AND
MarkDown5='NA';

SELECT * FROM features
WHERE MarkDown1 ='NA' OR 
MarkDown2 ='NA' OR
MarkDown3 ='NA' OR 
MarkDown4 ='NA'OR
MarkDown5='NA';

UPDATE features
SET MarkDown1=NULLIF(MarkDown1,'NA'),
    MarkDown2=NULLIF(MarkDown2,'NA'),
    MarkDown3=NULLIF(MarkDown3,'NA'),
    MarkDown4=NULLIF(MarkDown4,'NA'),
    MarkDown5=NULLIF(MarkDown5,'NA');
    
ALTER TABLE features
MODIFY MarkDown1 DOUBLE,
MODIFY MarkDown2 DOUBLE,
MODIFY MarkDown3 DOUBLE,
MODIFY MarkDown4 DOUBLE,
MODIFY MarkDown5 DOUBLE;

SELECT
  COUNT(*) AS total_rows,
  SUM(MarkDown1 IS NULL) AS md1_nulls,
  SUM(MarkDown2 IS NULL) AS md2_nulls
FROM features;

SELECT * FROM features;

SELECT `Date` FROM features
WHERE `Date` LIKE '%/%/%';
SELECT `Date` FROM features
WHERE CAST(SUBSTRING_INDEX(`Date`,'/',1) AS UNSIGNED )>12;
UPDATE features
SET `Date`=STR_TO_DATE(`Date`,'%d/%m/%Y')
WHERE CAST(SUBSTRING_INDEX(`Date`,'/',1) AS UNSIGNED)>12;
UPDATE features
SET `Date`=STR_TO_DATE(`Date`,'%d/%m/%Y')
WHERE `Date` LIKE '%/%/%';
ALTER TABLE features
MODIFY `Date` DATE;

SELECT DISTINCT(Store)
FROM features;


-- sales table
CREATE TABLE sales
LIKE `sales data-set`;
INSERT sales
SELECT * FROM `sales data-set`;

SELECT * FROM sales;

UPDATE sales
SET `Date`=STR_TO_DATE(`Date`,'%d/%m/%Y')
WHERE CAST(SUBSTRING_INDEX(`Date`,'/',1) AS UNSIGNED)>12;
UPDATE sales
SET `Date`=STR_TO_DATE(`Date`,'%d/%m/%Y')
WHERE `Date` LIKE '%/%/%';
ALTER TABLE sales
MODIFY `Date` date;

-- TABLE 3 Stores
CREATE TABLE Stores
LIKE `stores data-set`;
INSERT Stores
SELECT * FROM `stores data-set`;

SELECT * FROM Stores;