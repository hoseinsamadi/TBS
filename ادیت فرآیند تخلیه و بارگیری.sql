select *
from dbo.Tbl_frm532

DECLARE @PKFormID nvarchar(10);
DECLARE  @WorkflowInstanceId int = 329597
SELECT @PKFormID = dbo.Get_FormIDByWorkflowInstanceID(532 ,@WorkflowInstanceId )
select @PKFormID

select *
from dbo.Tbl_frm532
where frm532Id = 37890

begin tran
update dbo.Tbl_frm532
set ITSDatabase.dbo.Tbl_frm532.Col_4992123563508363310 = 'شرکت سیلیس البرز' , ITSDatabase.dbo.Tbl_frm532.Col_5501230271836040619= '1300243' , ITSDatabase.dbo.Tbl_frm532.Col_5039491696792157121 = 'شرکت سیلیس البرز#1300243'
output
    deleted.Col_4992123563508363310 as deleRow, inserted.Col_4992123563508363310 as InserRow,
    deleted.Col_5501230271836040619 as deleRow, inserted.Col_5501230271836040619 as InserRow,
    deleted.Col_5039491696792157121 as deleRow, inserted.Col_5039491696792157121 as InserRow
where frm532Id = 37890
-- rollback;
commit;
