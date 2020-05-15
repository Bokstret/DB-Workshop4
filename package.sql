CREATE OR REPLACE PACKAGE my_package IS
    TYPE rowprojects IS RECORD (
        projectid      project.projectid%TYPE,
        title   project.title%TYPE,
        main_category project.main_category%TYPE
    );
    TYPE tblprojects IS
        TABLE OF rowprojects;
--
    FUNCTION chooseproject (
        project_country   VARCHAR,
        project_goal      FLOAT
    ) RETURN tblprojects
        PIPELINED;

    PROCEDURE addowner (
        owner_name      VARCHAR,
        project_title   VARCHAR
    );

END my_package;

/


create or replace PACKAGE BODY my_package IS

   PROCEDURE addowner (
    owner_name      VARCHAR,
    project_title   VARCHAR
) AS
    projectstatus NUMBER;
    ownerstatus NUMBER;
    no_data EXCEPTION;
BEGIN

    SELECT
        COUNT(*)
    INTO projectstatus
    FROM
        project
    WHERE
        title LIKE project_title;

    SELECT
        COUNT(*)
    INTO ownerstatus
    FROM
        projectowner
    WHERE
        owner LIKE owner_name;

    IF (projectstatus = 1) and (ownerstatus = 1)  THEN
    UPDATE project
        SET
            owner = owner_name
        WHERE
            title = project_title;

    ELSE
        RAISE no_data;

    END IF;

EXCEPTION
    WHEN no_data THEN
        dbms_output.put_line('No such project or owner in the database');
    WHEN OTHERS THEN
        dbms_output.put_line('Something else went wrong - '
                             || sqlcode
                             || ' : '
                             || sqlerrm);
END;

FUNCTION chooseproject (
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

END;
