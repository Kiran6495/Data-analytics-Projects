SELECT*
FROM PortfolioProject..covid_deaths
WHERE continent is not null
ORDER by 3,4

--SELECT*
--FROM PortfolioProject..covid_vacination
--ORDER by 3,4

--SELECT Data that we are going to be useing


SELECT location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProject..covid_deaths
WHERE continent is not null
ORDER by 1,2

--Looking at Total cases vs Total Death

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases*100) as death_percentage
FROM PortfolioProject..covid_deaths
WHERE location like '%India%'
and continent is not null
ORDER by 1, 2

--Looking at total cases vs Population]
--shows what percentage population got vaccinated

SELECT location, date, total_cases, population, (total_cases/population)*100 as total_case_percentage
FROM PortfolioProject..covid_deaths
WHERE location like '%India%'
and  continent is not null
ORDER by 1, 2

--Looking at Highest infection

SELECT location, population, MAX(total_cases) as highest_cases, Max((total_cases/population))*100 as total_case_percentage
FROM PortfolioProject..covid_deaths
WHERE continent is not null
GROUP BY location, population
ORDER by total_case_percentage DESC

--Lets Break things by location 

SELECT location, MAX(cast(total_deaths as int)) as highest_deaths
FROM PortfolioProject..covid_deaths
WHERE continent is not null
GROUP BY location
ORDER by highest_deaths DESC

--lets Break things by continent

SELECT continent, MAX(cast(total_deaths as int)) as highest_deaths
FROM PortfolioProject..covid_deaths
WHERE continent is not null
GROUP BY continent
ORDER by highest_deaths DESC

--looking at percetage of death

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases*100) as death_percentage
FROM PortfolioProject..covid_deaths
--WHERE location like '%India%'
WHERE continent is not null
ORDER by 1, 2

--Looking at New cases by date

SELECT date, SUM(new_cases)--, total_deaths, (total_deaths/total_cases*100) as death_percentage
FROM PortfolioProject..covid_deaths
--WHERE location like '%India%'
WHERE continent is not null
GROUP BY date
ORDER by 1, 2

--Looking at percentage of new deaths
SELECT date, SUM(new_cases) as total_cases,SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as death_percentage
FROM PortfolioProject..covid_deaths
--WHERE location like '%India%'
WHERE continent is not null
GROUP BY date
ORDER by 1, 2

--Joing data from Deaths and Vaccinated
SELECT *
FROM PortfolioProject..covid_deaths dea
JOIN PortfolioProject..covid_vacination vac
   on dea.location = vac.location
   and cast(dea.date as int) = cast(vac.date as int)

SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
FROM PortfolioProject..covid_deaths dea
JOIN PortfolioProject..covid_vacination vac
   on dea.location = vac.location
   and cast(dea.date as int) = cast(vac.date as int)
WHERE dea.continent is not null
ORDER by 2,3

SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
,SUM(CONVERT(int,vac.new_vaccinations)) OVER(partition by dea.location ORDER BY dea.location, dea.date)
FROM PortfolioProject..covid_deaths dea
JOIN PortfolioProject..covid_vacination vac
   on dea.location = vac.location
   and dea.date = vac.date 
WHERE dea.continent is not null
ORDER by 2,3

--Looking at new vaccination by Joining 

SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(bigint,vac.new_vaccinations)) OVER (Partition by dea.location ORDER BY dea.location, dea.date) 
as total_vaccinated
--, (total_vaccinated/population)*100
FROM PortfolioProject..covid_deaths dea
JOIN PortfolioProject..covid_vacination vac
   on dea.location = vac.location
   and cast(dea.date as bigint) = cast(vac.date as bigint)
WHERE dea.continent is not null
ORDER by 2,3

--USE CTE

WITH popvsvac (continent, location, date, population,new_vaccination,total_vaccinated)
as 
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(bigint,vac.new_vaccinations)) OVER (Partition by dea.location ORDER BY dea.location, dea.date) 
as total_vaccinated
--, (total_vaccinated/popolation)*100
FROM PortfolioProject..covid_deaths dea
JOIN PortfolioProject..covid_vacination vac
   on dea.location = vac.location
   and cast(dea.date as bigint) = cast(vac.date as bigint)
WHERE dea.continent is not null
--ORDER by 2,3
)
SELECT *, (total_vaccinated/population)*100
FROM popvsvac

--Creating temp-table 

DROP TABLE IF EXISTS #Vaccinated
CREATE TABLE #Vaccinated
(
continent nvarchar(255),
location nvarchar(255),
date datetime,
population numeric,
new_vaccinations numeric,
total_vaccinated numeric
)
INSERT INTO #Vaccinated
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(bigint,vac.new_vaccinations)) OVER (Partition by dea.location ORDER BY dea.location, dea.date) 
as total_vaccinated
--, (total_vaccinated/popolation)*100
FROM PortfolioProject..covid_deaths dea
JOIN PortfolioProject..covid_vacination vac
   on dea.location = vac.location
   and dea.date = vac.date
--WHERE dea.continent is not null
--ORDER by 2,3

SELECT *, (total_vaccinated/population)*100
FROM #Vaccinated

--Creating View OF SQL Work


Create view (PopulationVaccinated) AS
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(bigint,vac.new_vaccinations)) OVER (Partition by dea.location ORDER BY dea.location, dea.date) 
as total_vaccinated
--, (total_vaccinated/popolation)*100
FROM PortfolioProject..covid_deaths dea
JOIN PortfolioProject..covid_vacination vac
   on dea.location = vac.location
   and dea.date = vac.date
WHERE dea.continent is not null
--ORDER by 2,3