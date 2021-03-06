USE [BloggingStructure]
GO
/****** Object:  Table [dbo].[BlogDetails]    Script Date: 2/14/2021 7:51:48 PM ******/
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
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2/14/2021 7:51:49 PM ******/
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
GO
INSERT [dbo].[BlogDetails] ([ArticleId], [Title], [Abstract], [Contents], [CreatedDate], [ModifiedDate]) VALUES (2, N'Title 1', N'Abstract 1', N'This is title 1', CAST(N'2021-02-14T17:43:06.677' AS DateTime), CAST(N'2021-02-14T17:43:06.677' AS DateTime))
GO
INSERT [dbo].[BlogDetails] ([ArticleId], [Title], [Abstract], [Contents], [CreatedDate], [ModifiedDate]) VALUES (3, N'Title 2', N'Abstract 2', N'This is title 2', CAST(N'2021-02-14T17:43:21.240' AS DateTime), CAST(N'2021-02-14T17:43:21.240' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[BlogDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[UserInfo] ON 
GO
INSERT [dbo].[UserInfo] ([UserId], [FirstName], [LastName], [UserName], [Email], [Password], [CreatedDate]) VALUES (1, N'Blog', N'Admin', N'BlogAdmin', N'navdeeps937@gmail.com', N'P@ssw0rd1111', CAST(N'2021-02-13T21:04:36.470' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
GO
ALTER TABLE [dbo].[BlogDetails] ADD  CONSTRAINT [DF_BlogDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[BlogDetails] ADD  CONSTRAINT [DF_BlogDetails_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[UserInfo] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
