create view Essay_with_3_Authors as
with A as (select Es#, Nr, Author.* from Essay_Author join Author on Essay_Author.Au# = Author.Au#)
select E.*,
       A1.Name as Author_1_Name,
       A2.Name as Author_2_Name,
       A3.Name as Author_3_Name
from Essay E
    left join A A1 on E.Es# = A1.Es# and A1.Nr = 1
    left join A A2 on E.Es# = A2.Es# and A2.Nr = 2
    left join A A3 on E.Es# = A3.Es# and A3.Nr = 3
go
