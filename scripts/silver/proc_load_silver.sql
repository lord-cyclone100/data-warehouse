TRUNCATE TABLE silver_crm_cust_info;
INSERT INTO silver_crm_cust_info(
	cst_id,
    cst_key,
    cst_firstname,
    cst_lastname,
    cst_marital_status,
    cst_gndr,
    cst_create_date
)
select
cst_id,
cst_key,
trim(cst_firstname) as cst_firstname,
trim(cst_lastname) as cst_lastname,
case cst_marital_status
when "S" then "Single"
when "M" then "Married"
else "N/A"
end as cst_marital_status,
case cst_gndr
when "M" then "Male"
when "F" then "Female"
else "N/A"
end as cst_gndr,
cst_create_date
from(
select
*,
row_number() over(partition by cst_id order by cst_create_date desc) as ranked_customer
from bronze_crm_cust_info
where cst_id != 0)t
where ranked_customer = 1;

TRUNCATE TABLE silver_crm_prd_info;
INSERT INTO silver_crm_prd_info(
	prd_id,
    cat_id,
    prd_key,
    prd_nm,
    prd_cost,
    prd_line,
    prd_start_dt,
    prd_end_dt
)
select
prd_id,
replace(substring(prd_key,1,5), '-', '_') as cat_id,
substring(prd_key,7,length(prd_key)) as prd_key, 
prd_nm,
coalesce(prd_cost,0) as prd_cost,
case trim(prd_line)
when "R" then "Road"
when "S" then "Other Sales"
when "M" then "Mountain"
when "T" then "Touring"
else "N/A"
end as prd_line,
cast(prd_start_dt as date) as prd_start_dt,
cast(lead(prd_start_dt) over(partition by prd_key order by prd_start_dt) - interval 1 day as date) as prd_end_dt
from bronze_crm_prd_info;

TRUNCATE TABLE silver_crm_sales_details;
INSERT INTO silver_crm_sales_details(
	sls_ord_num,
	sls_prd_key,
	sls_cust_id,
	sls_order_dt,
	sls_ship_dt,
	sls_due_dt,
	sls_sales,
	sls_quantity,
	sls_price
)
select
sls_ord_num,
sls_prd_key,
sls_cust_id,
case 
when sls_order_dt = 0 or length(sls_order_dt) != 8 then NULL
else cast(cast(sls_order_dt as char(50) CHARACTER SET utf8mb4) as date)
end as sls_order_dt,
case 
when sls_ship_dt = 0 or length(sls_ship_dt) != 8 then NULL
else cast(cast(sls_ship_dt as char(50) CHARACTER SET utf8mb4) as date)
end as sls_ship_dt,
case 
when sls_due_dt = 0 or length(sls_due_dt) != 8 then NULL
else cast(cast(sls_due_dt as char(50) CHARACTER SET utf8mb4) as date)
end as sls_due_dt,
case when sls_sales <= 0 or sls_sales is NULL or sls_sales != (sls_quantity * abs(sls_price))
then sls_quantity * abs(sls_price)
else sls_sales
end as sls_sales,
sls_quantity,
case 
when sls_price is null or sls_price <= 0 
then cast(sls_sales / nullif(sls_quantity,0) as unsigned)
else sls_price
end as sls_price
from bronze_crm_sales_details;

TRUNCATE TABLE silver_erp_cust_az12;
insert into silver_erp_cust_az12(
	cid,
    bdate,
    gen
)
select
case when cid like "NAS%"
then substring(trim(cid),4,length(cid))
else cid
end as cid,
case when bdate > curdate() then null
else bdate
end as bdate,
case 
when upper(trim(REPLACE(gen, '\r', ''))) in ('F', 'FEMALE') then "Female"
when upper(trim(REPLACE(gen, '\r', ''))) in ('M', 'MALE') then "Male"
else 'N/A'
end as gen
from bronze_erp_cust_az12;

TRUNCATE TABLE silver_erp_loc_a101;
insert into silver_erp_loc_a101(
	cid,
    cntry
)
select 
replace(cid, '-', '') as cid,
case trim(replace(cntry, '\r', ''))
when "US" then "United States"
when "USA" then "United States"
when "DE" then "Germany"
when "" then 'N/A'
when null then 'N/A'
else cntry
end as cntry
from bronze_erp_loc_a101;

TRUNCATE TABLE silver_erp_px_cat_g1v2;
insert into silver_erp_px_cat_g1v2(
	id,
    cat,
    subcat,
    maintenance
)
select
id,
cat,
subcat,
maintenance
from bronze_erp_px_cat_g1v2;
