---- TABLES ----

create table Language
(
    Lang# iso2 not null
        constraint Language_pk primary key
        constraint Language_Lang_ch check (Lang# = upper(Lang#)),
    Lang_Name varchar(26) not null
        constraint Language_ak unique
)

create table Author
(
    Au# surr not null
        constraint Author_pk primary key,
    Name_F varchar(40),
    Name_L varchar(40),
    Name as (trim(coalesce(Name_F,'')+' '+coalesce(Name_L,''))) persisted
        constraint Author_Name_nn check (Name is not null)
        constraint Author_Name_ak unique,
    Lang# iso2
        constraint Author_Lang_fk references Language,
    Life_Year_F year,
    Life_Year_L year,
    constraint Author_Life_Years_ch check (coalesce(Life_Year_F,-9999) <= coalesce(Life_Year_L,9999))
)

create table Author_Wiki_Ref
(
    Au# surr not null
        constraint Author_Wiki_Ref_fk references Author
            on update cascade on delete cascade,
    Lang# iso2 not null
        constraint Author_Wiki_Ref_Lang_fk references Language,
    Wiki_Word nvarchar(80) not null,
    Link as ('https://'+lower(Lang#)+'.wikipedia.org/wiki/'+Wiki_Word),
    constraint Author_Wiki_Ref_pk primary key (Au#, Lang#)
)

create table Essay
(
    Es# surr not null
        constraint Essay_pk primary key,
    Authored_Year year,
    Title nvarchar(80) not null
)

create index Essay_Authored_Year_i on Essay (Authored_Year)
create index Essay_Title_i on Essay (Title)

create table Essay_Author
(
    Es# surr not null
        constraint Essay_Author_Es_fk references Essay
            on update cascade on delete cascade,
    Nr tinyint not null
        constraint Essay_Author_Nr_ch check (Nr >= 1),
    Au# surr not null
        constraint Essay_Author_Au_fk references Author,
    constraint Essay_Author_pk primary key (Es#, Nr, Au#),
    constraint Essay_Author_ak unique (Es#, Au#)
)

commit
go