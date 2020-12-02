create database termolabs;
use termolabs;

create table usuario (
idUsuario int primary key auto_increment,
email varchar(70),
senha char(8),
fkEmpresa int,
foreign key (fkEmpresa) references empresa (idEmpresa)
)auto_increment = 1000;

insert into usuario values 
(null, "mario.ruben@drogasil.com", "87364951", 2),
(null, "gina.silva@drogariasp.com", "57984621", 1);

create table empresa (
idEmpresa INT primary key auto_increment,
nomeEmpresa varchar(45),
tipoEmpresa varchar(45),
telefonePrincipal varchar(15),
telefoneSecundario varchar(15),
estadoSede varchar(45),
cidadeSede varchar(45),
ruaSede varchar(45),
cep Char(8),
numero INT,
cnpj varchar(15)
);

create table camara (
idCamara INT primary key auto_increment ,
tamanho varchar(45),
tipoCamara varchar(45)
) auto_increment = 100;

alter table camara add column fkEmpresa INT; 
alter table camara add foreign key (fkEmpresa) references empresa(idEmpresa);

create table sensorTemp (
idSensor INT primary key auto_increment
) auto_increment = 200;

alter table sensorTemp add column fkCamara INT; 
alter table sensorTemp add foreign key (fkCamara) references Camara(idCamara);

create table medicao (
idMedicao int primary key auto_increment,
data_hora datetime,
temperatura INT,
fkSensor int,
foreign key (fkSensor) references sensortemp (idSensor)
) auto_increment = 300;


alter table medicao add column fkSensor INT; 
alter table medicao add foreign key (fkSensor) references sensorTemp(idSensor);

insert into empresa values
(null, "Drogaria SP", "Drogaria", "(11)28875564", "(11)28875598", "São Paulo", "São Paulo", "Rua Liberdade", "06543654", "180", "61412110000155"),
(null, "Drogasil", "Drogaria", "(21)38743453", "(21)38745453", "Rio de Janeiro", "Botafogo", "Rua São Judas", "06753832", "87", "61412110007474");

insert into camara values
(null, "10m²", "geladeira", 2),
(null, "5m²", "Freezer", 1);

insert into sensorTemp values
(null, 101),
(null, 100);

insert into medicao values
(null, "2020-10-22 14:23:54", 5, 201),
(null, "2020-10-21 12:00:00", 6, 200);

select * from empresa;
select * from camara;
select * from sensorTemp;
select * from medicao;
select * from usuario, empresa, camara, sensortemp, medicao where 
                                             idEmpresa = camara.fkEmpresa and idEmpresa = usuario.fkEmpresa 
                                                                                        and idCamara = fkCamara and idSensor = fkSensor;