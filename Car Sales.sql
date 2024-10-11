-- 1. Top selling car makes with highest average selling price

SELECT * FROM car_prices cp

SELECT make, AVG(sellingprice) AS avg_selling_price
FROM car_prices cp 
GROUP BY make
ORDER BY avg_selling_price DESC
LIMIT 10;

-- 2. Count of cars sold per state
SELECT state, COUNT(*) AS car_count
FROM car_prices cp 
GROUP BY state
ORDER BY car_count DESC;

-- 3. Most popular car colors by frequency of sale
SELECT color, COUNT(*) AS frequency
FROM car_prices cp 
GROUP BY color
ORDER BY frequency DESC
LIMIT 10;

-- 4. Most frequent sellers
SELECT seller, COUNT(*) AS car_count
FROM car_prices cp 
GROUP BY seller
ORDER BY car_count DESC
LIMIT 10;

-- 5. Top 5 most sold car body types
SELECT body, COUNT(*) AS body_type_count
FROM car_prices cp 
GROUP BY body
ORDER BY body_type_count DESC
LIMIT 5;

-- 6. Cars with highest condition ratings and their selling prices
SELECT make, model, trim, sellingprice, mmr, 
       (sellingprice / mmr) AS value_ratio
FROM car_prices cp 
WHERE mmr > 0
ORDER BY value_ratio DESC
LIMIT 10;

-- 7. Most frequently sold car make and model in each state
SELECT state, make, model, COUNT(*) AS car_count
FROM car_prices cp 
GROUP BY state, make, model
ORDER BY car_count DESC;

-- 8. Cars with the greatest depreciation
SELECT make, model, trim, sellingprice, mmr, 
       (mmr - sellingprice) AS depreciation
FROM car_prices cp 
ORDER BY depreciation DESC
LIMIT 5;

-- 9. Cars with highest mileage to price ratio
SELECT make, model, trim, odometer, sellingprice, 
       (odometer / sellingprice) AS mileage_price_ratio
FROM car_prices cp 
WHERE sellingprice > 0
ORDER BY mileage_price_ratio DESC
LIMIT 10;

-- 10. Average MMR value and selling price per body type
SELECT body, AVG(mmr) AS avg_mmr, AVG(sellingprice) AS avg_sellingprice
FROM car_prices cp 
GROUP BY body
ORDER BY avg_mmr DESC;
