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

  ## Consultas y Análisis

[#consultas-y-análisis](#consultas-y-análisis)

Además del modelo relacional, se desarrollaron consultas SQL orientadas a responder preguntas de negocio típicas de una tienda de tecnología: qué productos rotan más, qué categoría genera más ingresos y quién es el cliente de mayor valor. El código completo de las tres consultas está en [`consultas.sql`](./consultas.sql).

### 1. Top 5 productos más vendidos

[#1-top-5-productos-más-vendidos](#1-top-5-productos-más-vendidos)

**Pregunta de negocio:** ¿Qué productos deberían priorizarse en reposición de stock?

Consulta con `JOIN` entre `Producto` y `Detalle_Compra`, agrupando por producto y ordenando por cantidad vendida ([ver código](./consultas.sql#L1-L9)).

**Resultado:**

| Producto | Unidades Vendidas |
|---|---|
| [Producto 1] | [N] |
| [Producto 2] | [N] |
| [Producto 3] | [N] |
| [Producto 4] | [N] |
| [Producto 5] | [N] |

**Conclusión:** [Ej: El producto más vendido fue X con N unidades, lo que sugiere priorizar su stock en bodega y evaluar promociones cruzadas con accesorios relacionados.]

---

### 2. Ventas totales por categoría

[#2-ventas-totales-por-categoría](#2-ventas-totales-por-categoría)

**Pregunta de negocio:** ¿Qué categoría de productos genera más ingresos para la tienda?

Consulta con doble `JOIN` (`Categoria` → `Producto` → `Detalle_Compra`), agregando ingresos totales por categoría ([ver código](./consultas.sql#L11-L20)).

**Resultado:**

| Categoría | Total Ventas |
|---|---|
| [iPhone] | $[N] |
| [Mac] | $[N] |
| [iPad] | $[N] |
| [Apple Watch] | $[N] |
| [Accesorios] | $[N] |

**Conclusión:** [Ej: La categoría X concentra el mayor volumen de ventas, lo que indica dónde enfocar esfuerzos comerciales y de inventario.]

---

### 3. Cliente con mayor gasto total

[#3-cliente-con-mayor-gasto-total](#3-cliente-con-mayor-gasto-total)

**Pregunta de negocio:** ¿Quién es el cliente más valioso para un programa de fidelización?

Consulta con `JOIN` entre `Cliente`, `Compra` y `Detalle_Compra`, sumando el gasto total por cliente y ordenando de forma descendente ([ver código](./consultas.sql#L22-L34)).

**Resultado:**

| Cliente | Total Gastado |
|---|---|
| [Nombre Cliente] | $[N] |

**Conclusión:** [Ej: El cliente X representa el mayor valor histórico, un candidato ideal para estrategias de retención o beneficios VIP.]

---

### Herramientas utilizadas para el análisis

[#herramientas-utilizadas-para-el-análisis](#herramientas-utilizadas-para-el-análisis)

- SQLite + DB Browser for SQLite para ejecución de consultas
- Consultas con `JOIN`, `GROUP BY`, funciones de agregación (`SUM`) y `ORDER BY`/`LIMIT` para responder preguntas de negocio concretas
