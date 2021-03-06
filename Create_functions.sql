
/****** Object:  UserDefinedFunction [dbo].[fn_create_sql_catalog]    Script Date: 4/10/2016 8:46:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
Date 10/24/2015
Version 1.0
Owner Jorge Munoz/Ian Araya
Description:The purpose of this function is to create a query useful to retrieve the content of Indico Catalog
Input parameters:[Path of excel file--Var_excel_path variable]
	
Output parameters:[full query constructed--var_full_sql variable]				
*/
CREATE FUNCTION [dbo].[fn_create_sql_catalog](@var_excel_path varchar(256))
RETURNS NVARCHAR(2000)
WITH EXECUTE AS CALLER
AS
BEGIN

--Variables modules
declare @var_sql_select1 varchar(250)
declare @var_linked_server varchar(30)
declare @var_database_server varchar(30)
declare @var_HDR varchar(10)
declare @var_close_sql varchar(2)
declare @var_full_sql nvarchar(400)
declare @var_excel_select varchar(100)

--Variables definition
select @var_sql_select1='SELECT  Name,Modified,[modified by],[file size],[path] FROM OPENROWSET('
select @var_linked_server='''Microsoft.ACE.OLEDB.12.0'','
select @var_database_server='''Excel 12.0;Database='
select @var_HDR=';HDR=YES'','
select @var_excel_select='''select * from [owssvr$]'')'
--Concat command
select @var_full_sql=concat(@var_sql_select1,@var_linked_server,@var_database_server,@var_excel_path,@var_HDR,@var_excel_select)
--Return SQL command
RETURN @var_full_sql
END


GO
/****** Object:  UserDefinedFunction [dbo].[fn_create_sql_check_contract]    Script Date: 4/10/2016 8:46:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
 
/*
Date 10/18/2015
Version 1.0
Owner Jorge Munoz/Ian Araya
Description:The purpose of this function is to create a query useful to retrieve the content of Indico contract,p_deal page
Input parameters:[Path of excel file--Var_excel_path variable]
Output parameters:[full query constructed--var_full_sql variable]				
*/
CREATE FUNCTION [dbo].[fn_create_sql_check_contract](@var_excel_path varchar(256))
RETURNS NVARCHAR(400)
WITH EXECUTE AS CALLER
AS
BEGIN

--Variables modules
declare @var_sql_select1 varchar(50)
declare @var_linked_server varchar(30)
declare @var_database_server varchar(30)
declare @var_HDR varchar(10)
declare @var_close_sql varchar(2)
declare @var_full_sql nvarchar(2000)
declare @var_excel_select varchar(256)

--Variables definition
select @var_sql_select1='SELECT CAST(F1 as varchar) FROM OPENROWSET('
select @var_linked_server='''Microsoft.ACE.OLEDB.12.0'','
select @var_database_server='''Excel 12.0;Database='
select @var_HDR=';HDR=NO'','
select @var_excel_select='''select * from [p_line_wf$]'')'
--Concat command
select @var_full_sql=concat(@var_sql_select1,@var_linked_server,@var_database_server,@var_excel_path,@var_HDR,@var_excel_select)
--Return SQL command
RETURN @var_full_sql
END


GO
/****** Object:  UserDefinedFunction [dbo].[fn_create_sql_check_p_onsite]    Script Date: 4/10/2016 8:46:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
Date 11/17/2015
Version 1.0
Owner Jorge Munoz/Ian Araya
Description:The purpose of this function is to create a query useful to retrieve the content of Indico contract and define if its a valid Indico file
Input parameters:[Path of excel file--Var_excel_path variable]
				 [Contract_id--var_contract_id]
Output parameters:[full query constructed--var_full_sql variable]				
*/
CREATE FUNCTION [dbo].[fn_create_sql_check_p_onsite](@var_excel_path varchar(256))
RETURNS NVARCHAR(800)
WITH EXECUTE AS CALLER
AS
BEGIN

