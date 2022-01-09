# KonectaTest

KonectaTest es una aplicación web que permite el amacenamiento y gestión del investario de una cafeteria. Permite:
- Crear productos nuevos.
- Editar prouctos.
- Eliminar prodcutos.
- Listar todos los productos.
- Ingresar ventas.
- Consultar el producto más vendido
- Consultar el producto con mayor cantidad en el inventario.

El programa se conecta a una base de datos de MySQL.

## Recomendaciones
- Contar con instalado MySQL para desplegar el servidor e implementar la base de datos inicial.
  - MySQL puede ser descargado de https://dev.mysql.com/downloads/mysql/.
  - Es posible importar la base de datos inicial desde MySQL. El archivo importable está en la carpeta tools.
- El archivo JAR utilizado que actúa de conector con MySQl se encentra en la carpeta tools en caso de ser necesario.
- El servidor Apache utilizado se encuentra en la carpeta tools en caso de ser necesario.
- Para editar la URL, nombre de usuario, contraseña y nombre de la base de datos en caso de ser necesario, se deben editar las lineas 16, 17, 18 y 19 del archivo Mysqlconxion.java.

## Base de datos
- La base de datos contiene los siguientes campos:
  - ID.
  - Nombre.
  - Referencia.
  - Precio.
  - Peso.
  - Categoria.
  - Cantidad.
  - Fecha de creación.
- La base de datos genera el ID y la fecha de creación del producto automaticamente. El usuario final no debe preocuparse por añadir estos campos al crear un producto.
- La base de datos almacena la cantidad de articulos vendidos de un producto. Esto se guarda en la misma base de datos.
