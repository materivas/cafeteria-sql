-- Datos para la tabla clientes
INSERT INTO clientes(nombre, email, telefono, fecha_registro) VALUES
('Julian Perez', 'julian.perez@example.com', '1122334455',CURRENT_DATE),
('Jimena García', 'jimena.garcia@example.com','1166778899', CURRENT_DATE),
('Carlos Lencinas', 'carlos.lencinas@example.com', '1100123456',CURRENT_DATE);

-- Datos para la tabla empleados
INSERT INTO empleados(nombre, puesto, fecha_ingreso) VALUES
('Ezequiel Rodriguez', 'ezequiel.rodriguez@example.com', CURRENT_DATE),
('Maximo Paletti', 'maximo.paletti@example.com', CURRENT_DATE);

-- Datos para la tabla productos
INSERT INTO productos (nombre, precio, categoria, stock) VALUES
('Café Americano', 700.00, 'Bebidas', 50),
('Café con Leche', 800.00, 'Bebidas', 40),
('Capuccino', 900.00, 'Bebidas', 30),
('Té Chai Latte', 850.00, 'Bebidas', 35),
('Croissant', 650.00, 'Pastelería', 25),
('Alfajor de Maicena', 500.00, 'Pastelería', 20),
('Tostado Jamón y Queso', 1200.00, 'Comidas', 15),
('Ensalada Veggie', 1500.00, 'Comidas', 10),
('Jugo de Naranja', 600.00, 'Bebidas', 45),
('Tarta de Manzana', 950.00, 'Pastelería', 12);

-- Datos para la tabla metodos_pago
INSERT INTO metodos_pago(tipo) VALUES
('Efectivo'),
('Tarjeta de Crédito'),
('Tarjeta de Débito'),
('Mercado Pago');

-- Datos para la tabla pedidos
INSERT INTO pedidos(cliente_id, empleado_id, metodo_pago_id, fecha) VALUES
(1, 1, 2, '2025-07-01'),
(2, 2, 1, '2025-07-02'),
(3, 1, 4, '2025-07-03');

-- Datos para la tabla detalle_pedido
INSERT INTO detalle_pedido(pedido_id, producto_id, cantidad, subtotal) VALUES
(1, 1, 2, 700.00),
(1, 3, 1, 200.00),
(2, 2, 1, 450.00),
(2, 4, 1, 600.00),
(3, 1, 1, 350.00),
(3, 3, 2, 400.00);
