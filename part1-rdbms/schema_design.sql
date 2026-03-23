DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS sales_reps;
DROP TABLE IF EXISTS offices;

-- Part 1: 3NF schema design

CREATE TABLE offices (
    office_id VARCHAR(10) PRIMARY KEY,
    office_name VARCHAR(100) NOT NULL,
    office_address VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL
);

CREATE TABLE sales_reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(150) NOT NULL UNIQUE,
    office_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (office_id) REFERENCES offices(office_id)
);

CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(150) NOT NULL UNIQUE,
    customer_city VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE orders (
    order_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

CREATE TABLE order_items (
    order_item_id INTEGER PRIMARY KEY,
    order_id VARCHAR(20) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INTEGER NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO offices (office_id, office_name, office_address, city) VALUES
('OF001', 'Mumbai HQ', 'Mumbai HQ, Nariman Point, Mumbai - 400021', 'Mumbai'),
('OF002', 'Delhi Office', 'Delhi Office, Connaught Place, New Delhi - 110001', 'Delhi'),
('OF003', 'South Zone', 'South Zone, MG Road, Bangalore - 560001', 'Bangalore'),
('OF004', 'Hyderabad Office', 'Hyderabad Office, Banjara Hills, Hyderabad - 500034', 'Hyderabad'),
('OF005', 'Chennai Office', 'Chennai Office, T Nagar, Chennai - 600017', 'Chennai');

INSERT INTO sales_reps (sales_rep_id, sales_rep_name, sales_rep_email, office_id) VALUES
('SR01', 'Deepak Joshi', 'deepak@corp.com', 'OF001'),
('SR02', 'Anita Desai', 'anita@corp.com', 'OF002'),
('SR03', 'Ravi Kumar', 'ravi@corp.com', 'OF003'),
('SR04', 'Meera Shah', 'meera@corp.com', 'OF004'),
('SR05', 'Karan Patel', 'karan@corp.com', 'OF005');

INSERT INTO customers (customer_id, customer_name, customer_email, customer_city) VALUES
('C001', 'Rohan Mehta', 'rohan@gmail.com', 'Mumbai'),
('C002', 'Priya Sharma', 'priya@gmail.com', 'Delhi'),
('C003', 'Amit Verma', 'amit@gmail.com', 'Bangalore'),
('C004', 'Sneha Iyer', 'sneha@gmail.com', 'Chennai'),
('C005', 'Vikram Singh', 'vikram@gmail.com', 'Mumbai');

INSERT INTO products (product_id, product_name, category, unit_price) VALUES
('P001', 'Laptop', 'Electronics', 55000.00),
('P002', 'Mouse', 'Electronics', 800.00),
('P003', 'Desk Chair', 'Furniture', 8500.00),
('P004', 'Notebook', 'Stationery', 120.00),
('P005', 'Headphones', 'Electronics', 3200.00),
('P006', 'Standing Desk', 'Furniture', 22000.00),
('P007', 'Pen Set', 'Stationery', 250.00),
('P008', 'Webcam', 'Electronics', 2100.00),
('P009', 'Whiteboard', 'Stationery', 1500.00);

INSERT INTO orders (order_id, customer_id, sales_rep_id, order_date) VALUES
('ORD1002', 'C002', 'SR02', '2023-01-17'),
('ORD1027', 'C002', 'SR02', '2023-11-02'),
('ORD1030', 'C005', 'SR01', '2023-04-11'),
('ORD1048', 'C003', 'SR03', '2023-02-08'),
('ORD1114', 'C001', 'SR01', '2023-08-06');

INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES
(1, 'ORD1002', 'P005', 1),
(2, 'ORD1027', 'P004', 4),
(3, 'ORD1030', 'P003', 2),
(4, 'ORD1048', 'P002', 5),
(5, 'ORD1114', 'P007', 2),
(6, 'ORD1114', 'P008', 1);
