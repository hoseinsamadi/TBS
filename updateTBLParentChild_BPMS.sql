select *
FROM dbo. TBL_ParentChild_ByUSER
where Child_USERID = 3281

update dbo.TBL_ParentChild_ByUSER
set ITSDatabase.dbo.TBL_ParentChild_ByUSER.Parent_USERID = 914 , ITSDatabase.dbo.TBL_ParentChild_ByUSER.Parent_EMP_NO = 12401
where Child_USERID = 3281
