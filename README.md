# Vehicle Rental Management

A MySQL-based database project for managing a vehicle rental business. This repository contains the database schema, sample data, and query examples for tracking vehicles, customers, rentals, and payments.

## Overview

The system is designed to manage the core operational flow of a rental business:

- Add and track vehicles
- Maintain customer records
- Record rental transactions
- Calculate rental charges and payment status
- Query rental history with filters and analytics

This project is useful for learning relational database design, SQL queries, and realistic data modeling in a rental scenario.

## Features

- Vehicle inventory management
- Customer registration and lookup
- Rental booking and return tracking
- Status tracking for vehicles and rentals
- Payment record management
- Sample SQL queries for common reporting needs
- Analytics examples using SQL window functions

## Database Schema

The database includes the following tables:

- `Vehicles`
  - Vehicle details
  - Rental price per day
  - Availability status
  - Travel timings

- `Customers`
  - Customer personal details
  - Contact information

- `Rentals`
  - Rental booking records
  - Customer and vehicle reference
  - Dates, charges, distance, and status

- `Payments`
  - Payment information related to rentals
  - Payment method and payment date

## File Structure

```text
vehicle-rental-management/
├── vehicle_rental_management.sql   # Database schema, sample data, and SQL examples
├── README.md                       # Project documentation
└── .gitignore                      # Optional repo settings (if added later)
```

## Prerequisites

Before importing the database, ensure you have:

- MySQL 5.7+ or MariaDB
- A MySQL client such as:
  - MySQL Workbench
  - phpMyAdmin
  - Command-line `mysql`

## Setup Instructions

### 1. Clone the repository

```bash
git clone https://github.com/Sai-Niresh/vehicle-rental-management.git
cd vehicle-rental-management
```

### 2. Create a database

```bash
mysql -u root -p -e "CREATE DATABASE vehicle_rental;"
```

### 3. Import the SQL file

```bash
mysql -u root -p vehicle_rental < vehicle_rental_management.sql
```

### 4. Verify the import

```bash
mysql -u root -p -D vehicle_rental -e "SHOW TABLES;"
```

## Example Queries

### List all vehicles

```sql
SELECT * FROM Vehicles;
```

### View rental details with customer and vehicle names

```sql
SELECT
    r.rental_id,
    c.name AS customer_name,
    v.vehicle_name,
    r.rental_date,
    r.return_date
FROM Rentals r
INNER JOIN Customers c ON r.customer_id = c.customer_id
INNER JOIN Vehicles v ON r.vehicle_id = v.vehicle_id;
```

### Check if a vehicle is available

```sql
SELECT vehicle_name,
       IF(status = 'Available', 'Yes', 'No') AS is_available
FROM Vehicles;
```

### Find rentals within a date range

```sql
SELECT *
FROM Rentals
WHERE rental_date BETWEEN '2024-11-01' AND '2024-11-05';
```

### Get payment records for a specific month

```sql
SELECT *
FROM Payments
WHERE payment_date BETWEEN '2025-01-01' AND '2025-01-31';
```

### Rank rentals by total amount

```sql
SELECT
    rental_id,
    customer_id,
    vehicle_id,
    total_amount,
    RANK() OVER (ORDER BY total_amount DESC) AS rank
FROM Rentals;
```

### Running total of rental amounts

```sql
SELECT
    rental_id,
    customer_id,
    vehicle_id,
    rental_date,
    total_amount,
    SUM(total_amount) OVER (ORDER BY rental_date) AS running_total
FROM Rentals;
```

## Project Notes

This project is a practical SQL-based example for a vehicle rental startup or learning exercise. It demonstrates:

- Relational database design
- Foreign key relationships
- Data insertion patterns
- Reporting queries
- SQL window functions and analytics

## Improvements to Consider

The sample database is a strong starting point, but before production use, the following improvements are recommended:

- Add proper primary key definitions for all tables
- Normalize duplicate or inconsistent seed data
- Validate date and time field consistency
- Add indexes on frequently queried columns
- Add constraints for stronger data integrity
- Split the SQL into separate migration files for cleaner versioning

## Use Cases

This repository can be used for:

- Database coursework
- Learning SQL joins and analytics
- Demo systems for rental businesses
- Prototyping backend data models

## License

This project currently does not specify a license. If you plan to distribute or reuse it publicly, consider adding an open-source license such as MIT or Apache 2.0.

## Author

- Sai-Niresh

## Contributing

Contributions are welcome. If you want to improve the schema, add new queries, or fix data quality issues, feel free to fork the repository and create a pull request.

```bash
git checkout -b feature/improvements
```

## Support

If you need help with database setup, schema issues, or query optimization, open an issue in the repository or contact the project maintainer.