--Variables modules
declare @var_sql_select1 varchar(100)
declare @var_linked_server varchar(30)
declare @var_database_server varchar(30)
declare @var_HDR varchar(10)
declare @var_close_sql varchar(2)
declare @var_full_sql nvarchar(800)
declare @var_excel_select varchar(100)

--Variables definition
select @var_sql_select1='SELECT F2 FROM OPENROWSET( '
select @var_linked_server='''Microsoft.ACE.OLEDB.12.0'','
select @var_database_server='''Excel 12.0;Database='
select @var_HDR=';HDR=NO'','
select @var_excel_select='''select * from [p_onsite$]'')'
--Concat command
select @var_full_sql=concat(@var_sql_select1,@var_linked_server,@var_database_server,@var_excel_path,@var_HDR,@var_excel_select)
--Return SQL command
RETURN @var_full_sql
END


GO
/****** Object:  UserDefinedFunction [dbo].[fn_create_sql_db_sce_value]    Script Date: 4/10/2016 8:46:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
Date 11/17/2015
Version 1.0
Owner Jorge Munoz/Ian Araya
Description:The purpose of this function is to create a query useful to retrieve the content of Indico contract,db_sce_value
Input parameters:[Path of excel file--Var_excel_path variable]
				 [Contract_id--var_contract_id]
Output parameters:[full query constructed--var_full_sql variable]				
*/
CREATE FUNCTION [dbo].[fn_create_sql_db_sce_value](@var_contract_id int, @var_excel_path varchar(256))
RETURNS NVARCHAR(3500)
WITH EXECUTE AS CALLER
AS
BEGIN

--Variables modules
declare @var_sql_select1 varchar(20)
declare @var_sql_select2 varchar(300)
declare @var_sql_select3 varchar(250)
declare @var_sql_select4 varchar(250)
declare @var_sql_select5 varchar(250)
declare @var_sql_select6 varchar(250)
declare @var_linked_server varchar(30)
declare @var_database_server varchar(30)
declare @var_HDR varchar(10)
declare @var_close_sql varchar(2)
declare @var_full_sql nvarchar(3500)
declare @var_excel_select varchar(100)

--Variables definition
select @var_sql_select1='SELECT '
select @var_sql_select2=',NEXT value for seq_consecutive as Consecutivo,[gross revenue Y0],[gross revenue Y1],[gross revenue Y2],[gross revenue Y3],[gross revenue Y4],[gross revenue Y5],[gross revenue Y6],[gross revenue Y7], '
select @var_sql_select3='[gross revenue Y8],[gross revenue Y9],[gross revenue Y10],[net revenue Y0],[net revenue Y1],[net revenue Y2],[net revenue Y3],[net revenue Y4],[net revenue Y5],'
select @var_sql_select4='[net revenue Y6],[net revenue Y7],[net revenue Y8],[net revenue Y9],[net revenue Y10],[cost Y0],[cost Y1],[cost Y2],[cost Y3],[cost Y4],[cost Y5],'
select @var_sql_select5='[cost Y6],[cost Y7],[cost Y8],[cost Y9],[cost Y10],[GM Y0],[GM Y1],[GM Y2],[GM Y3],[GM Y4],[GM Y5],[GM Y6],[GM Y7],[GM Y8],[GM Y9],[GM Y10],'
select @var_sql_select6='[OPEX Y0],[OPEX Y1],[OPEX Y2],[OPEX Y3],[OPEX Y4],[OPEX Y5],[OPEX Y6],[OPEX Y7],[OPEX Y8],[OPEX Y9],[OPEX Y10] FROM OPENROWSET('
select @var_linked_server='''Microsoft.ACE.OLEDB.12.0'','
select @var_database_server='''Excel 12.0;Database='
select @var_HDR=';HDR=YES'','
select @var_excel_select='''select * from [db_sce_value$]'')'
--Concat command
select @var_full_sql=concat(@var_sql_select1,@var_contract_id,@var_sql_select2,@var_sql_select3,@var_sql_select4,@var_sql_select5,@var_sql_select6,@var_linked_server,@var_database_server,@var_excel_path,@var_HDR,@var_excel_select)
--Return SQL command
RETURN @var_full_sql
END


