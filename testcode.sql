declare @year int = 1404;


	with cte as (
		select
		left(unitproducer,1) unitproducer,left(reportdate,4) yearProducer
		,cast(sum(prdqty) as float)prdqty
		,substring(CAST(reportdate as nvarchar(8)),5,2) monProducer
	from [192.168.11.7\SQL2017].[BehdashManufacturing].[dbo].[MnfWorkReport]
	where unitproducer not in (109,309,604,605) and CAST(left(reportdate,4) as int)=@year
	group by  left(unitproducer,1),left(reportdate,4),substring(CAST(reportdate as nvarchar(8)),5,2)
	)

	with cte1 as (
		select LEFT(Col_5459786617801679259,4) as yearPro,SUBSTRING(cast(Col_5459786617801679259 as nvarchar(8)),6,2) monPro,  --1404/10/01
						sum(col_5103383024662097285) as sabon, -- صابون
						sum(col_5095704895072364059) as elokemikal -- الئوکمیکال
		from Tbl_frm565
		where  cast (LEFT(Col_5459786617801679259,4) as int) = @year
		group by LEFT(Col_5459786617801679259,4), SUBSTRING(cast(Col_5459786617801679259 as nvarchar(8)),6,2)
	)
	--insert  into energhy_MnfWorkReport
	--select * from cte

	select
		case when left(unitproducer,1)=6 then 'صابون'
	end as unitproducer,monProducer,yearProducer,
	0 as dmWater,
	SUM([ک 35 آب]) as freshWater,
	SUM([ک 35 آب]) as water,
	0,0,prdqty,round(SUM([ک 35 آب])/prdqty*1000,3) ProductWater,0,0 ProductPower
	from cte producer
	inner join VW_Energhy_Dailyused Energhy on producer.monProducer=Energhy.mon and producer.yearProducer=Energhy.year
	where unitproducer=6 and yearProducer=@year
	group by monProducer,unitproducer,yearProducer,prdqty
