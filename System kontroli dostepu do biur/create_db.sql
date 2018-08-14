CREATE TABLE Firma
(
	Lp                  serial                        ,
	Nazwa               varchar(32)            not null,
	CONSTRAINT          Firma_Nazwa_pk         PRIMARY KEY(Nazwa)
);

CREATE TABLE Pomieszczenie
(
	Nr                  char(6)                	   ,
	Nazwa               varchar(32)            not null,
	Rodzaj              varchar(32)            null    ,
	Nazwa_firmy         varchar(32)                    ,
	CONSTRAINT	      pomieszczenie_Nr_pk       
				PRIMARY KEY(Nr),
	CONSTRAINT          pomieszczenie_Nazwa_firmy_fk 
				FOREIGN KEY(Nazwa_firmy)
			      	REFERENCES firma(Nazwa)
         	             	ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE Pracownik
(
  	Id                  char(6)                	   ,
  	Nazwa_firmy         varchar(12)            not null,
  	Imie                varchar(32)                    ,
 	Nazwisko            varchar(32)            not null,
  	Nr_kontaktowy       integer              	   ,
  	Plec                varchar(2)   		   ,          
 	CONSTRAINT          pracownik_Id_pk           
				PRIMARY KEY(Id),
  	CONSTRAINT          pracownik_Nazwa_firmy_fk  
				FOREIGN KEY(Nazwa_firmy)
			      	REFERENCES firma(Nazwa)
         	             	ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE Wynagrodzenie
(
 	Id_Pracownika          char(6)              not null,
  	Stanowisko             varchar(24)                  ,	
  	Il_przepracowanych_msc char(6)                      ,
  	Pensja_brutto          numeric(7,2)                 ,
	Pensja_netto	       numeric(7,2)	 	    ,
  	CONSTRAINT          Wynagrodzenie_Id_Pracownika_pk   
				PRIMARY KEY(Id_Pracownika),
  	CONSTRAINT          Wynagrodzenie_Id_Pracownika_fk   
				FOREIGN KEY(Id_Pracownika)
        	              	REFERENCES Pracownik(Id)
                      	ON UPDATE CASCADE ON DELETE SET NULL
);
     

CREATE TABLE Karta
(
  	Id                 char(6)                          ,
  	Id_Pracownika      char(6)                 not null,
  	Pomieszczenie_nr   varchar(16)             not null,
  	Nr_decymalny       char(14)                not null		UNIQUE,
  	Data_wydania       date                            ,
	Status		   varchar(16)		           ,
  	CONSTRAINT         Karta_Id_pk
				PRIMARY KEY(Id),
  	CONSTRAINT         Karta_Id_Pracownika_fk  
		             	FOREIGN KEY(Id_Pracownika)
      		               	REFERENCES   pracownik(Id)
       		              	ON UPDATE CASCADE ON DELETE SET NULL,
  	CONSTRAINT         Karta_Pomieszczenie_nr_fk
        	             	FOREIGN KEY(Pomieszczenie_nr)
        	             	REFERENCES Pomieszczenie(Nr)

);