GO
/****** Object:  UserDefinedFunction [dbo].[fn_create_sql_p_deal]    Script Date: 4/10/2016 8:46:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
Date 9/4/2015
Version 1.0
Owner Jorge Munoz/Ian Araya
Description:The purpose of this function is to create a query useful to retrieve the content of Indico contract,p_deal page
Input parameters:[Path of excel file--Var_excel_path variable]
				 [Contract_id--var_contract_id]
Output parameters:[full query constructed--var_full_sql variable]				
*/
CREATE FUNCTION [dbo].[fn_create_sql_p_deal](@var_contract_id int, @var_excel_path varchar(256))
RETURNS NVARCHAR(600)
WITH EXECUTE AS CALLER
AS
BEGIN

--Variables modules
declare @var_sql_select1 varchar(20)
declare @var_sql_select2 varchar(180)
declare @var_linked_server varchar(30)
declare @var_database_server varchar(30)
declare @var_HDR varchar(10)
declare @var_close_sql varchar(2)
declare @var_full_sql nvarchar(600)
declare @var_excel_select varchar(100)

--Variables definition
select @var_sql_select1='SELECT '
select @var_sql_select2=',NEXT value for seq_consecutive as Consecutivo,CAST(F1 as varchar),CAST(F2 as varchar) FROM OPENROWSET('
select @var_linked_server='''Microsoft.ACE.OLEDB.12.0'','
select @var_database_server='''Excel 12.0;Database='
select @var_HDR=';HDR=NO'','
select @var_excel_select='''select * from [p_deal$]'')'
--Concat command
select @var_full_sql=concat(@var_sql_select1,@var_contract_id,@var_sql_select2,@var_linked_server,@var_database_server,@var_excel_path,@var_HDR,@var_excel_select)
--Return SQL command
RETURN @var_full_sql
END


GO
/****** Object:  UserDefinedFunction [dbo].[fn_create_sql_p_line_cost]    Script Date: 4/10/2016 8:46:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
Date 11/16/2015
Version 1.0
Owner Jorge Munoz/Ian Araya
Description:The purpose of this function is to create a query useful to retrieve the content of Indico contract,p_line_cost page
Input parameters:[Path of excel file--Var_excel_path variable]
				 [Contract_id--var_contract_id]
Output parameters:[full query constructed--var_full_sql variable]				
*/
CREATE FUNCTION [dbo].[fn_create_sql_p_line_cost](@var_contract_id int, @var_excel_path varchar(256))
RETURNS NVARCHAR(1500)
WITH EXECUTE AS CALLER
AS
BEGIN

--Variables modules
declare @var_sql_select1 varchar(20)
declare @var_sql_select2 varchar(250)
declare @var_sql_select3 varchar(250)
declare @var_sql_select4 varchar(250)
declare @var_linked_server varchar(30)
declare @var_database_server varchar(30)
declare @var_HDR varchar(10)
declare @var_close_sql varchar(2)
declare @var_full_sql nvarchar(1500)
declare @var_excel_select varchar(100)

--Variables definition
select @var_sql_select1='SELECT '
select @var_sql_select2=',NEXT value for seq_consecutive as Consecutivo,CAST(F1 as varchar),CAST(F2 as varchar),CAST(F3 as varchar),CAST(F4 as varchar),CAST(F5 as varchar),CAST(F6 as varchar),CAST(F7 as varchar),CAST(F8 as varchar),CAST(F9 as varchar),CAST(F10 as varchar),'
select @var_sql_select3='CAST(F11 as varchar),CAST(F12 as varchar),CAST(F13 as varchar),CAST(F14 as varchar),CAST(F15 as varchar),CAST(F16 as varchar),CAST(F17 as varchar),CAST(F18 as varchar),CAST(F19 as varchar),CAST(F20 as varchar),'
select @var_sql_select4='CAST(F21 as varchar),CAST(F22 as varchar) FROM OPENROWSET('
select @var_linked_server='''Microsoft.ACE.OLEDB.12.0'','
select @var_database_server='''Excel 12.0;Database='
select @var_HDR=';HDR=NO'','
select @var_excel_select='''select * from [p_line_cost$]'')'
--Concat command
select @var_full_sql=concat(@var_sql_select1,@var_contract_id,@var_sql_select2,@var_sql_select3,@var_sql_select4,@var_linked_server,@var_database_server,@var_excel_path,@var_HDR,@var_excel_select)
--Return SQL command
RETURN @var_full_sql
END


