create view Essay_with_Authors
as
with A as ( select Es#,
                   string_agg(X.Au#,', ') as Authors#,
                   string_agg(Y.Name,', ') as Author_Names
            from Essay_Author X
            join Author Y on X.Au# = Y.Au#
            group by Es#)
select E.Es#,
       A.Authors#, A.Author_Names,
       E.Authored_Year, E.Title
from Essay E left join A on E.Es# = A.Es#
go


commit
go
