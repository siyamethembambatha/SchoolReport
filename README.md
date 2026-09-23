# SchoolReport

A SQL Server data warehouse project for Mtuba Christian Academy, following a Bronze/Silver/Gold layered architecture to move student report data from raw staging tables into clean, analysis-ready form.

## Overview

Two databases are created to separate raw and cleaned data:

- **`MCA_stg`** — staging database holding raw/dirty data, organized under a `BronzeLayer` schema
- **`MCA_dwh`** — data warehouse database holding cleaned data, split into a `SilverLayer` schema (conformed data) and a `GoldLayer` schema (business-ready, aggregated data)

Raw student report data — a single CSV, `prelim_science_students_marks` — is loaded into `BronzeLayer` in `MCA_stg` as-is. Each row is one student, with columns for student ID, name, grade, and subject marks (Mathematics, Physical Science, Life Sciences, English Home Language, Life Orientation, Information Technology, Agricultural Science) plus `total_mark` and `average_mark`.

## Bronze → Silver

The single Bronze table is split into three cleaned tables in `SilverLayer`, one per grade:

- `SilverLayer.prelim_science_students_marks_g10` — grades `10A`/`10B` (33 rows)
- `SilverLayer.prelim_science_students_marks_g11` — grades `11A`/`11B` (24 rows)
- `SilverLayer.prelim_science_students_marks_g12` — grades `12A`/`12B` (43 rows)

Each Silver table is populated with `INSERT INTO ... SELECT ... FROM BronzeLayer.prelim_science_students_marks WHERE grade IN (...)`, applying cleaning as it goes:

- `TRIM()` on `student_id` and `student_name` to strip stray whitespace
- `UPPER(TRIM())` on `grade` to standardize casing
- `TRY_CAST(... AS DECIMAL(5,2))` on every mark column, so non-numeric junk becomes `NULL` instead of failing the insert
- Filtered to one grade band per table via `WHERE grade IN (...)`

**Gotcha hit along the way:** the `grade` column was originally created as `int`, but Bronze stores values like `'10A'`/`'10B'` as text — inserting them threw a conversion error (`Msg 245`). Fixed by altering the column type on all three Silver tables:
```sql
ALTER TABLE SilverLayer.prelim_science_students_marks_g10 ALTER COLUMN grade VARCHAR(5);
ALTER TABLE SilverLayer.prelim_science_students_marks_g11 ALTER COLUMN grade VARCHAR(5);
ALTER TABLE SilverLayer.prelim_science_students_marks_g12 ALTER COLUMN grade VARCHAR(5);
```

## Gold layer

Not yet built. This is the next step — reshaping/aggregating the three Silver tables into business-ready reporting tables (e.g. per-subject pass rates, averages by grade).

## Project Structure

```
create_db.sql                  -- DDL script: creates the staging and warehouse databases and their schemas
create_SilverLayer_tables.sql  -- DDL + ETL: creates the three per-grade Silver tables and loads/cleans them from Bronze
```