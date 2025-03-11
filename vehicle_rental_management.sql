1. Creating Tables
-- Vehicles Table

CREATE TABLE Vehicles (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_name VARCHAR(50),
    vehicle_type VARCHAR(50),
    price_per_day DECIMAL(10,2) NOT NULL,
    status ENUM('Available', 'Rented', 'Under Maintenance') DEFAULT 'Available',
    departure_time TIME,
    arrival_time TIME,
   time_travelled TIME,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
--Customers Table
CREATE TABLE Customers (
    customer_id int auto_increment key ,
    name VARCHAR(150),
    phone VARCHAR(12),
    email VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
--Rentals Table
CREATE TABLE Rentals (
    rental_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    vehicle_id INT,
    rental_date DATE,
    return_date DATE,
    total_amount DECIMAL(10,2),
    arrival_time TIME NOT NULL,
    departure_time TIME NOT NULL,
    time_travelled TIME NOT NULL,
    kms_travelled DECIMAL(10,2) NOT NULL,
    status ENUM('Ongoing', 'Completed') DEFAULT 'Ongoing',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id)
);
--Payments Table
CREATE TABLE Payments (
    payment_id ,
    rental_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('Credit Card', 'Debit Card', 'Cash', 'UPI') NOT NULL,
    FOREIGN KEY (rental_id) REFERENCES Rentals(rental_id)
);
________________________________________
2. Inserting Data
--Insert Vehicles
INSERT INTO Vehicles ( vehicle_id ,vehicle_name, vehicle_type, price_per_day, status,departure_time,arrival_time,time_travelled,created_at) 
VALUES 
(21, 'Toyota Rumion', 'Sedan', 2000.1, 'Available','08:00:00', '18:00:00', '10:00:00', '2024-11-01 10:00:00'),
(22, 'Tata Nexon', 'SUVs', 1500.1, 'Rented', '10:00:00', '19:00:00', '10:00:00', '2024-12-05 11:20:20'),
(23, 'Toyota Innova Crysta', 'MPV', 3500.2, 'Available','17:00:00', '07:00:00', '10:00:00','2025-01-08 01:40:05'),
(24, 'Hyundai Creta', 'SUV', 1800.0, 'Available','19:00:00', '11:00:00', '08:00:00','2024-11-15 12:00:00'),
(25, 'Mahindra Scorpio', 'SUV', 2500.0, 'Rented','17:00:00', '09:00:00', '08:00:00','2024-11-20 14:00:00'),
(26, 'Maruti Swift', 'Hatchback', 1200.0, 'Under Maintenance', '18:00:00', '10:00:00', '08:00:00','2024-11-25 16:00:00'),
(27, 'Honda City', 'Sedan', 2200.0, 'Available','19:00:00', '11:00:00', '08:00:00','2024-12-01 10:00:00'),
(28, 'Ford Ecosport', 'SUV', 2000.0, 'Available','20:00:00', '12:00:00', '08:00:00','2024-12-05 18:00:00'),
(29, 'Nissan Altima', 'Sedan', 2100.0, 'Available','21:00:00', '13:00:00', '08:00:00','2025-02-01 09:00:00'),
(30, 'Chevrolet Tahoe', 'SUV', 2700.0, 'Rented','22:00:00', '14:00:00', '08:00:00','2025-02-05 11:30:00'),
(31, 'Kia Soul', 'Hatchback', 1400.0, 'Under Maintenance', '23:00:00', '15:00:00', '08:00:00','2025-02-10 13:45:00'),
(32, 'BMW X5', 'SUV', 3000.0, 'Available', '00:00:00', '16:00:00', '08:00:00','2025-02-15 15:00:00'),
(33, 'Audi A4', 'Sedan', 2600.0, 'Available','01:00:00', '17:00:00', '08:00:00','2025-02-20 17:30:00');
--Insert Customers
INSERT INTO Customers (customer_id,name, phone, email,created_at) 
VALUES (
 (101, 'Prakash', '987456123', 'prakash22@gmail.com', '2024-11-01 10:00:00'),
 (102, 'Vijay', '897564231', 'vijaymass4@gmail.com', '2024-12-05 11:20:00'),
(103, 'Pawan Kalyan', '7730099100', 'pawankonidela5@gmail.com', '2025-01-08 01:40:05'),
(104, 'ajith kumar', '917778655', 'thalaajith6@gmail.com', '2024-11-25 16:00:00'), 
(105, 'sai nithin', '9966885544', 'sainithin89@gmail.com', '2024-12-01 10:00:00'),
 (106, 'Rahul Singh', '9876543210', 'rahul.singh@example.com', '2024-11-25 16:00:00'),
(107, ' pradeep', '9123456789', 'sneha.patil@example.com', '2024-12-01 10:00:00'), 
(108, 'Amitabh Bachchan', '9898989898', 'amitabh.bachchan@example.com', '2024-12-05 18:00:00'), 
(109, 'Arjun Reddy', '9945123478', 'arjun.reddy@example.com', '2025-01-10 09:00:00'),
(107, ' pradeep', '9123456789', 'sneha.patil@example.com', '2024-12-01 10:00:00'), 
(108, 'Amitabh Bachchan', '9898989898', 'amitabh.bachchan@example.com', '2024-12-05 18:00:00'), 
(109, 'Arjun Reddy', '9945123478', 'arjun.reddy@example.com', '2025-01-10 09:00:00'),
(110, 'rohit Sharma', '9978665544', 'preeti.sharma@example.com', '2025-01-15 11:30:00'), 
(111, 'Siddharth Malhotra', '9988776655', 'siddharth.malhotra@example.com', '2025-01-20 14:00:00'), 
(112, 'raju Kapoor', '9966554433', 'priya.kapoor@example.com', '2025-01-25 16:30:00'), 
(113, 'Ravi Teja', '9955443322', 'ravi.teja@example.com', '2025-01-30 18:00:00');
 
Insert Rentals
INSERT INTO Rentals (rental_id,customer_id, vehicle_id, rental_date, return_date, total_amount, departure_time, arrival_time, time_travelled, kms_travelled, status,created_at) 
VALUES 
(11, 101, 21, '2024-11-01', '2024-11-05', 10000.1, , '8:00:00',  '18:00:00', '10:00:00', 150.5, 'Completed', '2024-11-01 10:00:00'),
(12, 102, 22, '2024-12-05', '2024-12-12', 20000.2, '10:00:00', '19:00:00', '10:00:00', 200.0, 'Ongoing', '2024-12-05 11:20:00'),
(13, 103, 23, '2025-01-08', '2025-01-15', 250000.3, '17:00:00', '7:00:00', '10:00:00', 250.0, 'Completed', '2025-01-08 01:40:05'),
 (14, 101, 21, '2025-02-01', '2025-02-05', 8000.0, '17:00:00', '09:00:00', '08:00:00', 100.0, 'Completed', '2025-02-01 09:00:00'),
(15, 102, 22, '2025-02-06', '2025-02-10', 10000.0, '18:00:00', '10:00:00', '08:00:00', 150.0, 'Ongoing', '2025-02-06 10:00:00'),
 (16, 103, 23, '2025-02-11', '2025-02-15', 12000.0, '19:00:00', '11:00:00', '08:00:00', 200.0, 'Completed', '2025-02-11 11:00:00'),
(17, 104, 24, '2025-02-16', '2025-02-20', 14000.0, '16:00:00', '08:00:00', '08:00:00', 250.0, 'Ongoing', '2025-02-16 08:00:00'),
 (18, 105, 25, '2025-02-21', '2025-02-25', 16000.0, '17:00:00', '09:00:00', '08:00:00', 300.0, 'Completed', '2025-02-21 09:00:00'),
(19, 106, 26, '2025-02-26', '2025-03-02', 18000.0, '18:00:00', '10:00:00', '08:00:00', 350.0, 'Ongoing', '2025-02-26 10:00:00'), 
(20, 107, 27, '2025-03-03', '2025-03-07', 20000.0, '19:00:00', '11:00:00', '08:00:00', 400.0, 'Completed', '2025-03-03 11:00:00'),
(21, 108, 28, '2025-03-08', '2025-03-12', 22000.0, '20:00:00', '12:00:00', '08:00:00', 450.0, 'Ongoing', '2025-03-08 12:00:00'), 
(22, 109, 29, '2025-03-13', '2025-03-17', 24000.0, '21:00:00', '13:00:00', '08:00:00', 500.0, 'Completed', '2025-03-13 13:00:00'),
 (23, 110, 30, '2025-03-18', '2025-03-22', 26000.0, '22:00:00', '14:00:00', '08:00:00', 550.0, 'Ongoing', '2025-03-18 14:00:00'),
(24, 111, 31, '2025-03-23', '2025-03-27', 28000.0, '23:00:00', '15:00:00', '08:00:00', 600.0, 'Completed', '2025-03-23 15:00:00'), 
(25, 112, 32, '2025-03-28', '2025-04-01', 30000.0, '00:00:00', '16:00:00', '08:00:00', 650.0, 'Ongoing', '2025-03-28 16:00:00'), 
(26, 113, 33, '2025-04-02', '2025-04-06', 32000.0, '01:00:00', '17:00:00', '08:00:00', 700.0, 'Completed', '2025-04-02 17:00:00');
 

Insert Payments
INSERT INTO Payments (payment_id,rental_id, amount, payment_date, payment_timestamp,payment_method)
VALUES 
(51, 11, 10000.1, '2024-11-01', '2024-11-01 10:00:00', 'Credit Card'),
 (52, 13, 25000.3, '2025-01-08', '2025-01-08 01:40:05', 'Debit Card'),
 (53, 14, 8000.0, '2025-02-01', '2025-02-01 09:00:00', 'Credit Card'),
 (54, 15, 10000.0, '2025-02-06', '2025-02-06 10:00:00', 'Debit Card'),
 (55, 16, 12000.0, '2025-02-11', '2025-02-11 11:00:00', 'Cash'),
 (56, 17, 14000.0, '2025-02-16', '2025-02-16 08:00:00', 'UPI'),
 (57, 18, 16000.0, '2025-02-21', '2025-02-21 09:00:00', 'Credit Card'), 
(58, 19, 18000.0, '2025-02-26', '2025-02-26 10:00:00', 'Debit Card'),
 (59, 20, 20000.0, '2025-03-03', '2025-03-03 11:00:00', 'Cash'),
 (60, 21, 22000.0, '2025-03-08', '2025-03-08 12:00:00', 'UPI'),
 (61, 22, 24000.0, '2025-03-13', '2025-03-13 13:00:00', 'Credit Card'),
 (62, 23, 26000.0, '2025-03-18', '2025-03-18 14:00:00', 'Debit Card'),
 (63, 24, 28000.0, '2025-03-23', '2025-03-23 15:00:00', 'Cash'), 
(64, 25, 30000.0, '2025-03-28', '2025-03-28 16:00:00', 'UPI'), 
(65, 26, 32000.0, '2025-04-02', '2025-04-02 17:00:00', 'Credit Card');

 
Modify the Rentals Table to Add the charges Columns:
ALTER TABLE Rentals
ADD COLUMN charges DECIMAL(10,2);
Updating charges for existing rental records:
-- Update rental_id 11 UPDATE Rentals SET rental_date = '2024-11-01', return_date = '2024-11-05', charges = 1500.0 WHERE rental_id = 11;
-- Update rental_id 12 UPDATE Rentals SET rental_date = '2024-12-05', return_date = '2024-12-12', charges = 3000.0 WHERE rental_id = 12;
-- Update rental_id 13 UPDATE Rentals SET rental_date = '2025-01-08', return_date = '2025-01-15', charges = 3000.0 WHERE rental_id = 13;
- Update rental_id 14 UPDATE Rentals SET rental_date = '2025-02-01', return_date = '2025-02-05', charges = 1000.0 WHERE rental_id = 14;
-- Update rental_id 15 UPDATE Rentals SET rental_date = '2025-02-06', return_date = '2025-02-10', charges = 2250.0 WHERE rental_id = 15;
 -- Update rental_id 16 UPDATE Rentals SET rental_date = '2025-02-11', return_date = '2025-02-15', charges = 2400.0 WHERE rental_id = 16;
-- Update rental_id 17 UPDATE Rentals SET rental_date = '2025-02-16', return_date = '2025-02-20', charges = 3750.0 WHERE rental_id = 17; 
-- Update rental_id 18 UPDATE Rentals SET rental_date = '2025-02-21', return_date = '2025-02-25', charges = 4500.0 WHERE rental_id = 18; 
-- Update rental_id 19 UPDATE Rentals SET rental_date = '2025-02-26', return_date = '2025-03-02', charges = 2800.0 WHERE rental_id = 19;
-- Update rental_id 20 UPDATE Rentals SET rental_date = '2025-03-03', return_date = '2025-03-07', charges = 4000.0 WHERE rental_id = 20;
 --update rental_id 21 SET rental_date = '2025-01-01', return_date = '2025-01-05', charges = 6750.0 WHERE rental_id = 21; 
-- Update rental_id 22 UPDATE Rentals SET rental_date = '2025-02-01', return_date = '2025-02-05', charges = 5000.0 WHERE rental_id = 22; 
 --Update rental_id 23 UPDATE Rentals SET rental_date = '2025-03-01', return_date = '2025-03-05', charges = 8250.0 WHERE rental_id = 23; 
 --Update rental_id 24 UPDATE Rentals SET rental_date = '2025-04-01', return_date = '2025-04-05', charges = 4800.0 WHERE rental_id = 24; 
-- Update rental_id 25 UPDATE Rentals SET rental_date = '2025-05-01', return_date = '2025-05-05', charges = 9750.0 WHERE rental_id = 25;
 -- Update rental_id 26 UPDATE Rentals SET rental_date = '2025-06-01', return_date = '2025-06-05', charges = 7000.0 WHERE rental_id = 26;
 

3. Queries
List All Vehicles
SELECT * FROM Vehicles;
 

List All Customers
SELECT * FROM Customers;
 
List All Rentals with Customer and Vehicle Details
    SELECT
 rentals.rental_id,
 customers.name AS customer_name, 
customers.customer_id, 
vehicles.vehicle_id, 
vehicles.vehicle_name, 
rentals.rental_date, 
rentals.return_date
 FROM Rentals 
INNER JOIN Customers ON Rentals.customer_id = Customers.customer_id
 INNER JOIN Vehicles ON Rentals.vehicle_id = Vehicles.vehicle_id;
 
Query to retrieve rental details along with vehicle information and charges
SELECT r.rental_id, v.vehicle_name, v.vehicle_type, r.kms_travelled, r.charges
FROM Rentals r
JOIN Vehicles v ON r.vehicle_id = v.vehicle_id;
 
   Find Rentals Between Specific Dates
SELECT * FROM Rentals WHERE rental_date BETWEEN '2024-11-01' AND '2024-11-05';
 
Check If a Vehicle is Available
SELECT vehicle_name, 
IF(status='Available','Yes','No') AS is_available 
FROM Vehicles;
 
Find Payments Made in January
SELECT * FROM Payments 
WHERE payment_date BETWEEN "2025-01-01" AND "2025-01-31";
 
--AND CONDITION (MULTIPLE CONDITIONS SHOULB BE TRUE)
SELECT *FROM CUSTOMERS WHERE customer_id=103 AND phone:7730099100
 
________________________________________
4. Advanced Queries
Inner Join Query (Customer, Rental, Vehicle, and Payment Details)
SELECT 
    rentals.rental_id,
    rentals.rental_date,
    rentals.return_date,
    vehicles.vehicle_name,
    vehicles.vehicle_type,
    customers.name AS customer_name,
    customers.phone AS customer_phone,
    payments.amount AS payment_amount,
    payments.payment_date,
    payments.payment_method,
FROM Rentals
INNER JOIN Vehicles ON Rentals.vehicle_id = Vehicles.vehicle_id
INNER JOIN Customers ON Rentals.customer_id = Customers.customer_id
INNER JOIN Payments ON Rentals.rental_id = Payments.rental_id
ORDER BY Rentals.rental_id;
 
--window function
Ranking Rentals Based on Total Amount
SELECT 
    rental_id,
    customer_id,
    vehicle_id,
    rental_date,
    return_date,
    total_amount,
    RANK() OVER (ORDER BY total_amount DESC) AS rank
FROM Rentals;
 
Calculate Running Total of Rental Amounts
SELECT 
    rental_id,
    customer_id,
    vehicle_id,
    rental_date,
    return_date,
    total_amount,
    SUM(total_amount) OVER (ORDER BY rental_date) AS running_total
FROM Rentals;
 
Calculate Average Rental Amount Per Vehicle
SELECT 
    rental_id,
    customer_id,
    vehicle_id,
    rental_date,
    return_date,
    total_amount,
    AVG(total_amount) OVER (PARTITION BY vehicle_id ORDER BY rental_date) AS avg_rental_amount
FROM Rentals;
 
Assign Row Numbers to Each Rental
SELECT 
    rental_id,
    customer_id,
    vehicle_id,
    rental_date,
    return_date,
    total_amount,
    ROW_NUMBER() OVER (ORDER BY rental_date) AS row_num
 
FROM Rentals;
