select * from [ITSDatabase].[Users].[TblProfiles]

Select * from [Task].[TblTask] t
inner join [Task].[TblWorkflowActivityInstance] a on t.WorkflowActivityInstaceID=a.WorkflowActivityInstanceID
Where WokflowInstanceID=328813
order by TaskID desc

declare @tblTaskId int = 4010141
begin tran
update [Task].[TblTask]
set UserID = 1661
output
    deleted.userid as oldData, inserted.userid as NewData
where taskid = @tblTaskId
rollback;

declare @tblTaskId int = 4010141
begin tran
update [Task].[TblTask]
set UserID = 1661
output
    deleted.userid as oldData, inserted.userid as NewData
where taskid = @tblTaskId
commit;


