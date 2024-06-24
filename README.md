# Sistema de Gestión de Distribución de Paquetes para una Empresa de Logística

![logistics_diagram]()

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

