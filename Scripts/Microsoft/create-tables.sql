---- TABLES ----

create table Language
(
    Lang# char(2) not null
        constraint Language_pk primary key,
    Lang_Name varchar(26) not null
        constraint Language_ak unique
)

create table Author
(
    Au# int not null
        constraint Author_pk primary key,
    Name_F varchar(40),
    Name_L varchar(40),
    Name as (trim(coalesce(Name_F,'')+' '+coalesce(Name_L,''))) persisted
        constraint Author_Name_nn check (Name is not null)
        constraint Author_Name_ak unique,
    Lang# char(2)
        constraint Author_Lang_fk references Language,
    Life_Year_F smallint
        constraint Author_Life_Year_F_ch check (Life_Year_F between -4000 and 2022),
    Life_Year_L smallint
        constraint Author_Life_Year_L_ch check (Life_Year_L between -4000 and 2022),
    constraint Author_Life_Years_ch check (coalesce(Life_Year_F,-9999) <= coalesce(Life_Year_L,9999))
)

create table Author_Wiki_Ref
(
    Au# int not null
        constraint Author_Wiki_Ref_fk references Author,
    Lang# char(2) not null
        constraint Author_Wiki_Ref_Lang_fk references Language,
    Wiki_Word nvarchar(80) not null,
    Link as ('https://'+lower(Lang#)+'.wikipedia.org/wiki/'+Wiki_Word),
    constraint Author_Wiki_Ref_pk primary key (Au#, Lang#)
)

create table Essay
(
    Es# int not null
        constraint Essay_pk primary key,
    Authored_Year smallint
        constraint Essay_Auth_Year_ch check (Authored_Year between -4000 and 2022),
    Title nvarchar(80) not null
)

create index Essay_Authored_Year_i on Essay (Authored_Year)
create index Essay_Title_i on Essay (Title)

create table Essay_Author
(
    Es# int not null
        constraint Essay_Author_Es_fk references Essay,
    Nr tinyint not null
        constraint Essay_Author_Nr_ch check (Nr >= 1),
    Au# int not null
        constraint Essay_Author_Au_fk references Author,
    constraint Essay_Author_pk primary key (Es#, Nr, Au#),
    constraint Essay_Author_ak unique (Es#, Au#)
)

go