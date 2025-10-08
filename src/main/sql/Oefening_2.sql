/* (a) Hoeveel verschillende brouwers zitten er in de database? (118)*/
select count(*) from brewers;
/* (b) Bereken de gemiddelde turnover van alle brouwers. (114302.1525)*/
select avg(Turnover) as turnoverMiddel from brewers;
/*(c) Geef het laagste, gemiddelde en hoogste alcoholgehalte uit de beers tabel in 1 instructie. (0, 5.8706, 15)*/
select min(Alcohol) as minAlcohol,
       avg(Alcohol) as avgAlcohol,
       max(Alcohol) as maxAlcohol
from beers;
/*(d) Bereken de gemiddelde turnover van alle brouwers in de provincie Brabant (postcodes die beginnen met
een 1) maar negeer de brouwerij ‘Palm’. (39525.7143) */
select avg(Turnover) as avgTurnover
from brewers
where ZipCode like '1%' and Name not like '%Palm%';
/*(e) Bereken het gemiddelde alcohol per categorie(id). (39 records)*/
select CategoryId, avg(Alcohol) as alcoholAvg
from beers
group by CategoryId;

/*(f) Toon de hoogste bierprijs per categorie maar negeer alle bieren die niet in stock zijn. Sorteer het resultaat
op categorie id. Zorg er ook voor dat we enkel prijzen zien die hoger zijn dan 3. (5 records)*/
select CategoryId, max(Price) as maxPrice
from beers
where Stock > 0
group by CategoryId
having max(Price) > 3;

/*Geeft een lijst van alle beers met de velden name, brouwerij-naam en soort uit de tabellen beers, brewers en categories*/
select beers.Name, brewers.Name, categories.category
from beers
inner join brewers on beers.BrewerId = brewers.Id
inner join categories on beers.CategoryId = categories.Id;

/*In het volgende voorbeeld worden de tabellen beers en brewers gekoppeld via het veld brewerid*/
select beers.Name, brewers.Name
from beers, brewers
where beers.BrewerId = brewers.Id;

/*In het volgende voorbeeld worden de tabellen Categories en Beers gekoppeld op het veld CategoryId. De
SELECT instructie genereert een lijst van alle Soorten, inclusief biersoorten waarvan er geen beers aanwezig zijn in de
tabel beers*/
select Name, Category
from categories
left join beers on categories.id = beers.CategoryId;

/*geeft een lijst van brouwers die in dezelfde gemeente wonen. Aan de tabel brouwers wordt
telkens een aliasnaam gegeven. Als je een kolomnaam gebruikt, ben je verplicht om de aliasnaam
te gebruiken*/

select b1.name, b2.name
from brewers as b1 inner join brewers as b2
on b1.City = b2.City and b1.Id < b2.Id;