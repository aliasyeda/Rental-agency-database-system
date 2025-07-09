# Rental-agency-database-system

Premium Rentals - Car Rental System (SQL Database Project)

This project demonstrates a professional relational database system built using MySQL for a **car rental business**. It includes real-world features like customer records, vehicle management, bookings, payments, and multi-branch location support.

---

## 📌 Project Features

- Customer information storage
- Car inventory management with availability
- Rental transactions per location
- Multiple cars per rental via rental items
- Payment tracking for each rental
- Foreign key relationships between tables

---

## 🧱 Tables Created

| Table Name      | Description                            |
|-----------------|----------------------------------------|
| `customers`      | Stores customer personal details       |
| `locations`      | Rental branches in different cities    |
| `cars`           | Cars available for rent                |
| `rentals`        | Records of car rentals by customers    |
| `rental_items`   | Links cars to rental records           |
| `payments`       | Payment details for each rental        |

---

## ⚙️ Technologies Used

- MySQL
- MySQL Workbench

---

## 📂 File Structure

- `Premium Rentals - Car Rental System..sql` – Full SQL file with database, tables, and sample data
  
- `README.md` – This file

---

## 🔍 Sample Queries

```sql
-- View all cars in a specific location
SELECT * FROM cars WHERE location_id = 1;

-- Show all rentals with customer name
SELECT r.rental_id, c.full_name, r.rental_date, r.total_cost
FROM rentals r
JOIN customers c ON r.customer_id = c.customer_id;

-- View all payments made using UPI
SELECT * FROM payments WHERE method = 'UPI';

## 🔗 Author

Developed by [Syeda Alia Samia](https://github.com/aliasyeda)


