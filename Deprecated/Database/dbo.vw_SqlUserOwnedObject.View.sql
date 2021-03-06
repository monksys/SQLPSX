/****** Object:  View [dbo].[vw_SqlUserOwnedObject]    Script Date: 07/09/2008 12:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_SqlUserOwnedObject]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_SqlUserOwnedObject]
AS
SELECT [LoginType], [Server], [dbname], [Login], [timestamp], [ObjectType], [ObjectName]
FROM dbo.SqlUser u
CROSS APPLY dbo.ufn_GetObjectType(u.objects)
CROSS APPLY dbo.ufn_GetObjectName(u.objects)'
GO
