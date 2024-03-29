USE [master]
GO
/****** Object:  Database [transportmanagement]    Script Date: 08/25/2019 10:57:36 PM ******/
CREATE DATABASE [transportmanagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'transportmanagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.AMANPURI\MSSQL\DATA\transportmanagement.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'transportmanagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.AMANPURI\MSSQL\DATA\transportmanagement_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [transportmanagement] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [transportmanagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [transportmanagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [transportmanagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [transportmanagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [transportmanagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [transportmanagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [transportmanagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [transportmanagement] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [transportmanagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [transportmanagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [transportmanagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [transportmanagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [transportmanagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [transportmanagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [transportmanagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [transportmanagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [transportmanagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [transportmanagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [transportmanagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [transportmanagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [transportmanagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [transportmanagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [transportmanagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [transportmanagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [transportmanagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [transportmanagement] SET  MULTI_USER 
GO
ALTER DATABASE [transportmanagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [transportmanagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [transportmanagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [transportmanagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [transportmanagement]
GO
/****** Object:  StoredProcedure [dbo].[sp_bind_bank]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_bind_bank] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

      Select*from tbl_bank inner join tbl_bank_name on tbl_bank_name.id=tbl_bank.bank_name
END


GO
/****** Object:  StoredProcedure [dbo].[sp_bind_bankname]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_bind_bankname]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   Select*from tbl_bank_name
END


GO
/****** Object:  StoredProcedure [dbo].[sp_bind_compnay_registration]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE	[dbo].[sp_bind_compnay_registration] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

Begin

   Select* from tbl_company_registration
    inner join state on state.id=tbl_company_registration.reg_state
  inner join district on district.id=tbl_company_registration.reg_district
End
END


GO
/****** Object:  StoredProcedure [dbo].[sp_Bind_consignee]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Bind_consignee]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
      
select*from tbl_consignee
-- inner join State on state.id=tbl_consignee.state
--inner join district  on district.id=tbl_consignee.district
--inner join tbl_bank_name on tbl_bank_name.id=tbl_consignee.bank_name
END


GO
/****** Object:  StoredProcedure [dbo].[sp_bind_Consigner]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_bind_Consigner]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    
select*from tbl_consigner inner join State on state.id=tbl_consigner.state
inner join district  on district.id=tbl_consigner.district
inner join tbl_bank_name on tbl_bank_name.id=tbl_consigner.bank_name
END


GO
/****** Object:  StoredProcedure [dbo].[sp_bind_district]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_bind_district]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   Select * from district inner join State on district.state_name=state.id order by district.id desc
END


GO
/****** Object:  StoredProcedure [dbo].[sp_bind_fueling]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_bind_fueling]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   Select* from tbl_fueling_station inner join  tbl_bank_name on tbl_bank_name.id=tbl_fueling_station.bank_name
   inner join state on state.id=tbl_fueling_station.state
   inner join district on district.id=tbl_fueling_station.district
   


END


GO
/****** Object:  StoredProcedure [dbo].[sp_bind_tbl_vehicle]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_bind_tbl_vehicle] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Select*from tbl_vehicle order by id desc
END


GO
/****** Object:  StoredProcedure [dbo].[sp_cash_ledger]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_cash_ledger] 
	(
	@id int=null,
	@cash_ledger nvarchar(50)=null,
	@cr_dr nvarchar(50)=null,
	@opening_balance nvarchar(50)=null,
	@created_date nvarchar(50)=null,
	@Action nvarchar(50)=null
	)
AS
BEGIN
SET NOCOUNT ON;	
	if @Action='insert'
	Begin
	Insert into tbl_cash_ledger values(@cash_ledger,@cr_dr,@opening_balance,@created_date)
	End

	if @Action ='update'

	begin
	update tbl_cash_ledger set cash_ledger=@cash_ledger,cr_dr=@cr_dr,opening_balance=@opening_balance,created_date=@created_date
	where id=@id
	end

	if @Action='select'
	begin
	Select * from tbl_cash_ledger
	end

	if @Action ='delete'
	begin
	delete tbl_cash_ledger where id=@id
	end
END


GO
/****** Object:  StoredProcedure [dbo].[sp_Consignee_Name]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Consignee_Name]



AS

BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from

	-- interfering with SELECT statements.

	SET NOCOUNT ON;

select consignee_name   from tbl_consignee

END


GO
/****** Object:  StoredProcedure [dbo].[sp_Consigner_Name]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Consigner_Name]



AS

BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from

	-- interfering with SELECT statements.

	SET NOCOUNT ON;

select consigner_name   from tbl_consigner

END


GO
/****** Object:  StoredProcedure [dbo].[sp_Expense]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Expense]  
	(
	@id int=null,
	@expense_name nvarchar(50)=null,
	@cr_dr nvarchar(50)=null,
	@opening_balance nvarchar(50)=null,
	@created_date nvarchar(50)=null,
	@Action nvarchar(50)=null
	)
AS
BEGIN
SET NOCOUNT ON;
	if @Action='insert'
	Begin
	Insert into tbl_expense values(@expense_name,@cr_dr,@opening_balance,@created_date)
	End

	if @Action ='update'

	begin
	update tbl_expense set expense_name=@expense_name,cr_dr=@cr_dr,opening_balance=@opening_balance,created_date=@created_date
	where id=@id
	end

	if @Action='bind'
	begin
	Select * from tbl_expense
	end
END


GO
/****** Object:  StoredProcedure [dbo].[sp_id_proof]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_id_proof]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Select*from Id_Proof
END


GO
/****** Object:  StoredProcedure [dbo].[sp_insert_bank]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_insert_bank]
(

@bank_name			nvarchar(50)	,
@address			nvarchar(MAX)	,
@pin_no				nvarchar(50)	,
@state				nvarchar(50)	,
@district			nvarchar(50)	,
@ifsc_code			nvarchar(50)	,
@account_no			nchar(10)	,
@cr_dr				nvarchar(50)	,
@opening_balance	decimal(18, 2)	,
@created_date		datetime	
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Insert into tbl_bank values(@bank_name,@address,@pin_no,@state,	@district,@ifsc_code,@account_no,@cr_dr,@opening_balance,	@created_date	)
								
								End


GO
/****** Object:  StoredProcedure [dbo].[sp_insert_company_registration]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_insert_company_registration] 
	(
	--@id int,
@office_type nvarchar(50),
@company_name nvarchar(50),
@email_id nvarchar(50),
@gst_no nvarchar(50),
@pan_no nvarchar(50),
@gr_no nvarchar(50),
@contact_person nvarchar(50),
@contact_no nvarchar(50),
@owner_name nvarchar(50),
@owner_no nvarchar(50),
@address nvarchar(max),
@pin_no nvarchar(50),
@state nvarchar(50),
@district nvarchar(50),
@created_date datetime
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

Begin
--if exists( Select * from tbl_company_registration where office_type=@office_type and company_name=@company_name and gst_no=@gst_no)
-- update tbl_company_registration set office_type=@office_type,company_name=@company_name,email_id=@email_id,gst_no=@gst_no,pan_no=@pan_no,
-- gr_no=@gr_no,@contact_person=@contact_person,contact_no=@contact_no,owner_name=@owner_name,owner_no=@owner_no,address=@address,pin_no=@pin_no,
-- state=@state,district=@district,created_date=@created_date where id=@id
-- else
 insert into tbl_company_registration values(@office_type,@company_name,@email_id,@gst_no,@pan_no,@gr_no,@contact_person,@contact_no,
 @owner_name,@owner_no,@address,@pin_no,@state,@district,@created_date)
End
END


GO
/****** Object:  StoredProcedure [dbo].[sp_insert_consignee]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_insert_consignee]
	(
	@consignee_name nvarchar(50),
	@email_id nvarchar(50),
	@gst_no nvarchar(50),
	@pan_no nvarchar(50),
	@address nvarchar(max),
	@pin_no nvarchar(50),
	@state nvarchar(50),
	@district nvarchar(50),
	@contact_person nvarchar(50),
	@contact_no nvarchar(50),
	@owner_name nvarchar(50),
	@owner_contact_no nvarchar(50),
	@id_proof nvarchar(50),
	@id_no nvarchar(50),
	@bank_name nvarchar(50),
	@ifsc_code nvarchar(50),
	@account_no nvarchar(50),
	@cr_dr nvarchar(50),
	@opening_balance decimal(18, 2),
	@created_date datetime
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Insert into tbl_consignee values(@consignee_name,@email_id,@gst_no,@pan_no,@address,@pin_no,@state,@district,@contact_person,@contact_no,
	@owner_name,@owner_contact_no,@id_proof,@id_no,@bank_name,@ifsc_code,@account_no,@cr_dr,@opening_balance,@created_date)
END


GO
/****** Object:  StoredProcedure [dbo].[sp_insert_Consigner]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_insert_Consigner]
	(
	@consigner_name nvarchar(50),
	@email_id nvarchar(50),
	@gst_no nvarchar(50),
	@pan_no nvarchar(50),
	@address nvarchar(max),
	@pin_no nvarchar(50),
	@state nvarchar(50),
	@district nvarchar(50),
	@contact_person nvarchar(50),
	@contact_no nvarchar(50),
	@owner_name nvarchar(50),
	@owner_contact_no nvarchar(50),
	@id_proof nvarchar(50),
	@id_no nvarchar(50),
	@bank_name nvarchar(50),
	@ifsc_code nvarchar(50),
	@account_no nvarchar(50),
	@cr_dr nvarchar(50),
	@opening_balance decimal(18, 2),
	@created_date datetime
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Insert into tbl_consigner values(@consigner_name,@email_id,@gst_no,@pan_no,@address,@pin_no,@state,@district,@contact_person,@contact_no,
	@owner_name,@owner_contact_no,@id_proof,@id_no,@bank_name,@ifsc_code,@account_no,@cr_dr,@opening_balance,@created_date)
END


GO
/****** Object:  StoredProcedure [dbo].[sp_insert_district]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_insert_district]
	(
	@state_name  nvarchar(50),
	@district  nvarchar(50),
	@district_sortname  nvarchar(50),
	@created_date datetime
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   insert into district (state_name,district,district_sortname,created_date) values(@state_name,@district,@district_sortname,@created_date)
END


GO
/****** Object:  StoredProcedure [dbo].[sp_insert_fueling]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_insert_fueling]
	(
	@fueling_station varchar(50),
	@bank_name varchar(50),
	@address varchar(50),
	@pin_no varchar(50),
	@state varchar(50),
	@district varchar(50),
	@ifsc_code varchar(50),
	@account_no varchar(50),
	@cr_dr varchar(50),
	@opening_balance decimal(18, 2),
	@created_date datetime
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   Insert into tbl_fueling_station values(@fueling_station,@bank_name,@address,@pin_no,@state,@district,@ifsc_code,@account_no,
   @cr_dr,@opening_balance,@created_date)
END


GO
/****** Object:  StoredProcedure [dbo].[sp_insert_vehicle]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_insert_vehicle]
(
@vehicle_ownership	nvarchar(50),	
@vehicle_type	nvarchar(50)	,
@vehicle_number	nvarchar(50)	,
@standard_mileage	nvarchar(50),	
@vehicle_year	nvarchar(50)	,
@fuel_type	nvarchar(50)	,
@vehicle_reg	nvarchar(50),	
@cr_dr	nvarchar(50)	,
@opening_balance	decimal(18, 2)	,
@Insurance_vendor	nvarchar(50)	,
@agent_name	nvarchar(50)	,
@contact_number	nvarchar(50),	
@Insurance_expire	nvarchar(50),	
@R_C_no	nvarchar(50)	,
@created_date	datetime	
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

 Insert into tbl_vehicle (vehicle_ownership,vehicle_type,vehicle_number,standard_mileage,vehicle_year,fuel_type,vehicle_reg,cr_dr,opening_balance,
 Insurance_vendor,agent_name,contact_number,Insurance_expire,R_C_no,created_date)
  values (@vehicle_ownership,@vehicle_type,@vehicle_number, @standard_mileage,@vehicle_year,@fuel_type,@vehicle_reg,@cr_dr,@opening_balance,
  @Insurance_vendor,@agent_name,@contact_number, @Insurance_expire,@R_C_no,@created_date)
END


GO
/****** Object:  StoredProcedure [dbo].[sp_loan_account]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_loan_account] 

	(

	@id int=null,

@account_name			nvarchar(50)=null	,

@address			nvarchar(MAX)	=null,

@pin_no				nvarchar(50)	=null,

@state				nvarchar(50)	=null,

@district			nvarchar(50)	=null,

@ifsc_code			nvarchar(50)	=null,

@account_no			nchar(10)	=null,

@cr_dr				nvarchar(50)	=null,

@opening_balance	decimal(18, 2)	=null,

@created_date		datetime=null	,

@Action nvarchar(50)=null

)

AS

BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from

	-- interfering with SELECT statements.

	SET NOCOUNT ON;

	if @Action='insert'

	Begin

	  Insert into tbl_Loan_Account values(@account_name,@address,@pin_no,@state,@district,@ifsc_code,@account_no,@cr_dr,@opening_balance,@created_date	)

			End



			if @Action='update'

			Begin

					 update tbl_Loan_Account set account_name=@account_name,address=@address,pin_no=@pin_no,state=@state,district=@district,	

						ifsc_code=@ifsc_code,account_no=@account_no,cr_dr=@cr_dr,opening_balance=@opening_balance,created_date=@created_date	

						where id=@id

			End



			if @Action='select'

			Begin

			Select * from tbl_Loan_Account   inner join state on state.id=tbl_Loan_Account.state

  inner join district on district.id=tbl_Loan_Account.district

			End

			
			if @Action='edit'

			Begin

			Select * from tbl_Loan_Account where tbl_Loan_Account.id=@id

  --	Select * from tbl_Loan_Account   inner join state on state.id=tbl_Loan_Account.state

  --inner join district on district.id=tbl_Loan_Account.district where tbl_Loan_Account.id=@id
			End


			



END

GO
/****** Object:  StoredProcedure [dbo].[sp_location]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_location]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

select*from tbl_location
END


GO
/****** Object:  StoredProcedure [dbo].[sp_login]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_login]
	(
	@username nvarchar(50),
	@password nvarchar(50)
	
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Select * from login where username=@username and password=@password
END


GO
/****** Object:  StoredProcedure [dbo].[sp_NewTripSheet]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_NewTripSheet]

	(

	@id int=null,

	@trip_sheet_number nvarchar(50),

	@trip_sheet_date datetime,

	@vehicle_ownership nvarchar(50),

	@truck_number nvarchar(50),

	@driver_name nvarchar(50),

	@contact_number nvarchar(50),

	@conigner_name nvarchar(50),

	@from_location nvarchar(50),

	@No_of_count nvarchar(50),

	@freight decimal(18, 2),

	@extra_point decimal(18, 2),

	@labour decimal(18, 2),

	@commision decimal(18, 2),

	@total_freight decimal(18, 2),

	@fueling_station nvarchar(50),

	@voucher_number nvarchar(50),

	@fuel_amount decimal(18, 2),

	@fuel_quantity nvarchar(50),

	@cash_ledger nvarchar(50),

	@cash_ledger_amount nvarchar(50),

	@bank_ledger nvarchar(50),

	@transaction_date nvarchar(50),

	@transaction_number nvarchar(50),

	@payment_type nvarchar(50),

	@payment_amount nvarchar(50),

	@created_date nvarchar(50),

	@Action nvarchar(50)=null

	)

AS

BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from

	-- interfering with SELECT statements.

	SET NOCOUNT ON;

	if @Action='insert'



	Begin

	Insert into tbl_NewTripSheet values(@trip_sheet_number,@trip_sheet_date,@vehicle_ownership,@truck_number,@driver_name,@contact_number,@conigner_name,

	@from_location,@No_of_count,@freight,@extra_point,@labour,@commision,@total_freight,@fueling_station,@voucher_number,@fuel_amount,

	@fuel_quantity,@cash_ledger,@cash_ledger_amount,@bank_ledger,@transaction_date,@transaction_number,@payment_type,@payment_amount,@created_date)

	End



	if @Action='update'

	Begin

	update tbl_NewTripSheet set trip_sheet_number=@trip_sheet_number,trip_sheet_date=@trip_sheet_date,vehicle_ownership=@vehicle_ownership,truck_number=@truck_number,

	driver_name=@driver_name,contact_number=@contact_number,conigner_name=@conigner_name,from_location=@from_location,No_of_count=@No_of_count,

	freight=@freight,extra_point=@extra_point,labour=@labour,commision=@commision,total_freight=@total_freight,fueling_station=@fueling_station,

	voucher_number=@voucher_number,fuel_amount=@fuel_amount,

	fuel_quantity=@fuel_quantity,cash_ledger=@cash_ledger,cash_ledger_amount=@cash_ledger_amount,bank_ledger=@bank_ledger,

	transaction_date=@transaction_date,transaction_number=@transaction_number,payment_type=@payment_type,payment_amount=@payment_amount,

	created_date=@created_date where id =@id

	End



	if @Action='select'

	Begin

	Select * from tbl_NewTripSheet

	End

	if @Action='search'

	Begin

	Select * from tbl_NewTripSheet where trip_sheet_number=@trip_sheet_number

	End




END



GO
/****** Object:  StoredProcedure [dbo].[sp_update_bank]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_update_bank]
(
@id int,
@bank_name			nvarchar(50)	,
@address			nvarchar(MAX)	,
@pin_no				nvarchar(50)	,
@state				nvarchar(50)	,
@district			nvarchar(50)	,
@ifsc_code			nvarchar(50)	,
@account_no			nchar(10)	,
@cr_dr				nvarchar(50)	,
@opening_balance	decimal(18, 2)	,
@created_date		datetime	
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    update tbl_bank set bank_name		=		@bank_name			,
						address			=		@address,					
						pin_no			=		@pin_no		,		
						state			=		@state			,	
						district		=		@district		,	
						ifsc_code		=		@ifsc_code		,	
						account_no		=		@account_no		,	
						cr_dr			=		@cr_dr			,	
						opening_balance	=		@opening_balance,	
						created_date	=		@created_date	
						where id=@id

								End


GO
/****** Object:  StoredProcedure [dbo].[sp_update_company_registration]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_update_company_registration] 
	(
	@id int,
@office_type nvarchar(50),
@company_name nvarchar(50),
@email_id nvarchar(50),
@gst_no nvarchar(50),
@pan_no nvarchar(50),
@gr_no nvarchar(50),
@contact_person nvarchar(50),
@contact_no nvarchar(50),
@owner_name nvarchar(50),
@owner_no nvarchar(50),
@address nvarchar(max),
@pin_no nvarchar(50),
@reg_state nvarchar(50),
@reg_district nvarchar(50),
@created_date datetime
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

update tbl_company_registration set office_type=@office_type,company_name=@company_name,email_id=@email_id,gst_no=@gst_no,pan_no=@pan_no,
gr_no=@gr_no,@contact_person=@contact_person,contact_no=@contact_no,owner_name=@owner_name,owner_no=@owner_no,address=@address,pin_no=@pin_no,
reg_state=@reg_state,reg_district=@reg_district,created_date=@created_date where id=@id
End



GO
/****** Object:  StoredProcedure [dbo].[sp_update_consignee]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[sp_update_consignee]
	(@id int,
	@consignee_name nvarchar(50),
	@email_id nvarchar(50),
	@gst_no nvarchar(50),
	@pan_no nvarchar(50),
	@address nvarchar(max),
	@pin_no nvarchar(50),
	@state nvarchar(50),
	@district nvarchar(50),
	@contact_person nvarchar(50),
	@contact_no nvarchar(50),
	@owner_name nvarchar(50),
	@owner_contact_no nvarchar(50),
	@id_proof nvarchar(50),
	@id_no nvarchar(50),
	@bank_name nvarchar(50),
	@ifsc_code nvarchar(50),
	@account_no nvarchar(50),
	@cr_dr nvarchar(50),
	@opening_balance decimal(18, 2),
	@created_date datetime
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  update tbl_consignee set @consignee_name=@consignee_name,email_id=@email_id,gst_no=@gst_no,pan_no=@pan_no,address=@address,pin_no=@pin_no,
	state=@state,district=@district,contact_person=@contact_person,contact_no=@contact_no,
	owner_name=@owner_name,owner_contact_no=@owner_contact_no,id_proof=@id_proof,id_no=@id_no,bank_name=@bank_name,ifsc_code=@ifsc_code,
	account_no=@account_no,cr_dr=@cr_dr,opening_balance=@opening_balance,created_date=@created_date where id=@id
END


GO
/****** Object:  StoredProcedure [dbo].[sp_update_Consigner]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_update_Consigner]
	(@id int,
	@consigner_name nvarchar(50),
	@email_id nvarchar(50),
	@gst_no nvarchar(50),
	@pan_no nvarchar(50),
	@address nvarchar(max),
	@pin_no nvarchar(50),
	@state nvarchar(50),
	@district nvarchar(50),
	@contact_person nvarchar(50),
	@contact_no nvarchar(50),
	@owner_name nvarchar(50),
	@owner_contact_no nvarchar(50),
	@id_proof nvarchar(50),
	@id_no nvarchar(50),
	@bank_name nvarchar(50),
	@ifsc_code nvarchar(50),
	@account_no nvarchar(50),
	@cr_dr nvarchar(50),
	@opening_balance decimal(18, 2),
	@created_date datetime
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    update tbl_consigner set consigner_name=@consigner_name,email_id=@email_id,gst_no=@gst_no,pan_no=@pan_no,address=@address,pin_no=@pin_no,
	state=@state,district=@district,contact_person=@contact_person,contact_no=@contact_no,
	owner_name=@owner_name,owner_contact_no=@owner_contact_no,id_proof=@id_proof,id_no=@id_no,bank_name=@bank_name,ifsc_code=@ifsc_code,
	account_no=@account_no,cr_dr=@cr_dr,opening_balance=@opening_balance,created_date=@created_date where id=@id
END


GO
/****** Object:  StoredProcedure [dbo].[sp_update_district]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_update_district]
	(
	@id int,
	@state_name  nvarchar(50),
	@district  nvarchar(50),
	@district_sortname  nvarchar(50),
	@created_date datetime
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   update district set state_name=@state_name,district=@district,district_sortname=@district_sortname,created_date=@created_date where id=@id
END


GO
/****** Object:  StoredProcedure [dbo].[sp_update_fueling]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_update_fueling]
	(
	@id int,
	@fueling_station varchar(50),
	@bank_name varchar(50),
	@address varchar(50),
	@pin_no varchar(50),
	@state varchar(50),
	@district varchar(50),
	@ifsc_code varchar(50),
	@account_no varchar(50),
	@cr_dr varchar(50),
	@opening_balance decimal(18, 2),
	@created_date datetime
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   update tbl_fueling_station set fueling_station=@fueling_station,bank_name=@bank_name,address=@address,pin_no=@pin_no,state=@state,
   district=@district,ifsc_code=@ifsc_code,account_no=@account_no,cr_dr=@cr_dr,opening_balance=@opening_balance,created_date=@created_date
   where id=@id
END


GO
/****** Object:  StoredProcedure [dbo].[sp_update_vehicle]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_update_vehicle]
(
@id int,
@vehicle_ownership	nvarchar(50),	
@vehicle_type	nvarchar(50)	,
@vehicle_number	nvarchar(50)	,
@standard_mileage	nvarchar(50),	
@vehicle_year	nvarchar(50)	,
@fuel_type	nvarchar(50)	,
@vehicle_reg	nvarchar(50),	
@cr_dr	nvarchar(50)	,
@opening_balance	decimal(18, 2)	,
@Insurance_vendor	nvarchar(50)	,
@agent_name	nvarchar(50)	,
@contact_number	nvarchar(50),	
@Insurance_expire	nvarchar(50),	
@R_C_no	nvarchar(50)	,
@created_date	datetime	
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

 update tbl_vehicle set vehicle_ownership=@vehicle_ownership,vehicle_type=@vehicle_type,vehicle_number=@vehicle_number,standard_mileage=@standard_mileage,
 vehicle_year=@vehicle_year,fuel_type=@fuel_type,vehicle_reg=@vehicle_reg,cr_dr=@cr_dr,opening_balance=@opening_balance,
 Insurance_vendor=@Insurance_vendor,agent_name=@agent_name,contact_number=@contact_number,Insurance_expire=@Insurance_expire,R_C_no=@R_C_no,
 created_date=@created_date where id=@id
END


GO
/****** Object:  StoredProcedure [dbo].[sp_vehicle_number]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_vehicle_number]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
select vehicle_number from tbl_vehicle
END


GO
/****** Object:  StoredProcedure [dbo].[sp_vehicle_type]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_vehicle_type]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
select vehicle_type  from tbl_vehicle
END


GO
/****** Object:  Table [dbo].[district]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[district](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[state_name] [nvarchar](50) NULL,
	[district] [nvarchar](50) NULL,
	[district_sortname] [nvarchar](50) NULL,
	[created_date] [datetime] NULL,
 CONSTRAINT [PK_add_district] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Id_Proof]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Id_Proof](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[IdProof] [nvarchar](50) NULL,
 CONSTRAINT [PK_Id_Proof] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[login]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[id] [int] NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[State]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[state] [nvarchar](50) NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_bank]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bank](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bank_name] [nvarchar](50) NULL,
	[address] [nvarchar](max) NULL,
	[pin_no] [nvarchar](50) NULL,
	[state] [nvarchar](50) NULL,
	[district] [nvarchar](50) NULL,
	[ifsc_code] [nvarchar](50) NULL,
	[account_no] [nchar](10) NULL,
	[cr_dr] [nvarchar](50) NULL,
	[opening_balance] [decimal](18, 2) NULL,
	[created_date] [datetime] NULL,
 CONSTRAINT [PK_tbl_bank] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_bank_name]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bank_name](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bank_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_bank_name] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_cash_ledger]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cash_ledger](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cash_ledger] [nvarchar](50) NULL,
	[cr_dr] [nvarchar](50) NULL,
	[opening_balance] [decimal](18, 2) NULL,
	[created_date] [datetime] NULL,
 CONSTRAINT [PK_tbl_cash_ledger] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_company_registration]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_company_registration](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[office_type] [nvarchar](50) NULL,
	[company_name] [nvarchar](50) NULL,
	[email_id] [nvarchar](50) NULL,
	[gst_no] [nvarchar](50) NULL,
	[pan_no] [nvarchar](50) NULL,
	[gr_no] [nvarchar](50) NULL,
	[contact_person] [nvarchar](50) NULL,
	[contact_no] [nvarchar](50) NULL,
	[owner_name] [nvarchar](50) NULL,
	[owner_no] [nvarchar](50) NULL,
	[address] [nvarchar](max) NULL,
	[pin_no] [nvarchar](50) NULL,
	[reg_state] [nvarchar](50) NULL,
	[reg_district] [nvarchar](50) NULL,
	[created_date] [datetime] NULL,
 CONSTRAINT [PK_tbl_company_registration] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_consignee]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_consignee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[consignee_name] [nvarchar](50) NULL,
	[email_id] [nvarchar](50) NULL,
	[gst_no] [nvarchar](50) NULL,
	[pan_no] [nvarchar](50) NULL,
	[address] [nvarchar](max) NULL,
	[pin_no] [nvarchar](50) NULL,
	[state] [nvarchar](50) NULL,
	[district] [nvarchar](50) NULL,
	[contact_person] [nvarchar](50) NULL,
	[contact_no] [nvarchar](50) NULL,
	[owner_name] [nvarchar](50) NULL,
	[owner_contact_no] [nvarchar](50) NULL,
	[id_proof] [nvarchar](50) NULL,
	[id_no] [nvarchar](50) NULL,
	[bank_name] [nvarchar](50) NULL,
	[ifsc_code] [nvarchar](50) NULL,
	[account_no] [nchar](10) NULL,
	[cr_dr] [nvarchar](50) NULL,
	[opening_balance] [decimal](18, 2) NULL,
	[created_date] [datetime] NULL,
 CONSTRAINT [PK_tbl_consignee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_consigner]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_consigner](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[consigner_name] [nvarchar](50) NULL,
	[email_id] [nvarchar](50) NULL,
	[gst_no] [nvarchar](50) NULL,
	[pan_no] [nvarchar](50) NULL,
	[address] [nvarchar](max) NULL,
	[pin_no] [nvarchar](50) NULL,
	[state] [nvarchar](50) NULL,
	[district] [nvarchar](50) NULL,
	[contact_person] [nvarchar](50) NULL,
	[contact_no] [nvarchar](50) NULL,
	[owner_name] [nvarchar](50) NULL,
	[owner_contact_no] [nvarchar](50) NULL,
	[id_proof] [nvarchar](50) NULL,
	[id_no] [nvarchar](50) NULL,
	[bank_name] [nvarchar](50) NULL,
	[ifsc_code] [nvarchar](50) NULL,
	[account_no] [nchar](10) NULL,
	[cr_dr] [nvarchar](50) NULL,
	[opening_balance] [decimal](18, 2) NULL,
	[created_date] [datetime] NULL,
 CONSTRAINT [PK_tbl_consigner] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_expense]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_expense](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[expense_name] [nvarchar](50) NULL,
	[cr_dr] [nvarchar](50) NULL,
	[opening_balance] [decimal](18, 2) NULL,
	[created_date] [datetime] NULL,
 CONSTRAINT [PK_tbl_expense] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_fueling_station]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_fueling_station](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fueling_station] [nvarchar](50) NULL,
	[bank_name] [nvarchar](50) NULL,
	[address] [nvarchar](max) NULL,
	[pin_no] [nvarchar](50) NULL,
	[state] [nvarchar](50) NULL,
	[district] [nvarchar](50) NULL,
	[ifsc_code] [nvarchar](50) NULL,
	[account_no] [nchar](10) NULL,
	[cr_dr] [nvarchar](50) NULL,
	[opening_balance] [decimal](18, 2) NULL,
	[created_date] [datetime] NULL,
 CONSTRAINT [PK_tbl_fueling_station] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_insurance_vendor]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_insurance_vendor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[insurance_vendor] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_insurance_vendor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Loan_Account]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Loan_Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_name] [nvarchar](50) NULL,
	[address] [nvarchar](max) NULL,
	[pin_no] [nvarchar](50) NULL,
	[state] [nvarchar](50) NULL,
	[district] [nvarchar](50) NOT NULL,
	[ifsc_code] [nvarchar](50) NULL,
	[account_no] [nchar](10) NULL,
	[cr_dr] [nvarchar](50) NULL,
	[opening_balance] [decimal](18, 2) NULL,
	[created_date] [datetime] NULL,
 CONSTRAINT [PK_tbl_Loan_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_location]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_location](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[location] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_location] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_NewTripSheet]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_NewTripSheet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[trip_sheet_number] [nvarchar](50) NULL,
	[trip_sheet_date] [datetime] NULL,
	[vehicle_ownership] [nvarchar](50) NULL,
	[truck_number] [nvarchar](50) NULL,
	[driver_name] [nvarchar](50) NULL,
	[contact_number] [nvarchar](50) NULL,
	[conigner_name] [nvarchar](50) NULL,
	[from_location] [nvarchar](50) NULL,
	[No_of_count] [nvarchar](50) NULL,
	[freight] [decimal](18, 2) NULL,
	[extra_point] [decimal](18, 2) NULL,
	[labour] [decimal](18, 2) NULL,
	[commision] [decimal](18, 2) NULL,
	[total_freight] [decimal](18, 2) NULL,
	[fueling_station] [nvarchar](50) NULL,
	[voucher_number] [nvarchar](50) NULL,
	[fuel_amount] [decimal](18, 2) NULL,
	[fuel_quantity] [nvarchar](50) NULL,
	[cash_ledger] [nvarchar](50) NULL,
	[cash_ledger_amount] [nvarchar](50) NULL,
	[bank_ledger] [nvarchar](50) NULL,
	[transaction_date] [nvarchar](50) NULL,
	[transaction_number] [nvarchar](50) NULL,
	[payment_type] [nvarchar](50) NULL,
	[payment_amount] [nvarchar](50) NULL,
	[created_date] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_NewTripSheet] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_vehicle]    Script Date: 08/25/2019 10:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_vehicle](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vehicle_ownership] [nvarchar](50) NULL,
	[vehicle_type] [nvarchar](50) NULL,
	[vehicle_number] [nvarchar](50) NULL,
	[standard_mileage] [nvarchar](50) NULL,
	[vehicle_year] [nvarchar](50) NULL,
	[fuel_type] [nvarchar](50) NULL,
	[vehicle_reg] [nvarchar](50) NULL,
	[cr_dr] [nvarchar](50) NULL,
	[opening_balance] [decimal](18, 2) NULL,
	[Insurance_vendor] [nvarchar](50) NULL,
	[agent_name] [nvarchar](50) NULL,
	[contact_number] [nvarchar](50) NULL,
	[Insurance_expire] [nvarchar](50) NULL,
	[R_C_no] [nvarchar](50) NULL,
	[created_date] [datetime] NULL,
 CONSTRAINT [PK_tbl_vehicle] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[district] ON 

INSERT [dbo].[district] ([id], [state_name], [district], [district_sortname], [created_date]) VALUES (1, N'1', N'Anantapur', N'Anantapur', CAST(0x0000AAAE010420F8 AS DateTime))
INSERT [dbo].[district] ([id], [state_name], [district], [district_sortname], [created_date]) VALUES (2, N'4', N'Betiya', N'Betiya', CAST(0x0000AAAE01045938 AS DateTime))
INSERT [dbo].[district] ([id], [state_name], [district], [district_sortname], [created_date]) VALUES (3, N'4', N'Hazipur', N'Hazi', CAST(0x0000AAAE0105CF0C AS DateTime))
INSERT [dbo].[district] ([id], [state_name], [district], [district_sortname], [created_date]) VALUES (4, N'9', N'Shimla', N'Shimla', CAST(0x0000AAB400D17C84 AS DateTime))
INSERT [dbo].[district] ([id], [state_name], [district], [district_sortname], [created_date]) VALUES (5, N'9', N'him', N'him', CAST(0x0000AAB400D1A588 AS DateTime))
SET IDENTITY_INSERT [dbo].[district] OFF
SET IDENTITY_INSERT [dbo].[Id_Proof] ON 

INSERT [dbo].[Id_Proof] ([id], [IdProof]) VALUES (1, N'Aadhar Card')
INSERT [dbo].[Id_Proof] ([id], [IdProof]) VALUES (2, N'Driving License')
INSERT [dbo].[Id_Proof] ([id], [IdProof]) VALUES (3, N'PAN Card')
INSERT [dbo].[Id_Proof] ([id], [IdProof]) VALUES (4, N'Passbook')
INSERT [dbo].[Id_Proof] ([id], [IdProof]) VALUES (5, N'Passport')
INSERT [dbo].[Id_Proof] ([id], [IdProof]) VALUES (6, N'Rashan Card')
INSERT [dbo].[Id_Proof] ([id], [IdProof]) VALUES (7, N'Voter Id Card')
SET IDENTITY_INSERT [dbo].[Id_Proof] OFF
INSERT [dbo].[login] ([id], [username], [password]) VALUES (1, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([id], [state]) VALUES (1, N'	Andhra Pradesh')
INSERT [dbo].[State] ([id], [state]) VALUES (2, N'	Arunachal Pradesh')
INSERT [dbo].[State] ([id], [state]) VALUES (3, N'	Assam')
INSERT [dbo].[State] ([id], [state]) VALUES (4, N'	Bihar')
INSERT [dbo].[State] ([id], [state]) VALUES (5, N'	Chhattisgarh')
INSERT [dbo].[State] ([id], [state]) VALUES (6, N'Goa')
INSERT [dbo].[State] ([id], [state]) VALUES (7, N'Gujarat	')
INSERT [dbo].[State] ([id], [state]) VALUES (8, N'Haryana')
INSERT [dbo].[State] ([id], [state]) VALUES (9, N'	Himachal Pradesh')
INSERT [dbo].[State] ([id], [state]) VALUES (10, N'	Jammu and Kashmir')
INSERT [dbo].[State] ([id], [state]) VALUES (11, N'Jharkhand')
INSERT [dbo].[State] ([id], [state]) VALUES (12, N'	Karnataka')
INSERT [dbo].[State] ([id], [state]) VALUES (13, N'	Kerala')
INSERT [dbo].[State] ([id], [state]) VALUES (14, N'Madhya Pradesh')
INSERT [dbo].[State] ([id], [state]) VALUES (15, N'	Maharashtra')
INSERT [dbo].[State] ([id], [state]) VALUES (16, N'Manipur')
INSERT [dbo].[State] ([id], [state]) VALUES (17, N'	Meghalaya')
INSERT [dbo].[State] ([id], [state]) VALUES (18, N'	Mizoram')
INSERT [dbo].[State] ([id], [state]) VALUES (19, N'Nagaland')
INSERT [dbo].[State] ([id], [state]) VALUES (20, N'Odisha')
INSERT [dbo].[State] ([id], [state]) VALUES (21, N'	Punjab')
INSERT [dbo].[State] ([id], [state]) VALUES (22, N'	Rajasthan')
INSERT [dbo].[State] ([id], [state]) VALUES (23, N'	Sikkim')
INSERT [dbo].[State] ([id], [state]) VALUES (24, N'	Tamil Nadu')
INSERT [dbo].[State] ([id], [state]) VALUES (25, N'	Telangana')
INSERT [dbo].[State] ([id], [state]) VALUES (26, N'	Tripura')
INSERT [dbo].[State] ([id], [state]) VALUES (27, N'	Uttar Pradesh')
INSERT [dbo].[State] ([id], [state]) VALUES (28, N'Uttarakhand')
INSERT [dbo].[State] ([id], [state]) VALUES (29, N'	West Bengal')
SET IDENTITY_INSERT [dbo].[State] OFF
SET IDENTITY_INSERT [dbo].[tbl_bank] ON 

INSERT [dbo].[tbl_bank] ([id], [bank_name], [address], [pin_no], [state], [district], [ifsc_code], [account_no], [cr_dr], [opening_balance], [created_date]) VALUES (1, N'1', N'New Delhi', N'pinn32424', N'4', N'2', N'jhvhjc865t8769j', N'23124414  ', N'DR', CAST(89000.00 AS Decimal(18, 2)), CAST(0x0000AAB000F890D0 AS DateTime))
INSERT [dbo].[tbl_bank] ([id], [bank_name], [address], [pin_no], [state], [district], [ifsc_code], [account_no], [cr_dr], [opening_balance], [created_date]) VALUES (2, N'1', N'Noida', N'kjsdfguo', N'1', N'1', N'hjasgu869', N'8767866392', N'DR', CAST(10000.00 AS Decimal(18, 2)), CAST(0x0000AAB000D4D1A4 AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_bank] OFF
SET IDENTITY_INSERT [dbo].[tbl_bank_name] ON 

INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (1, N'State Bank Of India')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (2, N'Punjab National Bank')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (3, N'Bank Of Baroda')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (4, N'Union Bank Of India')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (5, N'Allahabad Bank')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (6, N'ICICI Bank')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (7, N'HDFC Bank')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (8, N'Bank of Maharashtra')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (9, N'CENTRAL BANK OF INDIA')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (10, N'Purvanchal Bank')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (11, N'Indian Overseas Bank')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (12, N'Indian Bank')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (13, N'AXIS BANK')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (14, N'Bank Of India')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (15, N'Baroda uttar Pradesh Gramin bank')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (16, N'Allahabad UP Gramin Bank')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (17, N'Andhra Bank')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (18, N'Punjab & Sindh Bank')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (19, N'UCO Bank')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (20, N'Canara Bank')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (21, N'Corporation Bank')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (22, N'Oriental Bank Of Commerce')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (23, N'Dena Bank')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (24, N'IDBI Bank')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (25, N'Shivalik Mercantile Co-operative Bank Ltd.')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (26, N'Syndicate Bank')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (27, N'The Nanital bank Ltd')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (28, N'United Bank of India')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (29, N'Urban Co-Opeative')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (30, N'Vijaya Bank')
INSERT [dbo].[tbl_bank_name] ([id], [bank_name]) VALUES (31, N'Karur Vysya Bank')
SET IDENTITY_INSERT [dbo].[tbl_bank_name] OFF
SET IDENTITY_INSERT [dbo].[tbl_cash_ledger] ON 

INSERT [dbo].[tbl_cash_ledger] ([id], [cash_ledger], [cr_dr], [opening_balance], [created_date]) VALUES (7, N'Trasport Cash13', N'CR', CAST(10000.00 AS Decimal(18, 2)), CAST(0x0000AAB1010A2020 AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_cash_ledger] OFF
SET IDENTITY_INSERT [dbo].[tbl_company_registration] ON 

INSERT [dbo].[tbl_company_registration] ([id], [office_type], [company_name], [email_id], [gst_no], [pan_no], [gr_no], [contact_person], [contact_no], [owner_name], [owner_no], [address], [pin_no], [reg_state], [reg_district], [created_date]) VALUES (1, N'Transport', N'MArketing', N'rohan@gmail.com', N'sdysd986f9s', N'kjsbszf8as708', N'cv86s9df', N'', N'98981229898', N'shyam', N'9898765645', N'delhi
delhi', N'8968968tg79t976', N'9', N'4', CAST(0x0000AAB401578054 AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_company_registration] OFF
SET IDENTITY_INSERT [dbo].[tbl_consignee] ON 

INSERT [dbo].[tbl_consignee] ([id], [consignee_name], [email_id], [gst_no], [pan_no], [address], [pin_no], [state], [district], [contact_person], [contact_no], [owner_name], [owner_contact_no], [id_proof], [id_no], [bank_name], [ifsc_code], [account_no], [cr_dr], [opening_balance], [created_date]) VALUES (1, N'shyam', N'rohan@gmail.com', N'hjgf7689769', N'nmvhjgiut97869', N'delhi', N'kjb6986g', N'4', N'3', N'rohan', N'987896869', N'jjkgkaj', N'', N'4', N'9879879798789', N'1', N'jhvhjc865t8769j', N'96969869  ', N'DR', CAST(10000.00 AS Decimal(18, 2)), CAST(0x0000AAB40179001C AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_consignee] OFF
SET IDENTITY_INSERT [dbo].[tbl_consigner] ON 

INSERT [dbo].[tbl_consigner] ([id], [consigner_name], [email_id], [gst_no], [pan_no], [address], [pin_no], [state], [district], [contact_person], [contact_no], [owner_name], [owner_contact_no], [id_proof], [id_no], [bank_name], [ifsc_code], [account_no], [cr_dr], [opening_balance], [created_date]) VALUES (1, N'rohan', N'rohan@gmail.com', N'hjgf7689769', N'nmvhjgiut97869', N'delhi', N'kjb6986g', N'1', N'1', N'rohan', N'987896869', N'jjkgkaj', N'8798767000', N'1', N'9879879798789', N'1', N'jhvhjc865t8769j', N'23124414  ', N'DR', CAST(9080.00 AS Decimal(18, 2)), CAST(0x0000AAAF01160E08 AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_consigner] OFF
SET IDENTITY_INSERT [dbo].[tbl_expense] ON 

INSERT [dbo].[tbl_expense] ([id], [expense_name], [cr_dr], [opening_balance], [created_date]) VALUES (1, N'Office Expense', N'DR', CAST(2300.00 AS Decimal(18, 2)), CAST(0x0000AAB100F794DC AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_expense] OFF
SET IDENTITY_INSERT [dbo].[tbl_fueling_station] ON 

INSERT [dbo].[tbl_fueling_station] ([id], [fueling_station], [bank_name], [address], [pin_no], [state], [district], [ifsc_code], [account_no], [cr_dr], [opening_balance], [created_date]) VALUES (1, N'aman', N'13', N'delhi', N'kjb6986g', N'1', N'1', N'jhvhjc865t8769j', N'23124414  ', N'DR', CAST(10000.00 AS Decimal(18, 2)), CAST(0x0000AAB0011D1734 AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_fueling_station] OFF
SET IDENTITY_INSERT [dbo].[tbl_insurance_vendor] ON 

INSERT [dbo].[tbl_insurance_vendor] ([id], [insurance_vendor]) VALUES (1, N'Future General Insurance co. Ltd.')
INSERT [dbo].[tbl_insurance_vendor] ([id], [insurance_vendor]) VALUES (2, N'National Insurance co. Ltd.')
INSERT [dbo].[tbl_insurance_vendor] ([id], [insurance_vendor]) VALUES (3, N'United India Insurance co. Ltd.')
INSERT [dbo].[tbl_insurance_vendor] ([id], [insurance_vendor]) VALUES (4, N'HDFC ERGO General Insurance Co. Ltd')
INSERT [dbo].[tbl_insurance_vendor] ([id], [insurance_vendor]) VALUES (5, N'IFFCO-TOKIO genral insurance Ltd.')
INSERT [dbo].[tbl_insurance_vendor] ([id], [insurance_vendor]) VALUES (6, N'ICICI LOMBARD')
INSERT [dbo].[tbl_insurance_vendor] ([id], [insurance_vendor]) VALUES (7, N'SBI Car Insurance')
INSERT [dbo].[tbl_insurance_vendor] ([id], [insurance_vendor]) VALUES (8, N'Raheja QBE Car Insurance')
INSERT [dbo].[tbl_insurance_vendor] ([id], [insurance_vendor]) VALUES (9, N'Bharti AXA Car Insurance')
INSERT [dbo].[tbl_insurance_vendor] ([id], [insurance_vendor]) VALUES (10, N'Shriram Car Insurance')
INSERT [dbo].[tbl_insurance_vendor] ([id], [insurance_vendor]) VALUES (11, N'Universal Sompo Car Insurance')
INSERT [dbo].[tbl_insurance_vendor] ([id], [insurance_vendor]) VALUES (12, N'Future General Car Insurance Plan')
SET IDENTITY_INSERT [dbo].[tbl_insurance_vendor] OFF
SET IDENTITY_INSERT [dbo].[tbl_Loan_Account] ON 

INSERT [dbo].[tbl_Loan_Account] ([id], [account_name], [address], [pin_no], [state], [district], [ifsc_code], [account_no], [cr_dr], [opening_balance], [created_date]) VALUES (1, N'hjc', N'delhi', N'', N'4', N'2', N'jhvhjc865t8769j', N'          ', N'DR', CAST(10000.00 AS Decimal(18, 2)), CAST(0x0000AAB1011DF384 AS DateTime))
INSERT [dbo].[tbl_Loan_Account] ([id], [account_name], [address], [pin_no], [state], [district], [ifsc_code], [account_no], [cr_dr], [opening_balance], [created_date]) VALUES (2, NULL, N'delhi', N'', N'1', N'2', N'ifsc', N'9868576456', N'CR', CAST(9080.00 AS Decimal(18, 2)), CAST(0x0000AAB3017E6F20 AS DateTime))
INSERT [dbo].[tbl_Loan_Account] ([id], [account_name], [address], [pin_no], [state], [district], [ifsc_code], [account_no], [cr_dr], [opening_balance], [created_date]) VALUES (3, N'bbbbbbb', N'Noida', N'kjb6986g', N'4', N'3', N'ifsc', N'9868576456', N'CR', CAST(9080.00 AS Decimal(18, 2)), CAST(0x0000AAB10123A7AC AS DateTime))
INSERT [dbo].[tbl_Loan_Account] ([id], [account_name], [address], [pin_no], [state], [district], [ifsc_code], [account_no], [cr_dr], [opening_balance], [created_date]) VALUES (4, NULL, N'himachal', N'213245', N'9', N'4', N'himachal12', N'986986986 ', N'CR', CAST(789.00 AS Decimal(18, 2)), CAST(0x0000AAB4016F5D50 AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_Loan_Account] OFF
SET IDENTITY_INSERT [dbo].[tbl_location] ON 

INSERT [dbo].[tbl_location] ([id], [location]) VALUES (1, N'Ahmedabad')
INSERT [dbo].[tbl_location] ([id], [location]) VALUES (2, N'AJMER')
INSERT [dbo].[tbl_location] ([id], [location]) VALUES (3, N'AKBARPUR')
INSERT [dbo].[tbl_location] ([id], [location]) VALUES (4, N'AKLERA')
INSERT [dbo].[tbl_location] ([id], [location]) VALUES (5, N'Akola')
INSERT [dbo].[tbl_location] ([id], [location]) VALUES (6, N'ALIGARH')
INSERT [dbo].[tbl_location] ([id], [location]) VALUES (7, N'ALLAHABAD')
INSERT [dbo].[tbl_location] ([id], [location]) VALUES (8, N'ALMORA')
INSERT [dbo].[tbl_location] ([id], [location]) VALUES (9, N'Alpphuzha')
INSERT [dbo].[tbl_location] ([id], [location]) VALUES (10, N'ALWAR')
INSERT [dbo].[tbl_location] ([id], [location]) VALUES (11, N'AMBALA')
SET IDENTITY_INSERT [dbo].[tbl_location] OFF
SET IDENTITY_INSERT [dbo].[tbl_NewTripSheet] ON 

INSERT [dbo].[tbl_NewTripSheet] ([id], [trip_sheet_number], [trip_sheet_date], [vehicle_ownership], [truck_number], [driver_name], [contact_number], [conigner_name], [from_location], [No_of_count], [freight], [extra_point], [labour], [commision], [total_freight], [fueling_station], [voucher_number], [fuel_amount], [fuel_quantity], [cash_ledger], [cash_ledger_amount], [bank_ledger], [transaction_date], [transaction_number], [payment_type], [payment_amount], [created_date]) VALUES (1, N'342', CAST(0x0000AAB300000000 AS DateTime), N'Own', N'sdsf8698', N'dgdg', N'536436', N'rohan', N'1', N'34', CAST(22.00 AS Decimal(18, 2)), CAST(45.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(235.00 AS Decimal(18, 2)), CAST(314.00 AS Decimal(18, 2)), N'1', N'sdgs6', CAST(5447.00 AS Decimal(18, 2)), N'475', N'7', N'43', N'1', N'', N'', N'INTERNET BANKING', N'3453', N'08/24/2019 10:41:44 PM')
SET IDENTITY_INSERT [dbo].[tbl_NewTripSheet] OFF
SET IDENTITY_INSERT [dbo].[tbl_vehicle] ON 

INSERT [dbo].[tbl_vehicle] ([id], [vehicle_ownership], [vehicle_type], [vehicle_number], [standard_mileage], [vehicle_year], [fuel_type], [vehicle_reg], [cr_dr], [opening_balance], [Insurance_vendor], [agent_name], [contact_number], [Insurance_expire], [R_C_no], [created_date]) VALUES (1, N'Own', N'Ace', N'dsfs', N'sfdaf', N'2019', N'Petrol', N'sfaf', N'DR', CAST(9080.00 AS Decimal(18, 2)), N'Bharti AXA Car Insurance', N'uiiugti', N'90898080980', N'', N'iuyi', CAST(0x0000AAB200F5F154 AS DateTime))
INSERT [dbo].[tbl_vehicle] ([id], [vehicle_ownership], [vehicle_type], [vehicle_number], [standard_mileage], [vehicle_year], [fuel_type], [vehicle_reg], [cr_dr], [opening_balance], [Insurance_vendor], [agent_name], [contact_number], [Insurance_expire], [R_C_no], [created_date]) VALUES (2, N'On Contract', N'Ace', N'jkdsgkjgfv', N'jghkjg', N'2015', N'Petrol', N'kjgkj', N'CR', CAST(89000.00 AS Decimal(18, 2)), N'ICICI LOMBARD', N'uiiugti', N'90898080980', N'8/19/2019', N'hjgkj896896', CAST(0x0000AAB200F5E0EC AS DateTime))
INSERT [dbo].[tbl_vehicle] ([id], [vehicle_ownership], [vehicle_type], [vehicle_number], [standard_mileage], [vehicle_year], [fuel_type], [vehicle_reg], [cr_dr], [opening_balance], [Insurance_vendor], [agent_name], [contact_number], [Insurance_expire], [R_C_no], [created_date]) VALUES (3, N'On Contract', N'Pickup', N'987ghhj', N'', N'', N'CNG & Petrol', N'', N'DR', CAST(10000.00 AS Decimal(18, 2)), N'Future General Insurance co. Ltd.', N'', N'', N'', N'', CAST(0x0000AAB200F5D534 AS DateTime))
INSERT [dbo].[tbl_vehicle] ([id], [vehicle_ownership], [vehicle_type], [vehicle_number], [standard_mileage], [vehicle_year], [fuel_type], [vehicle_reg], [cr_dr], [opening_balance], [Insurance_vendor], [agent_name], [contact_number], [Insurance_expire], [R_C_no], [created_date]) VALUES (4, N'On Contract', N'Ace', N'sdsf8698', N'', N'', N'Diesel', N'', N'DR', CAST(52000.00 AS Decimal(18, 2)), N'Future General Insurance co. Ltd.', N'', N'', N'', N'', CAST(0x0000AAB200F5C724 AS DateTime))
INSERT [dbo].[tbl_vehicle] ([id], [vehicle_ownership], [vehicle_type], [vehicle_number], [standard_mileage], [vehicle_year], [fuel_type], [vehicle_reg], [cr_dr], [opening_balance], [Insurance_vendor], [agent_name], [contact_number], [Insurance_expire], [R_C_no], [created_date]) VALUES (8, N'On Contract', N'Ace', N'xfsabf87687', N'', N'', N'Diesel', N'', N'DR', CAST(11.00 AS Decimal(18, 2)), N'SBI Car Insurance', N'', N'', N'', N'', CAST(0x0000AAB200F5AE88 AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_vehicle] OFF
USE [master]
GO
ALTER DATABASE [transportmanagement] SET  READ_WRITE 
GO
