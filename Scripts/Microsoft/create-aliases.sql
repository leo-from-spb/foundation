---- ALIASES and RULES ----

create type surr from int
create type iso2 from char(2)
create type year from smallint
go

create rule positive as @id > 0
go
create rule year as @y between 0001 and 2099
go

exec sys.sp_bindrule @rulename='positive', @objname='surr' , @futureonly='futureonly'
exec sys.sp_bindrule @rulename='year', @objname='year' , @futureonly='futureonly'
go

commit
go