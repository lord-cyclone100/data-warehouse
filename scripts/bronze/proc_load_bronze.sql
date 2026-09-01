TRUNCATE TABLE bronze_crm_cust_info;
LOAD DATA LOCAL INFILE 'C:/Users/sang6/OneDrive/Desktop/coderz/sql/data-warehouse/datasets/source_crm/cust_info.csv'
INTO TABLE bronze_crm_cust_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(cst_id, cst_key, cst_firstname, cst_lastname, cst_marital_status, cst_gndr, cst_create_date);
 
TRUNCATE TABLE bronze_crm_prd_info;
LOAD DATA LOCAL INFILE 'C:/Users/sang6/OneDrive/Desktop/coderz/sql/data-warehouse/datasets/source_crm/prd_info.csv'
INTO TABLE bronze_crm_prd_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(prd_id, prd_key, prd_nm, prd_cost, prd_line, prd_start_dt, prd_end_dt);

TRUNCATE TABLE bronze_crm_sales_details;
LOAD DATA LOCAL INFILE 'C:/Users/sang6/OneDrive/Desktop/coderz/sql/data-warehouse/datasets/source_crm/sales_details.csv'
INTO TABLE bronze_crm_sales_details
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(sls_ord_num, sls_prd_key, sls_cust_id, sls_order_dt, sls_ship_dt, sls_due_dt, sls_sales, sls_quantity, sls_price);

TRUNCATE TABLE bronze_erp_cust_az12;
LOAD DATA LOCAL INFILE 'C:/Users/sang6/OneDrive/Desktop/coderz/sql/data-warehouse/datasets/source_erp/cust_az12.csv'
INTO TABLE bronze_erp_cust_az12
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(cid, bdate, gen);

TRUNCATE TABLE bronze_erp_loc_a101;
LOAD DATA LOCAL INFILE 'C:/Users/sang6/OneDrive/Desktop/coderz/sql/data-warehouse/datasets/source_erp/loc_a101.csv'
INTO TABLE bronze_erp_loc_a101
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(cid, cntry);

TRUNCATE TABLE bronze_erp_px_cat_g1v2;
LOAD DATA LOCAL INFILE 'C:/Users/sang6/OneDrive/Desktop/coderz/sql/data-warehouse/datasets/source_erp/px_cat_g1v2.csv'
INTO TABLE bronze_erp_px_cat_g1v2
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, cat, subcat, maintenance);
 