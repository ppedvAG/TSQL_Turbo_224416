USE Northwind;

--Tabellen haben Abh�ngigkeiten zueinander in Form von IDs

--Prim�rschl�ssel (PK -> Primary Key)
	--Existiert generell in jeder Tabelle (nicht erzwungen)
	--Datens�tze eindeutig identifizierbar
	--Jeder Datensatz muss einen eindeutigen Schl�ssel haben (keine Duplikate)
	--Jeder Datensatz muss einen Wert in der Schl�sselspalte haben (nicht NULL)

--Fremdschl�ssel (FK -> Foreign Key)
	--Prim�rschl�ssel aus einer anderen Tabelle -> Referenz (Beziehung)
	--Kann nur Werte enthalten die in der anderen Tabelle enthalten sind
	--Kann leer sein wenn Tabelle so definiert wurde

SELECT * FROM Orders; --EmployeeID
SELECT * FROM Employees; --Datens�tze kombinieren �ber EmployeeID

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
INNER JOIN Products p ON p.ProductID = od.ProductID; --Sinnvolle Spalten f�r eine Rechnung ausw�hlen

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

--OUTER JOIN: Funktioniert genau wie der INNER JOIN, nur erg�nzt fehlende Datens�tze auf der anderen Seite mit NULL Werten

SELECT * FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID; --830 Datens�tze

SELECT * FROM Orders o
RIGHT JOIN Customers c ON o.CustomerID = c.CustomerID; --832 Datens�tze

SELECT * FROM Customers c
LEFT JOIN Orders o ON o.CustomerID = c.CustomerID;

SELECT c.* FROM Orders o --Mit c.* alle NULL Spalten von Orders filtern
RIGHT JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.OrderID IS NULL; --Alle Kunden filtern die keine Bestellungen bisher get�tigt haben

SELECT * FROM Customers c
FULL JOIN Orders o ON o.CustomerID = c.CustomerID; --Durch FULL werden beide Seiten erg�nzt (Alle Kunden die keine Bestellungen get�tigt haben und alle Bestellungen die keinen Kunden haben)

SELECT * FROM Customers CROSS JOIN Orders; --Kreuzprodukt erstellen (alle Datens�tze mit allen anderen Datens�tzen kombinieren)