USE MCA_dwh;
GO

CREATE TABLE SilverLayer.prelim_science_students_marks_g10(
       student_id                   varchar(10) not null,
       student_name                 nvarchar(100),
       grade                        int,
       mathematics_mark             decimal(5,2),
       physical_science_mark        decimal(5,2),
       life_sciences_mark           decimal(5,2),
       english_home_language_mark   decimal(5,2),
       life_orientation_mark        decimal(5,2),
       information_technology_mark  decimal(5,2),
       agricultural_science_mark    decimal(5,2),
       total_mark                   decimal(5,2),
       average_mark                 decimal(5,2)
);
GO

INSERT INTO SilverLayer.prelim_science_students_marks_g10
    (student_id, student_name, grade, mathematics_mark, physical_science_mark,
     life_sciences_mark, english_home_language_mark, life_orientation_mark, information_technology_mark,
     agricultural_science_mark, total_mark, average_mark)
SELECT
    TRIM(student_id),
    TRIM(student_name),
    UPPER(TRIM(grade)),
    TRY_CAST(mathematics_mark AS DECIMAL(5,2)),
    TRY_CAST(physical_science_mark AS DECIMAL(5,2)),
    TRY_CAST(life_sciences_mark AS DECIMAL(5,2)),
    TRY_CAST(english_home_language_mark AS DECIMAL(5,2)),
    TRY_CAST(life_orientation_mark AS DECIMAL(5,2)),
    TRY_CAST(information_technology_mark AS DECIMAL(5,2)),
    TRY_CAST(agricultural_science_mark AS DECIMAL(5,2)),
    TRY_CAST(total_mark AS DECIMAL(5,2)),
    TRY_CAST(average_mark AS DECIMAL(5,2))
FROM 
    MCA_stg.BronzeLayer.prelim_science_students_marks
WHERE
    grade IN ('10A', '10B');
GO

USE MCA_dwh;
GO

CREATE TABLE SilverLayer.prelim_science_students_marks_g11(
       student_id                   varchar(10) not null,
       student_name                 nvarchar(100),
       grade                        int,
       mathematics_mark             decimal(5,2),
       physical_science_mark        decimal(5,2),
       life_sciences_mark           decimal(5,2),
       english_home_language_mark   decimal(5,2),
       life_orientation_mark        decimal(5,2),
       information_technology_mark  decimal(5,2),
       agricultural_science_mark    decimal(5,2),
       total_mark                   decimal(5,2),
       average_mark                 decimal(5,2)
);
GO

INSERT INTO SilverLayer.prelim_science_students_marks_g11
    (student_id, student_name, grade, mathematics_mark, physical_science_mark,
     life_sciences_mark, english_home_language_mark, life_orientation_mark, information_technology_mark,
     agricultural_science_mark, total_mark, average_mark)
SELECT
    TRIM(student_id),
    TRIM(student_name),
    UPPER(TRIM(grade)),
    TRY_CAST(mathematics_mark AS DECIMAL(5,2)),
    TRY_CAST(physical_science_mark AS DECIMAL(5,2)),
    TRY_CAST(life_sciences_mark AS DECIMAL(5,2)),
    TRY_CAST(english_home_language_mark AS DECIMAL(5,2)),
    TRY_CAST(life_orientation_mark AS DECIMAL(5,2)),
    TRY_CAST(information_technology_mark AS DECIMAL(5,2)),
    TRY_CAST(agricultural_science_mark AS DECIMAL(5,2)),
    TRY_CAST(total_mark AS DECIMAL(5,2)),
    TRY_CAST(average_mark AS DECIMAL(5,2))
FROM 
    MCA_stg.BronzeLayer.prelim_science_students_marks
WHERE
    grade IN ('11A', '11B');
GO

USE MCA_dwh;
GO

CREATE TABLE SilverLayer.prelim_science_students_marks_g12(
       student_id                   varchar(10) not null,
       student_name                 nvarchar(100),
       grade                        int,
       mathematics_mark             decimal(5,2),
       physical_science_mark        decimal(5,2),
       life_sciences_mark           decimal(5,2),
       english_home_language_mark   decimal(5,2),
       life_orientation_mark        decimal(5,2),
       information_technology_mark  decimal(5,2),
       agricultural_science_mark    decimal(5,2),
       total_mark                   decimal(5,2),
       average_mark                 decimal(5,2)
);
GO

INSERT INTO SilverLayer.prelim_science_students_marks_g12
    (student_id, student_name, grade, mathematics_mark, physical_science_mark,
     life_sciences_mark, english_home_language_mark, life_orientation_mark, information_technology_mark,
     agricultural_science_mark, total_mark, average_mark)
SELECT
    TRIM(student_id),
    TRIM(student_name),
    UPPER(TRIM(grade)),
    TRY_CAST(mathematics_mark AS DECIMAL(5,2)),
    TRY_CAST(physical_science_mark AS DECIMAL(5,2)),
    TRY_CAST(life_sciences_mark AS DECIMAL(5,2)),
    TRY_CAST(english_home_language_mark AS DECIMAL(5,2)),
    TRY_CAST(life_orientation_mark AS DECIMAL(5,2)),
    TRY_CAST(information_technology_mark AS DECIMAL(5,2)),
    TRY_CAST(agricultural_science_mark AS DECIMAL(5,2)),
    TRY_CAST(total_mark AS DECIMAL(5,2)),
    TRY_CAST(average_mark AS DECIMAL(5,2))
FROM 
    MCA_stg.BronzeLayer.prelim_science_students_marks
WHERE
    grade IN ('12A', '12B');
GO


SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
FROM MCA_dwh.INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'SilverLayer'
  AND TABLE_NAME = 'prelim_science_students_marks_g10'
  AND COLUMN_NAME = 'grade';

ALTER TABLE SilverLayer.prelim_science_students_marks_g10
ALTER COLUMN grade VARCHAR(5);

SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
FROM MCA_dwh.INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'SilverLayer'
  AND TABLE_NAME = 'prelim_science_students_marks_g11'
  AND COLUMN_NAME = 'grade';

ALTER TABLE SilverLayer.prelim_science_students_marks_g11
ALTER COLUMN grade VARCHAR(5);

ALTER TABLE SilverLayer.prelim_science_students_marks_g12
ALTER COLUMN grade VARCHAR(5);