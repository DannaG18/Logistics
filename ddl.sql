CREATE DATABASE logistics;
USE logistics;

CREATE TABLE countrys(
    id VARCHAR (20),
    name VARCHAR (30),
    CONSTRAINT pk_id_countrys PRIMARY KEY (id)
);

CREATE TABLE brands(
    id INT AUTO_INCREMENT,
    name VARCHAR (20),
    CONSTRAINT pk_id_brands PRIMARY KEY (id)
);

CREATE TABLE packages(
    id INT AUTO_INCREMENT,
    tracking_number VARCHAR (50),
    weight DECIMAL (5,2),
    dimensions VARCHAR (50),
    content TEXT,
    declared_value DECIMAL (5,2),
    service_type VARCHAR (30),
    CONSTRAINT pk_id_packages PRIMARY KEY (id)
);


CREATE TABLE license_type(
    id INT AUTO_INCREMENT,
    type VARCHAR (20),
    CONSTRAINT pk_id_license PRIMARY KEY (id)
);

CREATE TABLE status(
    id INT AUTO_INCREMENT,
    status VARCHAR (25),
    CONSTRAINT pk_id_status PRIMARY KEY (id)
);

CREATE TABLE document_type(
    id INT AUTO_INCREMENT,
    type VARCHAR (20),
    CONSTRAINT pk_id_documenttype PRIMARY KEY (id)
);

CREATE TABLE models(
    id VARCHAR (30),
    capacity DECIMAL (10,2),
    reference VARCHAR (30),
    year INT (4),
    brand_id INT (11),
    CONSTRAINT pk_id_models PRIMARY KEY (id),
    CONSTRAINT fk_brandid FOREIGN KEY (brand_id) REFERENCES brands(id)
);

CREATE TABLE tracking(
    id INT AUTO_INCREMENT,
    location VARCHAR (80),
    date_time TIMESTAMP,
    status VARCHAR (20),
    package_id INT (11),
    CONSTRAINT pk_id_tracking PRIMARY KEY (id),
    CONSTRAINT fk_packages_id FOREIGN KEY (package_id) REFERENCES packages (id)
);

CREATE TABLE citys(
    id VARCHAR (20),
    name VARCHAR (30),
    country_id VARCHAR (20),
    CONSTRAINT pk_id_city PRIMARY KEY (id),
    CONSTRAINT fk_countryid FOREIGN KEY (country_id) REFERENCES countrys (id)
);

CREATE TABLE clients(
    id INT AUTO_INCREMENT,
    name VARCHAR (50),
    email VARCHAR (50),
    adress VARCHAR (100),
    registration_date TIMESTAMP,
    document_type_id INT (11),
    city_id VARCHAR (20),
    CONSTRAINT pk_id_clients PRIMARY KEY (id),
    CONSTRAINT fk_documenttypeid FOREIGN KEY (document_type_id) REFERENCES document_type(id),
    CONSTRAINT fk_cityid FOREIGN KEY (city_id) REFERENCES citys (id) 
);

CREATE TABLE clients_phones(
    id INT AUTO_INCREMENT,
    phone VARCHAR (20),
    phone_number_type VARCHAR (30),
    client_id INT (11),
    CONSTRAINT pk_id_clientsphones PRIMARY KEY (id),
    CONSTRAINT fk_clientid FOREIGN KEY (client_id) REFERENCES clients (id)
);


CREATE TABLE branches(
    id INT AUTO_INCREMENT,
    name VARCHAR (30), 
    adress VARCHAR (100),
    city_id VARCHAR (20),
    CONSTRAINT pk_id_branches PRIMARY KEY (id),
    CONSTRAINT fk_cityid_branches FOREIGN KEY (city_id) REFERENCES citys (id)
);

CREATE TABLE routes(
    id INT AUTO_INCREMENT,
    description VARCHAR(200),
    branch_id INT (11),
    CONSTRAINT pk_id_routes PRIMARY KEY (id),
    CONSTRAINT fk_branchid_routes FOREIGN KEY (branch_id) REFERENCES branches (id)
);

CREATE TABLE assistants(
    id INT AUTO_INCREMENT,
    name VARCHAR (50),
    phone VARCHAR (20),
    document_type_id INT (11),
    CONSTRAINT pk_id_assistants PRIMARY KEY (id),
    CONSTRAINT fk_documenttypeid_assistants FOREIGN KEY (document_type_id) REFERENCES document_type(id)
);

CREATE TABLE assistants_phones(
    id INT AUTO_INCREMENT,
    phone_number VARCHAR (20),
    phone_number_type VARCHAR (30),
    assistant_id INT (11),
    CONSTRAINT pk_id_assistants_phones PRIMARY KEY (id),
    CONSTRAINT fk_assistantid_phones FOREIGN KEY (assistant_id) REFERENCES assistants (id)
);

