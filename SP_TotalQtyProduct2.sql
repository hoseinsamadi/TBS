drop table #MyTable

declare @fromdate nvarchar(10) = '1404/11/11'
declare @Todate nvarchar (10) = '1404/11/17'
Select [PQTY],[محصول],[واحد],[Plant],[Qtyplanned],[qtyMotamam],t8.[Product]
---,(Case When [qtyMotamam] is Not null then [PQTY]/[qtyMotamam] else [PQTY]/[Qtyplanned] End ) as [IntervalFinal]
into #MyTable
 from (
Select Sum ([مقدارتولید]) as [PQTY],[محصول],[واحد],[Plant],[Product]
             from

             (SELECT      Tbl_frm341.Col_5024317495055819113 AS [مقدارتولید],
                          Tbl_frm345.frm345Id AS [محصول],
                          Tbl_frm183.Col_5619090097083518959 AS [واحد],
                          Tbl_frm341.Col_5312031486110875018 as [ProductCode],
                          Tbl_frm167.col_5109564846528301770 as [Plant],
                          col_4685013093536963607 as [Product]

                              FROM         Tbl_frm339 INNER JOIN
                                   Tage_BPMS.Behdash.Shift ON Tbl_frm339.Col_4895985106013421657 = Tage_BPMS.Behdash.Shift.ID INNER JOIN
                                   Task.TblFormInstance ON Tbl_frm339.frm339Id = Task.TblFormInstance.PKFormID INNER JOIN
                                   Tbl_frm167 ON Tbl_frm339.Col_5622142296571918767 = Tbl_frm167.frm167Id INNER JOIN
                                   Tbl_frm341 ON Tbl_frm339.Col_4797991004921738340 = Tbl_frm341.Col_5209121282993809995 INNER JOIN
                                   Tbl_frm345 ON Tbl_frm341.Col_5408234554508361351 = Tbl_frm345.frm345Id INNER JOIN
                                   Tbl_frm183 ON Tbl_frm341.Col_5619697339272546299 = Tbl_frm183.frm183Id
                                  WHERE     (Task.TblFormInstance.FormID = 339) and
                                             Tbl_frm167.frm167Id in (2,5,6,8)  and
                                             ( Tbl_frm339.Col_4929408481287351951 >=@fromdate
                                             and Tbl_frm339.Col_4929408481287351951 <= @Todate
                                             and  Tbl_frm167.col_5109564846528301770 is not null )

Group by Tbl_frm341.Col_5024317495055819113,Tbl_frm345.frm345Id, col_4685013093536963607,
          Tbl_frm183.Col_5619090097083518959, Tbl_frm167.col_5109564846528301770,  Tbl_frm341.Col_5312031486110875018) as T1
Group by [محصول],[واحد],[Plant],[Product]) as t8
inner Join
(SELECT     Tbl_frm345.Col_4685013093536963607 AS Product, SUM(CAST(Tbl_frm338.Col_5219175971637271591 AS float)) AS Qtyplanned,
 Tbl_frm345.frm345Id AS productid
  ,(case when [dbo].[getmotamam] (frm345Id,@fromdate,@Todate) < 0 then SUM(CAST(Tbl_frm338.Col_5219175971637271591 AS float))+(-[dbo].[getmotamam] (frm345Id,@fromdate,@Todate)) else
 SUM(CAST(Tbl_frm338.Col_5219175971637271591 AS float))-[dbo].[getmotamam] (frm345Id,@fromdate,@Todate) End ) as [qtyMotamam]
FROM         Tbl_frm338 INNER JOIN
                      Tbl_frm345 ON Tbl_frm338.Col_5454345176296650163 = Tbl_frm345.frm345Id INNER JOIN
                      Tbl_frm337 ON Tbl_frm338.Col_4816520823772850953 = Tbl_frm337.Col_4934908701495379211 LEFT OUTER JOIN
                      Tbl_frm343 ON Tbl_frm337.Col_4971582767154358515 = Tbl_frm343.Col_5565346928324515000
WHERE     (Tbl_frm337.Col_5375822703265634102 >= @fromdate) and (Tbl_frm337.Col_5375822703265634102 <= @Todate)
GROUP BY Tbl_frm345.Col_4685013093536963607, Tbl_frm345.frm345Id ) as t5
on
t8.[محصول]=t5.productid
union all
Select [مقدارتولید],[محصول],[واحد],[Plant],[Qtyplanned], [qtyMotamam],t2.[Product]
from (
SELECT     SUM( Tbl_frm341.Col_5024317495055819113 ) AS [مقدارتولید],
           Tbl_frm345.frm345Id AS [محصول],
           Tbl_frm183.Col_5619090097083518959 AS [واحد],
           Tbl_frm167.col_5109564846528301770 as [Plant],
           Tbl_frm345.col_4685013093536963607 as [Product]
FROM         Tbl_frm339 INNER JOIN
                      Tage_BPMS.Behdash.Shift ON Tbl_frm339.Col_4895985106013421657 = Tage_BPMS.Behdash.Shift.ID INNER JOIN
                      Task.TblFormInstance ON Tbl_frm339.frm339Id = Task.TblFormInstance.PKFormID INNER JOIN
                      Tbl_frm167 ON Tbl_frm339.Col_5622142296571918767 = Tbl_frm167.frm167Id INNER JOIN
                      Tbl_frm341 ON Tbl_frm339.Col_4797991004921738340 = Tbl_frm341.Col_5209121282993809995 INNER JOIN
                      Tbl_frm345 ON Tbl_frm341.Col_5408234554508361351 = Tbl_frm345.frm345Id INNER JOIN
                      Tbl_frm183 ON Tbl_frm341.Col_5619697339272546299 = Tbl_frm183.frm183Id
WHERE     (Task.TblFormInstance.FormID = 339) and Tbl_frm167.frm167Id in (7,9)
 and (  Tbl_frm339.Col_4929408481287351951 >= @fromdate and Tbl_frm339.Col_4929408481287351951 <= @Todate)
Group by Tbl_frm345.frm345Id,Tbl_frm345.col_4685013093536963607,
          Tbl_frm183.Col_5619090097083518959, Tbl_frm167.col_5109564846528301770 ) as t2