GO
/****** Object:  UserDefinedFunction [dbo].[fn_create_sql_p_line_gen]    Script Date: 4/10/2016 8:46:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
Date 11/17/2015
Version 1.0
Owner Jorge Munoz/Ian Araya
Description:The purpose of this function is to create a query useful to retrieve the content of Indico contract,p_line_gen
Input parameters:[Path of excel file--Var_excel_path variable]
				 [Contract_id--var_contract_id]
Output parameters:[full query constructed--var_full_sql variable]				
*/
CREATE FUNCTION [dbo].[fn_create_sql_p_line_gen](@var_contract_id int, @var_excel_path varchar(256))
RETURNS NVARCHAR(2000)
WITH EXECUTE AS CALLER
AS
BEGIN

--Variables modules
declare @var_sql_select1 varchar(20)
declare @var_sql_select2 varchar(250)
declare @var_sql_select3 varchar(250)
declare @var_sql_select4 varchar(250)
declare @var_sql_select5 varchar(250)
declare @var_sql_select6 varchar(250)
declare @var_sql_select7 varchar(250)
declare @var_sql_select8 varchar(250)
declare @var_sql_select9 varchar(250)
declare @var_linked_server varchar(30)
declare @var_database_server varchar(30)
declare @var_HDR varchar(10)
declare @var_close_sql varchar(2)
declare @var_full_sql nvarchar(2000)
declare @var_excel_select varchar(100)

--Variables definition
select @var_sql_select1='SELECT '
select @var_sql_select2=',NEXT value for seq_consecutive as Consecutivo,CAST(F1 as varchar),CAST(F2 as varchar),CAST(F3 as varchar),CAST(F4 as varchar),CAST(F5 as varchar),CAST(F6 as varchar),CAST(F7 as varchar),CAST(F8 as varchar),CAST(F9 as varchar),CAST(F10 as varchar),'
select @var_sql_select3='CAST(F11 as varchar),CAST(F12 as varchar),CAST(F13 as varchar),CAST(F14 as varchar),CAST(F15 as varchar),CAST(F16 as varchar),CAST(F17 as varchar),CAST(F18 as varchar),CAST(F19 as varchar),CAST(F20 as varchar),'
select @var_sql_select4='CAST(F21 as varchar),CAST(F22 as varchar),CAST(F23 as varchar),CAST(F24 as varchar),CAST(F25 as varchar),CAST(F26 as varchar),CAST(F27 as varchar),CAST(F28 as varchar),CAST(F29 as varchar),CAST(F30 as varchar),'
select @var_sql_select5='CAST(F31 as varchar),CAST(F32 as varchar),CAST(F33 as varchar),CAST(F34 as varchar),CAST(F35 as varchar),CAST(F36 as varchar),CAST(F37 as varchar),CAST(F38 as varchar),CAST(F39 as varchar),CAST(F40 as varchar),'
select @var_sql_select6='CAST(F41 as varchar),CAST(F42 as varchar),CAST(F43 as varchar),CAST(F44 as varchar),CAST(F45 as varchar),CAST(F46 as varchar),CAST(F47 as varchar),CAST(F48 as varchar),CAST(F49 as varchar),CAST(F50 as varchar),'
select @var_sql_select7='CAST(F51 as varchar),CAST(F52 as varchar),CAST(F53 as varchar),CAST(F54 as varchar),CAST(F55 as varchar),CAST(F56 as varchar),CAST(F57 as varchar),CAST(F58 as varchar),CAST(F59 as varchar),CAST(F60 as varchar),'
select @var_sql_select8='CAST(F61 as varchar),CAST(F62 as varchar),CAST(F63 as varchar),CAST(F64 as varchar),CAST(F65 as varchar),CAST(F66 as varchar),CAST(F67 as varchar),CAST(F68 as varchar),CAST(F69 as varchar),CAST(F70 as varchar),'
select @var_sql_select9='CAST(F71 as varchar),CAST(F72 as varchar),CAST(F73 as varchar),CAST(F74 as varchar),CAST(F75 as varchar),CAST(F76 as varchar),CAST(F77 as varchar),CAST(F78 as varchar) FROM OPENROWSET('

