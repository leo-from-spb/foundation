create trigger Language_tbi
    on Language after insert
    not for replication
as
    update Language
    set Lang# = upper(Lang#)
    where Lang# in (select Lang# from inserted)
go

commit
go