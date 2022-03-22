CREATE TABLE Departmen (
id INTEGER  UNIQUE NOT NULL, 
name TEXT NOT NULL,
CONSTRAINT Departmen_pk PRIMARY KEY (id)
);

CREATE TABLE Municipality(
id INTEGER PRIMARY KEY  AUTOINCREMENT UNIQUE,
name TEXT NOT NULL,
id_deparment INTEGER NOT NULL,
FOREIGN KEY (id_deparment) REFERENCES Departmen(id)
);

CREATE TABLE Statuscivil(
id INTEGER  UNIQUE NOT NULL,
name TEXT NOT NULL,
CONSTRAINT Statuscivil_pk PRIMARY KEY (id)
)


CREATE TABLE Users(
email TEXT UNIQUE NOT NULL,
name TEXT NOT NULL,
last_name TEXT NOT NULL,
direction Text ,
status_civil TEXT,
Phone NUMERIC,
city INTEGER,
PRIMARY KEY (email),
FOREIGN KEY(city) REFERENCES Municipality(id)
);



--/**Ingreso de datos iniciales**/

--Departamento
INSERT INTO Departmen(id, name) VALUES (1, "Amazonas");
INSERT INTO Departmen(id, name) VALUES (2, "Antioquia");
INSERT INTO Departmen(id, name) VALUES (3, "Arauca");
INSERT INTO Departmen(id, name) VALUES (4, "Atlántico");
INSERT INTO Departmen(id, name) VALUES (5, "Bolívar");
INSERT INTO Departmen(id, name) VALUES (6, "Boyacá");
INSERT INTO Departmen(id, name) VALUES (7, "Caldas");
INSERT INTO Departmen(id, name) VALUES (8, "Caquetá");
INSERT INTO Departmen(id, name) VALUES (9, "Casanara");
INSERT INTO Departmen(id, name) VALUES (10, "Cauca");
INSERT INTO Departmen(id, name) VALUES (11, "Cesar");
INSERT INTO Departmen(id, name) VALUES (12, "Chocó");
INSERT INTO Departmen(id, name) VALUES (13, "Córdoba");
INSERT INTO Departmen(id, name) VALUES (14, "Cundinamarca");
INSERT INTO Departmen(id, name) VALUES (15, "Guinía");
INSERT INTO Departmen(id, name) VALUES (16, "Guaviare");
INSERT INTO Departmen(id, name) VALUES (17, "Huila");
INSERT INTO Departmen(id, name) VALUES (18, "La Guajira");
INSERT INTO Departmen(id, name) VALUES (19, "Magdalena");
INSERT INTO Departmen(id, name) VALUES (20, "Meta");
INSERT INTO Departmen(id, name) VALUES (21, "Nariño");
INSERT INTO Departmen(id, name) VALUES (22, "Norte de Santander");
INSERT INTO Departmen(id, name) VALUES (23, "Putumayo");
INSERT INTO Departmen(id, name) VALUES (24, "Quindío");
INSERT INTO Departmen(id, name) VALUES (25, "Risaralda");
INSERT INTO Departmen(id, name) VALUES (26, "San Andrés y Providencia");
INSERT INTO Departmen(id, name) VALUES (27, "Santander");

INSERT INTO Departmen(id, name) VALUES (28, "Sucre");
INSERT INTO Departmen(id, name) VALUES (29, "Tolima");
INSERT INTO Departmen(id, name) VALUES (30, "Valle del Cauca");
INSERT INTO Departmen(id, name) VALUES (31, "Vaupés");
INSERT INTO Departmen(id, name) VALUES (32, "Vichada");

--/**Municipios**/


--Amazonas
INSERT INTO Municipality(name, id_deparment) VALUES("Leticia", 1);

