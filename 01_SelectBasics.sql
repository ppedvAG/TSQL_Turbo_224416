USE Northwind; --Datenbank ausw�hlen

/*
Mehrzeilige
Kommentar
*/

SELECT 100; --Einzelnen Wert ausgeben

SELECT 10.5; --Kommazahl mit Punkt statt mit Beistrich

SELECT 'Test'; --Texte mit einzelnen Hochkomma ('Text')

--Strg + E: Markiertes Statement aus
--Strg + R: Ergebnisansicht schlie�en

SELECT 100 * 3; --Berechnung

SELECT '100 * 3'; --Wird als Text interpretiert

SELECT 100 AS Zahl; --AS: Spalte einen Namen geben

SELECT 100, 200, 300; --Mehrere Spalten ausw�hlen
SELECT 100 AS Z1, 200 AS Z2, 300 AS Z3;

--FROM: Tabelle ausw�hlen aus denen die Daten geholt werden

SELECT * FROM Customers; --*: Alles selektieren (alle Spalten)

SELECT CompanyName FROM Customers; --Bestimmte Spalten ausw�hlen

SELECT CompanyName, ContactName FROM Customers; --Mehrere Spalten ausw�hlen

SELECT Freight * 5 FROM Orders; --Berechnungen auf Spalten durchf�hren

SELECT UnitPrice * Quantity FROM [Order Details]; --Zwei Spalten multiplizieren

SELECT Address + City + PostalCode + Country FROM Customers; --Strings verbinden (unsch�n)

SELECT Address + ' ' + City + ' ' + PostalCode + ', ' + Country FROM Customers; --Mit Abst�nden etwas sch�ner

SELECT Address + ' ' + City + ' ' + PostalCode + ', ' + Country AS [Volle Adresse] FROM Customers;
SELECT Address + ' ' + City + ' ' + PostalCode + ', ' + Country AS "Volle Adresse" FROM Customers;
SELECT Address + ' ' + City + ' ' + PostalCode + ', ' + Country AS 'Volle Adresse' FROM Customers;
--Namen mit Abst�nden m�ssen mit [] oder "" oder '' angegeben werden

SELECT
CompanyName,
ContactName,
Address,
Phone
FROM Customers; --Umbr�che beliebig m�glich