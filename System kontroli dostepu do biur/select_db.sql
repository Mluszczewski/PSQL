*Do uzupełnienia po poprawie kodu.
-- GRUPOWANIE

 -- Pokaz nazwiska pracownikow
	SELECT nazwisko FROM pracownik;

 -- Pokaz nazwiska pracownikow bez elementow powtarzajacych sie	
	SELECT DISTINCT nazwisko FROM pracownik;

 -- Pokaz nazwiska pracownikow oraz ilosc ich wystapien	
	SELECT nazwisko, count(nazwisko) FROM pracownik GROUP BY nazwisko;

 -- Pokaz nazwiska pracownikow ale tylko tych ktorzy sie powtarzaja	
	SELECT nazwisko FROM pracownik GROUP BY nazwisko HAVING count(nazwisko) > 1;
	
-- ZAGNIEZDZENIA NIESKORELOWANE

 -- Wyswietl dane pracownikow o powtarzajacych sie nazwiskach
	SELECT imie, nazwisko, plec FROM pracownik
		WHERE nazwisko in(
		SELECT nazwisko FROM pracownik
		GROUP BY nazwisko HAVING count(nazwisko) > 1);

 -- Sprawdz jacy pracownicy posiadaja karty (w tym uszkodzone bądź zagubione)
	SELECT imie, nazwisko FROM pracownik K, Karta Z
		WHERE K.id = Z.Id_pracownika
		GROUP BY K.id, imie, nazwisko;

-- ZAGNIEZDZENIA SKORELOWANE

 -- Pokazuje pracownikow ktorzy posiadaja kartę
	SELECT imie, nazwisko FROM pracownik K
		WHERE EXISTS(
		SELECT *
		FROM karta Z INNER JOIN Pomieszczenie P
		ON k.id = z.id_pracownika
		and P.Nr = Z.id);

 -- Pokazuje pracownikow ktorzy nie posiadaja karty 
	SELECT imie, nazwisko FROM pracownik K
		WHERE NOT EXISTS(
		SELECT *
		FROM karta Z INNER JOIN Pomieszczenie P
		ON k.id = z.id_pracownika
		and P.Nr = Z.id);

-- FUNKCJE AGREGUJACE

 -- Pokazuje ilosc posiadanych kart przez danego pracownika do poszczegolnego pomieszczenia
	SELECT imie, nazwisko, nazwa, Karta.id AS karta_id, count(*) as "ile kart do pomieszczenia"
		FROM ((pracownik INNER JOIN karta
		ON pracownik.id = karta.id_pracownika)
		INNER JOIN pomieszczenie
		ON karta.id = pomieszczenie.nr)
		GROUP BY imie, nazwisko, karta.id, nazwa;

-- WARUNEK NOT IN ORAZ IN

 -- Sprawdza ktorzy pracownicy nie maja wcale karty
	SELECT imie, nazwisko FROM pracownik
		WHERE id NOT IN(
		SELECT Id_pracownika FROM karta)
		GROUP BY imie, nazwisko;

 -- Sprawdza jakie firmy posiadaja pomieszczenia
	SELECT nr, nazwa, rodzaj FROM pomieszczenie
		WHERE nazwa_firmy IN(
		SELECT nazwa FROM firma)
		GROUP BY nr, nazwa, rodzaj ORDER BY nr;


-- OPERACJE ARYTMETYCZNE

 -- Obliczanie kosztu zatrudnienia pracownika
	SELECT *, pensja_brutto - pensja_netto AS koszt FROM wynagrodzenie ORDER BY koszt DESC;
	SELECT * FROM karta WHERE Data_wydania BETWEEN '2018/03/23' AND '2018/08/11';

-- SPRAWDZANIE WARUNKU NULL ORAZ NOT NULL
	
	SELECT * FROM pomieszczenie WHERE Nazwa_firmy IS NOT NULL;
	SELECT * FROM pomieszczenie WHERE Nazwa_firmy IS NULL;
	SELECT * FROM wynagrodzenie WHERE pensja_brutto IS NULL;

-- WARUNKI ODWOLUJACE SIE DO WZOROW NAPISOW	

	SELECT imie, nazwisko, stanowisko FROM pracownik p, wynagrodzenie w
		WHERE p.id = w.id_pracownika AND stanowisko LIKE '%Programista%';
	
	SELECT * FROM pomieszczenie WHERE nazwa_firmy = 'Green';

-- USUWANIE Z TABELI

	DELETE FROM pomieszczenie WHERE nazwa_firmy IS NULL;
	
	
-- UPDATE

	UPDATE wynagrodzenie SET pensja_brutto = pensja_brutto + 200
		WHERE pensja_brutto IS NOT NULL;

	UPDATE wynagrodzenie SET pensja_brutto = 0 
		WHERE pensja_brutto IS NULL;

	UPDATE wynagrodzenie SET pensja_brutto = pensja_brutto * 1.05
		WHERE EXISTS(
		SELECT 1 FROM pracownik WHERE id = id_pracownika);

-- VIEW	

  -- Tworzy widok na osoby pracujace jako programista
	CREATE VIEW programisci AS
		SELECT * FROM wynagrodzenie
		WHERE stanowisko = 'Programista'; 

	-- Wywołanie

	SELECT * FROM programisci;

  -- Tworzy widok na pomieszczenia które należą do firmy Green

	CREATE VIEW pomieszczenia_green AS
		SELECT * FROM pomieszczenie
		WHERE nazwa_firmy = 'Green';

	-- Wywołanie

	SELECT * FROM pomieszczenia_green;


-- OPCJA LEFT INNER JOIN

  -- Pokazuje karty pracowników, id karty oraz ich status
	SELECT pracownik.id, imie, nazwisko,
		karta.Id, karta.status
		FROM pracownik
		LEFT JOIN karta
		ON pracownik.id=karta.id_pracownika;








