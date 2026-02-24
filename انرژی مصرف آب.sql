select *
from dbo.Tbl_frm470


select frm470Id, Col_5468255265847999798 as [date], Col_4952959391915733799 as [24-a] , Col_4725945843888380193 as [24-b],
Col_5188936661926911982 as [24-c] , Col_4904225574280423059 as [24-d]
from dbo.Tbl_frm470
where Col_4725945843888380193 = '55509'
order by frm470Id desc

 select DISTINCT Col_4952959391915733799 as [24-a] , Col_4725945843888380193 as [24-b],
Col_5188936661926911982 as [24-c] , Col_4904225574280423059 as [24-d]
from dbo.Tbl_frm470
order by frm470Id desc