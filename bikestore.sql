-- Online SQL Editor to Run SQL Online.
--Dataset: From 
SELECT	
  ord.order_id,   
  CONCAT(cus.first_name, ' ', cus.last_name) AS 'customers',   
  cus.city,   
  cus.state,   
  ord.order_date,   
  SUM(ite.quantity) AS 'total_unit',   
  SUM(ite.quantity * ite.list_price) AS 'revenue',   
  pro.product_name,   
  cat.category_name,  
  sto.stores_name,    
  CONCAT(sta.first_name, ' ', sta.last_name) AS 'sales_rep' 
FROM sales.orders ord 
JOIN sales.customers cus 
ON ord.customer_id = cus.customer_id
JOIN sales.order_items ite
ON ord.order_id = ite.order_id
JOIN productions.product pro
ON ite.product_id = pro.product_id
JOIN productions.categories cat 
ON pro.category_id = cat.product_id 
JOIN sales.store sto 
ON ord.store_id = sto.store_id 
JOIN sales.staff sta 
ON ord.staff_id = sta.staff_id 
GROUP BY 	ord.order_id,    
  CONCAT(cus.first_name, ' ', cus.last_name) AS 'customers', 
  cus.city,   
  cus.state,   
  ord.order_date,   
  pro.product_name,   
  cat.category_name,  
  sto.stores_name,  
  CONCAT(sta.first_name, ' ', sta.last_name) AS 'sales_rep'
