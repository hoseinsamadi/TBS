declare @WorkflowInstanceId nvarchar(10)= 329141
DECLARE @PKFormID  BIGINT
SELECT @PKFormID = dbo.Get_FormIDByWorkflowInstanceID(532 ,@WorkflowInstanceId )
select @PKFormID

select col_5738788815199204256,*
from dbo.Tbl_frm532
where frm532Id= 37576

select *
from tbl_frm536
where frm536Id= 41693

-- دستور آپدیت برای فرآیند 329141
begin tran
update tbl_frm536
set Col_5225494921650844714 = 254
output
    deleted.Col_5225494921650844714 as DeleteItem,
    Inserted.Col_5225494921650844714 as InsertItem
where frm536Id= 41693
rollback

begin tran
update tbl_frm536
set Col_5225494921650844714 = 254
output
    deleted.Col_5225494921650844714 as DeleteItem,
    Inserted.Col_5225494921650844714 as InsertItem
where frm536Id= 41693
commit
