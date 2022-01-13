--Teste do banco de dados

Select *
From Portifólio_Cryptocoins..[Binance Coin Historical Data]

Select *
From Portifólio_Cryptocoins..['Bitcoin Coin Historical Data]

Select *
From Portifólio_Cryptocoins..[Ethereum Historical Data]

Select *
From Portifólio_Cryptocoins..['Tether Historical Data']

Select *
From Portifólio_Cryptocoins..['USD Coin Historical Data']

Select *
From Portifólio_Cryptocoins..['Cardano Historical Data ']

Select *
From Portifólio_Cryptocoins..['Solana Historical Data']

Select *
From Portifólio_Cryptocoins..['Terra Historical Data']

Select *
From Portifólio_Cryptocoins..['XRP Historical Data']

Select *
From Portifólio_Cryptocoins..['Polkadot Historical Data']


-- Adicionando Balanço do dia, variante da alta e da baixa e ajustando a porcentagem

-- Tratamento dados Binance

With BinanceCoin (Date, Price, Opened, Balance, High, Low, Variant_of_the_day, Vol#, ChangePercent, Cryptocoin)
as
(
Select Date, Price, Opened, (price-Opened) as 'Balance', High, Low, (High-Low) as 'Variant_of_the_day', Vol#, ([ChangePercent]*100) as 'ChangePercent',Cryptocoin
From Portifólio_Cryptocoins..[Binance Coin Historical Data]
)
SELECT *
FROM BinanceCoin

-- Tratamento dados Bitcoin

With Bitcoin (Date, Price, Opened, Balance, High, Low, Variant_of_the_day, Vol#, ChangePercent, Cryptocoin)
as
(
Select Date, Price, Opened, (price-Opened) as 'Balance', High, Low, (High-Low) as 'Variant_of_the_day', Volume, ([ChangePercent]*100) as 'ChangePercent',Cryptocoin
From Portifólio_Cryptocoins..['Bitcoin Coin Historical Data]
)
SELECT *
FROM Bitcoin

-- Tratamento dados Ethereum

With EthereumCoin (Date, Price, Opened, Balance, High, Low, Variant_of_the_day, Volume, ChangePercent, Cryptocoin)
as
(
Select Date, Price, Opened, (price-Opened) as 'Balance', High, Low, (High-Low) as 'Variant_of_the_day', Volume, ([ChangePercent]*100) as 'ChangePercent',Cryptocoin
From Portifólio_Cryptocoins..[Ethereum Historical Data]
)
SELECT *
FROM EthereumCoin

-- Tratamento dados Tether

With TetherCoin (Date, Price, Opened, Balance, High, Low, Variant_of_the_day, Volume, ChangePercent, Cryptocoin)
as
(
Select Date, Price, Opened, (price-Opened) as 'Balance', High, Low, (High-Low) as 'Variant_of_the_day', Volume, ([ChangePercent]*100) as 'ChangePercent',Cryptocoin
From Portifólio_Cryptocoins..['Tether Historical Data']
)
SELECT *
FROM TetherCoin

-- Tratamento dados USD

With USDCoin (Date, Price, Opened, Balance, High, Low, Variant_of_the_day, Volume, ChangePercent, Cryptocoin)
as
(
Select Date, Price, Opened, (price-Opened) as 'Balance', High, Low, (High-Low) as 'Variant_of_the_day', Volume, ([ChangePercent]*100) as 'ChangePercent',Cryptocoin
From Portifólio_Cryptocoins..['USD Coin Historical Data']
)
SELECT *
FROM USDCoin

-- Tratamento dados Cardano

With CardanoCoin (Date, Price, Opened, Balance, High, Low, Variant_of_the_day, Volume, ChangePercent, Cryptocoin)
as
(
Select Date, Price, Opened, (price-Opened) as 'Balance', High, Low, (High-Low) as 'Variant_of_the_day', Volume, ([ChangePercent]) as 'ChangePercent',Cryptocoin
From Portifólio_Cryptocoins..['Cardano Historical Data ']
)
SELECT *
FROM CardanoCoin

---- Tratamento dados Solana

With SolanaCoin (Date, Price, Opened, Balance, High, Low, Variant_of_the_day, Volume, ChangePercent, Cryptocoin)
as
(
Select Date, Price, Opened, (price-Opened) as 'Balance', High, Low, (High-Low) as 'Variant_of_the_day', Volume, chan as 'ChangePercent',Cryptocoin
From Portifólio_Cryptocoins..['Solana Historical Data']
)
SELECT *
FROM SolanaCoin

--Tratamento dados Terra

With TerraCoin (Date, Price, Opened, Balance, High, Low, Variant_of_the_day, Volume, ChangePercent, Cryptocoin)
as
(
Select Date, Price, Opened, (price-Opened) as 'Balance', High, Low, (High-Low) as 'Variant_of_the_day', Volume, ([ChangePercent]) as 'ChangePercent',Cryptocoin
From Portifólio_Cryptocoins..['Terra Historical Data']
)
SELECT *
FROM TerraCoin

--Tratamento dados XRP

With XRPCoin (Date, Price, Opened, Balance, High, Low, Variant_of_the_day, Volume, ChangePercent, Cryptocoin)
as
(
Select Date, Price, Opened, (price-Opened) as 'Balance', High, Low, (High-Low) as 'Variant_of_the_day', Volume, ([ChangePercentage]) as 'ChangePercent',Cryptocoin
From Portifólio_Cryptocoins..['XRP Historical Data']
)
SELECT *
FROM XRPCoin

--Tratamento dados Polkadot

With PolkadotCoin (Date, Price, Opened, Balance, High, Low, Variant_of_the_day, Volume, ChangePercent, Cryptocoin)
as
(
Select Date, Price, Opened, (price-Opened) as 'Balance', High, Low, (High-Low) as 'Variant_of_the_day', Volume, ([ChangePercent]) as 'ChangePercent',Cryptocoin
From Portifólio_Cryptocoins..['Polkadot Historical Data']
)
SELECT *
FROM PolkadotCoin