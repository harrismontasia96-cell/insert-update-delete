DROP DATABASE IF EXISTS car_dealership;
CREATE DATABASE car_dealership;
USE car_dealership;

CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50),
    phone VARCHAR(12)
);

CREATE TABLE vehicles (
    VIN VARCHAR(17) PRIMARY KEY,
    make VARCHAR(30),
    model VARCHAR(30),
    year INT,
    price DECIMAL(10,2),
    color VARCHAR(20),
    SOLD BOOLEAN DEFAULT FALSE
);

CREATE TABLE inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    dealership_id INT,
    VIN VARCHAR(17),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

CREATE TABLE sales_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    buyer_name VARCHAR(50),
    sale_price DECIMAL(10,2),
    sale_date DATE,
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);


CREATE TABLE lease_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    lessee_name VARCHAR(50),
    monthly_payment DECIMAL(10,2),
    lease_term_months INT,
    start_date DATE,
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

INSERT INTO dealerships (name, address, phone) VALUES
('Auto Plaza', '123 Main St', '555-111-2222'),
('Monajia Motors', '456 Market Ave', '555-333-4444'),
('Cheap Cars', '789 Oak Blvd', '555-555-6666');

INSERT INTO vehicles (VIN, make, model, year, price, color, SOLD) VALUES
('1HGCM82633A123456', 'Honda', 'Accord', 2018, 17500.00, 'Black', FALSE),
('2T3ZF4DV9BW123789', 'Toyota', 'RAV4', 2020, 26000.00, 'Silver', FALSE),
('1FAFP40413F123987', 'Ford', 'Mustang', 2019, 30000.00, 'Red', TRUE),
('5YJ3E1EA7KF318999', 'Tesla', 'Model 3', 2022, 42000.00, 'White', FALSE),
('WDBRF40J73F440222', 'Mercedes', 'C-Class', 2017, 23000.00, 'Blue', TRUE);

INSERT INTO inventory (dealership_id, VIN) VALUES
(1, '1HGCM82633A123456'),
(1, '2T3ZF4DV9BW123789'),
(2, '1FAFP40413F123987'),
(2, '5YJ3E1EA7KF318999'),
(3, 'WDBRF40J73F440222');

INSERT INTO sales_contracts (VIN, buyer_name, sale_price, sale_date) VALUES
('1FAFP40413F123987', 'John Carter', 29500.00, '2024-01-15'),
('WDBRF40J73F440222', 'Emily Stone', 22000.00, '2024-02-01');

