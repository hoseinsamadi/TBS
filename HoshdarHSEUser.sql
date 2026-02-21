with cte
as
(
select  * from [192.168.10.16\SQL2019].[framework].[Prs].[vAllPersonInfo]
where exitdate is null and departmentname is not null
)
select  r.fname + ' ' + r.lname personname,cte.personcode,cte.birthdate,cte.mobileno,cte.marriagetitle,e.[EDUCATIONDEGREE],e.[EDUCATIONFEILD],cte.departmentname,cte.roletitle,cte.employdate from cte
inner join [192.168.10.16\SQL2019].[framework].[Prs].[RealPerson] R on R.[PersonID]=cte.[PersonID]
left join [192.168.10.16\SQL2019].[framework].[Prs].[PERSONELI_Person_] E on e.id=r.personid
where
 cte.personcode=@code