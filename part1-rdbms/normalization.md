## Anomaly Analysis

### Insert Anomaly
Because customer, product, and sales-rep details are stored in a single flat row, the business cannot insert a new product unless an order exists for it. For example, the columns `product_id`, `product_name`, `category`, `unit_price`, `customer_id`, and `order_id` all appear in the same row. If the company wants to add a new product like a whiteboard, there is no place to store it without creating a fake order row. Rows such as **row 1 (`ORD1027`)** and **row 2 (`ORD1114`)** show that a product record only exists when tied to an order.

### Update Anomaly
Sales representative `SR01` (Deepak Joshi) appears many times, but the `office_address` is not stored consistently. In **row 2 (`ORD1114`)**, the value is `Mumbai HQ, Nariman Point, Mumbai - 400021`, while in **row 38 (`ORD1180`)**, the value is `Mumbai HQ, Nariman Pt, Mumbai - 400021`. Because the same fact is repeated across multiple rows, updating the office address in only some rows creates inconsistent data.

### Delete Anomaly
If the only row for a particular order line is deleted, important master data is also lost. For example, **row 4 (`ORD1002`)** stores the order, customer `C002`, product `P005` (`Headphones`), and sales rep `SR02` together. Deleting that row removes not just the order record but also the association showing that product `P005` exists and that `SR02` handled this transaction. In a normalized design, deleting an order line should not delete customer, product, or employee master data.

## Normalization Justification
Keeping everything in one table may look simpler at first, but this dataset shows why that approach becomes risky very quickly. In the flat file, customer details, product details, order details, and sales-representative details are repeated across many rows. That repetition increases storage, but more importantly, it creates inconsistency risk. A clear example is `SR01`, where the office address appears both as “Nariman Point” and “Nariman Pt.” This is an update anomaly because a single business fact is stored in multiple places and can drift over time.

The same structure also causes insert and delete problems. A new product cannot be added unless it is attached to an order row, which is not good master-data design. Likewise, deleting a row for an order line can accidentally remove the only stored copy of a product-customer-sales-rep combination. In a real retail system, orders should be transactional data, while customers, products, and employees should be maintained independently.

Normalizing to 3NF fixes this by separating entities into logical tables such as `customers`, `products`, `sales_reps`, `orders`, and `order_items`. Each table stores one type of fact, and foreign keys connect them cleanly. This design reduces duplication, prevents inconsistent updates, allows independent inserts for master data, and preserves history even when a transaction row is removed. In this dataset, normalization is not over-engineering; it is the safer and more scalable design choice.