-- =========================================================
-- Staging Database
-- Holds raw/dirty data before cleaning (Bronze layer)
-- =========================================================
CREATE DATABASE MCA_stg;
GO

USE MCA_stg;
GO

CREATE SCHEMA BronzeLayer;
GO

-- =========================================================
-- Data Warehouse Database
-- Holds cleaned, structured data (Silver & Gold layers)
-- =========================================================
CREATE DATABASE MCA_dwh;
GO

USE MCA_dwh;
GO

CREATE SCHEMA SilverLayer;  -- Cleaned/conformed data
GO

CREATE SCHEMA GoldLayer;    -- Business-ready, aggregated data
GO