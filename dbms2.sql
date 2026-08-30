USE PlayStoreDB;

CREATE TABLE Developers (
    DeveloperID INT PRIMARY KEY,
    DeveloperName VARCHAR(60) NOT NULL,
    Country VARCHAR(30),
    FoundedYear INT
);

CREATE TABLE Publishers (
    PublisherID INT PRIMARY KEY,
    PublisherName VARCHAR(60),
    HeadOffice VARCHAR(40),
    SupportEmail VARCHAR(60)
);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(40),
    MinimumAge INT
);

CREATE TABLE Apps (
    AppID INT PRIMARY KEY,
    AppName VARCHAR(60),
    DeveloperID INT,
    PublisherID INT,
    CategoryID INT,
    Rating DECIMAL(2, 1),
    Downloads BIGINT,
    Price DECIMAL(6, 2)
);

INSERT INTO Developers (DeveloperID, DeveloperName, Country, FoundedYear) VALUES
(101, 'Google LLC', 'USA', 1998),
(102, 'Meta Platforms', 'USA', 2004),
(103, 'Spotify AB', 'Sweden', 2006),
(104, 'Canva Pty Ltd', 'Australia', 2012),
(105, 'BYJU''S', 'India', 2011);

INSERT INTO Publishers (PublisherID, PublisherName, HeadOffice, SupportEmail) VALUES
(201, 'Google Play', 'California', 'support@google.com'),
(202, 'Samsung Galaxy Store', 'Seoul', 'support@samsung.com'),
(203, 'Huawei AppGallery', 'Shenzhen', 'support@huawei.com'),
(204, 'Amazon Appstore', 'Seattle', 'support@amazon.com');

INSERT INTO Categories (CategoryID, CategoryName, MinimumAge) VALUES
(301, 'Education', 3),
(302, 'Productivity', 3),
(303, 'Music', 12),
(304, 'Social', 13),
(305, 'Gaming', 16);

INSERT INTO Apps (AppID, AppName, DeveloperID, PublisherID, CategoryID, Rating, Downloads, Price) VALUES
(1001, 'Google Classroom', 101, 201, 301, 4.6, 500000000, 0.00),
(1002, 'Google Keep', 101, 201, 302, 4.5, 1000000000, 0.00),
(1003, 'Instagram', 102, 201, 304, 4.4, 5000000000, 0.00),
(1004, 'Spotify', 103, 201, 303, 4.5, 1000000000, 0.00),
(1005, 'Canva', 104, 201, 302, 4.7, 500000000, 0.00),
(1006, 'BYJU''S Learning', 105, 201, 301, 4.3, 100000000, 299.00),
(1007, 'Candy Crush', 102, 204, 305, 4.6, 1000000000, 0.00),
(1008, 'Temple Run', 104, 203, 305, 4.2, 500000000, 0.00);

SELECT * FROM Developers;
SELECT * FROM Publishers;
SELECT * FROM Categories;
SELECT * FROM Apps;

DESC Apps;

INSERT INTO Developers (DeveloperID, DeveloperName, Country, FoundedYear) 
VALUES (106, 'OpenAI', 'USA', 2015);

INSERT INTO Categories (CategoryID, CategoryName, MinimumAge) 
VALUES (306, 'Artificial Intelligence', 12);

INSERT INTO Apps (AppID, AppName, DeveloperID, PublisherID, CategoryID, Rating, Downloads, Price) 
VALUES (1009, 'ChatGPT', 106, 201, 306, 4.8, 100000000, 0.00);

UPDATE Apps 
SET Rating = 4.5 
WHERE AppName = 'Temple Run';

DELETE FROM Developers 
WHERE DeveloperID = 105;

UPDATE Publishers 
SET SupportEmail = 'galaxy.support@samsung.com' 
WHERE PublisherName = 'Samsung Galaxy Store';

INSERT INTO Apps (AppID, AppName, DeveloperID, PublisherID, CategoryID, Rating, Downloads, Price) VALUES
(1010, 'WhatsApp', 102, 201, 304, 4.3, 5000000000, 0.00),
(1011, 'Subway Surfers', 104, 201, 305, 4.6, 1000000000, 0.00);

