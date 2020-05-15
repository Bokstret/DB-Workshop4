---------------------------------------------
--КАЖДЫЙ CREATE ЗАПУСКАТЬ ОТДЕЛЬНО ПО ОЧЕРЕДИ
---------------------------------------------


CREATE TYPE rowprojects IS OBJECT (
        projectid      NUMBER(38),
        title   VARCHAR(100),
        main_category VARCHAR(100)
    );

CREATE TYPE tblprojects IS
        TABLE OF rowprojects;

CREATE OR REPLACE FUNCTION chooseproject (
        project_country   VARCHAR,
        project_goal      FLOAT
    ) RETURN tblprojects
        PIPELINED
    IS

        CURSOR cur IS
        (SELECT
            projectid,
            title,
            main_category
        FROM
            project_collection
        WHERE
            country = project_country
            AND project_goal >= goal);
    my_rec rowprojects;
    BEGIN
        FOR rec IN cur 
        LOOP
            my_rec.projectid := rec.projectid;
            my_rec.title := rec.title;
            my_rec.main_category := rec.main_category;
            PIPE ROW ( my_rec );
        END LOOP;
    END;