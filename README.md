# Technical Test
## Descripción general
El proyecto consiste en una aplicación web que permite realizar la consulta de los inmuebles asociados a los diferentes contratos, junto con las partes que componen el respectivo contrato, es decir, el arrendatario, propietarios y deudores. 
La consulta puede ser realizada ingresando los nombres, apellidos, documento de identidad o email de la persona, dirección del inmueble o código del contrato, y retornará cada contrato que contenga el texto en cualquiera de los campos mencionados.
Una vez realizada la consulta, se presentará en una tabla la siguiente información: 
-	Código del contrato
-	Dirección del inmueble
-	Nombres y apellidos del arrendatario
-	Nombres y apellidos completos de los propietarios
-	Nombres y apellidos completos de los deudores solidarios (si existe)

## Prerrequisitos
-	Gestor de base de datos
-	Eclipse IDE

## Pasos para ejecutar el proyecto
1.	Crear una base de datos en MySQL y asignarle el nombre de “test_service”
2.	Importar el archivo “test_service.sql”, disponible en https://github.com/isabela-lopezm/technical-test/tree/master/sql
3.	Importar el proyecto “TechnicalTest” en Eclipse
4.	En Eclipse, ingresar en la pestaña “Server” y crear un nuevo servidor (New -> Server)
5.	Desplegar la carpeta 	Tomcat y elegir la versión correspondiente (Tomcat v9.0 Server)
6.	Añadir al servidor creado el proyecto “TechnicalTest”
7.	Iniciar el servidor (dar click derecho sobre el servidor creado y presionar “Start”)
8.	Abrir el archivo index.html, disponible en https://github.com/isabela-lopezm/technical-test-front/tree/master/html, en un navegador web
9.	Ingresar la información que se desea consultar


