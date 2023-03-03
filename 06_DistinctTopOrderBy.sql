USE Northwind;

--ORDER BY: Ergebnis nach einer Spalte sortieren

SELECT * FROM Customers ORDER BY Country;

SELECT * FROM Customers ORDER BY Country, City; --Sortierung nach mehreren Spalten (Primär: Country, Sekundär: City)

SELECT * FROM Customers ORDER BY Country DESC, City ASC; --ASC/DESC: Sortierrichtung vorgeben (DESC -> Absteigend, ASC -> Aufsteigend)

SELECT * FROM Customers ORDER BY 2; --Nach Spaltenindex sortieren (hier CompanyName)

SELECT CompanyName, ContactName, Address, Phone FROM Customers ORDER BY 2; --ContactName

SELECT * FROM Customers ORDER BY 9, 6; --Sortierung nach mehreren Spalten mit Indizes

SELECT CONCAT_WS(' ', Address, City, PostalCode, Country) AS [Volle Adresse] FROM Customers ORDER BY [Volle Adresse]; --Nach Spaltenalias sortieren

SELECT Country FROM Customers ORDER BY 1;

--DISTINCT: Macht das Ergebnis eindeutig (filtert Duplikate)

SELECT Country FROM Customers; --Duplikate -> 91 Datensätze

SELECT DISTINCT Country FROM Customers; --Keine Duplikate mehr -> 22 Datensätze

SELECT DISTINCT Country, City FROM Customers ORDER BY 1, 2; --Entfernt Duplikate von Kombinationen

SELECT COUNT(*) FROM Customers; --Anzahl der Customer

SELECT COUNT(*) FROM Customers WHERE Country = 'UK'; --Anzahl Customer aus UK

SELECT COUNT(DISTINCT Country) FROM Customers; --Anzahl einzigartiger Länder

--TOP: Gibt die obersten X Datensätze aus

SELECT TOP 10 *
FROM Orders; --Obersten 10 Datensätze der Tabelle (nicht aussagekräftig)

SELECT TOP 10 * FROM Orders ORDER BY Freight; --Die 10 günstigsten Bestellungen

SELECT TOP 10 * FROM Orders ORDER BY Freight DESC; --Die 10 teuersten Bestellungen

SELECT TOP 2 PERCENT *
FROM Orders ORDER BY Freight; --Gibt die obersten 2% anhand der Anzahl der Datensätze aus (2% der Tabelle -> 17 DS)

SELECT TOP 2 PERCENT *
FROM Orders
WHERE Freight > 100 --Filterung mit WHERE zuerst: 187 DS -> 2%: 4 DS
ORDER BY Freight;

SELECT TOP 2 PERCENT *
FROM [Order Details]
ORDER BY Quantity; --Datensätze mit Quantity 2 bis Zeile 69, Ergebnis mit TOP 2% -> 44 DS

SELECT TOP 2 PERCENT WITH TIES *
FROM [Order Details]
ORDER BY Quantity; --Ergänzt alle DS mit Quantity 2