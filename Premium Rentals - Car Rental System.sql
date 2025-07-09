CREATE DATABASE premium_rentals;
USE premium_rentals;
-- Create All Tables


-- Table: customers
-- Stores customer information
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    driver_license VARCHAR(50),
    address TEXT
);

-- Table: locations
-- Stores rental locations like branches or cities
CREATE TABLE locations (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100)
);

-- Table: cars
-- Stores car details and their availability
CREATE TABLE cars (
    car_id INT AUTO_INCREMENT PRIMARY KEY,
    model VARCHAR(100),
    brand VARCHAR(100),
    year INT,
    license_plate VARCHAR(20),
    daily_rate DECIMAL(10,2),
    availability BOOLEAN,
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

-- Table: rentals
-- Stores rental transaction info
CREATE TABLE rentals (
    rental_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    rental_date DATE,
    return_date DATE,
    total_cost DECIMAL(10,2),
    location_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

-- Table: rental_items
-- Links cars to rentals (1 rental can include multiple cars)
CREATE TABLE rental_items (
    rental_item_id INT AUTO_INCREMENT PRIMARY KEY,
    rental_id INT,
    car_id INT,
    days_rented INT,
    subtotal DECIMAL(10,2),
    FOREIGN KEY (rental_id) REFERENCES rentals(rental_id),
    FOREIGN KEY (car_id) REFERENCES cars(car_id)
);

-- Table: payments
-- Stores payment info for rentals
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    rental_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    method VARCHAR(50),
    FOREIGN KEY (rental_id) REFERENCES rentals(rental_id)
);

-- Insert into customers
INSERT INTO customers (full_name, email, phone, driver_license, address) VALUES
('Ali Khan', 'ali.khan@gmail.com', '9876543210', 'DL123456789', 'Hyderabad, India'),
('Sara Roy', 'sara.roy@gmail.com', '9123456780', 'DL987654321', 'Delhi, India'),
('John David', 'john.david@gmail.com', '9785612345', 'DL456789123', 'Mumbai, India');

-- Insert into locations
INSERT INTO locations (city, state, country) VALUES
('Hyderabad', 'Telangana', 'India'),
('Delhi', 'Delhi', 'India'),
('Mumbai', 'Maharashtra', 'India');

-- Insert into cars
INSERT INTO cars (model, brand, year, license_plate, daily_rate, availability, location_id) VALUES
('Swift Dzire', 'Maruti Suzuki', 2020, 'TS09AB1234', 1200.00, TRUE, 1),
('Innova Crysta', 'Toyota', 2021, 'DL01CD5678', 2500.00, TRUE, 2),
('Creta', 'Hyundai', 2022, 'MH12EF9012', 2200.00, TRUE, 3),
('Baleno', 'Maruti Suzuki', 2020, 'TS08GH3456', 1500.00, FALSE, 1);

-- Insert into rentals
INSERT INTO rentals (customer_id, rental_date, return_date, total_cost, location_id) VALUES
(1, '2025-07-01', '2025-07-04', 3600.00, 1),
(2, '2025-07-02', '2025-07-05', 7500.00, 2),
(3, '2025-07-03', '2025-07-04', 2200.00, 3);

-- Insert into rental_items
INSERT INTO rental_items (rental_id, car_id, days_rented, subtotal) VALUES
(1, 1, 3, 3600.00),
(2, 2, 3, 7500.00),
(3, 3, 1, 2200.00);

-- Insert into payments
INSERT INTO payments (rental_id, payment_date, amount, method) VALUES
(1, '2025-07-01', 3600.00, 'Credit Card'),
(2, '2025-07-02', 7500.00, 'UPI'),
(3, '2025-07-03', 2200.00, 'Cash');

-- View all customers
SELECT * FROM customers;

-- View all locations
SELECT * FROM locations;

-- View all rentals
SELECT * FROM rentals;

-- View all cars
SELECT * FROM cars;

-- View all rental items
SELECT * FROM rental_items;

-- View all payments
SELECT * FROM payments;

SHOW TABLES;







