USE [master]
GO
/****** Object:  Database [Interest]    Script Date: 05/25/2015 00:37:16 ******/
CREATE DATABASE [Interest] ON  PRIMARY 
( NAME = N'Interest', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Interest.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Interest_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Interest_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Interest] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Interest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Interest] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Interest] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Interest] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Interest] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Interest] SET ARITHABORT OFF
GO
ALTER DATABASE [Interest] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Interest] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Interest] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Interest] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Interest] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Interest] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Interest] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Interest] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Interest] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Interest] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Interest] SET  DISABLE_BROKER
GO
ALTER DATABASE [Interest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Interest] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Interest] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Interest] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Interest] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Interest] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Interest] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Interest] SET  READ_WRITE
GO
ALTER DATABASE [Interest] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Interest] SET  MULTI_USER
GO
ALTER DATABASE [Interest] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Interest] SET DB_CHAINING OFF
GO
USE [Interest]
GO
/****** Object:  Table [dbo].[LogReg]    Script Date: 05/25/2015 00:37:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogReg](
	[Username] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Wallet] [nvarchar](max) NOT NULL,
	[ActionAmount] [nvarchar](max) NOT NULL,
	[MoneyMarketAmount] [nvarchar](max) NOT NULL,
	[BalancedMarket] [nvarchar](max) NOT NULL,
	[DebenturesAmount] [nvarchar](max) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[LogReg] ([Username], [Password], [Wallet], [ActionAmount], [MoneyMarketAmount], [BalancedMarket], [DebenturesAmount]) VALUES (N'blackranger', N'rangersi', N'10000', N'0', N'0', N'0', N'0')
INSERT [dbo].[LogReg] ([Username], [Password], [Wallet], [ActionAmount], [MoneyMarketAmount], [BalancedMarket], [DebenturesAmount]) VALUES (N'czarnyKoń', N'czarnyczarny', N'9698,98', N'0', N'0', N'0', N'0')
INSERT [dbo].[LogReg] ([Username], [Password], [Wallet], [ActionAmount], [MoneyMarketAmount], [BalancedMarket], [DebenturesAmount]) VALUES (N'bluemann', N'warszawa', N'6660,28', N'1', N'0', N'10', N'0')
/****** Object:  Table [dbo].[InterestTable]    Script Date: 05/25/2015 00:37:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InterestTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[InterestName] [varchar](max) NOT NULL,
	[InterestValue] [varchar](max) NOT NULL,
	[DateTime] [datetime] NULL,
 CONSTRAINT [PK_InterestTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[ViewUserList]    Script Date: 05/25/2015 00:37:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewUserList]
AS
SELECT     Username, ActionAmount, MoneyMarketAmount, BalancedMarket, DebenturesAmount
FROM         dbo.LogReg
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "LogReg"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 229
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewUserList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewUserList'
GO
