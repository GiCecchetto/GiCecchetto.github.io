SELECT *
FROM Projeto_Portif�lio..CovidDeaths
Where continent is not null
order by 3,4

--SELECT *
--FROM Projeto_Portif�lio..CovidVaccinations
--order by 3,4

--Selecionar os dados que vamos usar

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM Projeto_Portif�lio..CovidDeaths
order by 1,2

--Rela��o Casos totais vs Total de mortes
--Mostra a probabilidade se voc� contraiu Covid no seu Pa�s
 
 SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM Projeto_Portif�lio..CovidDeaths
Where location like '%Brazil%'
order by 1,2

--Visualiza��o de casos totais vs a popula��o
--Mostra a porcentagem da popula��o que se contaminou com Civid

 SELECT location, date, total_cases, population, (total_cases/population)*100 as ContaminationPercentage
FROM Projeto_Portif�lio..CovidDeaths
Where location like '%Brazil%'
order by 1,2

-- Visualizando pa�ses com a maior porcentagem de infec��o comparada a popula��o

SELECT location, total_cases, population, MAX(total_cases) as HighestContaminationCount, max((total_cases/population))*100 as ContaminationPercentage
FROM Projeto_Portif�lio..CovidDeaths
--Where location like '%Brazil%'
Where continent is not null
Group by location, population, total_cases
Order by ContaminationPercentage desc

-- Mostra os pa�ses com a maior congem de mortes/popula��o

SELECT location, MAX(cast(total_deaths as int)) as TotalDeathsCount
FROM Projeto_Portif�lio..CovidDeaths
--Where location like '%Brazil%'
Where continent is not null
Group by location
Order by TotalDeathsCount desc

--Visualizar por continente

-- Mostarando os continentes com a maior taixa de mortes por popul��o

SELECT continent, MAX(cast(total_deaths as int)) as TotalDeathsCount
FROM Projeto_Portif�lio..CovidDeaths
--Where location like '%Brazil%'
Where continent is not null
Group by continent
Order by TotalDeathsCount desc

-- N�meros globais

SELECT SUM(new_cases) as Total_cases, SUM(cast(new_deaths as int)) as Total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
FROM Projeto_Portif�lio..CovidDeaths
--Where location like '%Brazil%' 
Where continent is not null
--Group by date
order by 1,2


-- Abservando total pupul��o em rela��o a total vacinados

select dea.continent, dea. location, dea.date, dea.population, vac.new_vaccinations,
 SUM(Convert(bigint, vac.new_vaccinations)) OVER (Partition by dea.location order by dea.location, 
 dea.date) as RollingPeopleVaccineded
 --, (RollingPeopleVaccineded/dea.population)
from Projeto_Portif�lio..CovidDeaths dea
Join Projeto_Portif�lio..CovidVaccinations vac
	ON dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null
order by 2,3

--Usar CTE

with PopvsVac (Continent, Location, Date, Population, New_vaccinations, RollingPeopleVaccineded)
as
(
select dea.continent, dea. location, dea.date, dea.population, vac.new_vaccinations,
 SUM(Convert(bigint, vac.new_vaccinations)) OVER (Partition by dea.location order by dea.location, 
 dea.date) as RollingPeopleVaccineded
 --, (RollingPeopleVaccineded/dea.population)
from Projeto_Portif�lio..CovidDeaths dea
Join Projeto_Portif�lio..CovidVaccinations vac
	ON dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null
--order by 2,3
)
Select *, (RollingPeopleVaccineded/Population)*100
From PopvsVac


--Temp Table

Drop Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255), 
location nvarchar(255),
Date datetime,
Population numeric,
New_vacciantions numeric,
RollingPeopleVaccineded numeric
)
insert into #PercentPopulationVaccinated
select dea.continent, dea. location, dea.date, dea.population,vac.new_vaccinationsas),
 SUM(Convert(bigint, vac.new_vaccinations)) OVER (Partition by dea.location order by dea.location, 
 dea.date) as RollingPeopleVaccineded
 --, (RollingPeopleVaccineded/dea.population)
from Projeto_Portif�lio..CovidDeaths dea
Join Projeto_Portif�lio..CovidVaccinations vac
	ON dea.location = vac.location
	and dea.date = vac.date
--Where dea.continent is not null
--order by 2,3

Select *, (RollingPeopleVaccineded/Population)*100
From #PercentPopulationVaccinated


--Criando visualiza��o para mais tarde

Create View PercentPopulationVaccinated as
select dea.continent, dea. location, dea.date, dea.population,vac.new_vaccinations,
 SUM(Convert(bigint, vac.new_vaccinations)) OVER (Partition by dea.location order by dea.location, 
 dea.date) as RollingPeopleVaccineded
 --, (RollingPeopleVaccineded/dea.population)
from Projeto_Portif�lio..CovidDeaths dea
Join Projeto_Portif�lio..CovidVaccinations vac
	ON dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null
--order by 2,3

Select *
FROM PercentPopulationVaccinated