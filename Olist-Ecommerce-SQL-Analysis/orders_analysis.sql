# Verify Business Metrics
# Total Orders
SELECT COUNT(*) AS Total_orders
FROM olist_orders_dataset;

# Orders by Status
SELECT order_status,
COUNT(*) AS Total_orders
FROM olist_orders_dataset
GROUP BY order_status
ORDER BY Total_orders DESC;

# Customer Segmentation
# Customers per State
SELECT customer_state,
COUNT(DISTINCT customer_unique_id) AS Total_customers
FROM olist_customers_dataset
GROUP BY customer_state
ORDER BY Total_customers DESC;

# Repeat Customer Percentage
SELECT
ROUND(
(COUNT(DISTINCT customer_id)-COUNT(DISTINCT customer_unique_id))
*100/COUNT(DISTINCT customer_unique_id),2) AS Repeat_percentage
FROM olist_customers_dataset;

# Orders v/s customers state wise
SELECT c.customer_state,
COUNT(DISTINCT c.customer_unique_id) AS Total_customers,
COUNT(DISTINCT o.order_id) AS Total_orders
FROM olist_customers_dataset c
LEFT JOIN olist_orders_dataset o
ON c.customer_id=o.customer_id
GROUP BY c.customer_state
ORDER BY Total_customers DESC;