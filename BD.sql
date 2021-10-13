CREATE TABLE cliente
(
	id_usuario           INTEGER NOT NULL,
	nombre_usuario       VARCHAR(20) NULL,
	password             VARCHAR(20) NULL,
	correo               VARCHAR(20) NULL,
	direccion            VARCHAR(20) NULL,
	telefono             INTEGER NULL
);



ALTER TABLE cliente
ADD PRIMARY KEY (id_usuario);



CREATE TABLE detalle_entrega
(
	id_detalle_entrega   INTEGER NOT NULL,
	hora_envio           DATE NULL,
	hora_entrega         DATE NULL,
	id_empleado          VARCHAR(20) NOT NULL,
	id_pedido            INTEGER NOT NULL,
	id_detalle_pedido    INTEGER NOT NULL,
	id_producto          INTEGER NOT NULL,
	id_usuario           INTEGER NOT NULL
);



ALTER TABLE detalle_entrega
ADD PRIMARY KEY (id_detalle_entrega,id_empleado,id_pedido,id_detalle_pedido,id_producto);



CREATE TABLE detalle_pedido
(
	id_detalle_pedido    INTEGER NOT NULL,
	num_pedido           CHAR(18) NULL,
	cantidad             INTEGER NULL,
	monto_pagar          INTEGER NULL,
	direc_entrega        VARCHAR(20) NULL,
	nom_usuario          VARCHAR(20) NULL,
	id_producto          INTEGER NOT NULL
);



ALTER TABLE detalle_pedido
ADD PRIMARY KEY (id_detalle_pedido,id_producto);



CREATE TABLE empleados
(
	id_empleado          VARCHAR(20) NOT NULL,
	nom_empleado         VARCHAR(20) NULL,
	cargo                VARCHAR(20) NULL,
	telefono             INTEGER NULL
);



ALTER TABLE empleados
ADD PRIMARY KEY (id_empleado);



CREATE TABLE pedido
(
	id_pedido            INTEGER NOT NULL,
	num_pedido           INTEGER NULL,
	id_usuario           INTEGER NOT NULL,
	id_empleado          VARCHAR(20) NOT NULL,
	precio_pedido        INTEGER NULL,
	id_detalle_pedido    INTEGER NOT NULL,
	id_producto          INTEGER NOT NULL
);



ALTER TABLE pedido
ADD PRIMARY KEY (id_pedido,id_usuario,id_empleado,id_detalle_pedido,id_producto);



CREATE TABLE productos
(
	id_producto          INTEGER NOT NULL,
	descripcion          VARCHAR(20) NULL,
	Nom_Producto         VARCHAR(20) NULL,
	precio               INTEGER NULL
);



ALTER TABLE productos
ADD PRIMARY KEY (id_producto);



ALTER TABLE detalle_entrega
ADD FOREIGN KEY R_3 (id_empleado) REFERENCES empleados (id_empleado);



ALTER TABLE detalle_entrega
ADD FOREIGN KEY R_4 (id_pedido, id_usuario, id_empleado, id_detalle_pedido, id_producto) REFERENCES pedido (id_pedido, id_usuario, id_empleado, id_detalle_pedido, id_producto);



ALTER TABLE detalle_pedido
ADD FOREIGN KEY R_2 (id_producto) REFERENCES productos (id_producto);



ALTER TABLE pedido
ADD FOREIGN KEY R_1 (id_usuario) REFERENCES cliente (id_usuario);



ALTER TABLE pedido
ADD FOREIGN KEY R_5 (id_empleado) REFERENCES empleados (id_empleado);



ALTER TABLE pedido
ADD FOREIGN KEY R_6 (id_detalle_pedido, id_producto) REFERENCES detalle_pedido (id_detalle_pedido, id_producto);


