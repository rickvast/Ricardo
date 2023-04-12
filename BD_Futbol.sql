drop database if exists bd_futbol;
create database bd_futbol;
use bd_futbol;

create table Liga (
id_liga int not null auto_increment,
tipo_liga varchar (30),
primary key (id_liga)
);

create table Equipo (
id_equipo int not null auto_increment,
id_liga int not null,
nombre varchar (30),
ciudad varchar (30),
fecha_fund date,
entrenador varchar (30),
primary key (id_equipo)
);

create table Jugadores (
id_jugador int not null auto_increment,
id_equipo int not null,
nombre varchar (30),
nacionalidad varchar (30),
fecha_nac date,
posicion varchar (30),
primary key (id_jugador)
);

create table Lesiones (
id_lesion int not null auto_increment,
id_jugador int not null,
tipo varchar (50),
duracion varchar (30),
gravedad varchar (30),
primary key (id_lesion)
);

create table Partidos (
id_partido int not null auto_increment,
hora varchar (30),
lugar varchar (30),
fecha date,
equipos_participantes varchar (50),
primary key (id_partido)
);

create table Estadisticas_Partido (
id_estad_part int not null auto_increment,
posesion_balon int,
tiros_puerta int,
faltas int,
tiros_fuera int,
primary key (id_estad_part)
);

create table Estadisticas_Jugadores (
id_estad_jug int not null auto_increment,
goles int,
faltas int,
tarjetas int,
asistencias int,
primary key (id_estad_jug)
);

create table Traspasos (
id_trasp int not null auto_increment,
nombre varchar (30),
equipo_anterior varchar (30),
equipo_actual varchar (30),
precio varchar (30),
primary key (id_trasp)
);

create table Historial_Enfrentamientos (
id_his_enfrent int not null auto_increment,
partidos_disputados int,
victorias int,
empates int,
derrotas int,
primary key (id_his_enfrent)
);

create table Premios (
id_premio int not null auto_increment,
mejor_jugador varchar (30),
maximo_goleador varchar (30),
portero_menos_goleado varchar (30),
primary key (id_premio)
);

create table Tabla_Posiciones (
id_posicion int not null auto_increment,
id_equipo int,
nombre_equipo varchar (30),
victorias int,
empates int, 
derrotas int,
primary key (id_posicion)
);

create table Equipo_Partidos (
id_equipo int not null,
id_partido int not null,
primary key (id_equipo, id_partido)
);

create table Equipo_Estadisticas_Partido (
id_equipo int not null,
id_estad_part int not null,
primary key (id_equipo, id_estad_part)
);

create table Equipo_Estadisticas_Jugadores (
id_equipo int not null,
id_estad_jug int not null,
primary key (id_equipo, id_estad_jug)
);

create table Equipo_Traspaso (
id_equipo int not null, 
id_trasp int not null,
primary key (id_equipo, id_trasp)
);

create table Equipo_Historial_Enfrentamientos (
id_equipo int not null,
id_his_enfrent int not null,
primary key (id_equipo, id_his_enfrent)
);

create table Equipo_Premios (
id_equipo int not null,
id_premio int not null,
primary key (id_equipo, id_premio)
);

alter table Equipo
add constraint fk1 foreign key (id_liga) references Liga (id_liga);

alter table Tabla_Posiciones
add constraint fk2 foreign key (id_equipo) references Equipo (id_equipo);

alter table Jugadores 
add constraint fk3 foreign key (id_equipo) references Equipo (id_equipo);

alter table Lesiones 
add constraint fk4 foreign key (id_jugador) references Jugadores (id_jugador);

alter table Equipo_Partidos
add constraint fk5 foreign key (id_equipo) references Equipo (id_equipo),
add constraint fk6 foreign key (id_partido) references Partidos (id_partido);

alter table Equipo_Estadisticas_Partido
add constraint fk7 foreign key (id_equipo) references Equipo (id_equipo),
add constraint fk8 foreign key (id_estad_part) references Estadisticas_Partido (id_estad_part);

alter table Equipo_Estadisticas_Jugadores
add constraint fk9 foreign key (id_equipo) references Equipo (id_equipo),
add constraint fk10 foreign key (id_estad_jug) references Estadisticas_Jugadores (id_estad_jug);

