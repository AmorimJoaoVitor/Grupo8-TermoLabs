create database termoLabs;
use termoLabs;

create table sensores(
	idSensor int primary key auto_increment,
    tipoSensor varchar(40) not null,
    medicaoHr datetime,
    temperatura int
    );
    
    create table empresas(
	idEmpresa int primary key auto_increment,
    nome varchar(100) not null,
	cnpj char(13) not null,
	repEmpresa varchar(100),
    email varchar(100),
	telefone varchar(15),
    fkSensor int,
    foreign key (fkSensor) references sensores(idSensor)
	);
desc sensores;
desc empresas;

insert into sensores values
	(null, 'temperatura', '2020-09-15 6:09:00', 4),
	(null, 'temperatura', '2020-09-15 8:10:00', 3),
	(null, 'temperatura', '2020-09-15 6:25:00', 5),
	(null, 'temperatura', '2020-09-15 4:59:00', 7),
	(null, 'temperatura', '2020-09-15 2:13:30', 5);
    
insert into empresas values
	(null, 'Drogasil', '0945126000015', 'Lucas Batista', 'lucasbatista@drogasil.com', '11-89765423', 2),
    (null, 'Medley','1202379100015', 'Joao Amado', 'joaoamado@medley.com', '11-90765432', 4),
    (null, 'DrogaRaia', '9432046900015', 'Rafael Silva', 'rafaelsilva@drogaraia.com', '11-56789034', 3),
    (null, 'Neoquimica', '7809086500018', 'Amanda Alves', 'amandaalves@neoquimica.com', '11-70705679', 1);
    
select empresas.*, sensores.tipoSensor from empresas, sensores where idSensor = fkSensor;
select empresas.*, sensores.temperatura from empresas, sensores where idSensor = fkSensor;