inner Join
  (SELECT     Tbl_frm345.Col_4685013093536963607 AS Product, SUM(CAST(Tbl_frm338.Col_5219175971637271591 AS float)) AS Qtyplanned,
 Tbl_frm345.frm345Id AS productid
 ,(case when [dbo].[getmotamam] (frm345Id,@fromdate,@Todate) < 0 then SUM(CAST(Tbl_frm338.Col_5219175971637271591 AS float))+(-[dbo].[getmotamam] (frm345Id,@fromdate,@Todate)) else
 SUM(CAST(Tbl_frm338.Col_5219175971637271591 AS float))-[dbo].[getmotamam] (frm345Id,@fromdate,@Todate) End ) as [qtyMotamam]
FROM         Tbl_frm338 INNER JOIN
                      Tbl_frm345 ON Tbl_frm338.Col_5454345176296650163 = Tbl_frm345.frm345Id INNER JOIN
                      Tbl_frm337 ON Tbl_frm338.Col_4816520823772850953 = Tbl_frm337.Col_4934908701495379211 LEFT OUTER JOIN
                      Tbl_frm343 ON Tbl_frm337.Col_4971582767154358515 = Tbl_frm343.Col_5565346928324515000
WHERE     (Tbl_frm337.Col_5375822703265634102 >= @fromdate) and (Tbl_frm337.Col_5375822703265634102 <= @Todate)
GROUP BY Tbl_frm345.Col_4685013093536963607, Tbl_frm345.frm345Id ) as t3
on  t2.[محصول]=t3.productid
Select [PQTY] as [مقدار تولید شده],[محصول] as [شناسه],[واحد],[Plant] as [پلنت],
isnull([Qtyplanned],0) as [مقدار برنامه ریزی شده],[qtyMotamam] as [مقدار متمم برنامه ریزی],[Product] as [محصول]
,(Case When [qtyMotamam] is Not null then ([PQTY]-[qtyMotamam]) else ([PQTY]-isnull([Qtyplanned],0)) End ) as [مغایرت تولید و برنامه]
 ---dbo.getintrevalpercent ([Qtyplanned] ,[qtyMotamam],  [PQTY]) as [مغایرت تولید و برنامه]
 from #MyTable

-- select Col_5109564846528301770 as [name], frm167id as [Id] from tbl_frm167
-- Where frm167Id not in (1,3,4)
-- order by Col_5109564846528301770
-- sabon = 2