USE Northwind;

--%: Beliebig viele Zeichen suchen

SELECT * FROM Customers WHERE Country LIKE 'A%'; --Alle Customer finden die in einem Land wohnen das mit A anf�ngt

SELECT * FROM Customers WHERE Country LIKE 'a%'; --Case-Insensitive

SELECT * FROM Customers WHERE Country LIKE '%A'; --Alle L�nder die mit a/A enden

SELECT * FROM Customers WHERE Country LIKE '%A%'; --A in der Mitte (beliebig viele Zeichen sind auch 0 Zeichen -> Andorra)

SELECT * FROM Customers WHERE Country LIKE '%A%A%'; --Alle L�nder die mindestens 2 A's enthalten

--_: Genau ein beliebiges Zeichen

SELECT * FROM Customers WHERE City LIKE '_�nchen';

SELECT * FROM Customers WHERE PostalCode LIKE '____'; --Genau vier beliebige Zeichen suchen

SELECT * FROM Customers WHERE PostalCode LIKE '1___';

--[]: Genau ein Zeichen aus der gegebenen Liste suchen

SELECT * FROM Customers WHERE Country LIKE '[abc]%'; --Alle L�nder finden die mit A, B oder C anfangen

SELECT * FROM Customers WHERE Country LIKE '[a-f]%'; --Alle L�nder von A bis F finden (Bereich)

SELECT * FROM Customers WHERE PostalCode LIKE '[0-9][0-9][0-9][0-9]'; --Nur numerische 4-Stellige Postleitzahlen

SELECT * FROM Customers WHERE Country LIKE '[^a-f]%'; --Alle L�nder die NICHT mit A bis F anfangen

SELECT * FROM Customers WHERE Country LIKE '[a-c|v-z]%'; --Bereiche kombinieren mit |

SELECT * FROM Customers WHERE Country LIKE '[^a-c|v-z]%'; --Hier wird die gesamte Klammer invertiert statt nur A-C

--Sonderf�lle

SELECT * FROM Customers WHERE CompanyName LIKE '%[%]%'; --Prozent finden

SELECT * FROM Customers WHERE CompanyName LIKE '%['']%'; --Hochkomma finden