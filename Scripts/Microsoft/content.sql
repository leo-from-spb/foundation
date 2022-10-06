---- CONTENT ----

insert into Language (Lang#, Lang_Name)
values ('EN', 'English'),
       ('DE', 'German'),
       ('RU', 'Russian'),
       ('ZH', 'Chinese'),
       ('FI', 'Finnish'),
       ('KA', 'Georgian'),
       ('FA', 'Persian'),
       ('PL', 'Polish'),
       ('ZU', 'Zulu')

insert into Author (Au#, Name_F, Name_L, Lang#, Life_Year_F, Life_Year_L)
values (1, 'Isaac', 'Asimov', 'EN', 1920, 1992),
       (2, 'Stanislaw', 'Lem', 'PL', 1921, 2006),
       (3, 'Arkady', 'Strugatsky', 'RU', 1925, 1991),
       (4, 'Boris', 'Strugatsky', 'RU', 1933, 2012)

insert into Foundation.dbo.Author_Wiki_Ref (Au#, Lang#, Wiki_Word)
values (1, 'DE', N'Isaak_Asimov'),
       (1, 'EN', N'Isaac_Asimov'),
       (1, 'RU', N'Азимов,_Айзек'),
       (2, 'EN', N'Stanislaw_Lem'),
       (2, 'PL', N'Stanisław_Lem')

insert into Essay (Es#, Authored_Year, Title)
values (1, 1951, 'Foundation'),
       (2, 1952, 'Foundation and Empire'),
       (3, 1953, 'Second Foundation'),
       (4, 1961, 'Solaris')

commit
go