select @var_linked_server='''Microsoft.ACE.OLEDB.12.0'','
select @var_database_server='''Excel 12.0;Database='
select @var_HDR=';HDR=NO'','
select @var_excel_select='''select * from [p_line_gen$]'')'
--Concat command
select @var_full_sql=concat(@var_sql_select1,@var_contract_id,@var_sql_select2,@var_sql_select3,@var_sql_select4,@var_sql_select5,@var_sql_select6,@var_sql_select7,@var_sql_select8,@var_sql_select9,@var_linked_server,@var_database_server,@var_excel_path,@var_HDR,@var_excel_select)
--Return SQL command
RETURN @var_full_sql
END


GO
/****** Object:  UserDefinedFunction [dbo].[fn_create_sql_p_line_wf]    Script Date: 4/10/2016 8:46:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
Date 11/17/2015
Version 1.0
Owner Jorge Munoz/Ian Araya
Description:The purpose of this function is to create a query useful to retrieve the content of Indico contract,p_deal page
Input parameters:[Path of excel file--Var_excel_path variable]
				 [Contract_id--var_contract_id]
Output parameters:[full query constructed--var_full_sql variable]				
*/
CREATE FUNCTION [dbo].[fn_create_sql_p_line_wf](@var_contract_id int, @var_excel_path varchar(256))
RETURNS NVARCHAR(2000)
WITH EXECUTE AS CALLER
AS
BEGIN

--Variables modules
declare @var_sql_select1 varchar(20)
declare @var_sql_select2 varchar(250)
declare @var_sql_select3 varchar(250)
declare @var_sql_select4 varchar(250)
declare @var_sql_select5 varchar(250)
declare @var_sql_select6 varchar(250)
declare @var_linked_server varchar(30)
declare @var_database_server varchar(30)
declare @var_HDR varchar(10)
declare @var_close_sql varchar(2)
declare @var_full_sql nvarchar(2000)
declare @var_excel_select varchar(100)

--Variables definition
select @var_sql_select1='SELECT '
select @var_sql_select2=',NEXT value for seq_consecutive as Consecutivo,CAST(F1 as varchar),CAST(F2 as varchar),CAST(F3 as varchar),CAST(F4 as varchar),CAST(F5 as varchar),CAST(F6 as varchar),CAST(F7 as varchar),CAST(F8 as varchar),CAST(F9 as varchar),CAST(F10 as varchar),'
select @var_sql_select3='CAST(F11 as varchar),CAST(F12 as varchar),CAST(F13 as varchar),CAST(F14 as varchar),CAST(F15 as varchar),CAST(F16 as varchar),CAST(F17 as varchar),CAST(F18 as varchar),CAST(F19 as varchar),CAST(F20 as varchar),'
select @var_sql_select4='CAST(F21 as varchar),CAST(F22 as varchar),CAST(F23 as varchar),CAST(F24 as varchar),CAST(F25 as varchar),CAST(F26 as varchar),CAST(F27 as varchar),CAST(F28 as varchar),CAST(F29 as varchar),CAST(F30 as varchar),'
select @var_sql_select5='CAST(F31 as varchar),CAST(F32 as varchar),CAST(F33 as varchar),CAST(F34 as varchar),CAST(F35 as varchar),CAST(F36 as varchar),CAST(F37 as varchar),CAST(F38 as varchar),CAST(F39 as varchar),CAST(F30 as varchar),'
select @var_sql_select6='CAST(F41 as varchar),CAST(F42 as varchar),CAST(F43 as varchar),CAST(F44 as varchar),CAST(F45 as varchar),CAST(F46 as varchar),CAST(F47 as varchar),CAST(F48 as varchar),CAST(F49 as varchar) FROM OPENROWSET('
select @var_linked_server='''Microsoft.ACE.OLEDB.12.0'','
select @var_database_server='''Excel 12.0;Database='
select @var_HDR=';HDR=NO'','
select @var_excel_select='''select * from [p_line_wf$]'')'
--Concat command
select @var_full_sql=concat(@var_sql_select1,@var_contract_id,@var_sql_select2,@var_sql_select3,@var_sql_select4,@var_sql_select5,@var_sql_select6,@var_linked_server,@var_database_server,@var_excel_path,@var_HDR,@var_excel_select)
--Return SQL command
RETURN @var_full_sql
END


