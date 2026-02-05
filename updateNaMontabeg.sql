declare @WorkflowInstanceId nvarchar(10)=325237
declare @type nvarchar(5) = 3
DECLARE @PKFormID  BIGINT
SELECT @PKFormID = dbo.Get_FormIDByWorkflowInstanceID(444 ,@WorkflowInstanceId )
select @PKFormID

declare @Site int = (select col_4623208122663923034 As Site from dbo.Tbl_frm444 where frm444Id= @PKFormID);
select @Site as Site

-- declare @Site int = (
-- 		select code,typerequest from Tbl_Request
-- 		where type=@type);

-- begin tran
-- UPDATE dbo.Tbl_frm444
-- SET   Col_4640468048855264077 = dbo.Miladi2Shamsi(GETDATE() , 1), Col_5095884041953968362=cast( cast(GetDate()  as Time) as varchar(5))
-- , Col_4869483965686663044=  @WorkflowInstanceId, Col_4704376085541198172=  1, col_5594804167278269361 = 0
-- output
--     deleted.Col_4640468048855264077, inserted.Col_4640468048855264077,
--     deleted.Col_5095884041953968362, inserted.Col_5095884041953968362,
--     deleted.Col_4869483965686663044, inserted.Col_4869483965686663044,
--     deleted.Col_4704376085541198172, inserted.Col_4704376085541198172,
--     deleted.col_5594804167278269361, inserted.col_5594804167278269361
-- where   frm444Id =@PKFormID
-- rollback



