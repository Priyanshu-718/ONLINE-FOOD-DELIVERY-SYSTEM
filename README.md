This project analyzes an Online Food Delivery System using SQL.
The goal is to extract business insights from customer orders, restaurants, and sales data.

Dataset includes:

Customers

Restaurants

Orders

Order Items

📂 Dataset Description
Tables Used
1. customers_50
Column	Description
customer_id	Unique customer ID
name	Customer name
city	Customer city
signup_date	Account creation date
2. restaurants_20
Column	Description
restaurant_id	Unique restaurant ID
name	Restaurant name
city	Restaurant city
rating	Customer rating
3. orders_200
Column	Description
order_id	Unique order ID
customer_id	Customer reference
restaurant_id	Restaurant reference
order_date	Order date
total_amount	Order value
4. order_items_300
Column	Description
item_id	Item ID
order_id	Order reference
item_name	Food item
quantity	Quantity ordered
price	Item price
🛠 Tools Used

MySQL

MySQL Workbench

Excel (for visualization – optional)

🔍 Analysis Performed

✔ Total customers & orders
✔ Unique cities
✔ Top restaurants by rating
✔ High-value orders
✔ Revenue calculations
✔ City-wise performance
✔ Customer spending analysis
✔ Ranking customers
✔ Window functions (Running total)
✔ INNER, LEFT, RIGHT, FULL JOIN
✔ Customer behavior analysis

📊 Key Queries Covered

Total revenue

Average order value

Top 5 customers by spending

Customers ordering more than 5 times

City-wise revenue

Most popular food item

Restaurants with no orders

Customers with no orders

Running total of revenue

Ranking customers by spending

🚀 Sample Business Insights

Identified highest revenue city

Found top spending customers

Determined most popular food item

Analyzed restaurant performance

Studied monthly order trends

📁 Project Structure
📦 SQL-Project
 ┣ 📜 customers_50.csv
 ┣ 📜 restaurants_20.csv
 ┣ 📜 orders_200.csv
 ┣ 📜 order_items_300.csv
 ┣ 📜 queries.sql
 ┗ 📜 README.md

📈 Future Enhancements

Add payment data

Create Power BI dashboard

Predict customer churn

Sales forecasting

👨‍💻 Author

Priyanshu Choubey
Data Analyst | SQL | Python
