insert into firma(Lp, Nazwa)
	values('1', 'Green');
insert into firma(Lp, Nazwa)
	values('2', 'Red');

insert into pomieszczenie(Nr, Nazwa, Rodzaj, Nazwa_firmy)
	values('1', 'Alpha', 'Salka konferencyjna', 'Green');
insert into pomieszczenie(Nr, Nazwa, Rodzaj, Nazwa_firmy)
	values('2', 'Beta', 'Biuro', 'Red');
insert into pomieszczenie(Nr, Nazwa, Rodzaj, Nazwa_firmy)
	values('3', 'Gamma', 'Biuro', 'Green');
insert into pomieszczenie(Nr, Nazwa, Rodzaj, Nazwa_firmy)
	values('4', 'Omega', 'Salka konferencyjna', 'Red');
insert into pomieszczenie(Nr, Nazwa, Rodzaj, Nazwa_firmy)
	values('5', 'Delta', 'Kuchnia', NULL);

insert into pracownik(Id, Nazwa_firmy, Imie, Nazwisko, Nr_kontaktowy, Plec)
	values('1', 'Green', 'Stanislaw', 'Wokulski', '541369854', 'M');
insert into pracownik(Id, Nazwa_firmy, Imie, Nazwisko, Nr_kontaktowy, Plec)
	values('2', 'Red', 'Seweryn', 'Baryka', '526519854', 'M');
insert into pracownik(Id, Nazwa_firmy, Imie, Nazwisko, Nr_kontaktowy, Plec)
	values('3', 'Green', 'Izabela', 'Lecka', '435723467', 'K');
insert into pracownik(Id, Nazwa_firmy, Imie, Nazwisko, Nr_kontaktowy, Plec)
	values('4', 'Red', 'Jacek', 'Gmoch','654734976', 'M');
insert into pracownik(Id, Nazwa_firmy, Imie, Nazwisko, Nr_kontaktowy, Plec)
	values('5', 'Green', 'Agata', 'Lecka','654734976', 'K');
insert into pracownik(Id, Nazwa_firmy, Imie, Nazwisko, Nr_kontaktowy, Plec)
	values('6', 'Red', 'Cezary', 'Baryka', NULL, 'M');

insert into Wynagrodzenie(Id_Pracownika, Stanowisko, Il_przepracowanych_msc, Pensja_brutto, Pensja_netto)
        values('1', 'Prezez', '631', '15600', '13600');
insert into Wynagrodzenie(Id_Pracownika, Stanowisko, Il_przepracowanych_msc, Pensja_brutto, Pensja_netto)
        values('2', 'Praktykant', '2', '2100', '1800');
insert into Wynagrodzenie(Id_Pracownika, Stanowisko, Il_przepracowanych_msc, Pensja_brutto, Pensja_netto)
        values('3', 'Programista', '12', '5200', '4100');
insert into Wynagrodzenie(Id_Pracownika, Stanowisko, Il_przepracowanych_msc, Pensja_brutto, Pensja_netto)
        values('4', 'Ksiegowy', '34', '3100', '2500');
insert into Wynagrodzenie(Id_Pracownika, Stanowisko, Il_przepracowanych_msc, Pensja_brutto, Pensja_netto)
        values('5', 'Programista', '21', '3100', '2500');
insert into Wynagrodzenie(Id_Pracownika, Stanowisko, Il_przepracowanych_msc, Pensja_brutto, Pensja_netto)
        values('6', 'Prezez', '851', '19300', '17300');

insert into Karta(Id, Id_Pracownika, Pomieszczenie_nr, Nr_decymalny, Data_wydania, Status)
	values('1', '1', '1', '52526478569321', '11-08-2018', 'Aktywna');
insert into Karta(Id, Id_Pracownika, Pomieszczenie_nr, Nr_decymalny, Data_wydania, Status)
	values('2', '1', '2', '52524286239331', '22-02-2016', 'Aktywna');
insert into Karta(Id, Id_Pracownika, Pomieszczenie_nr, Nr_decymalny, Data_wydania, Status)
	values('3', '3', '3', '52526000215412', '23-03-2014', 'Aktywna');
insert into Karta(Id, Id_Pracownika, Pomieszczenie_nr, Nr_decymalny, Data_wydania, Status)
	values('4', '4', '4', '23872008569325', '28-03-2018', 'Aktywna');
insert into Karta(Id, Id_Pracownika, Pomieszczenie_nr, Nr_decymalny, Data_wydania, Status)
	values('5', '1', '3', '52526467867830', '11-08-2018', 'Aktywna');
insert into Karta(Id, Id_Pracownika, Pomieszczenie_nr, Nr_decymalny, Data_wydania, Status)
	values('6', '2', '2', '95739507282060', '11-08-2018', 'Zagubiona');







