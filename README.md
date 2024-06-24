# Sistema de Gestión de Distribución de Paquetes para una Empresa de Logística

![logistics_diagram](https://github.com/DannaG18/Logistics/blob/main/logistics.jpg)

#### Caso de uso 1: Registrar un Nuevo País

**Descripción:** Un administrador desea agregar un nuevo país a la base de datos.

```SQL
INSERT INTO countrys 
VALUES ('BRA', 'Brazil');
```

#### Caso de Uso 2: Registrar una Nueva Ciudad

**Descripción:** Un administrador desea agregar una nueva ciudad asociada a un país existente.

```SQL
INSERT INTO citys 
VALUES ('RIO', 'Rio de Janeiro', 'BRA');
```

#### Caso de Uso 3: Registrar una Nueva Sucursal

**Descripción:** Un administrador desea agregar una nueva sucursal asociada a una ciudad
existente.

```SQL
INSERT INTO branches (name, adress, city_id) 
VALUES ('branch 1', 'Cra 11 #20-02', 'RIO');
```

#### Caso de Uso 4: Registrar un Nuevo Cliente

**Descripción:** Un administrador desea registrar un nuevo cliente en la base de datos.

```sql
INSERT INTO clients (name, email, adress, registration_date, document_type_id, city_id) 
VALUES ('Jose Manuel', 'jp_pardo@gmail.com', 'Diamante 2 #12-09', NOW(),3, 'RIO' );
```

**Caso de Uso 5: Registrar un Nuevo Teléfono para un Cliente** 

**Descripción:** Un administrador desea agregar un número de teléfono para un cliente existente. 

```sql
INSERT INTO clients_phones (phone, phone_number_type, client_id) 
VALUES ('123-456-7890', 'Mobile', 1);
```

**Caso de Uso 6: Registrar un Nuevo Paquete** 

**Descripción:** Un administrador desea registrar un nuevo paquete en la base de datos. 

```sql
INSERT INTO packages (tracking_number, weight, dimensions, content, declared_value, service_type)
VALUES 
('ABC123456789', 2.5, '10x8x6 inches', 'Books', 50.00, 'Standard'), ('ABC123456111', 1.0, '10x8x6 inches', 'Socks', 60.00, 'Premier'), ('ABC123456112', 5.0, '10x8x6 inches', 'Chair', 80.00, 'Medium');
```

**Caso de Uso 7: Registrar un Nuevo Envío** 

**Descripción:** Un administrador desea registrar un nuevo envío, asociando un cliente, paquete, ruta y sucursal. 

```sql
INSERT INTO shippings (client_id, package_id, shippingdate, receiver_id, route_id, branch_id) 
VALUES
(1, 1, NOW(), 1, 4, 1),
(1, 1, NOW(), 2, 5, 1),
(1, 1, NOW(), 3, 6, 1);
```

**Caso de Uso 8: Registrar un Nuevo Vehículo** 

**Descripción:** Un administrador desea agregar un nuevo vehículo a la base de datos.

```sql
INSERT INTO vehicles (status, mileage, last_inspection, plate, model_id)
VALUES ('1', 50000, '2024-06-20', 'ABC123',  'CHJ562');
```

 **Caso de Uso 9: Registrar un Nuevo Conductor** 

**Descripción:** Un administrador desea agregar un nuevo conductor a la base de datos. 

```sql
INSERT INTO drivers (name, number, hire_date, license_type_id, status_id)
VALUES ('John Doe', 'DRV123456', '2023-01-15', 1, 2);
```

**Caso de Uso 10: Registrar un Nuevo Teléfono para un Conductor** 

**Descripción:** Un administrador desea agregar un número de teléfono para un conductor existente. 

```sql
INSERT INTO drivers_phones (number, driver_id)
VALUES ('123456789', 1);
```

**Caso de Uso 11: Asignar un Conductor a una Ruta y un Vehículo** 

**Descripción:** Un administrador desea asignar un conductor a una ruta específica utilizando un vehículo. 

```sql
INSERT INTO driver_routes (driver_id, route_id, vehicle_id)
VALUES (1, 6, 1);
```

**Caso de Uso 12: Registrar un Nuevo Auxiliar** 

**Descripción:** Un administrador desea agregar un nuevo auxiliar de reparto a la base de datos.

```sql
INSERT INTO assistants (name, phone, document_type_id) VALUES 
('Laura Taylor', '901-234-5678', 2),
('Daniel Anderson', '012-345-6789', 1);
```

 **Caso de Uso 13: Asignar un Auxiliar a una Ruta** **Descripción:** Un administrador desea asignar un auxiliar de reparto a una ruta específica. 

```sql
INSERT INTO assistants_routes (route_id, assistant_id)
VALUES (5, 1);
```

**Caso de Uso 14: Registrar un Evento de Seguimiento para un Paquete** 

**Descripción:** Un administrador desea registrar un evento de seguimiento para un paquete.

```sql
INSERT INTO tracking (location, date_time, status, package_id)
VALUES 
('Warehouse A', '2024-06-21 10:00:00', 'In transit', 1),
('Milkhouse B', '2024-08-21 10:00:00', 'Arrived', 1), 
('Lighthouse B', '2024-07-21 10:00:00', 'Received', 1);
```

**Caso de Uso 15: Generar un Reporte de Envíos por Cliente** 

**Descripción:** Un administrador desea generar un reporte de todos los envíos realizados por un cliente específico. 

```sql
SELECT c.id AS clientid, c.name AS clientname s.id AS shippingid, s.shippingdate, p.id AS packageid, p.content AS packagecontent, r.id AS receiverid, r.name AS receivername 
FROM shippings AS s
INNER JOIN clients AS c ON c.id = s.client_id
INNER JOIN packages AS p ON p.id = s.package_id
INNER JOIN receivers AS r ON r.id = s.receiver_id
WHERE (c.id = '1');
```

**Caso de Uso 16: Actualizar el Estado de un Paquete**

 **Descripción:** Un administrador desea actualizar el estado de un paquete específico. 

```sql
UPDATE tracking
SET status = 'In transit'
WHERE id = '1';
```

**Caso de Uso 17: Rastrear la Ubicación Actual de un Paquete** **Descripción:** Un administrador desea rastrear la ubicación actual de un paquete específico. 

```sql
SELECT t.id AS traking_id, t.location AS location, p.id AS packageid, p.traking_number AS traking_number, p.content AS p_content
FROM tracking AS t
INNER JOIN packages AS p ON p.id = t.package_id;
```

**Casos Multitabla** 

**Caso de Uso 1: Obtener Información Completa de Envíos** 

**Descripción:** Un administrador desea obtener la información completa de todos los envíos, incluyendo detalles del cliente, paquete, ruta, conductor, y sucursal. 

```sql
SELECT c.id AS client_id, c.name AS client_name, p.id AS package_id, p.tracking_number, p.content AS package_content, s.id AS shipping_id, s.shippingdate, re.id AS receiver_id, re.name AS receiver_name, ro.description AS route, d.id AS driver_id, d.name AS driver_name, ro.branch_id AS branch_id, b.name AS branch_name
FROM shippings AS s
INNER JOIN clients AS c ON c.id = s.client_id
INNER JOIN packages AS p ON p.id = s.package_id
INNER JOIN receivers AS re ON re.id = s.receiver_id
INNER JOIN routes AS ro ON ro.id = s.route_id
INNER JOIN drivers AS d ON d.id = d.id
INNER JOIN branches AS b ON b.id = ro.branch_id;
```

**Caso de Uso 2: Obtener Historial de Envíos de un Cliente** 

**Descripción:** Un administrador desea obtener el historial completo de envíos de un cliente específico, incluyendo detalles de los paquetes y los eventos de seguimiento. 

```sql
SELECT c.id AS client_id, c.name AS client_name, p.id AS package_id, p.tracking_number AS tracking_number, p.content AS p_content, t.id AS tracking_id, t.location AS location, t.status AS t_status, t.date_time AS date_time
FROM shippings AS s
INNER JOIN clients AS c ON c.id = s.client_id
INNER JOIN packages AS p ON p.id = s.package_id
INNER JOIN tracking AS t ON t.package_id = p.id
WHERE c.id = '1';
```

**Caso de Uso 3: Listar Conductores y sus Rutas Asignadas** 

**Descripción:** Un administrador desea obtener una lista de todos los conductores y las rutas a las que están asignados, incluyendo detalles del vehículo utilizado y la sucursal correspondiente. 

```sql
SELECT d.id AS driver_id, v.id AS vehicle_id, v.status AS v_status, v.plate AS plate, v.model_id AS model, r.id AS route_id, b.id AS branch_id
FROM drivers AS d
INNER JOIN driver_routes AS dr ON d.id = dr.driver_id
INNER JOIN vehicles AS v ON v.id = dr.vehicle_id
INNER JOIN routes AS r ON r.id = dr.route_id
INNER JOIN branches AS b ON b.id = v.branch_id;
```

**Caso de Uso 4: Obtener Detalles de Rutas y Auxiliares Asignados** 

**Descripción:** Un administrador desea obtener detalles de todas las rutas, incluyendo los auxiliares asignados a cada ruta. 

```sql
SELECT r.id AS route_id, r.description AS description, a.id AS assistants_id, a.name AS assistant_name
FROM routes AS r
INNER JOIN assistants_routes AS ar ON r.id = ar.route_id
INNER JOIN assistants AS a ON a.id = ar.assistant_id;
```

**Caso de Uso 5: Generar Reporte de Paquetes por Sucursal y Estado** 

**Descripción:** Un administrador desea generar un reporte de todos los paquetes agrupados por sucursal y estado. 

```sql
SELECT p.id AS package_id, p.tracking_number AS traking_number, p.content AS content, s.branch_id AS branch_id, t.status AS status
FROM packages AS p
INNER JOIN shippings AS s ON p.id = s.branch_id
INNER JOIN tracking AS t ON p.id = t.package_id;
```

**Caso de Uso 6: Obtener Información Completa de un Paquete y su Historial de Seguimiento** 

**Descripción:** Un administrador desea obtener la información completa de un paquete específico y su historial de seguimiento.

```sql
SELECT p.id AS p_id, p.tracking_number AS t_number, p.weight AS weight, p.dimensions AS dimensions, p.content AS content, p.declared_value AS declared_value, p.service_type AS service_type, t.id AS t_id, t.location AS location, t.date_time AS date_time, t.status AS status
FROM packages AS p
INNER JOIN tracking AS t ON p.id = t.package_id;
```

**Casos de uso Between, In y Not In** 

**Caso de Uso 1: Obtener Paquetes Enviados Dentro de un Rango de Fechas** 

**Descripción:** Un administrador desea obtener todos los paquetes que fueron enviados dentro de un rango de fechas específico. 

```sql
SELECT p.id AS package_id, p.content AS content, s.id AS shipping_id, s.shippingdate
FROM packages AS p
INNER JOIN shippings AS s ON p.id = s.package_id
WHERE s.shippingdate BETWEEN '2024-06-21 10:00:00' AND '2024-08-21 10:00:00';
```

**Caso de Uso 2: Obtener Paquetes con Ciertos Estados** 

**Descripción:** Un administrador desea obtener todos los paquetes que tienen ciertos estados específicos (por ejemplo, 'en tránsito' o 'entregado'). 

```sql
SELECT p.id AS package_id, p.content AS content, t.id AS tracking_id, t.status AS status
FROM packages AS p
INNER JOIN tracking AS t ON p.id = t.package_id
WHERE t.status IN ('In transit', 'Received');
```

**Caso de Uso 3: Obtener Paquetes Excluyendo Ciertos Estados** 

**Descripción:** Un administrador desea obtener todos los paquetes excluyendo aquellos que tienen ciertos estados específicos (por ejemplo, 'recibido' o 'retenido en aduana'). 

```sql
SELECT p.id AS package_id, p.content AS content, t.id AS tracking_id, t.status AS status
FROM packages AS p
INNER JOIN tracking AS t ON p.id = t.package_id
WHERE t.status NOT IN ('In transit', 'Received');
```

**Caso de Uso 4: Obtener Clientes con Envíos Realizados Dentro de un Rango de Fechas** 

**Descripción:** Un administrador desea obtener todos los clientes que realizaron envíos dentro de un rango de fechas específico. 

```sql
SELECT c.id AS client_id, c.name AS name, s.id AS shipping_id, s.shippingdate
FROM clients AS c
INNER JOIN shippings AS s ON c.id = s.client_id
WHERE s.shippingdate BETWEEN '2024-04-23 13:18:36' AND '2024-06-23 21:57:39';
```

**Caso de Uso 5: Obtener Conductores Disponibles que No Están Asignados a Ciertas Rutas** 

**Descripción:** Un administrador desea obtener todos los conductores que no están asignados a ciertas rutas específicas. 

```sql
SELECT d.id AS driver_id, d.name AS d_name, dr.route_id AS driver_route, dr.driver_id AS driver_id
FROM drivers AS d
INNER JOIN driver_routes AS dr ON d.id = dr.driver_id
WHERE dr.route_id NOT IN ('4', '5');
```

**Caso de Uso 6: Obtener Información de Paquetes con Valor Declarado Dentro de un Rango Específico** 

**Descripción:** Un administrador desea obtener todos los paquetes cuyo valor declarado está dentro de un rango específico. 

```sql
SELECT p.id, p.content, p.declared_value
FROM packages AS p
WHERE p.declared_value BETWEEN '50' AND '80';
```

**Caso de Uso 7: Obtener Auxiliares Asignados a Rutas Específicas** 

**Descripción:** Un administrador desea obtener todos los auxiliares de reparto que están asignados a ciertas rutas específicas. 

```sql
SELECT as.id AS assistant_id, as.name AS name, r.id AS route_id, r.description AS assistant_route
FROM assistants AS as
INNER JOIN assistants_routes AS ar ON as.id = ar.assistant_id
INNER JOIN routes AS r ON r.id = ar.route_id 
WHERE r.id = '5';
```

**Caso de Uso 8: Obtener Envíos a Destinos Excluyendo Ciertas Ciudades** 

**Descripción:** Un administrador desea obtener todos los envíos cuyos destinos no están en ciertas ciudades específicas.

```sql
SELECT s.id AS shipping_id, s.client_id, s.package_id, s.shippingdate, s.receiver_id, c.name AS destinycity
FROM shippings AS s
INNER JOIN receivers AS r ON r.id = s.receiver_id
INNER JOIN citys AS c ON c.id = r.city_id
WHERE c.id NOT IN ('SAO','RIO');
```

**Caso de Uso 9: Obtener Seguimientos de Paquetes en un Rango de Fechas** 

**Descripción:** Un administrador desea obtener todos los eventos de seguimiento de paquetes que ocurrieron dentro de un rango de fechas específico. 

```sql
SELECT t.id AS tracking_id, p.id AS package_id, t.date_time
FROM tracking AS t
INNER JOIN packages AS p ON p.id = t.package_id
WHERE t.date_time BETWEEN '2024-06-21 10:00:00' AND '2024-08-21 10:00:00';
```

**Caso de Uso 10: Obtener Clientes que Tienen Ciertos Tipos de Paquetes** 

**Descripción:** Un administrador desea obtener todos los clientes que tienen paquetes de ciertos tipos específicos (por ejemplo, 'nacional' o 'internacional').

```sql
SELECT c.id AS client_id, s.id AS shipping_id, p.id AS package_id, p.content AS package_content, p.service_type
FROM shippings AS s
INNER JOIN packages AS p ON p.id = s.package_id
INNER JOIN clients AS c ON c.id = s.client_id
WHERE p.service_type IN ('Standard','Medium');
```