alter table Equipo_Traspaso
add constraint fk11 foreign key (id_equipo) references Equipo (id_equipo),
add constraint fk12 foreign key (id_trasp) references Traspasos (id_trasp);

alter table Equipo_Historial_Enfrentamientos
add constraint fk13 foreign key (id_equipo) references Equipo (id_equipo),
add constraint fk14 foreign key (id_his_enfrent) references Historial_Enfrentamientos (id_his_enfrent);

alter table Equipo_Premios 
add constraint fk15 foreign key (id_equipo) references Equipo (id_equipo),
add constraint fk16 foreign key (id_premio) references Premios (id_premio);

insert into Liga values (1,'Premier League');
insert into Liga values (2,'Serie A');
insert into Liga values (3,'LaLiga');
insert into Liga values (4,'Bundesliga');
insert into Liga values (5,'Ligue 1');

insert into Equipo values (1, 1, 'Manchester City', 'Manchester', '1880-11-23', 'Pep Guardiola');
insert into Equipo values (2, 2, 'Juventus', 'Turín', '1897-11-1', 'Massimiliano Allegri');
insert into Equipo values (3, 3, 'Real Madrid', 'Madrid', '1902-03-06', 'Carlo Ancelotti');
insert into Equipo values (4, 4, 'Bayern de Munich', 'Munich', '1900-02-27', 'Thomas Tuchel');
insert into Equipo values (5, 5, 'Paris Saint-Germain', 'Saint-Germain-des-Prés', '1970-08-12', 'Christophe Galtier');

insert into Jugadores values (1, 1, 'Erling Haaland', 'Noruego', '2000-07-21', 'Delantero Centro');
insert into Jugadores values (2, 2, 'Paul Pogba', 'Francés', '1993-03-15', 'Centrocampista');
insert into Jugadores values (3, 3, 'Karim Benzema', 'Francés', '1987-12-19', 'Delantero Centro');
insert into Jugadores values (4, 4, 'Manuel Neuer', 'Alemán', '1986-03-27', 'Portero');
insert into Jugadores values (5, 5, 'Kylian Mbappé', 'Francés', '1998-12-20', 'Delantero Centro');

insert into Lesiones values (1, 1, 'Lesión del Ligamento Cruzado Anterior', '3 meses', 'Leve');
insert into Lesiones values (2, 2, 'Esguince de Tobillo', '2 meses', 'Grave');
insert into Lesiones values (3, 3, 'Desgarro del Menisco', '4 meses', 'Media');
insert into Lesiones values (4, 4, 'Fractura de Falange', '5 meses', 'Leve');
insert into Lesiones values (5, 5, 'Rotura del tendón de Aquiles', '1 año', 'Grave');

insert into Partidos values (1, '18:00h', 'Etihad Stadium', '2023-02-17', 'Manchester City vs Valladolid');
insert into Partidos values (2, '14:30h', 'Allianz Stadium', '2023-01-03', 'Juventus vs Inter de Milán');
insert into Partidos values (3, '20:00h', 'Santiago Bernabeu', '2023-03-21', 'Real Madrid vs F. C. Barcelona');
insert into Partidos values (4, '11:00h', 'Allianz Stadium', '2023-04-10', 'Bayern de Munich vs Borussia Dortmund');
insert into Partidos values (5, '21:30h', 'Le Parc des Princes', '2023-02-28', 'Paris Saint-Germain vs Olympique de Marseille');

insert into Estadisticas_Partido values (1, 60, 20, 6, 11);
insert into Estadisticas_Partido values (2, 55, 8, 3, 5);
insert into Estadisticas_Partido values (3, 30, 13, 8, 6);
insert into Estadisticas_Partido values (4, 73, 10, 1, 4);
insert into Estadisticas_Partido values (5, 50, 3, 4, 1);

insert into Estadisticas_Jugadores values (1, 32, 2, 1, 7);
insert into Estadisticas_Jugadores values (2, 14, 5, 2, 25);
insert into Estadisticas_Jugadores values (3, 27, 1, 0, 4);
insert into Estadisticas_Jugadores values (4, 0, 1, 0, 1);
insert into Estadisticas_Jugadores values (5, 24, 2, 1, 10);