UPDATE Apps 
SET Price = 199.00 
WHERE AppName = 'BYJU''S Learning';

DELETE FROM Categories 
WHERE CategoryName = 'Music';

SELECT * FROM Developers;
SELECT * FROM Publishers;
SELECT * FROM Categories;
SELECT * FROM Apps;

SELECT UPPER(DeveloperName) FROM Developers;
SELECT LOWER(DeveloperName) FROM Developers;
SELECT AppName, LENGTH(AppName) FROM Apps;
SELECT CategoryName, LENGTH(CategoryName) FROM Categories;
SELECT CURRENT_DATE(), CURRENT_TIME();
SELECT AppName, ROUND(Rating, 0) FROM Apps;

SELECT AppName, SUBSTRING(AppName, 1, 5) FROM Apps;
SELECT CONCAT(DeveloperName, ', ', Country) FROM Developers;
SELECT AppName, ROUND(Rating) FROM Apps;
SELECT AppName, CEIL(Price) FROM Apps;
SELECT DeveloperName, FoundedYear FROM Developers;
SELECT AppName, CAST(Downloads AS CHAR) FROM Apps;

SELECT UPPER(AppName), Rating FROM Apps;
SELECT SUBSTRING(CategoryName, 1, 3) FROM Categories;
SELECT AppName, ABS(Price - 200) FROM Apps;
SELECT DeveloperName, LENGTH(DeveloperName) FROM Developers;
SELECT CURRENT_DATE(), CURRENT_TIMESTAMP();
SELECT CAST(Price AS CHAR) FROM Apps;

ALTER TABLE Apps
ADD CONSTRAINT fk_developer
FOREIGN KEY (DeveloperID) REFERENCES Developers(DeveloperID);

ALTER TABLE Apps
ADD CONSTRAINT fk_publisher
FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID);

ALTER TABLE Apps
ADD CONSTRAINT fk_category
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);

SELECT * FROM Apps WHERE Rating > 4.5;
SELECT * FROM Apps WHERE Price = 0;
SELECT * FROM Apps WHERE CategoryID = 305;

SELECT * FROM Apps WHERE Downloads > 500000000;
SELECT * FROM Apps WHERE Rating BETWEEN 4.3 AND 4.7;
SELECT * FROM Apps WHERE Price IN (0, 299);
SELECT * FROM Apps WHERE AppName LIKE 'G%';
SELECT * FROM Apps WHERE AppName LIKE '%Google%';
SELECT * FROM Apps WHERE Rating > 4.0 AND Downloads > 500000000;
SELECT * FROM Apps WHERE CategoryID = 301 OR CategoryID = 305;

SELECT * FROM Apps WHERE AppName NOT LIKE 'G%';
SELECT * FROM Apps WHERE Rating < 4.5 OR Downloads > 1000000000;
SELECT * FROM Developers WHERE DeveloperName LIKE '%a%';
SELECT * FROM Apps WHERE Price BETWEEN 0 AND 300;
SELECT * FROM Apps WHERE PublisherID IN (201, 204);
INSERT INTO Apps (AppID, AppName, DeveloperID, PublisherID, CategoryID, Rating, Downloads, Price) 
VALUES (9999, 'Test App', 999, 201, 301, 4.0, 1000, 0);
SELECT * FROM Apps WHERE CategoryID <> 305;

SELECT COUNT(*) FROM Apps;
SELECT AVG(Rating) FROM Apps;
SELECT MAX(Rating) FROM Apps;
SELECT MIN(Rating) FROM Apps;
SELECT SUM(Downloads) FROM Apps;
SELECT * FROM Apps ORDER BY Rating DESC;

SELECT CategoryID, COUNT(*) FROM Apps GROUP BY CategoryID;
SELECT CategoryID, AVG(Rating) FROM Apps GROUP BY CategoryID;
SELECT MAX(Price), MIN(Price) FROM Apps;
SELECT * FROM Apps ORDER BY Downloads DESC;
SELECT DeveloperID, COUNT(*) FROM Apps GROUP BY DeveloperID;
SELECT CategoryID, COUNT(*) FROM Apps GROUP BY CategoryID HAVING COUNT(*) > 1;

