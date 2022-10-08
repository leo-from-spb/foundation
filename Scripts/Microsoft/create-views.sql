create view Essay_with_1_Author as
select E.Es#,
       A.Au#,
       A.Name as Author_Name,
       E.Authored_Year,
       E.Title
from Essay E
    left join Essay_Author X on E.Es# = X.Es# and X.Nr = 1
    left join Author A on X.Au# = A.Au#
go


create view Essay_with_2_Authors as
with A as (select Es#, Nr, Author.* from Essay_Author join Author on Essay_Author.Au# = Author.Au#)
select E.Es#,
       A1.Au# as Au#_1,
       A2.Au# as Au#_2,
       trim(' ,' from isnull(A1.Name,'') + ', ' + isnull(A2.Name,'')) as Author_Names,
       E.Authored_Year,
       E.Title
from Essay E
    left join A A1 on E.Es# = A1.Es# and A1.Nr = 1
    left join A A2 on E.Es# = A2.Es# and A2.Nr = 2
go


create view Essay_with_3_Authors as
with A as (select Es#, Nr, Author.* from Essay_Author join Author on Essay_Author.Au# = Author.Au#)
select E.Es#,
       A1.Au# as Au#_1,
       A2.Au# as Au#_2,
       A3.Au# as Au#_3,
       trim(' ,' from isnull(A1.Name,'') + ', ' + isnull(A2.Name,'') + ', ' + isnull(A3.Name,'')) as Author_Names,
       E.Authored_Year,
       E.Title
from Essay E
    left join A A1 on E.Es# = A1.Es# and A1.Nr = 1
    left join A A2 on E.Es# = A2.Es# and A2.Nr = 2
    left join A A3 on E.Es# = A3.Es# and A3.Nr = 3
go

commit
go