GO
/****** Object:  UserDefinedFunction [dbo].[fn_create_sql_p_onsite]    Script Date: 4/10/2016 8:46:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
Date 11/17/2015
Version 1.0
Owner Jorge Munoz/Ian Araya
Description:The purpose of this function is to create a query useful to retrieve the content of Indico contract,p_onsite
Input parameters:[Path of excel file--Var_excel_path variable]
				 [Contract_id--var_contract_id]
Output parameters:[full query constructed--var_full_sql variable]				
*/
CREATE FUNCTION [dbo].[fn_create_sql_p_onsite](@var_contract_id int, @var_excel_path varchar(256))
RETURNS NVARCHAR(4000)
WITH EXECUTE AS CALLER
AS
BEGIN

--Variables modules
declare @var_sql_select1 varchar(10)
declare @var_sql_select2 varchar(250)
declare @var_sql_select3 varchar(250)
declare @var_sql_select4 varchar(250)
declare @var_sql_select5 varchar(250)
declare @var_sql_select6 varchar(250)
declare @var_sql_select7 varchar(250)
declare @var_sql_select8 varchar(250)
declare @var_sql_select9 varchar(250)
declare @var_sql_select10 varchar(250)
declare @var_sql_select11 varchar(250)
declare @var_sql_select12 varchar(250)
declare @var_sql_select13 varchar(250)
declare @var_sql_select14 varchar(250)
declare @var_sql_select15 varchar(250)
declare @var_linked_server varchar(30)
declare @var_database_server varchar(30)
declare @var_HDR varchar(10)
declare @var_close_sql varchar(2)
declare @var_full_sql nvarchar(4000)
declare @var_excel_select varchar(100)

