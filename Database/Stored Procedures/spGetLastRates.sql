ALTER PROCEDURE [dbo].[spGetLastRates]
AS
BEGIN

select r.* from   [Rates] r
inner join (SELECT [Acronim], [Site], Max([Date]) as dateres
FROM [web-api.online].[dbo].[Rates]
group by Acronim, [Site]) as se
on se.[Acronim] = cr.[Acronim] and se.[Site] = cr.[Site] and se.dateres = cr.Date

END
