# SchoolReport

A SQL Server data warehouse project for Mtuba Christian Academy, following a Bronze/Silver/Gold layered architecture to move student report data from raw staging tables into clean, analysis-ready form.

## Overview

Two databases are created to separate raw and cleaned data:

- **`MCA_stg`** — staging database holding raw/dirty data, organized under a `BronzeLayer` schema
- **`MCA_dwh`** — data warehouse database holding cleaned data, split into a `SilverLayer` schema (conformed data) and a `GoldLayer` schema (business-ready, aggregated data)

Raw student report data (e.g. a prelim science student marks table) is loaded into `BronzeLayer` in `MCA_stg` — one row per student, with columns for student ID, name, grade, and subject marks (Mathematics, Physical Science, Life Sciences, English Home Language, Life Orientation, Information Technology, and others). This raw data will move through the Silver and Gold layers in `MCA_dwh` as it's cleaned and transformed.

## Project Structure

```
create_db.sql   -- DDL script: creates the staging and warehouse databases and their schemas
```