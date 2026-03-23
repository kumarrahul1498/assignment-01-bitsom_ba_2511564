## Architecture Recommendation

I would recommend a Data Lakehouse for this food delivery startup. The company is dealing with highly varied data types: GPS location logs, text reviews, payment transactions, and restaurant menu images. A traditional data warehouse is excellent for structured BI reporting, but it is not ideal as the primary landing zone for raw images, semi-structured logs, and rapidly growing event streams. A pure data lake is flexible and cheap, but without stronger table management it can become hard to govern and query reliably as the business scales.

A Lakehouse gives the startup the best balance of flexibility and analytics readiness. First, it can store all raw data types in one architecture, including structured transaction records, semi-structured app events, unstructured text, and image files. Second, it supports downstream analytics and machine learning more effectively. Analysts can use curated tables for reporting on delivery times, customer retention, or payment success rates, while data scientists can still access raw reviews and images for recommendation, fraud, or computer-vision models.

Third, a Lakehouse improves governance and performance compared with a plain lake. Features such as schema enforcement, ACID-style table updates, and versioned datasets help maintain trust in business reporting while preserving low-cost object storage underneath. That matters for a fast-growing startup where operational data changes quickly and multiple teams need access.

So the best fit is a Data Lakehouse: raw ingestion for flexibility, curated analytical layers for BI, and shared infrastructure that supports both SQL analytics and AI/ML use cases.
