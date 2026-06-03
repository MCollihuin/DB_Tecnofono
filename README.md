# Sistema de Gestión de Ventas e Inventario - Tienda Apple

## Descripción

Este proyecto consiste en el diseño e implementación de una base de datos relacional para una tienda especializada en productos Apple, inspirada en el funcionamiento de un Apple Premium Reseller.

El objetivo principal es gestionar información relacionada con clientes, vendedores, productos, categorías, bodegas, stock y ventas, aplicando principios de normalización para evitar redundancia de datos y mantener la integridad de la información.

La base de datos fue desarrollada utilizando SQLite como motor de gestión de bases de datos.

---

## Objetivos

- Aplicar conceptos de modelado relacional.
- Implementar una base de datos normalizada.
- Utilizar claves primarias y foráneas para establecer relaciones entre entidades.
- Gestionar inventario distribuido en distintas bodegas.
- Registrar ventas realizadas por vendedores a clientes.
- Permitir consultas relacionadas con ventas, stock y desempeño comercial.

---

## Tecnologías Utilizadas

- SQLite
- SQL
- DB Browser for SQLite

---

## Modelo de Datos

### Cliente

Almacena la información de los clientes registrados.

| Campo | Tipo |
|---------|---------|
| ID_Cliente | INTEGER |
| Nombre_Cliente | TEXT |
| Apellido_Cliente | TEXT |
| Correo_Cliente | TEXT |
| Telefono | TEXT |

---

### Vendedor

Contiene los datos de los vendedores de la tienda.

| Campo | Tipo |
|---------|---------|
| ID_Vendedor | INTEGER |
| Nombre_Vendedor | TEXT |
| Codigo_Vendedor | INTEGER |

---

### Categoria

Clasifica los distintos tipos de productos.

| Campo | Tipo |
|---------|---------|
| ID_Categoria | INTEGER |
| Nombre_Categoria | TEXT |

Ejemplos:

- iPhone
- Mac
- iPad
- Apple Watch
- Accesorios

---

### Producto

Almacena la información de los productos disponibles para la venta.

| Campo | Tipo |
|---------|---------|
| ID_Producto | INTEGER |
| Nombre_Producto | TEXT |
| Descripcion | TEXT |
| Precio | REAL |
| ID_Categoria | INTEGER |

---

### Bodega

Registra las distintas bodegas o sucursales donde se almacena inventario.

| Campo | Tipo |
|---------|---------|
| ID_Bodega | INTEGER |
| Nombre_Bodega | TEXT |
| Direccion | TEXT |

---

### Stock

Permite controlar la cantidad disponible de cada producto en cada bodega.

| Campo | Tipo |
|---------|---------|
| ID_Producto | INTEGER |
| ID_Bodega | INTEGER |
| Cantidad | INTEGER |

---

### Compra

Representa una venta realizada por un vendedor a un cliente.

| Campo | Tipo |
|---------|---------|
| ID_Compra | INTEGER |
| Fecha_Compra | DATE |
| ID_Cliente | INTEGER |
| ID_Vendedor | INTEGER |

---

### Detalle_Compra

Almacena los productos incluidos en cada compra.

| Campo | Tipo |
|---------|---------|
| ID_Detalle | INTEGER |
| Cantidad | INTEGER |
| Precio_Unitario | REAL |
| ID_Compra | INTEGER |
| ID_Producto | INTEGER |

---

## Relaciones

- Un cliente puede realizar muchas compras.
- Un vendedor puede registrar muchas compras.
- Una categoría puede contener muchos productos.
- Un producto pertenece a una sola categoría.
- Un producto puede existir en varias bodegas.
- Una compra puede contener varios productos.
- Un producto puede aparecer en múltiples compras.

---

## Normalización

La base de datos fue diseñada siguiendo principios de normalización hasta la Tercera Forma Normal (3FN):

- Eliminación de datos redundantes.
- Separación de entidades independientes.
- Uso de claves foráneas para mantener relaciones.
- Almacenamiento del detalle de venta en una tabla independiente.
