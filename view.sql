CREATE VIEW PROJECT_COLLECTION AS
    SELECT
        project.projectid,
        title,
        country,
        main_category,
        collected,
        goal,
        currency,
        launched
    FROM
        project
        INNER JOIN collection ON project.projectid = collection.projectid;