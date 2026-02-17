BEGIN

Declare @Motamam float
Declare @Plan float
Declare @Interval float
Declare @Planned float

Select @Motamam=SUM([Qty]),@Plan=sum ([org]) from (

SELECT   CAST( tbl_frm344.Col_5219175971637271591 as float) as [Qty],CAST (tbl_frm338.col_5219175971637271591 as float) as [org]
FROM         Tbl_frm344 INNER JOIN
                      Tbl_frm343 ON Tbl_frm344.Col_4695304214557415114 = Tbl_frm343.Col_5565346928324515000 INNER JOIN
                      Tbl_frm337 ON Tbl_frm344.Col_4804082283320399307 = Tbl_frm337.frm337Id INNER JOIN
                      Tbl_frm338 ON Tbl_frm337.Col_4971582767154358515 = Tbl_frm338.Col_4695304214557415114
WHERE     (Tbl_frm343.Col_5375822703265634102 >= '1396/ 01/ 01') AND (Tbl_frm344.Col_5454345176296650163 = @productId)
and tbl_frm344.col_5219175971637271591 <> tbl_frm338.col_5219175971637271591
and tbl_frm337.col_5375822703265634102 >= @fromDate and tbl_frm337.col_5205622364235321329 <= @ToDate

GROUP BY Tbl_frm344.Col_5219175971637271591,tbl_frm338.col_5219175971637271591 ) as T1


Set @Interval=@Plan-@Motamam


RETURN @Interval

END