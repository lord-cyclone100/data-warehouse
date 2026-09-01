USE datawarehouse;

CREATE TABLE IF NOT EXISTS silver_crm_cust_info (
    cst_id              INT,
    cst_key             VARCHAR(50) CHARACTER SET utf8mb4,
    cst_firstname       VARCHAR(50) CHARACTER SET utf8mb4,
    cst_lastname        VARCHAR(50) CHARACTER SET utf8mb4,
    cst_marital_status  VARCHAR(50) CHARACTER SET utf8mb4,
    cst_gndr            VARCHAR(50) CHARACTER SET utf8mb4,
    cst_create_date     DATE,
    dwh_create_date     DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS silver_crm_prd_info (
    prd_id       INT,
    prd_key      VARCHAR(50) CHARACTER SET utf8mb4,
    prd_nm       VARCHAR(50) CHARACTER SET utf8mb4,
    prd_cost     INT,
    prd_line     VARCHAR(50) CHARACTER SET utf8mb4,
    prd_start_dt DATETIME,
    prd_end_dt   DATETIME,
    dwh_create_date     DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS silver_crm_sales_details (
    sls_ord_num  VARCHAR(50) CHARACTER SET utf8mb4,
    sls_prd_key  VARCHAR(50) CHARACTER SET utf8mb4,
    sls_cust_id  INT,
    sls_order_dt INT,
    sls_ship_dt  INT,
    sls_due_dt   INT,
    sls_sales    INT,
    sls_quantity INT,
    sls_price    INT,
    dwh_create_date     DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS silver_erp_loc_a101 (
    cid    VARCHAR(50) CHARACTER SET utf8mb4,
    cntry  VARCHAR(50) CHARACTER SET utf8mb4,
    dwh_create_date     DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS silver_erp_cust_az12 (
    cid    VARCHAR(50) CHARACTER SET utf8mb4,
    bdate  DATE,
    gen    VARCHAR(50) CHARACTER SET utf8mb4,
    dwh_create_date     DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS silver_erp_px_cat_g1v2 (
    id           VARCHAR(50) CHARACTER SET utf8mb4,
    cat          VARCHAR(50) CHARACTER SET utf8mb4,
    subcat       VARCHAR(50) CHARACTER SET utf8mb4,
    maintenance  VARCHAR(50) CHARACTER SET utf8mb4,
    dwh_create_date     DATETIME DEFAULT CURRENT_TIMESTAMP
);
