-- 	Alias
select *from persona as Idp;
-- 	regexp
select * from empleado where IdPersona regexp '[1,1,s]';
select * from empleado where cargo regexp '[a-s]';
-- operadores logico
select * from producto;
select * from producto where Plataforma='fisico';
select * from producto;
insert into producto values (4,4,'juegoterror','Digital','80');
-- 	encriptacion de datos
select * from persona;
insert into persona values (2,'Enzo','Fernandez','enzofer@gmail.com',aes_encrypt(2,'Enzo','SAn','SanEnzo@gmail.com'));

-- ...