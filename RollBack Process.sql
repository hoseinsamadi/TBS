USE [ITSDatabase]
GO

Select * from [Task].[TblTask] t
inner join [Task].[TblWorkflowActivityInstance] a on t.WorkflowActivityInstaceID=a.WorkflowActivityInstanceID
Where WokflowInstanceID=296275
order by TaskID desc



Update [Task].[TblTask]
set TaskStatusID=2
Where TaskID=3345690