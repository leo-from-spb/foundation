create trigger Language_tai
    on Language after insert
    not for replication
as
    update Language
    set Lang# = upper(Lang#)
    where Lang# in (select Lang# from inserted)
go


create trigger Essay_with_1_Author_insert
    on Essay_with_1_Author instead of insert
as
    insert into Essay (Es#, Authored_Year, Title)
        select inserted.Es#, inserted.Authored_Year, inserted.Title
        from inserted
    insert into Essay_Author (Es#, Nr, Au#)
        select inserted.Es#, 1, inserted.Au#
        from inserted
go


create trigger Essay_with_2_Authors_insert
    on Essay_with_2_Authors instead of insert
as
    insert into Essay (Es#, Authored_Year, Title)
        select inserted.Es#, inserted.Authored_Year, inserted.Title
        from inserted
    insert into Essay_Author (Es#, Nr, Au#)
        select inserted.Es#, 1, inserted.Au#_1
        from inserted
        where inserted.Au#_1 > 0
    insert into Essay_Author (Es#, Nr, Au#)
        select inserted.Es#, 2, inserted.Au#_2
        from inserted
        where inserted.Au#_2 > 0
go



commit
go