USE [master]
GO
/****** Object:  Database [BloodBank]    Script Date: 02-06-2021 14:13:11 ******/
CREATE DATABASE [BloodBank]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BloodBank', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BloodBank.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BloodBank_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BloodBank_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BloodBank] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BloodBank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BloodBank] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BloodBank] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BloodBank] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BloodBank] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BloodBank] SET ARITHABORT OFF 
GO
ALTER DATABASE [BloodBank] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BloodBank] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BloodBank] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BloodBank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BloodBank] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BloodBank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BloodBank] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BloodBank] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BloodBank] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BloodBank] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BloodBank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BloodBank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BloodBank] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BloodBank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BloodBank] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BloodBank] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BloodBank] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BloodBank] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BloodBank] SET  MULTI_USER 
GO
ALTER DATABASE [BloodBank] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BloodBank] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BloodBank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BloodBank] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BloodBank] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BloodBank]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 02-06-2021 14:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[admin](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[username] [varchar](50) NULL,
	[pwd] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bill_patient]    Script Date: 02-06-2021 14:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill_patient](
	[bill_id] [int] NULL,
	[bill_amount] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BloodBank]    Script Date: 02-06-2021 14:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BloodBank](
	[BloodGroup] [varchar](30) NULL,
	[Quantity] [int] NULL DEFAULT ((0)),
	[Unit] [varchar](30) NULL DEFAULT ('ML')
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BloodGroup]    Script Date: 02-06-2021 14:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloodGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](50) NULL,
 CONSTRAINT [PK_BloodGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BloodType]    Script Date: 02-06-2021 14:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloodType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BloodName] [nchar](10) NULL,
 CONSTRAINT [PK_BloodType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[camp]    Script Date: 02-06-2021 14:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[camp](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateTime] [varchar](50) NULL,
	[Venue] [varchar](50) NULL,
	[Purpose] [varchar](50) NULL,
 CONSTRAINT [PK_camp_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[City]    Script Date: 02-06-2021 14:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](50) NULL,
	[StateId] [int] NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 02-06-2021 14:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Country] [nvarchar](50) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Donor_table]    Script Date: 02-06-2021 14:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Donor_table](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[age] [int] NULL,
	[Weight] [varchar](50) NULL,
	[mob] [varchar](50) NULL,
	[email] [varchar](40) NULL,
	[bloodgp] [int] NULL,
	[country] [varchar](40) NULL,
	[state] [varchar](40) NULL,
	[city] [varchar](30) NULL,
	[aadhar] [varchar](50) NULL,
	[BloodType] [int] NULL,
	[Date] [varchar](50) NULL,
	[IsActive] [bit] NULL CONSTRAINT [DF_Donor_table_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_Donor_table_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[event]    Script Date: 02-06-2021 14:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[event](
	[id] [int] NOT NULL,
	[Date] [varchar](50) NULL,
	[Venue] [varchar](100) NULL,
	[Time] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 02-06-2021 14:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[feedback](
	[Name] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Query] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InBlood]    Script Date: 02-06-2021 14:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InBlood](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Donorid] [int] NULL,
	[Quantity] [varchar](50) NULL,
	[Unit] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Donorid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[login]    Script Date: 02-06-2021 14:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[login](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[mob] [varchar](50) NULL,
	[userid] [varchar](50) NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK__login__3213E83F13985EB3] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OutBlood]    Script Date: 02-06-2021 14:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OutBlood](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Patientid] [int] NULL,
	[Quantity] [varchar](50) NULL,
	[Unit] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Patientid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Patient_table]    Script Date: 02-06-2021 14:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Patient_table](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[age] [varchar](50) NULL,
	[Weight] [varchar](50) NULL,
	[mob] [varchar](50) NULL,
	[email] [varchar](40) NULL,
	[guarname] [varchar](50) NULL,
	[gmob] [varchar](50) NULL,
	[bloodgp] [int] NULL,
	[country] [varchar](50) NULL,
	[state] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[aadhar] [varchar](50) NULL,
	[BloodType] [int] NULL,
	[Date] [varchar](50) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__Patient___3213E83FBF0F17B2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[State]    Script Date: 02-06-2021 14:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[Id] [int] NOT NULL,
	[State] [nvarchar](50) NULL,
	[CountryId] [int] NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[bill_patient]  WITH CHECK ADD  CONSTRAINT [FK__bill_pati__bill___1FCDBCEB] FOREIGN KEY([bill_id])
REFERENCES [dbo].[Patient_table] ([id])
GO
ALTER TABLE [dbo].[bill_patient] CHECK CONSTRAINT [FK__bill_pati__bill___1FCDBCEB]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_State]
GO
ALTER TABLE [dbo].[Donor_table]  WITH CHECK ADD  CONSTRAINT [FK_Donor_table_BloodGroup] FOREIGN KEY([bloodgp])
REFERENCES [dbo].[BloodGroup] ([Id])
GO
ALTER TABLE [dbo].[Donor_table] CHECK CONSTRAINT [FK_Donor_table_BloodGroup]
GO
ALTER TABLE [dbo].[Donor_table]  WITH CHECK ADD  CONSTRAINT [FK_Donor_table_BloodType] FOREIGN KEY([BloodType])
REFERENCES [dbo].[BloodType] ([Id])
GO
ALTER TABLE [dbo].[Donor_table] CHECK CONSTRAINT [FK_Donor_table_BloodType]
GO
ALTER TABLE [dbo].[InBlood]  WITH CHECK ADD FOREIGN KEY([Donorid])
REFERENCES [dbo].[Donor_table] ([id])
GO
ALTER TABLE [dbo].[OutBlood]  WITH CHECK ADD FOREIGN KEY([Patientid])
REFERENCES [dbo].[Patient_table] ([id])
GO
ALTER TABLE [dbo].[Patient_table]  WITH CHECK ADD  CONSTRAINT [FK_Patient_table_BloodGroup] FOREIGN KEY([bloodgp])
REFERENCES [dbo].[BloodGroup] ([Id])
GO
ALTER TABLE [dbo].[Patient_table] CHECK CONSTRAINT [FK_Patient_table_BloodGroup]
GO
ALTER TABLE [dbo].[Patient_table]  WITH CHECK ADD  CONSTRAINT [FK_Patient_table_BloodType] FOREIGN KEY([BloodType])
REFERENCES [dbo].[BloodType] ([Id])
GO
ALTER TABLE [dbo].[Patient_table] CHECK CONSTRAINT [FK_Patient_table_BloodType]
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_Country]
GO
USE [master]
GO
ALTER DATABASE [BloodBank] SET  READ_WRITE 
GO
