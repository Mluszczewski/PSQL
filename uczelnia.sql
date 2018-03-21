
CREATE TABLE nauczyciel
(
    nr_leg           char(6)       not null,
    imie             varchar(32)   not null,
    nazwisko         varchar(32)   not null,
    CONSTRAINT       nauczyciel_pk PRIMARY KEY(nr_leg)
);

CREATE TABLE student
(
    nr_ind           char(6)       not null,
    imie             varchar(32)   not null,
    nazwisko         varchar(32)   not null,
    CONSTRAINT       student_pk PRIMARY KEY(nr_ind)
);

CREATE TABLE przedmiot
(
   kod              int,
   rodzaj           varchar(20)   not null,
   nazwa            varchar(50)   not null,
   godziny	        int           not null,
   -- nr legitymacji nauczyciela prowadzacego
   nr_leg           char(7)       ,
   CONSTRAINT       przedmiot_pk PRIMARY KEY(kod),
   -- klucz obcy - powiazanie przedmiotu z nauczycielem
   CONSTRAINT       przedmiot_fk FOREIGN KEY(nr_leg)
                       REFERENCES nauczyciel(nr_leg)
                        ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE termin
(
   dzien_tyg        int       not null,
   godzina          int       not null,
   sala             char(7)   not null,
   CONSTRAINT       termin_un UNIQUE(dzien_tyg,godzina,sala),
   -- klucz obcy - zwiazek jednojednoznaczny z przedmiotem
   kod              int,
   CONSTRAINT       termin_przedmiot_fk FOREIGN KEY(kod)
                       REFERENCES przedmiot(kod)
                       ON UPDATE CASCADE ON DELETE SET NULL,
   CONSTRAINT       kod_pk PRIMARY KEY(kod)
);


-- poniższa tabela jest realizacją związku między
-- zbiorami encji przedmiot i student

CREATE TABLE jest_sluchaczem
(
    nr_ind           char(6)     not null,
    kod              int         not null,
    CONSTRAINT       jest_sluchaczem_nr_ind_fk FOREIGN KEY(nr_ind)
                        REFERENCES student(nr_ind)
                        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT       jest_sluchaczem_kod_fk FOREIGN KEY(kod)
                        REFERENCES przedmiot(kod)
                        ON UPDATE CASCADE ON DELETE CASCADE
);


-- wypełnienie tabeli nauczyciel

INSERT INTO nauczyciel (nr_leg, imie, nazwisko)
       VALUES ('L 001', 'Jan', 'Kowalski');
INSERT INTO nauczyciel (nr_leg, imie, nazwisko)
       VALUES ('L 002', 'Michał', 'Michalski');
INSERT INTO nauczyciel (nr_leg, imie, nazwisko)
       VALUES ('L 003', 'Anna', 'Nowak');
INSERT INTO nauczyciel (nr_leg, imie, nazwisko)
       VALUES ('L 004', 'Zuzanna', 'Przepiórkowska');
INSERT INTO nauczyciel (nr_leg, imie, nazwisko)
       VALUES ('L 005', 'Eleonora', 'Plichta');

-- wypełnienie tabeli student

INSERT INTO student (nr_ind, imie, nazwisko)
       VALUES ('215001', 'Aleksander', 'Cyra');
INSERT INTO student (nr_ind, imie, nazwisko)
       VALUES ('215002', 'Hermenegilda', 'Kociubińska');
INSERT INTO student (nr_ind, imie, nazwisko)
       VALUES ('215003', 'Krzysztof', 'Kulikowski');
INSERT INTO student (nr_ind, imie, nazwisko)
       VALUES ('215004', 'Jerzy', 'Samp');
INSERT INTO student (nr_ind, imie, nazwisko)
       VALUES ('215005', 'Bronisław', 'Wstęp');

-- wypełnienie tabeli przedmiot

INSERT INTO przedmiot (kod, rodzaj, nazwa, godziny, nr_leg)
       VALUES (1, 'wykład', 'Matematyka dyskretna', 2, 'L 004');
INSERT INTO przedmiot (kod, rodzaj, nazwa, godziny, nr_leg)
       VALUES (2, 'wykład', 'Programowanie w C', 2, 'L 002');
INSERT INTO przedmiot (kod, rodzaj, nazwa, godziny, nr_leg)
       VALUES (3, 'laboratorium', 'Programowanie w C', 2, 'L 001');
INSERT INTO przedmiot (kod, rodzaj, nazwa, godziny, nr_leg)
       VALUES (4, 'ćwiczenia', 'Matematyka dyskretna', 2, 'L 004');
INSERT INTO przedmiot (kod, rodzaj, nazwa, godziny, nr_leg)
       VALUES (5, 'wykład', 'Filozofia', 2, 'L 003');

-- wypełnienie tabeli termin
INSERT INTO termin (dzien_tyg, godzina, sala, kod)
      VALUES (1, 10, 'aula 2', 1);
INSERT INTO termin (dzien_tyg, godzina, sala, kod)
      VALUES (2, 8, 's.116', 2);
INSERT INTO termin (dzien_tyg, godzina, sala, kod)
      VALUES (3, 12, 'l.109', 3);
INSERT INTO termin (dzien_tyg, godzina, sala, kod)
      VALUES (2, 12, 's.47', 4);
INSERT INTO termin (dzien_tyg, godzina, sala, kod)
      VALUES (4, 13, 'aula 2', 5);

-- wypełnienie tabeli jest_sluchaczem kodującej związek studenta i przedmiotu

INSERT INTO jest_sluchaczem (nr_ind, kod) VALUES ('215001', 1);
INSERT INTO jest_sluchaczem (nr_ind, kod) VALUES ('215001', 4);
INSERT INTO jest_sluchaczem (nr_ind, kod) VALUES ('215001', 2);
INSERT INTO jest_sluchaczem (nr_ind, kod) VALUES ('215001', 3);
INSERT INTO jest_sluchaczem (nr_ind, kod) VALUES ('215002', 5);
INSERT INTO jest_sluchaczem (nr_ind, kod) VALUES ('215003', 3);
INSERT INTO jest_sluchaczem (nr_ind, kod) VALUES ('215003', 4);
INSERT INTO jest_sluchaczem (nr_ind, kod) VALUES ('215004', 1);
INSERT INTO jest_sluchaczem (nr_ind, kod) VALUES ('215004', 5);
INSERT INTO jest_sluchaczem (nr_ind, kod) VALUES ('215005', 3);

-- usuwanie tabel
DROP TABLE termin;
DROP TABLE jest_sluchaczem;
DROP TABLE przedmiot;
DROP TABLE student;
DROP TABLE nauczyciel
