Select * from [Task].[TblTask] t
inner join [Task].[TblWorkflowActivityInstance] a on t.WorkflowActivityInstaceID=a.WorkflowActivityInstanceID
Where WokflowInstanceID=329126
order by TaskID desc

SELECT Tbl_frm153.[frm153Id],Task.TblFormInstance.WorkflowInstanceId
      ,Tbl_frm153.[Col_5297214998050660603] as PersonalCode
      ,Tbl_frm153.[Col_5740677270745428989] as FullName
      ,TblEmployee.UnitName as Unit
      ,Tbl_frm153.[Col_5470332479790153295] as BazresName
      ,Tbl_frm153.[Col_4646212142716140801] as Tarikh
      ,Tbl_frm153.[Col_5623651591819675527] as MahaleBazresi
	  ,Tbl_frm153.[Col_4970961271681050730] as Hoshdar
	  ,Tbl_frm153.Col_5629534449230116648 as Ubit2
      ,case Tbl_frm153.[Col_4970961271681050730] when 1 then N'هشدار' else N'اخطار' end as Hoshdar
      ,Tbl_frm153.[Col_5249258519405230860] as Ekhtar
	  , case Tbl_frm153.Col_4970961271681050730
	   when 1 then Tbl_frm153.Col_4668636832289077212
	   else ''
	    end as hoshdarSharayetemohiti
	   , Tbl_frm153.Col_5337938999044663735 as tajhizat
	  ,	Tbl_frm153.col_5497097280131987261 as standard
	  ,	Tbl_frm153.col_5439033348135346991 as sayeremavared
        FROM Tbl_frm153
INNER JOIN Task.TblFormInstance
   ON Tbl_frm153.frm153Id = Task.TblFormInstance.PKFormID
FULL OUTER JOIN TblEmployee
   ON CAST(TblEmployee.Emp_no AS nvarchar(50))
      = Tbl_frm153.Col_5297214998050660603
where Task.TblFormInstance.WorkflowInstanceId = 329126



select *
from dbo.Tbl_frm153
where frm153Id=3739


BEGIN TRAN;
-- بررسی رکورد
SELECT *
FROM dbo.Tbl_frm153
WHERE frm153Id = 3739;
-- حذف رکورد
DELETE
FROM dbo.Tbl_frm153
WHERE frm153Id = 3739;
-- دوباره ببین حذف شده یا نه
SELECT *
FROM dbo.Tbl_frm153
WHERE frm153Id = 3739;
-- ROLLBACK;
commit;
