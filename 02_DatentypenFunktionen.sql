USE Northwind;

--Numerische Typen:
--int: Ganze Zahl
--decimal, float: Kommazahlen
--bit: 1 oder 0, wahr oder falsch
--money: Geldwerte

--Texttypen
--varchar(X): Text mit maximal X Zeichen
--char(X): Text mit genau X Zeichen
--text: Text mit beliebiger L�nge (veraltet) -> varchar(MAX)
--n vor Typen: Unicode

--Datumstypen:
--datetime: Datum + Zeit
--date: Nur Datum
--time: Nur Zeit



--Datumsfunktionen
SELECT GETDATE(); --Das jetztige Datum + Zeit, millisekundengenau
SELECT SYSDATETIME(); --Das jetztige Datum + Zeit, nanosekundengenau

/*
	Intervalle:
    year, yyyy, yy = Year
    month, MM, M = month
    week, ww, wk = Week
    day, dd, d = Day
    hour, hh = hour
    minute, mi, m = Minute
    second, ss, s = Second
    millisecond, ms = Millisecond
	nanosecond, ns

    weekday, dw, w = Weekday (1-7)
    dayofyear, dy, y = Day of the year (1-366)
    quarter, qq, q = Quarter (1-4)
*/

--YEAR/MONTH/DAY
SELECT YEAR(GETDATE()); --Vom heutigen Datum nur das Jahr zur�ck geben
SELECT MONTH(GETDATE()); --Vom heutigen Datum nur das Monat zur�ck geben
SELECT DAY(GETDATE()); --Vom heutigen Datum nur den Tag zur�ck geben

SELECT YEAR(HireDate) FROM Employees; --Funktionen auf Spalten anwenden

--DATEPART: Teil eines Datums, anhand eines Intervalls
SELECT DATEPART(HOUR, GETDATE()); --Die Stunde vom heutigen Datum
SELECT DATEPART(SECOND, GETDATE()); --Die Sekunde vom heutigen Datum

SELECT DATEPART(WEEKDAY, GETDATE()); --Wochentag vom heutigen Datum (5, Freitag)
SELECT DATEPART(DAYOFYEAR, GETDATE()); --Jahrestag vom heutigen Datum seit 01.01. (62)
SELECT DATEPART(QUARTER, GETDATE()); --Quartal vom heutigen Datum (1)

SELECT HireDate, DATEPART(DAYOFYEAR, HireDate) FROM Employees; --DATEPART auf Spalte anwenden

--DATEDIFF: Unterschied zwischen zwei Datumswerten, anhand eines Intervalls
SELECT DATEDIFF(YEAR, '20000101', GETDATE()); --Wieviele Jahre sind seit 2000 vergangen?

SELECT HireDate, DATEDIFF(YEAR, HireDate, GETDATE()) FROM Employees; --Wie lange sind unsere Mitarbeiter schon in der Firma? (ungenau)

SELECT DATEDIFF(YEAR, '2020-01-01', GETDATE()); --ISO-8601 Datum immer m�glich
SELECT DATEDIFF(YEAR, '01.01.2020', GETDATE()); --Deutsches Datum m�glich weil deutscher Server
SELECT DATEDIFF(YEAR, '01/30/2020', GETDATE()); --Amerikanisches Datum nicht m�glich, da deutscher Server (aber auf amerikanischem Server m�glich)



--Stringfunktionen
SELECT Address + City + PostalCode + Country FROM Customers; --Strings verbinden mit +

SELECT CONCAT(Address, City, PostalCode, Country) FROM Customers; --CONCAT: beliebig viele Texte zusammenbauen
SELECT CONCAT(Address, ' ', City, ' ', PostalCode, ', ', Country) FROM Customers;

SELECT CONCAT_WS(' ', Address, City, PostalCode, Country) FROM Customers; --CONCAT_WS: beliebig viele Texte zusammenbauen mit einem Separator

SELECT CONCAT_WS(' ', Address, City, PostalCode, Country) AS [Volle Adresse] FROM Customers;

--LEN/DATALENGTH: Gibt die L�nge eines Texts aus
SELECT LEN('Text'); --4
SELECT LEN(' Text '); --5, weil automatisch Abst�nde am Ende weggeschnitten
SELECT DATALENGTH(' Text '); --6

SELECT LEN(FirstName) FROM Employees; --L�nge der Vornamen aller Mitarbeiter



--Konvertierungsfunktionen

--CAST: Wandelt einen Wert in einen anderen Typen um
SELECT CAST(GETDATE() AS DATE); --DateTime zu Date umwandeln -> Zeit f�llt weg
SELECT CAST(GETDATE() AS TIME); --DateTime zu Time umwandeln -> Datum f�llt weg

SELECT CAST(123 AS VARCHAR(3)); --Zahl zu Text umwandeln

SELECT HireDate, CAST(HireDate AS DATE) FROM Employees; --Cast auf Tabellenspalte anwenden

SELECT '123' + 5; --Automatische Konvertierung zu int m�glich
SELECT '123.4' + 5; --Hier nicht m�glich
SELECT CAST('123.4' AS FLOAT) + 5; --Explizite Konvertierung notwendig

--FORMAT: Formatiert der gegebenen Wert in die angegebene Formatierung

/*
	Intervalle:
    year, yyyy, yy = Year
    month, MM, M = month
    week, ww, wk = Week
    day, dd, d = Day
    hour, hh = hour
    minute, mi, m = Minute
    second, ss, s = Second
    millisecond, ms = Millisecond
	nanosecond, ns

    weekday, dw, w = Weekday (1-7)
    dayofyear, dy, y = Day of the year (1-366)
    quarter, qq, q = Quarter (1-4)
*/

SELECT GETDATE(); --ISO-Datum (nicht sonderlich anschaulich)

SELECT FORMAT(GETDATE(), 'dd.MM.yyyy'); --Formatierung hier angeben
SELECT FORMAT(GETDATE(), 'dd.MM.'); --Beliebige Formate m�glich

SELECT FORMAT(GETDATE(), 'd dd ddd dddd M MM MMM MMMM yy yyyy');

SELECT FORMAT(GETDATE(), 'dddd, dd. MMMM yyyy hh:mm:ss'); --Sch�nstes Deutsches Datum

--Schnellformatierungen
SELECT FORMAT(GETDATE(), 'd');
SELECT FORMAT(GETDATE(), 'D');

SELECT FORMAT(HireDate, 'D') FROM Employees; --Format auf Spalte anwenden

--https://learn.microsoft.com/en-us/sql/t-sql/functions/functions?view=sql-server-2017