insert into Traspasos values (1, 'Jack Grealish', 'Notts County F. C.', 'Manchester City', '117 Millones de Euros');
insert into Traspasos values (2, 'Ángel Di Maria', 'Paris Saint-Germain', 'Juventus', '179 Millones de Euros');
insert into Traspasos values (3, 'Federico Valverde', 'C. A. Peñarol', 'Real Madrid', '5 Millones de Euros');
insert into Traspasos values (4, 'Sadio Mané', 'Liverpool F. C.', 'Bayern de Munich', '32 Millones de Euros');
insert into Traspasos values (5, 'Lionel Messi', 'F. C. Barcelona', 'Paris Saint-Germain', '80 Millones de Euros');

insert into Historial_Enfrentamientos values (1, 70, 40, 12, 18);
insert into Historial_Enfrentamientos values (2, 70, 29, 18, 23);
insert into Historial_Enfrentamientos values (3, 70, 55, 5, 10);
insert into Historial_Enfrentamientos values (4, 70, 32, 10, 28);
insert into Historial_Enfrentamientos values (5, 70, 19, 29, 22);

insert into Premios values (1, 'Cristiano Ronaldo', 'Cristiano Ronaldo', 'Thibaut Courtois');
insert into Premios values (2, 'Lionel Messi', 'Lionel Messi', 'Gianluigi Donnarumma');
insert into Premios values (3, 'Neymar Jr.', 'Neymar Jr.', 'Thibaut Courtois');
insert into Premios values (4, 'Kylian Mbappé', 'Kylian Mbappé', 'André Ter Stegen');
insert into Premios values (5, 'Robert Lewandowski', 'Robert Lewandowski', 'Thibaut Courtois');

insert into Tabla_Posiciones values (1, 1, 'Manchester City', 40, 12, 18);
insert into Tabla_Posiciones values (2, 2, 'Juventus', 29, 18, 23);
insert into Tabla_Posiciones values (3, 3, 'Real Madrid', 55, 5, 10);
insert into Tabla_Posiciones values (4, 4, 'Bayern de Munich', 32, 10 , 28);
insert into Tabla_Posiciones values (5, 5, 'Paris Saint-Germain', 19, 29, 22);

insert into Equipo_Partidos values (1, 1);
insert into Equipo_Partidos values (2, 2);
insert into Equipo_Partidos values (3, 3);
insert into Equipo_Partidos values (4, 4);
insert into Equipo_Partidos values (5, 5);

insert into Equipo_Estadisticas_Partido values (1, 1);
insert into Equipo_Estadisticas_Partido values (2, 2);
insert into Equipo_Estadisticas_Partido values (3, 3);
insert into Equipo_Estadisticas_Partido values (4, 4);
insert into Equipo_Estadisticas_Partido values (5, 5);

insert into Equipo_Estadisticas_Jugadores values (1, 1);
insert into Equipo_Estadisticas_Jugadores values (2, 2);
insert into Equipo_Estadisticas_Jugadores values (3, 3);
insert into Equipo_Estadisticas_Jugadores values (4, 4);
insert into Equipo_Estadisticas_Jugadores values (5, 5);

insert into Equipo_Traspaso values (1, 1);
insert into Equipo_Traspaso values (2, 2);
insert into Equipo_Traspaso values (3, 3);
insert into Equipo_Traspaso values (4, 4);
insert into Equipo_Traspaso values (5, 5);

insert into Equipo_Historial_Enfrentamientos values (1, 1);
insert into Equipo_Historial_Enfrentamientos values (2, 2);
insert into Equipo_Historial_Enfrentamientos values (3, 3);
insert into Equipo_Historial_Enfrentamientos values (4, 4);
insert into Equipo_Historial_Enfrentamientos values (5, 5);

insert into Equipo_Premios values (1, 1);
insert into Equipo_Premios values (2, 2);
insert into Equipo_Premios values (3, 3);
insert into Equipo_Premios values (4, 4);
insert into Equipo_Premios values (5, 5);