SELECT DeveloperID, SUM(Downloads) FROM Apps GROUP BY DeveloperID;
SELECT PublisherID, AVG(Rating) FROM Apps GROUP BY PublisherID;
SELECT DeveloperID, COUNT(*) FROM Apps GROUP BY DeveloperID HAVING COUNT(*) > 1;
SELECT CategoryID, AVG(Rating) FROM Apps GROUP BY CategoryID HAVING AVG(Rating) > 4.3;
SELECT CategoryID, COUNT(*) AS AppCount FROM Apps GROUP BY CategoryID ORDER BY AppCount DESC;
SELECT * FROM Apps WHERE Rating = (SELECT MAX(Rating) FROM Apps);
SELECT DeveloperID, SUM(Price) FROM Apps GROUP BY DeveloperID;

SET autocommit = 0;

START TRANSACTION;
UPDATE Apps SET Rating = 4.8 WHERE AppName = 'Google Keep';
COMMIT;

START TRANSACTION;
UPDATE Apps SET Price = 350.00 WHERE AppName = 'BYJU''S Learning';
ROLLBACK;

START TRANSACTION;
INSERT INTO Apps (AppID, AppName, DeveloperID, PublisherID, CategoryID, Rating, Downloads, Price) 
VALUES (1012, 'Telegram', 101, 201, 304, 4.4, 1000000000, 0.00);
COMMIT;

START TRANSACTION;
INSERT INTO Developers (DeveloperID, DeveloperName, Country, FoundedYear) 
VALUES (107, 'Snapchat Inc', 'USA', 2011);
ROLLBACK;

START TRANSACTION;
UPDATE Apps SET Rating = 4.9 WHERE AppName = 'Spotify';
SAVEPOINT sp_rating;
ROLLBACK;

START TRANSACTION;
UPDATE Apps SET Rating = 4.7 WHERE AppName = 'Google Classroom';
SAVEPOINT sp1;
UPDATE Apps SET Rating = 4.9 WHERE AppName = 'Instagram';
ROLLBACK TO SAVEPOINT sp1;
COMMIT;

START TRANSACTION;
INSERT INTO Apps (AppID, AppName, DeveloperID, PublisherID, CategoryID, Rating, Downloads, Price) 
VALUES (1013, 'Signal', 101, 201, 304, 4.6, 50000000, 0.00);
SAVEPOINT sp_app;
UPDATE Apps SET Price = 10.00 WHERE AppID = 1013;
ROLLBACK TO SAVEPOINT sp_app;
COMMIT;

GRANT SELECT ON Apps TO 'user_name'@'localhost';
GRANT SELECT, INSERT ON Apps TO 'user_name'@'localhost';
REVOKE INSERT ON Apps FROM 'user_name'@'localhost';

START TRANSACTION;
UPDATE Apps SET Downloads = Downloads + 1000 WHERE AppID = 1001;
SAVEPOINT sp_up1;
UPDATE Apps SET Price = 15.00 WHERE AppID = 1001;
SAVEPOINT sp_up2;
UPDATE Apps SET Rating = 5.0 WHERE AppID = 1001;
ROLLBACK TO SAVEPOINT sp_up2;
COMMIT;

START TRANSACTION;
INSERT INTO Categories (CategoryID, CategoryName, MinimumAge) VALUES (307, 'News', 12), (308, 'Sports', 3);
SAVEPOINT sp_cat;
ROLLBACK TO SAVEPOINT sp_cat;
COMMIT;

GRANT SELECT, INSERT, UPDATE ON Apps TO 'user_name'@'localhost';
REVOKE UPDATE ON Apps FROM 'user_name'@'localhost';
GRANT SELECT ON Developers TO 'user_name'@'localhost';
REVOKE SELECT ON Developers FROM 'user_name'@'localhost';

START TRANSACTION;
UPDATE Apps SET Downloads = 600000000 WHERE AppName = 'Google Classroom';
INSERT INTO Developers (DeveloperID, DeveloperName, Country, FoundedYear) VALUES (108, 'Adobe', 'USA', 1982);
COMMIT;

SELECT * FROM Developers;
SELECT * FROM Publishers;
SELECT * FROM Categories;
SELECT * FROM Apps;
