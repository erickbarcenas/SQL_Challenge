# SQL Challenge


Nosotros somos un almacen de alimentos y necesitamos tener un control de los productos vendidos para limitar la cantidad de productos ofrecidos.

Por una parte, todos los dias a las 12:00 am se actualiza la información de nuestros productos en nuestro almacén. En una tabla se reflejan las cantidades disponibles de cada uno de los articulos disponibles a la venta asi como sus cantidades.


## Objetivo:
Generar el esquema de las entidades necesarias en Base de Datos que sean utiles para el control de ventas en el que se pueda asociar un producto vendido (con la cantidad solicitada) y el usuario que la compró.

Dicha tabla almacena el historial de ventas concretadas. Es decir, que un registro en esta tabla significa que pasó por las condiciones que restringen a la venta.

Actualmente, se cuentan con dos tablas (ver archivos adjuntos) que pueden tomarse como base para definir dos tablas:
    - **product**: La tabla de productos está definida de una forma básica por lo que se tendrá que corregir la/las tablas tomando en consideración constrains como Primary key, unique, autoincrement o cualquiera que se considere util.
    - **user:** Esta tabla no está definida, pero se muestra en el archivo SQL los datos a insertar. Se tiene que generar por completo el esquema de la tabla, teniendo en consideración los contrains necesarios de acuerdo a la columna



## Condiciones:
    - No podemos vender productos si no cuentan con existencia o si la cantidad es superior a la disponible.
    - No podemos vender productos que no estén disponibles para venta.


## Entregables:
    - script SQL del esquema de las entidades generada (inlcuyendo las tablas de usuario y productos si se aplicaron alguna correción).



Nota:
No es necesario generar funciones PL/SQL, basta con indicar las sentencias que usarian para lograr el objetivo. En el Script de ejemplo, en las primeras lineas se muestra la forma en la que podrian definir algunas variables

## DEMO

![Calculator](https://cdn.discordapp.com/attachments/954764763739586630/963628375962947604/unknown.png)