--Antioquia 
--bajo cauca
INSERT INTO Municipality(name, id_deparment) VALUES("Caucasia", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("El Bagre", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Nechí", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Tarazá", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Zaragoza", 2);

-- Magdalena Medio
INSERT INTO Municipality(name, id_deparment) VALUES("Caracolí", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Maceo", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Puerto Berrío", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Puerto Nare", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Puerto Triunfo", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Yondó", 2);

-- Nordeste
INSERT INTO Municipality(name, id_deparment) VALUES("Amalfi", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Anorí", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Cisneros", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Remedios", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("San Roque", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Santo Domingo", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Segovia", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Vegachí", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Yalí", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Yolombó", 2);

-- Norte
INSERT INTO Municipality(name, id_deparment) VALUES("Angostura", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Belmira", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Briceño", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Campamento", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Carolina", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Donmatías", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Entrerríos", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Gómez Plata", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Guadalupe", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Ituango", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("San Andrés de Cuerquia", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("San José de la Montaña", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("San Pedro de los Milagros", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Santa Rosa de Osos", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Toledo", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Valdivia", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Yarumal", 2);

-- Occidente
INSERT INTO Municipality(name, id_deparment) VALUES("Abriaquí", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Anzá", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Armenia", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Buriticá", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Caicedo", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Cañasgordas", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Dabeiba", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Ebéjico", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Frontino", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Giraldo", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Heliconia", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Liborina", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Olaya", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Peque", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Sabanalarga", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("San Jerónimo", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Santa Fe de Antioquia", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Sopetrán", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Uramita", 2);

--Oriente
INSERT INTO Municipality(name, id_deparment) VALUES("Abejorral", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Alejandría", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Argelia", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Cocorná", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Concepción", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("El Carmen de Viboral", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("El Peñol", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("El Retiro", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("El Santuario", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Granada", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Guarne", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Guatapé", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("La Ceja", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("La Unión", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Marinilla", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Nariño", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Rionegro", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("San Carlos", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("San Francisco", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("San Luis", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("San Rafael", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("San Vicente", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Sonsón", 2);

--Suroeste
INSERT INTO Municipality(name, id_deparment) VALUES("Amagá", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Andes", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Angelópolis", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Betania", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Betulia", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Caramanta", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Ciudad Bolívar", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Concordia", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Fredonia", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Hispania", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Jardín", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Jericó", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("La Pintada", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Montebello", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Pueblorrico", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Salgar", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Santa Bárbara", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Támesis", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Tarso", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Titiribí", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Urrao", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Valparaíso", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Venecia", 2);

--Urabá
INSERT INTO Municipality(name, id_deparment) VALUES("Apartadó", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Arboletes", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Carepa", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Chigorodó", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Murindó", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Mutatá", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Necoclí", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("San Juan de Urabá", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("San Pedro de Urabá", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Turbo", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Vigía del Fuerte", 2);

--Valle de Aburrá
INSERT INTO Municipality(name, id_deparment) VALUES("Barbosa", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Bello", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Caldas", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Copacabana", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Envigado", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Girardota", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Itagüí", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("La Estrella", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Medellín", 2);
INSERT INTO Municipality(name, id_deparment) VALUES("Sabaneta", 2);


--Arauca
INSERT INTO Municipality(name, id_deparment) VALUES("Arauca", 3);
--Atlántico
INSERT INTO Municipality(name, id_deparment) VALUES("Barranquilla", 4);
--Bolívar
INSERT INTO Municipality(name, id_deparment) VALUES("Cartagena", 5);
--Boyacá
INSERT INTO Municipality(name, id_deparment) VALUES("Tunja", 6);
--Caldas
INSERT INTO Municipality(name, id_deparment) VALUES("Manizales", 7);
--Caquetá
INSERT INTO Municipality(name, id_deparment) VALUES("Florencia", 8);
--Casanare
INSERT INTO Municipality(name, id_deparment) VALUES("Yopal", 9);


--cauca
INSERT INTO Municipality(name, id_deparment) VALUES("Popayán", 10);
--cesar
INSERT INTO Municipality(name, id_deparment) VALUES("Valledupar", 11);
--Chocó 
INSERT INTO Municipality(name, id_deparment) VALUES("Quibdó", 12);
--Córdoba
INSERT INTO Municipality(name, id_deparment) VALUES("Montería", 13);
--Cundinamarca
INSERT INTO Municipality(name, id_deparment) VALUES("Bogotá", 14);
--Guainía
INSERT INTO Municipality(name, id_deparment) VALUES("Inírida", 15);
--Guaviare
INSERT INTO Municipality(name, id_deparment) VALUES("San José del Guaviare", 16);
--Huila
INSERT INTO Municipality(name, id_deparment) VALUES("Neiva", 17);


--La Guajira
INSERT INTO Municipality(name, id_deparment) VALUES("Riohacha", 18);
--Magdalean
INSERT INTO Municipality(name, id_deparment) VALUES("Santa Marta", 19);
--Meta
INSERT INTO Municipality(name, id_deparment) VALUES("Villavicencio", 20);
--Nariño
INSERT INTO Municipality(name, id_deparment) VALUES("San Juan de Pasto", 21);
--Norte de Santander
INSERT INTO Municipality(name, id_deparment) VALUES("San Jośe de Cúcuta", 22);
--Putumayo
INSERT INTO Municipality(name, id_deparment) VALUES("Mocoa", 23);
--Quindío
INSERT INTO Municipality(name, id_deparment) VALUES("Armenia", 24);



--Risaralda
INSERT INTO Municipality(name, id_deparment) VALUES("Pereira", 25);
--San Andres y Providencia
INSERT INTO Municipality(name, id_deparment) VALUES("San Andrés", 26);
--Santander
INSERT INTO Municipality(name, id_deparment) VALUES("Bucaramanga", 27);
--Sucre
INSERT INTO Municipality(name, id_deparment) VALUES("Sincelejo", 28);
--Tolima
INSERT INTO Municipality(name, id_deparment) VALUES("Ibagué", 29);
--Valle del Cauca
INSERT INTO Municipality(name, id_deparment) VALUES("Cali", 30);
--Vaupés
INSERT INTO Municipality(name, id_deparment) VALUES("Mitú", 31);
--Vichada
INSERT INTO Municipality(name, id_deparment) VALUES("Puerto Carreño", 32);





--STADO CIVIL
INSERT INTO Statuscivil(id,name) VALUES(1, "Soltero");
INSERT INTO Statuscivil(id,name) VALUES(2, "Casado");
INSERT INTO Statuscivil(id,name) VALUES(3, "Viudo");
INSERT INTO Statuscivil(id,name) VALUES(4, "Divorciado");


--SELECT * from Municipality m

--select *
--FROM Artifact a inner join Municipality m on a.id_municipality = m.id



--select a.id, a.name, a.image, a.id_municipality, m.name, m.id_subregions
--FROM Artifact a inner join Municipality m on a.id_municipality = m.id WHERE m.id_subregions = "8"

--select COUNT(*) FROM Artifact a inner join Municipality m on a.id_municipality = m.id WHERE m.id_subregions = "8"
