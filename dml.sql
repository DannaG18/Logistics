INSERT INTO countrys 
VALUES ('BRA', 'Brazil');

INSERT INTO citys 
VALUES ('RIO', 'Rio de Janeiro', 'BRA'), (' SAO', 'Sao Paulo', 'BRA'), ('REC', 'Recife', 'BRA');

INSERT INTO branches (name, adress, city_id) 
VALUES ('branch 1', 'Cra 11 #20-02', 'RIO');

INSERT INTO document_type (type) 
VALUES ('Passport'),('Driver License'),('ID Card'),('Birth Certificate'),('Social Security Card');

INSERT INTO clients (name, email, adress, registration_date, document_type_id, city_id) 
VALUES ('Jose Manuel', 'jp_pardo@gmail.com', 'Diamante 2 #12-09', NOW(),3, 'RIO' );

INSERT INTO clients_phones (phone, phone_number_type, client_id) 
VALUES ('123-456-7890', 'Mobile', 1);

INSERT INTO packages (tracking_number, weight, dimensions, content, declared_value, service_type)
VALUES ('ABC123456789', 2.5, '10x8x6 inches', 'Books', 50.00, 'Standard'), ('ABC123456111', 1.0, '10x8x6 inches', 'Socks', 60.00, 'Premier'), ('ABC123456112', 5.0, '10x8x6 inches', 'Chair', 80.00, 'Medium');

INSERT INTO routes (description, branch_id) 
VALUES
('Route 1: Local deliveries', 1),
('Route 2: Regional shipments', 1),
('Route 3: National distribution', 1);
INSERT INTO receivers (name, adress, phone, city_id, document_type_id) 
VALUES
('Maria Silva', 'Rua das Flores, 123', '+55 11 98765-4321', 'RIO', 1),
('José Santos', 'Avenida Brasil, 456', '+55 21 98765-1234', 'RIO', 2),
('Ana Costa', 'Rua das Palmeiras, 789', '+55 31 87654-3210', 'RIO', 1);

INSERT INTO shippings (client_id, package_id, shippingdate, receiver_id, route_id, branch_id) 
VALUES
(1, 1, NOW(), 1, 4, 1),
(1, 1, NOW(), 2, 5, 1),
(1, 1, NOW(), 3, 6, 1);

INSERT INTO brands (name)
VALUES ('Fiat'), ('Toyota'), ('Ford');

INSERT INTO models (id, capacity, reference, year, brand_id)
VALUES ('XYZ456', 2.0, 'Model X', 2023, 1), ('CHJ562',3.0,'Sedan', 2020, 2);

INSERT INTO vehicles (status, mileage, last_inspection, plate, model_id)
VALUES ('1', 50000, '2024-06-20', 'ABC123',  'CHJ562');

INSERT INTO license_type (type)
VALUES ('Type 1'), ('Type 2'), ('Type 3');

INSERT INTO status (status)
VALUES ('Active'), ('Inactive'), ('Suspended');

INSERT INTO drivers (name, number, hire_date, license_type_id, status_id)
VALUES ('John Doe', 'DRV123456', '2023-01-15', 1, 2);

INSERT INTO drivers (name, number, hire_date, license_type_id, status_id)
VALUES ('John Smith', 'DRV2024', '2023-05-15', 1, 2);

INSERT INTO drivers_phones (number, driver_id)
VALUES ('123456789', 1);

INSERT INTO routes (description, branch_id)
VALUES ('Route 1', 1);

INSERT INTO driver_routes (driver_id, route_id, vehicle_id)
VALUES (1, 6, 1);

INSERT INTO assistants_routes (route_id, assistant_id)
VALUES (5, 1);

INSERT INTO tracking (location, date_time, status, package_id)
VALUES ('Warehouse A', '2024-06-21 10:00:00', 'In transit', 1), ('Milkhouse B', '2024-08-21 10:00:00', 'Arrived', 1), ('Lighthouse B', '2024-07-21 10:00:00', 'Received', 1) ;

SELECT c.id AS clientid, c.name AS clientname s.id AS shippingid, s.shippingdate, p.id AS packageid, p.content AS packagecontent, r.id AS receiverid, r.name AS receivername 
FROM shippings AS s
INNER JOIN clients AS c ON c.id = s.client_id
INNER JOIN packages AS p ON p.id = s.package_id
INNER JOIN receivers AS r ON r.id = s.receiver_id
WHERE (c.id = '1');

UPDATE tracking
SET status = 'In transit'
WHERE id = '1';

SELECT t.id AS traking_id, t.location AS location, p.id AS packageid, p.traking_number AS traking_number, p.content AS p_content
FROM tracking AS t
INNER JOIN packages AS p ON p.id = t.package_id;

SELECT c.id AS client_id, c.name AS client_name, p.id AS package_id, p.tracking_number, p.content AS package_content, s.id AS shipping_id, s.shippingdate, re.id AS receiver_id, re.name AS receiver_name, ro.description AS route, d.id AS driver_id, d.name AS driver_name, ro.branch_id AS branch_id, b.name AS branch_name
FROM shippings AS s
INNER JOIN clients AS c ON c.id = s.client_id
INNER JOIN packages AS p ON p.id = s.package_id
INNER JOIN receivers AS re ON re.id = s.receiver_id
INNER JOIN routes AS ro ON ro.id = s.route_id
INNER JOIN drivers AS d ON d.id = d.id
INNER JOIN branches AS b ON b.id = ro.branch_id;

