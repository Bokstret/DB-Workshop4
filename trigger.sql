create or replace TRIGGER country_check BEFORE INSERT
    ON project FOR EACH ROW  
    WHEN ( new.country IS NULL )
    
BEGIN 
    :new.country := 'Unknown';
END;

---------------------------------------------------
--ЗАПУСКАТЬ СНАЧАЛА ВЕРХНИЙ БЛОК КОДА, ПОТОМ НИЖНИЙ
---------------------------------------------------


INSERT  into project(projectid, title, main_category, owner) VALUES (100,'Is it','Music','Bob'); --страна проекта будет неизвестна
INSERT  into project(projectid, title, main_category, country, owner) VALUES (101,'Me','Music', 'US', 'Bob');--страна проекта будет известна
INSERT  into project(projectid, title, main_category, owner) VALUES (102,'You are looking for','Music','Bob');--страна проекта будет неизвестна