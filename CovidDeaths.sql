use coviddeaths;
select * from coviddeaths;

/*break*/

select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as "DeathPercentage" from coviddeaths
where location like "%states";

/*looking at countries most infected*/

select location, population, max(total_cases) as "HighestInfectionCount", max((total_cases/population)*100) as "PercentPopulationInfected" from coviddeaths
group by population, location
order by 4 desc;

/*looking at countries with most Covid-related Deaths*/

select location as "COUNTRY", max(total_deaths) as 'TotalDeathCount', 
from coviddeaths
group by location
order by 2 desc;



/*looking for the countries with highest infection count*/

select location as "Country", max(total_cases) as "Infections" from coviddeaths;



/*showing the countries with the highest death count per population*/
use coviddeaths;
select location, max(cast(total_deaths as UNSIGNED)) as "TotalDeathCount"
from coviddeaths
where continent is not null
group by location
order by TotalDeathCount desc;


/* breaking it down by continents */

use coviddeaths;
select continent, max(cast(total_deaths as UNSIGNED)) as "TotalDeathCount"
from coviddeaths
where continent is not NULL
group by continent
order by TotalDeathCount desc;


/* global numbers */

use coviddeaths;
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as "DeathPercentage"
from coviddeaths
where continent is not NULL
group by date;


/*tableau visualization 1 */
use coviddeaths;
Select SUM(new_cases) as "Total Cases", SUM(new_deaths) as "Total Deaths", (SUM(new_deaths)/SUM(new_cases))*100 as "Death Percentage"  
From coviddeaths
where continent is not null;


/*tableau visualization 2 */
use coviddeaths;
Select continent, SUM(new_deaths) as "TotalDeathCount"
From coviddeaths
Where continent is not NULL 
Group by continent
order by continent;

/* tableau visualization 3*/
use coviddeaths;
Select location, population, MAX(total_cases) as "HighestInfectionCount",  Max((total_cases/population))*100 as "PercentPopulationInfected"
From coviddeaths
Group by location, population
order by PercentPopulationInfected desc;


use coviddeaths;
select continent,location from coviddeaths
where continent is NULL 
group by location
order by location;

/*tableau visualization 4 */
use coviddeaths;
Select location, population,date, MAX(total_cases) as "HighestInfectionCount",  Max((total_cases/population))*100 as "PercentPopulationInfected"
From coviddeaths
Group by location,population,date
order by PercentPopulationInfected desc;