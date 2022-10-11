---- ALIASES and RULES ----

create type surr from int
create type iso2 from char(2)
create type year from smallint
go

exec commentOnType 'surr', 'positive surrogate (abstract) identifier'
exec commentOnType 'iso2', 'two-letter ISO code'
exec commentOnType 'year', 'year from 0001 to 2099'
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