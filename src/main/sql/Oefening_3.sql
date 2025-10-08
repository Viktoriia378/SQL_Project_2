/*(a) Toon een lijst van alle biernamen en hun categorie-naam van alle bieren met 0% alcohol. (31)*/
select beers.Name, categories.Category
from beers
inner join categories on beers.CategoryId = categories.Id
where Alcohol = 0;
/*(b) Toon een lijst van alle brouwers met de prijs van hun duurste bier. (records 113 - gedeeltelijk
resultaat: Achouffe- 3.06 Alken - 4.5)*/
select brewers.name,
       max(beers.price) as maxPrice
from beers
inner join brewers on beers.BrewerId = brewers.Id
    group by brewers.name;
/*(c) Toon ‘alle’ bieren met een id tussen 1500 en 1600 met hun eventuele brouwer(naam). (41) SQL - 30/41*/
select beers.Name as NameOfBeers,
       beers.Id as IdOfBeers,
       brewers.Name as NameOfBrewers
from beers
    left join brewers on beers.BrewerId = brewers.Id
where beers.Id between 1500 and 1600;
/*(d) Toon de top 3 bieren (id en naam) met het meeste alcohol samen met de naam van de brouwer en de
categorienaam. 529 - Fitt - 227 - Wieze 229 - Bush de Noel - Dubuisson - Alcoholarm - Gerstewijn 511 - Fantome
brewery (The best of) - Fantome - Massieve Ale*/
select beers.id,
       brewers.Name,
       categories.Category
from beers
inner join brewers on beers.BrewerId = brewers.Id
inner join categories on beers.CategoryId = categories.Id
order by Alcohol desc limit 3;

/*geeft een lijst van alle beers met het hoogste alcoholpercentage*/
select Name
from beers
where Alcohol = (select max(Alcohol)from beers);

/*Dit geeft een lijst van alle beers die in Gent gebrouwen zijn. */
select name
from beers
where BrewerId in (
    select BrewerId
    from brewers
    where city like 'Gent'
    );

/*geeft de soortnr van de soorten die maar door één brouwerij gebrouwen worden.*/
select CategoryId
from (select distinct CategoryId, BrewerId from beers) as CIBI
group by CategoryId having count(*) = 1;
/*In de subquery wordt eerst het gemiddelde alcoholpercentage berekend per soortnr. Gemiddelde is een aliasnaam uit de
subquery die gebruikt wordt als kolomnaam in de buitenste query. Om het resultaat van de subquery te kunnen joinen met een
andere tabel moet je aan aliasnaam geven aan de subquery.*/
select Category,average
from(
    select CategoryId, avg(Alcohol) as average
    from beers
    group by CategoryId) as r
    inner join categories on r.CategoryId = categories.Id;
/*Maak een lijst van alle beers die een lager alcoholpercentage dan die van zijn eigen soort*/
select b1.*
from beers b1
where b1.Alcohol < (select avg(b2.alcohol)
                    from beers b2
                    where b2.CategoryId=b1.CategoryId
                    );