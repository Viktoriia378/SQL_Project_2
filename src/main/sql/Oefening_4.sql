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
hebben dat boven het gemiddelde ligt.(60)*/
select beers.Name, beers.Alcohol, brewers.Name as `Brewers Name`, brewers.Turnover
from beers
inner join brewers on beers.BrewerId = brewers.Id
where Alcohol > (select avg(Alcohol) from beers)
and Turnover > (select avg(Turnover) from brewers);
/*(d) Doordenker zonder search: toon een lijst van alle brouwers met de prijs en naam van hun duurste
bier. Het is mogelijk dat er meerdere bieren per brouwer geselecteerd worden. (266)*/

select b1.Price, brewers.Name as `Brewers Name`
from beers b1
    inner join brewers on b1.BrewerId = brewers.Id
where b1.Price = (select max(Price)
                from beers b2
                where b2.BrewerId = b1.BrewerId
                );
