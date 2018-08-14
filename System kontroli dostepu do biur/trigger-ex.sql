-- Pierwszy Trigger

UPDATE wynagrodzenie SET pensja_netto = '8000'
WHERE id_pracownika = '2';

UPDATE wynagrodzenie SET pensja_netto = '-8000'
WHERE id_pracownika = '2';

UPDATE wynagrodzenie SET pensja_netto = '500'
WHERE id_pracownika = '2';



-- Drugi Trigger

UPDATE pracownik SET nr_kontaktowy = '452'
WHERE id = '1';

UPDATE pracownik SET nr_kontaktowy = '563214789'
WHERE id = '1';
