Select*
From COVIDDEATH
Where continent is not null
order by 3,4;

Select*
From Porfolioproject..COVIDVACCINATION
Where continent is not null
order by 3,4;

Select Location, date, total_cases, new_cases, total_deaths, population
From Porfolioproject..COVIDDEATH
Where continent is not null
order by 1,2;

Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage 
From Porfolioproject..COVIDDEATH
Where location like 'Australia'
order by 1,2;

Select Location, date, population, total_cases, (total_cases/population)*100 as PopulationInfectionRate
From Porfolioproject..COVIDDEATH
Where location like 'Australia'
and continent is not null
order by 1,2;

Select Location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as HighestInfectionRate
From Porfolioproject..COVIDDEATH
Group by Location, Population
order by HighestInfectionRate desc;

Select Location, MAX(total_deaths) as HighestDeathCount
From Porfolioproject..COVIDDEATH
Where continent is not null
Group by Location
order by HighestDeathCount desc;

Select continent, MAX(total_deaths) as HighestDeathCount
From Porfolioproject..COVIDDEATH
Where continent is not null
Group by continent
order by HighestDeathCount desc;

--Global number
Select date, SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(new_cases)*100 as NewDeathPercentage
From Porfolioproject..COVIDDEATH
Where continent is not null
Group by date
order by 1,2;
--Total population vs Vacination
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations_smoothed
, SUM(vac.new_vaccinations_smoothed) OVER (Partition by dea.location order by dea.location, dea.date) as Rollingpeoplevacinated
From Porfolioproject..COVIDDEATH dea
Join Porfolioproject..COVIDVACCINATION vac
on dea.location= vac.location
and dea.date=vac.date
Where dea.continent is not null
order by 2,3;

--CTE
With PopvsVac (Continent, Location, Date, Population, new_vaccinations_smoothed, Rollingpeoplevacinated)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations_smoothed
, SUM(vac.new_vaccinations_smoothed) OVER (Partition by dea.location order by dea.location, dea.date) as Rollingpeoplevacinated
From Porfolioproject..COVIDDEATH dea
Join Porfolioproject..COVIDVACCINATION vac
on dea.location= vac.location
and dea.date=vac.date
Where dea.continent is not null
)
Select*, (Rollingpeoplevacinated/population)*100
From PopvsVac

--TEMP TABLE
DROP TABLE if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(225),
Location nvarchar(225),
Date datetime,
Population numeric,
New_vaccinations_smoothed numeric,
Rollingpeoplevacinated numeric,
)

Insert into #PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations_smoothed
, SUM(vac.new_vaccinations_smoothed) OVER (Partition by dea.location order by dea.location, dea.date) as Rollingpeoplevacinated
From Porfolioproject..COVIDDEATH dea
Join Porfolioproject..COVIDVACCINATION vac
on dea.location= vac.location
and dea.date=vac.date
Where dea.continent is not null

Select*, (Rollingpeoplevacinated/population)*100
From #PercentPopulationVaccinated
--View to store data for later visualisations
Create view PercentPopulationVaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations_smoothed
, SUM(vac.new_vaccinations_smoothed) OVER (Partition by dea.location order by dea.location, dea.date) as Rollingpeoplevacinated
From Porfolioproject..COVIDDEATH dea
Join Porfolioproject..COVIDVACCINATION vac
on dea.location= vac.location
and dea.date=vac.date
Where dea.continent is not null

Select*
From PercentPopulationVaccinated

Create view NewDeathPercentage as
Select date, SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(new_cases)*100 as NewDeathPercentage
From Porfolioproject..COVIDDEATH
Where continent is not null
Group by date

Select*
From NewDeathPercentage