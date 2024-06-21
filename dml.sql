INSERT INTO countrys 
VALUES ('BRA', 'Brazil');

INSERT INTO citys 
VALUES ('RIO', 'Rio de Janeiro', 'BRA');

INSERT INTO branches (name, adress, city_id) 
VALUES ('branch 1', 'Cra 11 #20-02', 'RIO');

INSERT INTO document_type (type) 
VALUES ('Passport'),('Driver License'),('ID Card'),('Birth Certificate'),('Social Security Card');

INSERT INTO clients (name, email, adress, registration_date, document_type_id, city_id) 
VALUES ('Jose Manuel', 'jp_pardo@gmail.com', 'Diamante 2 #12-09', NOW(),3, 'RIO' );

INSERT INTO clients_phones (phone, phone_number_type, client_id) 
VALUES ('123-456-7890', 'Mobile', 1);

INSERT INTO packages (tracking_number, weight, dimensions, content, declared_value, service_type)
VALUES ('ABC123456789', 2.5, '10x8x6 inches', 'Books', 50.00, 'Standard');

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

INSERT INTO shippings (client_id, package_id, shippingdate, receiver_id, route_id) 
VALUES
(1, 1, NOW(), 1, 4),
(1, 1, NOW(), 2, 5),
(1, 1, NOW(), 3, 6);

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

INSERT INTO driver_routes (driver_id, route_id, vehicule_id)
VALUES (1, 4, 6);

INSERT INTO assistants_routes (route_id, assistant_id)
VALUES (5, 1);

INSERT INTO tracking (location, date_time, status, package_id)
VALUES ('Warehouse A', '2024-06-21 10:00:00', 'In transit', 1);

SELECT cli.id, shi.id
FROM shippings AS shi
INNER JOIN clients AS cli ON shi.id = cli.client_id
WHERE (cli.id = 1)

