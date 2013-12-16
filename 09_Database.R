library(RODBC)
dbhandle <- odbcDriverConnect('driver={SQL Server};server=localhost;database=mip_portal;trusted_connection=true')
res <- sqlQuery(dbhandle, 'select * from information_schema.tables')
