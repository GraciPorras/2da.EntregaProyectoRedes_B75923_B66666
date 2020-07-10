CREATE DATABASE proyecto_redes_b66666_b75923;
USE proyecto_redes_b66666_b75923;

CREATE TABLE usuario(
	id int auto_increment PRIMARY KEY,
    nombre_usuario varchar(100),
    contrasenna varchar(50),
    ruta_archivo varchar(250)
);

DELIMITER 
CREATE PROCEDURE sp_insertarUsuario (in nombre_usuario varchar(100),in contrasenna varchar(50),in ruta_archivo varchar(250))
begin
INSERT INTO usuario (nombre_usuario,contrasenna,ruta_archivo) values (nombre_usuario,contrasenna,ruta_archivo);
end;


DELIMITER 
CREATE PROCEDURE sp_verificarUsuario(IN nombre_usuario_condicion varchar(100),IN contrasenna_condicion varchar(50))
BEGIN
if exists (SELECT * FROM usuario  WHERE nombre_usuario = nombre_usuario_condicion and contrasenna = contrasenna_condicion)
then
	select id, 1 AS existe, ruta_archivo from usuario WHERE nombre_usuario = nombre_usuario_condicion and contrasenna = contrasenna_condicion;
else
	select 0,0 As existe;
end if; 
END;





	