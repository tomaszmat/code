USE [tomaszMatusiakLab3]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 05/13/2015 20:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[DateStart] [date] NULL,
	[StudentHostel] [bit] NULL,
	[IsStudent] [bit] NULL,
	[Average] [decimal](18, 0) NULL,
	[BestFriendID] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Student] ON
INSERT [dbo].[Student] ([ID], [Name], [Surname], [DateStart], [StudentHostel], [IsStudent], [Average], [BestFriendID]) VALUES (9, N'Anetka', N'Europa', NULL, NULL, NULL, NULL, 9)
INSERT [dbo].[Student] ([ID], [Name], [Surname], [DateStart], [StudentHostel], [IsStudent], [Average], [BestFriendID]) VALUES (12, N'Anetka', N'Europa', NULL, NULL, NULL, NULL, 9)
INSERT [dbo].[Student] ([ID], [Name], [Surname], [DateStart], [StudentHostel], [IsStudent], [Average], [BestFriendID]) VALUES (15, N'Anetka', N'Europa', NULL, NULL, NULL, NULL, 9)
SET IDENTITY_INSERT [dbo].[Student] OFF
/****** Object:  Table [dbo].[Note]    Script Date: 05/13/2015 20:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Note](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [decimal](18, 0) NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[StudentID] [int] NOT NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_Note] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Note_Student]    Script Date: 05/13/2015 20:59:15 ******/
ALTER TABLE [dbo].[Note]  WITH CHECK ADD  CONSTRAINT [FK_Note_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[Note] CHECK CONSTRAINT [FK_Note_Student]
GO
/****** Object:  ForeignKey [FK_Student_Student]    Script Date: 05/13/2015 20:59:15 ******/
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Student] FOREIGN KEY([BestFriendID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Student]
GO
