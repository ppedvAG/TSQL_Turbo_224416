USE Northwind; --Datenbank auswählen

/*
Mehrzeilige
Kommentar
*/

SELECT 100; --Einzelnen Wert ausgeben

SELECT 10.5; --Kommazahl mit Punkt statt mit Beistrich

SELECT 'Test'; --Texte mit einzelnen Hochkomma ('Text')

--Strg + E: Markiertes Statement aus
--Strg + R: Ergebnisansicht schließen

SELECT 100 * 3; --Berechnung

SELECT '100 * 3'; --Wird als Text interpretiert

SELECT 100 AS Zahl; --AS: Spalte einen Namen geben

SELECT 100, 200, 300; --Mehrere Spalten auswählen
SELECT 100 AS Z1, 200 AS Z2, 300 AS Z3;

--FROM: Tabelle auswählen aus denen die Daten geholt werden

SELECT * FROM Customers; --*: Alles selektieren (alle Spalten)

SELECT CompanyName FROM Customers; --Bestimmte Spalten auswählen

SELECT CompanyName, ContactName FROM Customers; --Mehrere Spalten auswählen

SELECT Freight * 5 FROM Orders; --Berechnungen auf Spalten durchführen

SELECT UnitPrice * Quantity FROM [Order Details]; --Zwei Spalten multiplizieren

SELECT Address + City + PostalCode + Country FROM Customers; --Strings verbinden (unschön)

SELECT Address + ' ' + City + ' ' + PostalCode + ', ' + Country FROM Customers; --Mit Abständen etwas schöner

SELECT Address + ' ' + City + ' ' + PostalCode + ', ' + Country AS [Volle Adresse] FROM Customers;
SELECT Address + ' ' + City + ' ' + PostalCode + ', ' + Country AS "Volle Adresse" FROM Customers;
SELECT Address + ' ' + City + ' ' + PostalCode + ', ' + Country AS 'Volle Adresse' FROM Customers;
--Namen mit Abständen müssen mit [] oder "" oder '' angegeben werden

SELECT
CompanyName,
ContactName,
Address,
Phone
FROM Customers; --Umbrüche beliebig möglich