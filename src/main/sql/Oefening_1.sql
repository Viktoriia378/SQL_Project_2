/*(a) Geef een lijst van alle biercategorieën. */
select * from categories;
/* (b) Toon de lijst van categorieën in dalende alfabetische volgorde zonder de categorie-id’s. (38) */
select Category from categories order by Category DESC;
/* (C) Toon een lijst van alle brouwerijen die meer dan 5000 Euro turnover hebben. (54)*/
select * from brewers where Turnover > 5000;
/* (d) Toon nu enkel de naam en de stad van de brouwerijen die minder dan 5000 Euro turnover, maar niet 0.
Sorteer de lijst op basis van de turnover. (53) */
select Name, City from brewers where Turnover < 5000 and Turnover != 0;
/* (e) Geef een lijst van alle mogelijke alcoholgehaltes in de beers tabel. Dus geen dubbels. En gesorteerd van
groot naar klein. (14)*/
select distinct Alcohol from beers order by Alcohol DESC;
/* (f) Toon alle namen van bieren waarvan de naam “wit” bevat zonder dubbels, alfabetisch gesorteerd. (30)*/
select distinct Name from beers where Name like '%wit%' order by Name ASC;
/* (g) Toon alle bieren met meer alcohol dan 3 en minder dan 7 zonder gebruik te maken van logische
operatoren (<, >, …) (568)*/
select * from beers where Alcohol not between 0 and 3  and Alcohol not between 7 and 100;
/* (h) Geef de top 3 van de sterkste bieren in onze database. (3) */
select * from beers order by Alcohol DESC limit 3;
/* (i) Doordenker:Maak een lijst van de naam, straat, postcode en stad voor alle brouwers in 3 kolommen voor een
adressenlijst. M.a.w. combineer de postcode en de stad in 1 kolom.*/
select Name, Address, concat (ZipCode, ' ', City)  as Info from brewers;
