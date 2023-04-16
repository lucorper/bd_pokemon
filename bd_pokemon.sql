drop database if exists bd_pokemon;
create database bd_pokemon;
use bd_pokemon;

create table Region (
Nombre_Reg varchar (15) not null,
primary key (Nombre_Reg)
);
create table Pueblo (
Nombre_Pue varchar (15) not null,
Nombre_Reg varchar (15) not null,
primary key (Nombre_Pue)
);
create table Entrenador (
Id_Entrenador int auto_increment not null,
Nombre_Ent varchar (15) not null,
Nombre_Pue varchar (15) not null,
primary key (Id_Entrenador)
);
create table Ligas (
Id_Liga int auto_increment not null,
Nombre_Lig varchar (20) not null,
primary key (Id_Liga)
);
create table va_a_liga (
Id_Liga int not null,
Id_Entrenador int not null,
primary key (Id_Liga,Id_Entrenador)
);
create table Gimnasio (
Id_Gimnasio int auto_increment not null,
Nombre_Gimnasio varchar (40) not null,
primary key (Id_Gimnasio)
);
create table Compite_En (
Id_Entrenador int not null,
Id_Gimnasio int not null,
primary key (Id_Entrenador,Id_Gimnasio)
);
create table Tipo (
Id_Tipo int auto_increment not null,
Nombre_Tipo varchar (20) not null,
primary key (Id_Tipo)
);
create table Pokemon (
Num_Pokedex int not null,
Id_Tipo int not null,
Id_Entrenador int not null,
Nombre varchar (20) not null,
Tipo varchar (20) not null,
Altura varchar (6) not null,
Peso varchar (6) not null,
primary key (Num_Pokedex)
);
create table Estadisticas (
Id_Stats int auto_increment not null,
Ps int not null,
Ataque int not null,
Defensa int not null,
Velocidad int not null,
Especial int,
primary key (Id_Stats)
);
create table Tiene_Estadisticas (
Id_Stats int not null,
Num_Pokedex int not null,
primary key (Id_Stats,Num_Pokedex)
);
create table Evolucionar (
Id_Evolucion int auto_increment not null,
Nombre_Evol varchar (20) not null,
primary key (Id_Evolucion)
);
create table Puede_Evolucionar (
Id_Evolucion int not null,
Num_Pokedex int not null,
primary key (Id_Evolucion,Num_Pokedex)
);
alter table Pueblo
add constraint fk_Region foreign key (Nombre_Reg) references Region (Nombre_Reg);
alter table Entrenador
add constraint fk_Pueblo foreign key (Nombre_Pue) references Pueblo (Nombre_Pue);
alter table Pokemon
add constraint fk_Entrenador foreign key (Id_Entrenador) references Entrenador (Id_Entrenador),
add constraint fk_Tipo foreign key (Id_Tipo) references Tipo (Id_Tipo);
alter table Tiene_Estadisticas
add constraint fk_Estadisticas foreign key (Id_Stats) references Estadisticas (Id_Stats),
add constraint fk_Pokemon_Estadisticas foreign key (Num_Pokedex) references Pokemon (Num_Pokedex);
alter table Puede_Evolucionar
add constraint fk_Evolucion foreign key (Id_Evolucion) references Evolucionar (Id_Evolucion),
add constraint fk_Pokemon_Evolucionar foreign key (Num_Pokedex) references Pokemon (Num_Pokedex);
alter table Compite_En
add constraint fk_Compite_Gimnasio foreign key (Id_Gimnasio) references Gimnasio (Id_Gimnasio),
add constraint fk_Compite_Entrenador foreign key (Id_Entrenador) references Entrenador (Id_Entrenador);
alter table va_a_liga
add constraint fk_va_a_liga foreign key (Id_Liga) references Ligas (Id_Liga),
add constraint fk_va_a_liga_Entrenador foreign key (Id_Entrenador) references Entrenador (Id_Entrenador);

