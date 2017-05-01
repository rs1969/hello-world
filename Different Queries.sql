-----------------
-----------------
if object_id('TestCreate') is not null drop table TestCreate;
go
create table TestCreate
(
test123 uniqueidentifier not null Rowguidcol default NewID() Primary key clustered (test123, test1234), 
test1234 int not null CONSTRAINT check_1234 CHECK (test1234 < 1000000),
Test12345 as (case when test1234 = 4 then 55 else 66 end) persisted
)
go
insert into TestCreate (test1234) values(555)
select * from TestCreate
go
alter table TestCreate 
	CHECK Constraint check_1234;
go
-----------------
-----------------
if object_id('TestCreateTrigger1', 'TR') is not null drop trigger TestCreateTrigger1;
go

create trigger TestCreateTrigger1 on TestCreate
after insert
as
	if (exists(select test1234 from inserted where test1234=1))
		ROLLBACK
return
go
------------------
------------------
create nonclustered index TestCreateIndex1 on TestCreate (test1234)
	where test1234 = 2;

Go
------------------
------------------

create view TestView1
as
SELECT test1234 from TestCreate;

Go

Select * from TestView1

Update TestView1 Set test1234=666 where test1234=555
------------------
------------------
USE AdventureWorks2012;
  GO
  DBCC SHOW_STATISTICS ("Person.Address", AK_Address_rowguid);
  GO

------------------
------------------
  create procedure Test123344

  	@test int=111222,
	@test1 nvarchar(50) OUTPUT

  as

  begin

	  begin try
			begin transaction
				raiserror ('ERROR',10,1)
				Commit
	  end try

	  begin catch
			print 'Error!!!'
			rollback
	  end catch
	  select FirstName, lastname from person.person
	  select FirstName from test1234function('11111')
	  set @test1  = 'Success!'
  end

go
	declare @test1 varchar(50)
	exec Test123344 111222, @test1 OUTPUT
	select @test1
go
	drop proc Test123344
go


------------------
------------------

select newid()
go
------------------
------------------

create function test1234function (@test varchar(50))
returns table

as

return(
	select FirstName from person.person
)
go

declare @test varchar(50)
select FirstName from test1234function(@test)
go
drop function test1234function
go
------------------
------------------

begin transaction
print @@trancount
go
commit
print @@trancount
go
rollback
print @@trancount
go
-------
set transaction isolation level read uncommitted;
set transaction isolation level read committed;
set transaction isolation level repeatable read;
set transaction isolation level snapshot;
set transaction isolation level serializable;

DBCC USEROPTIONS 

exec sp_lock
go
begin transaction
print @@trancount
go

insert into TestCreate(test1234) Values(2)
rollback
commit
go

------------------
------------------
select test1234 from TestCreate
union all
select test1234 from TestView1
go

select test1234 from TestCreate
union all
select BusinessEntityID from person.person
go
------------------
------------------
select top(1) * from sales.SalesOrderHeader
select top(1) * from sales.SalesOrderDetail
go

select 
	TER.TerritoryID, SOH.AccountNumber , SOH.SalesOrderID, convert(money,SUM(SOD.LineTotal),2) as 'Sum for Order'
from sales.SalesOrderDetail SOD
	inner join sales.SalesOrderHeader SOH 
		on SOH.SalesOrderID=SOD.SalesOrderID
	inner join sales.Customer CUS on CUS.CustomerID=SOH.CustomerID
	inner join sales.SalesTerritory TER on TER.TerritoryID=CUS.TerritoryID
Group by TER.TerritoryID, SOH.AccountNumber, SOH.SalesOrderID
order by TER.TerritoryID, SOH.AccountNumber, SOH.SalesOrderID
GO

select 
	TER.TerritoryID, SOH.AccountNumber , SOH.SalesOrderID, convert(money,SUM(SOD.LineTotal),2) as 'Sum for Order',
	RANK() OVER(PARTITION BY SOH.AccountNumber ORDER BY SUM(SOD.LineTotal) DESC) as 'Rank'
from sales.SalesOrderDetail SOD
	inner join sales.SalesOrderHeader SOH 
		on SOH.SalesOrderID=SOD.SalesOrderID
	inner join sales.Customer CUS on CUS.CustomerID=SOH.CustomerID
	inner join sales.SalesTerritory TER on TER.TerritoryID=CUS.TerritoryID
Group by TER.TerritoryID, SOH.AccountNumber, SOH.SalesOrderID
order by TER.TerritoryID, SOH.AccountNumber, 'Rank', SOH.SalesOrderID
GO
------------------
------------------
-- Create an Employee table.
  CREATE TABLE dbo.MyEmployees
  (
      EmployeeID smallint NOT NULL,
      FirstName nvarchar(30)  NOT NULL,
      LastName  nvarchar(40) NOT NULL,
      Title nvarchar(50) NOT NULL,
      DeptID smallint NOT NULL,
      ManagerID int NULL,
   CONSTRAINT PK_EmployeeID PRIMARY KEY CLUSTERED (EmployeeID ASC) 
  );
  -- Populate the table with values.
  INSERT INTO dbo.MyEmployees VALUES 
   (1, N'Ken', N'Sánchez', N'Chief Executive Officer',16,NULL)
  ,(273, N'Brian', N'Welcker', N'Vice President of Sales',3,1)
  ,(274, N'Stephen', N'Jiang', N'North American Sales Manager',3,273)
  ,(275, N'Michael', N'Blythe', N'Sales Representative',3,274)
  ,(276, N'Linda', N'Mitchell', N'Sales Representative',3,274)
  ,(285, N'Syed', N'Abbas', N'Pacific Sales Manager',3,273)
  ,(286, N'Lynn', N'Tsoflias', N'Sales Representative',3,285)
  ,(16,  N'David',N'Bradley', N'Marketing Manager', 4, 273)
  ,(23,  N'Mary', N'Gibson', N'Marketing Specialist', 4, 16);
  
  GO

  USE AdventureWorks2012;
  GO
  WITH DirectReports(ManagerID, EmployeeID, Title, EmployeeLevel) AS 
  (
      SELECT ManagerID, EmployeeID, Title, 0 AS EmployeeLevel
      FROM dbo.MyEmployees 
      WHERE ManagerID IS NULL
      UNION ALL
      SELECT e.ManagerID, e.EmployeeID, e.Title, EmployeeLevel + 1
      FROM dbo.MyEmployees AS e
          INNER JOIN DirectReports AS d
          ON e.ManagerID = d.EmployeeID 
  )
  SELECT ManagerID, EmployeeID, Title, EmployeeLevel 
  FROM DirectReports
  ORDER BY ManagerID;
  GO
  
------------------
------------------
  
