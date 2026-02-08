USE [ITSDatabase]
GO

Select * from [Task].[TblTask] t
inner join [Task].[TblWorkflowActivityInstance] a on t.WorkflowActivityInstaceID=a.WorkflowActivityInstanceID
Where WokflowInstanceID=312129
order by TaskID desc


Update [Task].[TblTask]
set TaskStatusID=6
Where TaskID=3733755