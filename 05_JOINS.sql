USE Northwind;

--Tabellen haben Abhängigkeiten zueinander in Form von IDs

--Primärschlüssel (PK -> Primary Key)
	--Existiert generell in jeder Tabelle (nicht erzwungen)
	--Datensätze eindeutig identifizierbar
	--Jeder Datensatz muss einen eindeutigen Schlüssel haben (keine Duplikate)
	--Jeder Datensatz muss einen Wert in der Schlüsselspalte haben (nicht NULL)

--Fremdschlüssel (FK -> Foreign Key)
	--Primärschlüssel aus einer anderen Tabelle -> Referenz (Beziehung)
	--Kann nur Werte enthalten die in der anderen Tabelle enthalten sind
	--Kann leer sein wenn Tabelle so definiert wurde

SELECT * FROM Orders; --EmployeeID
SELECT * FROM Employees; --Datensätze kombinieren über EmployeeID

SELECT * FROM Orders
INNER JOIN Employees --Hier andere Tabelle angeben
ON Orders.EmployeeID = Employees.EmployeeID; --Hier angeben welche 2 Spalten verbunden werden

SELECT
OrderID,
Employees.EmployeeID, --Ambiguous column name EmployeeID (in Orders und in Employees ist die EmployeeID enthalten, DB kann keine Entscheidung treffen)
CONCAT_WS(' ', FirstName, LastName) AS FullName,
Freight,
ShipName,
ShipAddress
FROM Orders
INNER JOIN Employees
ON Orders.EmployeeID = Employees.EmployeeID;

SELECT
o.OrderID,
e.EmployeeID, --Hier ist der Alias erzwingend, da die Spalte in beiden Tabellen vorhanden ist
CONCAT_WS(' ', e.FirstName, e.LastName) AS FullName,
o.Freight, --Hier ist der Alias optional, da die Spalte nur in einer Tabelle vorhanden ist
o.ShipName,
o.ShipAddress
FROM Orders AS o --Tabellenalias: Tabelle einen kurzen Namen geben damit diese einfacher zu verwenden ist
INNER JOIN Employees e --AS nicht notwendig
ON o.EmployeeID = e.EmployeeID;


--JOIN mit mehr als 2 Tabellen
SELECT * FROM [Order Details] od
INNER JOIN Orders o ON o.OrderID = od.OrderID
INNER JOIN Products p ON p.ProductID = od.ProductID;

SELECT
o.OrderID,
p.ProductName,
p.QuantityPerUnit,
od.Quantity,
od.UnitPrice,
o.Freight
FROM [Order Details] od
INNER JOIN Orders o ON o.OrderID = od.OrderID
INNER JOIN Products p ON p.ProductID = od.ProductID; --Sinnvolle Spalten für eine Rechnung auswählen

SELECT
o.OrderID,
p.ProductName,
p.QuantityPerUnit,
od.Quantity,
od.UnitPrice,
od.Quantity * od.UnitPrice AS Gesamt
--o.Freight
FROM [Order Details] od
INNER JOIN Orders o ON o.OrderID = od.OrderID
INNER JOIN Products p ON p.ProductID = od.ProductID
WHERE o.OrderID = 10248;

--OUTER JOIN: Funktioniert genau wie der INNER JOIN, nur ergänzt fehlende Datensätze auf der anderen Seite mit NULL Werten

SELECT * FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID; --830 Datensätze

SELECT * FROM Orders o
RIGHT JOIN Customers c ON o.CustomerID = c.CustomerID; --832 Datensätze

SELECT * FROM Customers c
LEFT JOIN Orders o ON o.CustomerID = c.CustomerID;

SELECT c.* FROM Orders o --Mit c.* alle NULL Spalten von Orders filtern
RIGHT JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.OrderID IS NULL; --Alle Kunden filtern die keine Bestellungen bisher getätigt haben

SELECT * FROM Customers c
FULL JOIN Orders o ON o.CustomerID = c.CustomerID; --Durch FULL werden beide Seiten ergänzt (Alle Kunden die keine Bestellungen getätigt haben und alle Bestellungen die keinen Kunden haben)

SELECT * FROM Customers CROSS JOIN Orders; --Kreuzprodukt erstellen (alle Datensätze mit allen anderen Datensätzen kombinieren)