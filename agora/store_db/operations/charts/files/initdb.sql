CREATE SCHEMA IF NOT EXISTS contoso;
CREATE TABLE IF NOT EXISTS contoso.products (productId SERIAL PRIMARY KEY, name text, description text, price numeric, stock int, photopath text, category text);
CREATE TABLE IF NOT EXISTS contoso.Orders (orderID SERIAL PRIMARY KEY, orderDate timestamp, orderdetails JSON, storeId INT, cloudsynced BOOLEAN DEFAULT FALSE);
CREATE TABLE IF NOT EXISTS contoso.checkout_type (id SERIAL PRIMARY KEY, name TEXT NOT NULL);
CREATE TABLE IF NOT EXISTS contoso.checkout (id INTEGER PRIMARY KEY, type INTEGER REFERENCES contoso.checkout_type(id), avgprocessingtime INTEGER, closed BOOLEAN);
CREATE TABLE IF NOT EXISTS contoso.checkout_history (timestamp TIMESTAMPTZ, checkout_id INT REFERENCES contoso.checkout(id), checkout_type INT, queue_length INT, average_wait_time_seconds INT, PRIMARY KEY (timestamp, checkout_id));
CREATE TABLE IF NOT EXISTS contoso.cameras (id SERIAL PRIMARY KEY, name text, description text);
CREATE TABLE IF NOT EXISTS contoso.zones (id SERIAL PRIMARY KEY, name text, description text);
CREATE TABLE IF NOT EXISTS contoso.ovens (id SERIAL PRIMARY KEY, name text, description text);
CREATE TABLE IF NOT EXISTS contoso.fridges (id SERIAL PRIMARY KEY, name text, description text);

-- seeding contoso.cameras
INSERT INTO contoso.cameras (name, description)
SELECT *
FROM (VALUES
    ('Camera 1', 'Entrance Camera'),
    ('Camera 2', 'Checkout Camera'),
    ('Camera 3', 'Fridge Camera'),
    ('Camera 4', 'Oven Camera')
) AS data
WHERE NOT EXISTS (SELECT 1 FROM contoso.cameras);

-- seeding contoso.zones
INSERT INTO contoso.zones (name, description)
SELECT *
FROM (VALUES
    ('Zone 1', 'Fruit Section'),
    ('Zone 2', 'Vegetable Section'),
    ('Zone 3', 'Bread Section'),
    ('Zone 4', 'Dairy Section'),
    ('Zone 5', 'Beverage Section'),
    ('Zone 6', 'Snack Section'),
    ('Zone 7', 'Egg Section')
) AS data
WHERE NOT EXISTS (SELECT 1 FROM contoso.zones);

-- seeding contoso.ovens
INSERT INTO contoso.ovens (name, description)
SELECT *
FROM (VALUES
    ('Oven 1', 'Bread Oven'),
    ('Oven 2', 'Pizza Oven'),
    ('Oven 3', 'Cake Oven')
) AS data
WHERE NOT EXISTS (SELECT 1 FROM contoso.ovens);

-- seeding contoso.fridges
INSERT INTO contoso.fridges (name, description)
SELECT *
FROM (VALUES
    ('Fridge 1', 'Fruit Fridge'),
    ('Fridge 2', 'Vegetable Fridge'),
    ('Fridge 3', 'Dairy Fridge'),
    ('Fridge 4', 'Beverage Fridge'),
    ('Fridge 5', 'Snack Fridge'),
    ('Fridge 6', 'Egg Fridge')
) AS data
WHERE NOT EXISTS (SELECT 1 FROM contoso.fridges);

-- seeding contoso.checkout_type
INSERT INTO contoso.checkout_type (id, name)
SELECT *
FROM (VALUES
    (1,'Standard'),
    (2, 'Express'),
    (3, 'SelfService')
) AS data
WHERE NOT EXISTS (SELECT 1 FROM contoso.checkout_type);

-- seeding contoso.checkout
INSERT INTO contoso.checkout (id, type, avgprocessingtime, closed)
SELECT *
FROM (VALUES
    (1, 1, 60, false),
    (2, 1, 60, true),
    (3, 2, 30, false),
    (4, 2, 30, true),
    (5, 3, 45, false),
    (6, 3, 45, false),
    (7, 3, 45, true),
    (8, 3, 45, true)
) AS data
WHERE NOT EXISTS (SELECT 1 FROM contoso.checkout);

-- seeding contoso.products
INSERT INTO contoso.products (name, description, price, stock, photopath, category)
SELECT *
FROM (VALUES
    ('Red Apple', 'Contoso Fresh Fuji Red Apples', 0.5, 10000, 'static/img/product1.png', 'Fruits'),
    ('Banana', 'Contoso Fresh Cavendish Bananas', 1, 10000, 'static/img/product2.png', 'Fruits'),
    ('Avocado', 'Contoso Fresh Hass Avocado', 1.5, 10000, 'static/img/product3.png', 'Vegetables'),
    ('Bread', 'Instore Bakery Fresh Bread Rolls 6 pack', .80, 10000, 'static/img/product4.png', 'Bread'),
    ('Milk', 'Contoso Full Milk', 0.95, 10000, 'static/img/product5.png', 'Dairy'),
    ('Orange Juice', 'Contoso Premium Juice', 4, 10000, 'static/img/product6.png', 'Beverages'),
    ('Chips', 'Contoso Crinkle Cut Chips', 2.0, 10000, 'static/img/product7.png', 'Snacks'),
    ('Red Pepper', 'Contoso Fresh Red Pepper', 3.5, 10000, 'static/img/product8.png', 'Vegetables'),
    ('Lettuce', 'Fresh Vegetable Cos Lettuce', 7, 10000, 'static/img/product9.png', 'Vegetables'),
    ('Tomato', 'Contoso Fresh Vine Tomatoes', 1, 10000, 'static/img/product10.png', 'Vegetables'),
    ('Strawberry', 'Contoso Fresh Allstar Strawberries', 1, 10000, 'static/img/product11.png', 'Fruit'),
    ('Eggs', 'Free Range Contoso Dozen Eggs', 1, 10000, 'static/img/product12.png', 'Eggs'),
    ('Lemon', 'Contoso Lisbon Lemons', 1, 10000, 'static/img/product13.png', 'Fruit')
) AS data
WHERE NOT EXISTS (SELECT 1 FROM contoso.products);