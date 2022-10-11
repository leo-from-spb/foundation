create procedure commentOnType
    @type varchar(60),
    @text nvarchar(100)
as
    declare @currentUser sysname
    select @currentUser = user_name()
    execute sp_addextendedproperty
        'MS_Description', @text,
        'user', @currentUser,
        'type', @type
go


create procedure commentOnTable
    @table varchar(60),
    @text nvarchar(100)
as
    declare @currentUser sysname
    select @currentUser = user_name()
    execute sp_addextendedproperty
        'MS_Description', @text,
        'user', @currentUser,
        'table', @table
go


create procedure commentOnTableColumn
    @table varchar(60),
    @column varchar(60),
    @text nvarchar(100)
as
    declare @currentUser sysname
    select @currentUser = user_name()
    execute sp_addextendedproperty
        'MS_Description', @text,
        'user', @currentUser,
        'table', @table,
        'column', @column
go


create procedure commentOnView
    @view varchar(60),
    @text nvarchar(100)
as
    declare @currentUser sysname
    select @currentUser = user_name()
    execute sp_addextendedproperty
        'MS_Description', @text,
        'user', @currentUser,
        'view', @view
go


create procedure commentOnViewColumn
    @view varchar(60),
    @column varchar(60),
    @text nvarchar(100)
as
    declare @currentUser sysname
    select @currentUser = user_name()
    execute sp_addextendedproperty
        'MS_Description', @text,
        'user', @currentUser,
        'view', @view,
        'column', @column
go


