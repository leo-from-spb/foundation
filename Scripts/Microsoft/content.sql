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
       (4, 'Boris', 'Strugatsky', 'RU', 1933, 2012),
       (5, 'Frank', 'Herbert', 'EN', 1920, 1986),
       (6, 'George', 'Orwell', 'EN', 1903, 1950)

insert into Author_Wiki_Ref (Au#, Lang#, Wiki_Word)
values (1, 'DE', N'Isaak_Asimov'),
       (1, 'EN', N'Isaac_Asimov'),
       (1, 'RU', N'Азимов,_Айзек'),
       (2, 'EN', N'Stanislaw_Lem'),
       (2, 'PL', N'Stanisław_Lem'),
       (3, 'RU', N'Стругацкий,_Аркадий_Натанович'),
       (3, 'DE', N'Arkadi_und_Boris_Strugazki'),
       (4, 'RU', N'Стругацкий,_Борис_Натанович'),
       (4, 'DE', N'Arkadi_und_Boris_Strugazki'),
       (5, 'EN', N'Frank_Herbert'),
       (6, 'EN', N'George_Orwell')

insert into Essay_with_1_Author (Es#, Au#, Authored_Year, Title)
values (1, 1, 1951, N'Foundation'),
       (2, 1, 1952, N'Foundation and Empire'),
       (3, 1, 1953, N'Second Foundation'),
       (4, 2, 1961, N'Solaris'),
       (5, 5, 1965, N'Dune'),
       (8, 6, 1945, N'Animal Farm'),
       (9, 6, 1949, N'1984')

insert into Essay_with_2_Authors (Es#, Au#_1, Au#_2, Authored_Year, Title)
values (6, 3, 4, 1959, N'Страна багровых туч'),
       (7, 3, 4, 1960, N'Путь на Амальтею')

commit
go
