/*(a) Selecteer de brouwers die een turnover hebben die hoger dan het gemiddelde is. (16)*/
select turnover
from brewers
where Turnover > (select avg(Turnover) from brewers);
/*(b) Toon alle bieren die het minimum of maximum alcohol gehalte hebben. (33)*/
select Alcohol
from beers
where Alcohol = (select min(Alcohol) from beers)
or Alcohol = (select max(Alcohol) from beers);
/*(c) Toon alle bieren met een alcohol hoger dan het gemiddelde en waarvan de brouwers een turnover
hebben dat boven het gemiddelde ligt. (60)*/
select beers.Name, beers.Alcohol, brewers.Name, brewers.Turnover
from beers
inner join brewers on

    /*SELECT beers.Name, beers.Alcohol, brewers.Name AS Brewer, brewers.Turnover
FROM beers
JOIN brewers ON beers.BrewerId = brewers.Id
WHERE beers.Alcohol > (SELECT AVG(Alcohol) FROM beers)
  AND brewers.Turnover > (SELECT AVG(Turnover) FROM brewers);*/
/*(d) Doordenker zonder search: toon een lijst van alle brouwers met de prijs en naam van hun duurste
bier. Het is mogelijk dat er meerdere bieren per brouwer geselecteerd worden. (266)*/