--Variables definition
select @var_sql_select1='SELECT '
select @var_sql_select2=',NEXT value for seq_consecutive as Consecutivo,CAST(F1 as varchar),CAST(F2 as varchar),CAST(F3 as varchar),CAST(F4 as varchar),CAST(F5 as varchar),CAST(F6 as varchar),CAST(F7 as varchar),CAST(F8 as varchar),CAST(F9 as varchar),CAST(F10 as varchar),'
select @var_sql_select3='CAST(F11 as varchar),CAST(F12 as varchar),CAST(F13 as varchar),CAST(F14 as varchar),CAST(F15 as varchar),CAST(F16 as varchar),CAST(F17 as varchar),CAST(F18 as varchar),CAST(F19 as varchar),CAST(F20 as varchar),'
select @var_sql_select4='CAST(F21 as varchar),CAST(F22 as varchar),CAST(F23 as varchar),CAST(F24 as varchar),CAST(F25 as varchar),CAST(F26 as varchar),CAST(F27 as varchar),CAST(F28 as varchar),CAST(F29 as varchar),CAST(F30 as varchar),'
select @var_sql_select5='CAST(F31 as varchar),CAST(F32 as varchar),CAST(F33 as varchar),CAST(F34 as varchar),CAST(F35 as varchar),CAST(F36 as varchar),CAST(F37 as varchar),CAST(F38 as varchar),CAST(F39 as varchar),CAST(F40 as varchar),'
select @var_sql_select6='CAST(F41 as varchar),CAST(F42 as varchar),CAST(F43 as varchar),CAST(F44 as varchar),CAST(F45 as varchar),CAST(F46 as varchar),CAST(F47 as varchar),CAST(F48 as varchar),CAST(F49 as varchar),CAST(F50 as varchar),'
select @var_sql_select7='CAST(F51 as varchar),CAST(F52 as varchar),CAST(F53 as varchar),CAST(F54 as varchar),CAST(F55 as varchar),CAST(F56 as varchar),CAST(F57 as varchar),CAST(F58 as varchar),CAST(F59 as varchar),CAST(F60 as varchar),'
select @var_sql_select8='CAST(F61 as varchar),CAST(F62 as varchar),CAST(F63 as varchar),CAST(F64 as varchar),CAST(F65 as varchar),CAST(F66 as varchar),CAST(F67 as varchar),CAST(F68 as varchar),CAST(F69 as varchar),CAST(F70 as varchar),'
select @var_sql_select9='CAST(F71 as varchar),CAST(F72 as varchar),CAST(F73 as varchar),CAST(F74 as varchar),CAST(F75 as varchar),CAST(F76 as varchar),CAST(F77 as varchar),CAST(F78 as varchar),CAST(F79 as varchar),CAST(F80 as varchar),'
select @var_sql_select10='CAST(F81 as varchar),CAST(F82 as varchar),CAST(F83 as varchar),CAST(F84 as varchar),CAST(F85 as varchar),CAST(F86 as varchar),CAST(F87 as varchar),CAST(F88 as varchar),CAST(F89 as varchar),CAST(F90 as varchar),'
select @var_sql_select11='CAST(F91 as varchar),CAST(F92 as varchar),CAST(F93 as varchar),CAST(F94 as varchar),CAST(F95 as varchar),CAST(F96 as varchar),CAST(F97 as varchar),CAST(F98 as varchar),CAST(F99 as varchar),CAST(F100 as varchar),'
select @var_sql_select12='CAST(F101 as varchar),CAST(F102 as varchar),CAST(F103 as varchar),CAST(F104 as varchar),CAST(F105 as varchar),CAST(F106 as varchar),CAST(F107 as varchar),CAST(F108 as varchar),CAST(F109 as varchar),CAST(F110 as varchar),'
select @var_sql_select13='CAST(F111 as varchar),CAST(F112 as varchar),CAST(F113 as varchar),CAST(F114 as varchar),CAST(F115 as varchar),CAST(F116 as varchar),CAST(F117 as varchar),CAST(F118 as varchar),CAST(F119 as varchar),CAST(F120 as varchar),'
select @var_sql_select14='CAST(F121 as varchar),CAST(F122 as varchar),CAST(F123 as varchar),CAST(F124 as varchar),CAST(F125 as varchar),CAST(F126 as varchar),CAST(F127 as varchar),CAST(F128 as varchar),CAST(F129 as varchar),CAST(F130 as varchar),'
select @var_sql_select15='CAST(F131 as varchar),CAST(F132 as varchar),CAST(F133 as varchar),CAST(F134 as varchar),CAST(F135 as varchar),CAST(F136 as varchar),CAST(F137 as varchar),CAST(F138 as varchar),CAST(F139 as varchar),CAST(F140 as varchar) FROM OPENROWSET('
select @var_linked_server='''Microsoft.ACE.OLEDB.12.0'','
select @var_database_server='''Excel 12.0;Database='
select @var_HDR=';HDR=NO'','
select @var_excel_select='''select * from [p_onsite$]'')'
--Concat command
select @var_full_sql=concat(@var_sql_select1,@var_contract_id,@var_sql_select2,@var_sql_select3,@var_sql_select4,@var_sql_select5,@var_sql_select6,@var_sql_select7,@var_sql_select8,@var_sql_select9,@var_sql_select10,@var_sql_select11,@var_sql_select12,@var_sql_select13,@var_sql_select14,@var_sql_select15,@var_linked_server,@var_database_server,@var_excel_path,@var_HDR,@var_excel_select)
--Return SQL command
RETURN @var_full_sql
END


GO
