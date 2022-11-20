create fulltext catalog FullText_Catalog as default
commit
go


create fulltext index on Entry_Note (Note)
    key index Entry_Note_pk
    with stoplist = system
commit
go

