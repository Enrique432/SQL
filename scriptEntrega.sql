
 CREATE SCHEMA practicaSQL AUTHORIZATION uaioimsm; 

 -------------- Grupo de coches    

 create table practicaSQL.grupoCoches(
    id SERIAL not null,
    name varchar(200) not null,
    description varchar(512) null
);

alter table practicaSQL.grupoCoches
add constraint grupoCoches_PK primary key (id);

insert into practicaSQL.grupoCoches (name, description) values('VAN','Audi, seat, VW');
insert into practicaSQL.grupoCoches (name, description) values('RENAULT','Renault, Nissan');

------------ Marcas de coches      

create table practicaSQL.marcaCoches(
    id_marca SERIAL not null, --PK - marca
    name varchar(200) not null,
    id_grupo int not null,   --FK - grupo
    description varchar(512) null
);

alter table practicaSQL.marcaCoches
add constraint coches_PK primary key (id_marca);

alter table  practicaSQL.marcaCoches
add constraint coches_FK foreign key (id_grupo) references practicaSQL.grupoCoches(id);


insert into practicaSQL.marcaCoches(name, id_grupo) values ('VW',1);
insert into practicaSQL.marcaCoches(name, id_grupo) values ('Audi',1);
insert into practicaSQL.marcaCoches(name, id_grupo) values ('Seat',1);
insert into practicaSQL.marcaCoches(name, id_grupo) values ('Renault',2);
insert into practicaSQL.marcaCoches(name, id_grupo) values ('Nissan',2);


---------  Modelos de coches

create table practicaSQL.modeloCoches(    
    id_modelo SERIAL not null, --PK - modelo
    name varchar(200) not null,
    id_marca int not null,     --FK - marca
    description varchar(512) null
   
);

alter table practicaSQL.modeloCoches
add constraint modeloCoches_PK primary key (id_modelo);

alter table  practicaSQL.modeloCoches
add constraint modeloCoches_FK foreign key (id_marca) references practicaSQL.marcaCoches(id_marca);

insert into practicaSQL.modeloCoches  (name, id_marca, description) values ('Golf GTI', 1, '');
insert into practicaSQL.modeloCoches  (name, id_marca, description) values ('A3', 2, '');
insert into practicaSQL.modeloCoches  (name, id_marca, description) values ('A5', 2, '');
insert into practicaSQL.modeloCoches  (name, id_marca, description) values ('A4', 2, '');
insert into practicaSQL.modeloCoches  (name, id_marca, description) values ('Leon', 3, '');
insert into practicaSQL.modeloCoches  (name, id_marca, description) values ('Ibiza', 3, '');
insert into practicaSQL.modeloCoches  (name, id_marca, description) values ('Megane', 4, '');
insert into practicaSQL.modeloCoches  (name, id_marca, description) values ('Clio', 4, '');
insert into practicaSQL.modeloCoches  (name, id_marca, description) values ('Leaf', 5, '');
insert into practicaSQL.modeloCoches  (name, id_marca, description) values ('Micra', 5, '');

--------- Colores de coches  

create table practicaSQL.colorCoche(
    id SERIAL not null, 
    name varchar(200) not null
);

alter table practicaSQL.colorCoche
add constraint colorCoche_PK primary key (id);

insert into practicaSQL.colorCoche (name) values ('Blanco');
insert into practicaSQL.colorCoche (name) values ('Negro');
insert into practicaSQL.colorCoche (name) values ('Rojo');
insert into practicaSQL.colorCoche (name) values ('Azul');
insert into practicaSQL.colorCoche (name) values ('Verde');
insert into practicaSQL.colorCoche (name) values ('Amarillo');
insert into practicaSQL.colorCoche (name) values ('Gris');

--------- Aseguradoras

create table practicaSQL.aseguradoras(
    id SERIAL not null, 
    name varchar(200) not null
);

alter table practicaSQL.aseguradoras
add constraint aseguradoras_PK primary key (id);


insert into practicaSQL.aseguradoras (name) values ('AXA');
insert into practicaSQL.aseguradoras (name) values ('MMT');
insert into practicaSQL.aseguradoras (name) values ('Mapfre');

