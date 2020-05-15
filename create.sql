CREATE TABLE collection (
    projectid   INTEGER NOT NULL,
    collected   FLOAT(20),
    goal        FLOAT(20),
    currency    VARCHAR2(50 CHAR),
    launched    TIMESTAMP
);

ALTER TABLE collection ADD CONSTRAINT collection_pk PRIMARY KEY ( projectid );

CREATE TABLE project (
    projectid   INTEGER NOT NULL,
    title       VARCHAR2(100 CHAR),
    main_category    VARCHAR2(100 CHAR) NOT NULL,
    country     VARCHAR2(100 CHAR) NOT NULL,
    owner       VARCHAR2(100 CHAR) NOT NULL
);

ALTER TABLE project ADD CONSTRAINT project_pk PRIMARY KEY ( projectid );

CREATE TABLE projectcategory (
    main_category VARCHAR2(100 CHAR) NOT NULL
);

ALTER TABLE projectcategory ADD CONSTRAINT projectcategory_pk PRIMARY KEY ( main_category );

CREATE TABLE projectcountry (
    country VARCHAR2(100 CHAR) NOT NULL
);

ALTER TABLE projectcountry ADD CONSTRAINT projectcountry_pk PRIMARY KEY ( country );

CREATE TABLE projectowner (
    owner VARCHAR2(100 CHAR) NOT NULL
);

ALTER TABLE projectowner ADD CONSTRAINT projectowner_pk PRIMARY KEY ( owner );

ALTER TABLE collection
    ADD CONSTRAINT collection_project_fk FOREIGN KEY ( projectid )
        REFERENCES project ( projectid );

ALTER TABLE project
    ADD CONSTRAINT projectcategory_fk FOREIGN KEY ( main_category )
        REFERENCES projectcategory ( main_category );

ALTER TABLE project
    ADD CONSTRAINT projectcountry_fk FOREIGN KEY ( country )
        REFERENCES projectcountry ( country );

ALTER TABLE project
    ADD CONSTRAINT projectowner_fk FOREIGN KEY ( owner )
        REFERENCES projectowner ( owner );