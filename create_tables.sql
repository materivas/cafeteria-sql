-- Se elimina si existen las tablas
DROP TABLES IF EXISTS productos;
DROP TABLES IF EXISTS pedidos;
DROP TABLES IF EXISTS clientes;
DROP TABLES IF EXISTS empleados;
DROP TABLES IF EXISTS detalle_pedido;
DROP TABLES IF EXISTS metodos_pago;


-- Clientes
CREATE TABLE IF NOT EXISTS clientes(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(20),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Empleado
CREATE TABLE IF NOT EXISTS empleados(
	id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    puesto VARCHAR(50),
    fecha_ingreso DATE 
);

-- Producto
CREATE TABLE IF NOT EXISTS productos(
	id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    categoria VARCHAR(50),
    stock INT DEFAULT 0
);

-- Metodo de Pago
CREATE TABLE IF NOT EXISTS metodos_pago(
	id_metodo INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL
);

-- Pedidos
CREATE TABLE IF NOT EXISTS pedidos(
	id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_empleado INT,
	id_metodo INT,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
	total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (id_metodo) REFERENCES metodo_pago(id_metodo)
);

-- Detalle Pedido
CREATE TABLE IF NOT EXISTS detalle_pedido(
	id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

