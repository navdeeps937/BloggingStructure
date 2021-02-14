USE [master]
GO
/****** Object:  Database [BloggingStructure]    Script Date: 2/14/2021 5:46:44 PM ******/
CREATE DATABASE [BloggingStructure]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BloggingStructure', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BloggingStructure.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BloggingStructure_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BloggingStructure_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BloggingStructure] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BloggingStructure].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BloggingStructure] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BloggingStructure] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BloggingStructure] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BloggingStructure] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BloggingStructure] SET ARITHABORT OFF 
GO
ALTER DATABASE [BloggingStructure] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BloggingStructure] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BloggingStructure] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BloggingStructure] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BloggingStructure] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BloggingStructure] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BloggingStructure] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BloggingStructure] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BloggingStructure] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BloggingStructure] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BloggingStructure] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BloggingStructure] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BloggingStructure] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BloggingStructure] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BloggingStructure] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BloggingStructure] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BloggingStructure] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BloggingStructure] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BloggingStructure] SET  MULTI_USER 
GO
ALTER DATABASE [BloggingStructure] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BloggingStructure] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BloggingStructure] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BloggingStructure] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BloggingStructure] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BloggingStructure] SET QUERY_STORE = OFF
GO
USE [BloggingStructure]
GO
/****** Object:  Table [dbo].[BlogDetails]    Script Date: 2/14/2021 5:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogDetails](
	[ArticleId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](500) NOT NULL,
	[Abstract] [varchar](500) NOT NULL,
	[Contents] [varchar](max) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ArticleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2/14/2021 5:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[UserName] [varchar](30) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BlogDetails] ON 

INSERT [dbo].[BlogDetails] ([ArticleId], [Title], [Abstract], [Contents], [CreatedDate], [ModifiedDate]) VALUES (2, N'Title 1', N'Abstract 1', N'This is title 1', CAST(N'2021-02-14T17:43:06.677' AS DateTime), CAST(N'2021-02-14T17:43:06.677' AS DateTime))
INSERT [dbo].[BlogDetails] ([ArticleId], [Title], [Abstract], [Contents], [CreatedDate], [ModifiedDate]) VALUES (3, N'Title 2', N'Abstract 2', N'This is title 2', CAST(N'2021-02-14T17:43:21.240' AS DateTime), CAST(N'2021-02-14T17:43:21.240' AS DateTime))
SET IDENTITY_INSERT [dbo].[BlogDetails] OFF
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([UserId], [FirstName], [LastName], [UserName], [Email], [Password], [CreatedDate]) VALUES (1, N'Blog', N'Admin', N'BlogAdmin', N'navdeeps937@gmail.com', N'P@ssw0rd1111', CAST(N'2021-02-13T21:04:36.470' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
ALTER TABLE [dbo].[BlogDetails] ADD  CONSTRAINT [DF_BlogDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[BlogDetails] ADD  CONSTRAINT [DF_BlogDetails_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[UserInfo] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
USE [master]
GO
ALTER DATABASE [BloggingStructure] SET  READ_WRITE 
GO
