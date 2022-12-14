---- TABLES ----

create table Language
(
    Lang# iso2 not null
        constraint Language_pk primary key
        constraint Language_Lang_ch check (Lang# = upper(Lang#)),
    Lang_Name varchar(26) not null
        constraint Language_ak unique
)

exec commentOnTable 'Language', 'Natural language.'
exec commentOnTableColumn 'Language', 'Lang#', 'Two-letter ISO code of the language.'
exec commentOnTableColumn 'Language', 'Lang_Name', 'Displayable name.'


create table Entry_Note
(
    Note# surr identity (1000001, 7) not null
        constraint Entry_Note_pk primary key,
    Note nvarchar(max) not null,
    Modification_Time smalldatetime default getdate() not null
)

exec commentOnTable 'Entry_Note', 'Note that can be attached to an Essay or to an Author, with common full-text index.'

create index Entry_Note_Modification_i on Entry_Note (Modification_Time, Note#)


create sequence Author_seq as surr start with 1001 no cache no cycle 

create table Author
(
    Au# surr default (next value for Author_seq) not null
        constraint Author_pk primary key,
    Name_F varchar(40),
    Name_L varchar(40),
    Name as (trim(coalesce(Name_F,'')+' '+coalesce(Name_L,''))) persisted
        constraint Author_Name_nn check (Name is not null)
        constraint Author_Name_ak unique,
    Lang# iso2
        constraint Author_Lang_fk references Language,
    Note# surr 
        constraint Author_Note_fk references Entry_Note,
    Life_Year_F year,
    Life_Year_L year,
    constraint Author_Life_Years_ch check (coalesce(Life_Year_F,-9999) <= coalesce(Life_Year_L,9999))
)

exec commentOnTable 'Author', 'An author of a literary work or another text.'
exec commentOnTableColumn 'Author', 'Au#', 'Abstract author id, positive.'
exec commentOnTableColumn 'Author', 'Name_F', 'The first name.'
exec commentOnTableColumn 'Author', 'Name_L', 'The last name.'
exec commentOnTableColumn 'Author', 'Name', 'Generated full name.'
exec commentOnTableColumn 'Author', 'Lang#', 'The primary language.'
exec commentOnTableColumn 'Author', 'Note#', 'Reference to the attached note.'
exec commentOnTableColumn 'Author', 'Life_Year_F', 'Year of birth.'
exec commentOnTableColumn 'Author', 'Life_Year_L', 'Year of death.'

create unique index Author_Note_ui
    on Author (Note#)
    where Note# is not null


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


create sequence Essay_seq as surr start with 100001 cache 

create table Essay
(
    Es# surr default (next value for Essay_seq) not null
        constraint Essay_pk primary key,
    Authored_Year year,
    Title nvarchar(80) not null,
    Note# surr
        constraint Essay_Note_fk references Entry_Note
)

exec commentOnTable 'Essay', 'A literary work (novel, story, ect.) or an article.'
exec commentOnTableColumn 'Essay', 'Authored_Year', 'the year when it was authored or published.'
exec commentOnTableColumn 'Essay', 'Title', 'the title.'
exec commentOnTableColumn 'Essay', 'Note#', 'Reference to the attached note.'

create unique index Essay_Note_ui
    on Essay (Note#)
    where Note# is not null

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