INSERT INTO Region VALUES ('Kanto'); 
INSERT INTO Region VALUES ('Sinnoh');
INSERT INTO Region VALUES ('Taselia');
INSERT INTO Region VALUES ('Kalos');
INSERT INTO Region VALUES ('Hoenn');
INSERT INTO Pueblo VALUES ('Ciudad Azafran','Kanto');
INSERT INTO Pueblo VALUES ('Ciudad Carmin','Kanto');
INSERT INTO Pueblo VALUES ('Ciudad Azulona','Kanto');
INSERT INTO Pueblo VALUES ('Ciudad Fucsia','Kanto');
INSERT INTO Pueblo VALUES ('Pueblo Paleta','Kanto');
INSERT INTO Entrenador VALUES ('1','Sabrina','Ciudad Azafran'); 
INSERT INTO Entrenador VALUES ('2','Teniente Surge','Ciudad Carmin');
INSERT INTO Entrenador VALUES ('3','Erika','Ciudad Azulona');
INSERT INTO Entrenador VALUES ('4','Janine','Ciudad Fucsia'); 
INSERT INTO Entrenador VALUES ('5','Ask ketchum','Pueblo Paleta');
INSERT INTO Ligas VALUES ('1','Liga Kanto');
INSERT INTO Ligas VALUES ('2','Liga Sinnoh');
INSERT INTO Ligas VALUES ('3','Liga Taselia');
INSERT INTO Ligas VALUES ('4','Liga Kalos');
INSERT INTO Ligas VALUES ('5','Liga Hoenn');
INSERT INTO va_a_liga VALUES ('1','1');
INSERT INTO va_a_liga VALUES ('1','5');
INSERT INTO va_a_liga VALUES ('3','5');
INSERT INTO va_a_liga VALUES ('5','5');
INSERT INTO va_a_liga VALUES ('2','3');
INSERT INTO Gimnasio VALUES ('1','Gimnasio de Ciudad Azafran');
INSERT INTO Gimnasio VALUES ('2','Gimnasio de Ciudad Carmin');
INSERT INTO Gimnasio VALUES ('3','Gimnasio de Ciudad Azulona');
INSERT INTO Gimnasio VALUES ('4','Gimnasio de Ciudad Fucsia');
INSERT INTO Gimnasio VALUES ('5','No hay Gimnasio');
INSERT INTO Compite_En VALUES ('1','1');
INSERT INTO Compite_En VALUES ('2','2');
INSERT INTO Compite_En VALUES ('3','3');
INSERT INTO Compite_En VALUES ('4','4');
INSERT INTO Compite_En VALUES ('5','5');
INSERT INTO Tipo VALUES ('1','Electrico');
INSERT INTO Tipo VALUES ('2','Psiquico');
INSERT INTO Tipo VALUES ('3','Tierra');
INSERT INTO Tipo VALUES ('4','Planta');
INSERT INTO Tipo VALUES ('5','Agua');
INSERT INTO Tipo VALUES ('6','Fuego');
INSERT INTO Pokemon VALUES ('1','4','1','Bulbasaur','Planta','0,7','6,9');
INSERT INTO Pokemon VALUES ('25','1','5','Pikachu','Electrico','0,4','6');
INSERT INTO Pokemon VALUES ('4','6','5','Charmander','Fuego','0,6','8,5');
INSERT INTO Pokemon VALUES ('658','5','2','Greninja','Agua','1,5','40');
INSERT INTO Pokemon VALUES ('726','6','3','Torracat','Fuego','0,7','25');
INSERT INTO Pokemon VALUES ('26','1','4','Raichu','Electrico','0,8','30');
INSERT INTO Pokemon VALUES ('6','6','2','Charizard','Fuego','1,7','90,5');
INSERT INTO Pokemon VALUES ('2','4','5','Ivysaur','Planta','1','13');
INSERT INTO Pokemon VALUES ('727','6','2','Inceneroar','Fuego','1,8','83');
INSERT INTO Pokemon VALUES ('5','6','4','Charmeleon','Fuego','1,1','19');
INSERT INTO Estadisticas VALUES ('1','65','85','50','90','80');
INSERT INTO Estadisticas VALUES ('2','72','95','67','122','103');
INSERT INTO Estadisticas VALUES ('3','45','49','49','45','65');
INSERT INTO Estadisticas VALUES ('4','39','52','43','65','60');
INSERT INTO Estadisticas VALUES ('5','45','80','50','120','75');
INSERT INTO Tiene_Estadisticas VALUES ('1','726');
INSERT INTO Tiene_Estadisticas VALUES ('2','658');
INSERT INTO Tiene_Estadisticas VALUES ('3','1');
INSERT INTO Tiene_Estadisticas VALUES ('4','4');
INSERT INTO Tiene_Estadisticas VALUES ('5','25');
INSERT INTO Evolucionar VALUES ('1','Raichu');
INSERT INTO Evolucionar VALUES ('2','Charizard');
INSERT INTO Evolucionar VALUES ('3','Ivysaur');
INSERT INTO Evolucionar VALUES ('4','Incineroar');
INSERT INTO Evolucionar VALUES ('5','Charmeleon');
INSERT INTO Puede_Evolucionar VALUES ('1','26');
INSERT INTO Puede_Evolucionar VALUES ('2','6');
INSERT INTO Puede_Evolucionar VALUES ('3','2');
INSERT INTO Puede_Evolucionar VALUES ('4','727');
INSERT INTO Puede_Evolucionar VALUES ('5','5');

