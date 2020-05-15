create or replace PROCEDURE addowner (
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