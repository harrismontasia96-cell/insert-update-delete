USE car_dealership;

SELECT d.name AS dealership_name,
       v.make,
       v.model,
       v.year,
       s.buyer_name,
       s.sale_price,
       s.sale_date
FROM sales_contracts s
JOIN vehicles v ON s.VIN = v.VIN
JOIN inventory i ON v.VIN = i.VIN
JOIN dealerships d ON i.dealership_id = d.dealership_id
WHERE d.dealership_id = 1
  AND s.sale_date BETWEEN '2024-01-01' AND '2024-12-31';