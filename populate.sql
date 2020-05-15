----------------------------------------------------
--ПОСЛЕ ЗАПУСКА ЭТОГО ФАЙЛА НУЖНО ЗАПУСТИТЬ VIEW.SQL
----------------------------------------------------

--------------------------------
-- Populate projectcountry table
--------------------------------
INSERT INTO projectcountry(country)
VALUES('US');

INSERT INTO projectcountry(country)
VALUES('GB');

INSERT INTO projectcountry(country)
VALUES('CA');

INSERT INTO projectcountry(country)
VALUES('Unknown');

---------------------------------
-- Populate projectcategory table
---------------------------------
INSERT INTO projectcategory(main_category)
VALUES('Publishing');

INSERT INTO projectcategory(main_category)
VALUES('Film and Video');

INSERT INTO projectcategory(main_category)
VALUES('Music');


---------------------------------
-- Populate projectcategory table
---------------------------------
INSERT INTO projectowner(owner)
VALUES('Bob');
INSERT INTO projectowner(owner)
VALUES('Boban');
INSERT INTO projectowner(owner)
VALUES('Bobich');


-------------------------
-- Populate project table
-------------------------
INSERT INTO Project(projectid,title,owner,country,main_category)
VALUES(1000002330, 'The Songs of Adelaide and Abullah','Bob', 'GB', 'Publishing');

INSERT INTO Project(projectid,title,owner,country,main_category)
VALUES(1000004038, 'Where is Hank?','Bobich', 'US', 'Film and Video');

INSERT INTO Project(projectid,title,owner,country,main_category)
VALUES(1000007540, 'ToshiCapital Needs Help to Complete Album','Boban', 'US', 'Music');

----------------------------
-- Populate collection table
----------------------------
INSERT INTO Collection(projectid,collected,goal,currency,launched)
VALUES(1000002330, 1250, 1000, 'GBP', TO_DATE('2015-08-11 12:12:28','RR.MM.DD HH24:MI:SS'));

INSERT INTO Collection(projectid,collected,goal,currency,launched)
VALUES(1000004038, 220, 45000, 'USD', TO_DATE('2013-01-12 00:20:50','RR.MM.DD HH24:MI:SS'));

INSERT INTO Collection(projectid,collected,goal,currency,launched)
VALUES(1000007540, 1283, 19500, 'USD', TO_DATE('2012-03-17 03:24:11','RR.MM.DD HH24:MI:SS'));
