drop synonym if exists Essay_with_N_Authors
commit 
go

drop view if exists Essay_with_Authors
commit
go

drop view Essay_with_3_Authors
drop view Essay_with_2_Authors
drop view Essay_with_1_Author
commit
go

drop table Author_Wiki_Ref
drop table Essay_Author
drop table Author
drop table Essay
drop table Entry_Note
drop table Language
commit
go

drop fulltext catalog FullText_Catalog
commit
go

drop sequence Essay_seq
drop sequence Author_seq
commit 
go

drop type surr
drop type iso2
drop type year
commit
go

drop rule positive
drop rule year
commit
go


drop procedure commentOnType
drop procedure commentOnTable
drop procedure commentOnTableColumn
drop procedure commentOnView
drop procedure commentOnViewColumn
go
