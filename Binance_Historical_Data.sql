Select *
From Portifólio_Cryptocoins..[Binance Coin Historical Data]

-- Variação durante o dia

With BinanceCoin (Date, Price, Opened, Balance, High, Low, Variant_of_the_day, Vol#, ChangePercent, Cryptocoin)
as
(
Create View BinanceCoinHistorical as 
Select Date, Price, Opened, (price-Opened) as 'Balance', High, Low, (High-Low) as 'Variant_of_the_day', Vol#, ([ChangePercent]*100) as 'ChangePercent',Cryptocoin
From Portifólio_Cryptocoins..[Binance Coin Historical Data]
SELECT *
FROM BinanceCoin






Create View PercentPopulationVaccinated as
select dea.continent, dea. location, dea.date, dea.population,vac.new_vaccinations,
 SUM(Convert(bigint, vac.new_vaccinations)) OVER (Partition by dea.location order by dea.location, 
 dea.date) as RollingPeopleVaccineded
 --, (RollingPeopleVaccineded/dea.population)
from Projeto_Portifólio..CovidDeaths dea
Join Projeto_Portifólio..CovidVaccinations vac
	ON dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null
--order by 2,3

Select *
FROM PercentPopulationVaccinated