CREATE TABLE assistants_routes(
    route_id INT (11),
    assistant_id INT (11),
    CONSTRAINT pk_id_assistants_routes PRIMARY KEY (route_id, assistant_id),
    CONSTRAINT fk_routesid FOREIGN KEY (route_id) REFERENCES routes (id),
    CONSTRAINT fk_assistantsid FOREIGN KEY (assistant_id) REFERENCES assistants (id)
);

CREATE TABLE receivers(
    id INT AUTO_INCREMENT,
    name VARCHAR (50),
    adress VARCHAR (100),
    phone VARCHAR (20),
    city_id VARCHAR (20),
    document_type_id INT (11),
    CONSTRAINT pk_id_receivers PRIMARY KEY (id),
    CONSTRAINT fk_cityid_receivers FOREIGN KEY (city_id) REFERENCES citys (id),
    CONSTRAINT fk_documenttypeid_receivers FOREIGN KEY (document_type_id) REFERENCES document_type (id)
);

CREATE TABLE shipping(
    id INT AUTO_INCREMENT,
    shipment_date TIMESTAMP,
    client_id INT (11),
    package_id INT (11),
    route_id INT (11),
    branch_id INT (11),
    receiver_id INT (11),
    CONSTRAINT pk_id_shipping PRIMARY KEY (id),
    CONSTRAINT fk_clientid_shipping FOREIGN KEY (client_id) REFERENCES clients (id),
    CONSTRAINT fk_packageid_shipping FOREIGN KEY (package_id) REFERENCES packages (id),
    CONSTRAINT fk_routeid_shipping FOREIGN KEY (route_id) REFERENCES routes (id),
    CONSTRAINT fk_branchid_shipping FOREIGN KEY (branch_id) REFERENCES branches (id)
);

CREATE TABLE shippings(
    id INT AUTO_INCREMENT,
    client_id INT (11),
    package_id INT (11),
    shippingdate TIMESTAMP,
    receiver_id INT (11),
    route_id INT (11),
    CONSTRAINT Pk_Id_shippings PRIMARY KEY (id),
    CONSTRAINT Fk_clientid_shippings FOREIGN KEY (client_id) REFERENCES clients(id),
    CONSTRAINT Fk_packageid_shippings FOREIGN KEY (package_id) REFERENCES packages(id),
    CONSTRAINT Fk_receiverid_shippings FOREIGN KEY (receiver_id) REFERENCES receivers(id),
    CONSTRAINT Fk_routeid_shippings FOREIGN KEY (route_id) REFERENCES routes(id)
);

CREATE TABLE drivers(
    id INT  AUTO_INCREMENT,
    name VARCHAR (50),
    number VARCHAR (20),
    hire_date DATE,
    license_type_id INT (11),
    status_id INT (11),
    CONSTRAINT pk_id_drivers PRIMARY KEY (id),
    CONSTRAINT fk_licensetypeid_drivers FOREIGN KEY (license_type_id) REFERENCES license_type (id),
    CONSTRAINT fk_statusid_drivers FOREIGN KEY (status_id) REFERENCES status (id)
);

CREATE TABLE drivers_phones(
    id INT AUTO_INCREMENT,
    number VARCHAR (20),
    driver_id INT (11),
    CONSTRAINT pk_id_driversphones PRIMARY KEY (id),
    CONSTRAINT fk_driverid_phones FOREIGN KEY (driver_id) REFERENCES drivers (id)
);

CREATE TABLE vehicles(
    id INT AUTO_INCREMENT,
    status BOOLEAN,
    mileage INT (11),
    last_inspection DATE,
    plate VARCHAR (20),
    model_id VARCHAR (30),
    CONSTRAINT pk_id_vehicles PRIMARY KEY (id),
    CONSTRAINT fk_modelid_vehicles FOREIGN KEY (model_id) REFERENCES models (id)
);


CREATE TABLE driver_routes(
    driver_id INT (11),
    route_id INT (11),
    vehicule_id INT(11),
    CONSTRAINT pk_id_driver_routes PRIMARY KEY (driver_id, route_id),
    CONSTRAINT fk_driverid_routes FOREIGN KEY (driver_id) REFERENCES drivers (id),
    CONSTRAINT fk_routesid_routes FOREIGN KEY (route_id) REFERENCES routes (id),
    CONSTRAINT fk_vehiculeid_routes FOREIGN KEY (vehicule_id) REFERENCES vehicles (id)
);
