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
group by CategoryId
having max(Price) > 3;