SELECT c.id AS client_id, c.name AS client_name, p.id AS package_id, p.tracking_number AS tracking_number, p.content AS p_content, t.id AS tracking_id, t.location AS location, t.status AS t_status, t.date_time AS date_time
FROM shippings AS s
INNER JOIN clients AS c ON c.id = s.client_id
INNER JOIN packages AS p ON p.id = s.package_id
INNER JOIN tracking AS t ON t.package_id = p.id
WHERE c.id = '1';

-- whats the difference between both

SELECT c.id AS client_id, c.name AS client_name, p.id AS package_id, p.tracking_number AS tracking_number, p.content AS p_content, t.id AS tracking_id, t.location AS location, t.status AS t_status, t.date_time AS date_time
FROM shippings AS s
INNER JOIN clients AS c ON c.id = s.client_id
INNER JOIN packages AS p ON p.id = s.package_id
INNER JOIN tracking AS t ON t.id = t.package_id
WHERE c.id = '1';

SELECT d.id AS driver_id, v.id AS vehicle_id, v.status AS v_status, v.plate AS plate, v.model_id AS model, r.id AS route_id, b.id AS branch_id
FROM drivers AS d
INNER JOIN driver_routes AS dr ON d.id = dr.driver_id
INNER JOIN vehicles AS v ON v.id = dr.vehicle_id
INNER JOIN routes AS r ON r.id = dr.route_id
INNER JOIN branches AS b ON b.id = v.branch_id;

SELECT r.id AS route_id, r.description AS description, a.id AS assistants_id, a.name AS assistant_name
FROM routes AS r
INNER JOIN assistants_routes AS ar ON r.id = ar.route_id
INNER JOIN assistants AS a ON a.id = ar.assistant_id;

SELECT p.id AS package_id, p.tracking_number AS traking_number, p.content AS content, s.branch_id AS branch_id, t.status AS status
FROM packages AS p
INNER JOIN shippings AS s ON p.id = s.branch_id
INNER JOIN tracking AS t ON p.id = t.package_id;

SELECT p.id AS p_id, p.tracking_number AS t_number, p.weight AS weight, p.dimensions AS dimensions, p.content AS content, p.declared_value AS declared_value, p.service_type AS service_type, t.id AS t_id, t.location AS location, t.date_time AS date_time, t.status AS status
FROM packages AS p
INNER JOIN tracking AS t ON p.id = t.package_id;

SELECT p.id AS package_id, p.content AS content, s.id AS shipping_id, s.shippingdate
FROM packages AS p
INNER JOIN shippings AS s ON p.id = s.package_id
WHERE s.shippingdate BETWEEN '2024-06-21 10:00:00' AND '2024-08-21 10:00:00';

SELECT p.id AS package_id, p.content AS content, t.id AS tracking_id, t.status AS status
FROM packages AS p
INNER JOIN tracking AS t ON p.id = t.package_id
WHERE t.status IN ('In transit', 'Received');

SELECT p.id AS package_id, p.content AS content, t.id AS tracking_id, t.status AS status
FROM packages AS p
INNER JOIN tracking AS t ON p.id = t.package_id
WHERE t.status NOT IN ('In transit', 'Received');

SELECT c.id AS client_id, c.name AS name, s.id AS shipping_id, s.shippingdate
FROM clients AS c
INNER JOIN shippings AS s ON c.id = s.client_id
WHERE s.shippingdate BETWEEN '2024-04-23 13:18:36' AND '2024-06-23 21:57:39';

SELECT d.id AS driver_id, d.name AS d_name, dr.route_id AS driver_route, dr.driver_id AS driver_id
FROM drivers AS d
INNER JOIN driver_routes AS dr ON d.id = dr.driver_id
WHERE dr.route_id NOT IN ('4', '5');

SELECT p.id, p.content, p.declared_value
FROM packages AS p
WHERE p.declared_value BETWEEN '50' AND '80';

SELECT as.id AS assistant_id, as.name AS name, r.id AS route_id, r.description AS assistant_route
FROM assistants AS as
INNER JOIN assistants_routes AS ar ON as.id = ar.assistant_id
INNER JOIN routes AS r ON r.id = ar.route_id 
WHERE r.id = '5';

SELECT s.id AS shipping_id, s.client_id, s.package_id, s.shippingdate, s.receiver_id, c.name AS destinycity
FROM shippings AS s
INNER JOIN receivers AS r ON r.id = s.receiver_id
INNER JOIN citys AS c ON c.id = r.city_id
WHERE c.id NOT IN ('SAO','RIO');

SELECT t.id AS tracking_id, p.id AS package_id, t.date_time
FROM tracking AS t
INNER JOIN packages AS p ON p.id = t.package_id
WHERE t.date_time BETWEEN '2024-06-21 10:00:00' AND '2024-08-21 10:00:00';

SELECT c.id AS client_id, s.id AS shipping_id, p.id AS package_id, p.content AS package_content, p.service_type
FROM shippings AS s
INNER JOIN packages AS p ON p.id = s.package_id
INNER JOIN clients AS c ON c.id = s.client_id
WHERE p.service_type IN ('Standard','Medium');

