/*
=============================================================
Create Database and Tables
=============================================================

Script Purpose:
    This script creates a new database named 'DataWarehouse'
    after checking if it already exists.

    The database contains three logical layers:

        bronze_*  -> Raw/staging data
        silver_*  -> Cleaned/transformed data
        gold_*    -> Business-ready/analytics data

    MySQL does not support schemas nested inside databases,
    so table prefixes are used to represent the layers.

WARNING:
    Running this script will drop the entire 'DataWarehouse'
    database if it exists.

    All data in the database will be permanently deleted.
=============================================================
*/


-- ===========================================================
-- Drop and recreate the 'DataWarehouse' database
-- ===========================================================

DROP DATABASE IF EXISTS datawarehouse;

CREATE DATABASE datawarehouse;

USE datawarehouse;


-- ===========================================================
-- Bronze Layer
-- ===========================================================

-- Tables belonging to the Bronze layer should use
-- the 'bronze_' prefix.

-- Example:
-- CREATE TABLE bronze_customers (...);
-- CREATE TABLE bronze_orders (...);


-- ===========================================================
-- Silver Layer
-- ===========================================================

-- Tables belonging to the Silver layer should use
-- the 'silver_' prefix.

-- Example:
-- CREATE TABLE silver_customers (...);
-- CREATE TABLE silver_orders (...);


-- ===========================================================
-- Gold Layer
-- ===========================================================

-- Tables belonging to the Gold layer should use
-- the 'gold_' prefix.

-- Example:
-- CREATE TABLE gold_customers (...);
-- CREATE TABLE gold_sales (...);