---------  Monedas    

create table practicaSQL.moneda(
    id varchar(10) not null, 
    name varchar(200) not null
);

alter table practicaSQL.moneda
add constraint moneda_PK primary key (id);


insert into practicaSQL.moneda (id, name) values ('EUR', 'Euro');
insert into practicaSQL.moneda (id, name) values ('USD', 'Dolar');

-------- Coches de Keepcoding               

create table  practicaSQL.kcodingCoches(    
    id SERIAL not null,  --PK
    id_modelo int not null, --FK . modelo coche
    dt_compra date not null,
    dt_baja date null default '4000-01-01',
    matricula varchar(20) not null,
    id_color int not null, --FK - colores
    tot_kms int null default 0,
    id_aseguradora int not null, -- FK- aseguradoras
    num_poliza_seguro varchar(100) not null,
    description varchar(512) null
);

alter table practicaSQL.kcodingCoches
add constraint kcodingCoches_PK primary key (id);

alter table  practicaSQL.kcodingCoches
add constraint kcodingCoches_modelo_FK foreign key (id_modelo) references practicaSQL.modeloCoches(id_modelo);

alter table  practicaSQL.kcodingCoches
add constraint kcodingCoches_color_FK foreign key (id_color) references practicaSQL.colorCoche(id);

alter table  practicaSQL.kcodingCoches
add constraint kcodingCoches_aseguradora_FK foreign key (id_aseguradora) references practicaSQL.aseguradoras(id);


insert into practicaSQL.kcodingCoches (id_modelo, dt_compra, matricula, id_color, tot_kms, id_aseguradora, num_poliza_seguro) values (1, '2012-05-01','1234 ZXC', 2, 85200,2,'15963241');
insert into practicaSQL.kcodingCoches (id_modelo, dt_compra, matricula, id_color, tot_kms, id_aseguradora, num_poliza_seguro) values (2, '2014-06-25','1478 ZAQ', 4, 54600,1,'48597458');
insert into practicaSQL.kcodingCoches (id_modelo, dt_compra, matricula, id_color, tot_kms, id_aseguradora, num_poliza_seguro) values (3, '2019-10-14','9512 PLO', 5, 19200,3,'85425644');
insert into practicaSQL.kcodingCoches (id_modelo, dt_compra, matricula, id_color, tot_kms, id_aseguradora, num_poliza_seguro) values (5, '2020-04-09','5289 JUI', 3, 7319,1,'44352588');

---------- Revisiones de coche             

create table practicaSQL.kcodingRevisiones(   
    id_coche int not null,   -- PK
    id_revision varchar(20) not null, --PK - revision
    dt_revision date not null, 
    importe decimal not null,
    id_moneda varchar(20) not null,
    kms int not null,
    description varchar(512) null
);

alter table practicaSQL.kcodingRevisiones
add constraint kcodingRevisiones_PK primary key (id_coche, id_revision);  

alter table  practicaSQL.kcodingRevisiones
add constraint kcodingRevisiones_FK foreign key (id_coche) references practicaSQL.kcodingCoches(id);



insert into practicaSQL.kcodingRevisiones values (1, 'Z-003', '2021-12-05', 232.5, 'EUR', 3000, 'Revision');
insert into practicaSQL.kcodingRevisiones values (1, 'X-0176', '2018-02-15', 630.5, 'EUR', 10000, 'Test');
insert into practicaSQL.kcodingRevisiones values (2, 'Z-015', '2022-06-21', 120.5, 'EUR', 1000, '');
insert into practicaSQL.kcodingRevisiones values (2, 'Z-052', '2019-08-08', 245.5, 'EUR', 5000, 'Aceite');
insert into practicaSQL.kcodingRevisiones values (3, 'X-0103', '2020-04-13', 845.5, 'USD', 30000, 'Sablazo');
insert into practicaSQL.kcodingRevisiones values (3, 'X-0087', '2019-11-16', 775.5, 'USD', 20000, '');


