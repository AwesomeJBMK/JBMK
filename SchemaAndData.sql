USE [master]
GO
/****** Object:  Database [JBMK]    Script Date: 11/23/2018 9:09:13 PM ******/
CREATE DATABASE [JBMK]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JBMK', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\JBMK.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'JBMK_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\JBMK_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [JBMK] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JBMK].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JBMK] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JBMK] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JBMK] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JBMK] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JBMK] SET ARITHABORT OFF 
GO
ALTER DATABASE [JBMK] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JBMK] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JBMK] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JBMK] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JBMK] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JBMK] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JBMK] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JBMK] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JBMK] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JBMK] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JBMK] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JBMK] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JBMK] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JBMK] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JBMK] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JBMK] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JBMK] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JBMK] SET RECOVERY FULL 
GO
ALTER DATABASE [JBMK] SET  MULTI_USER 
GO
ALTER DATABASE [JBMK] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JBMK] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JBMK] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JBMK] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [JBMK] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'JBMK', N'ON'
GO
USE [JBMK]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 11/23/2018 9:09:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountKey] [bigint] IDENTITY(1,10) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[InvitedByAccountKey] [bigint] NULL,
	[AccountSourceTypeKey] [tinyint] NULL,
	[ValidScore] [int] NULL,
	[SocialUserKey] [int] NULL,
	[CreateDate] [datetime] NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_AccountKey] PRIMARY KEY CLUSTERED 
(
	[AccountKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountScoreHistorys]    Script Date: 11/23/2018 9:09:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountScoreHistorys](
	[AccountScoreHistoryKey] [bigint] IDENTITY(1,10) NOT NULL,
	[AccountKey] [bigint] NULL,
	[ScoreTypeKey] [tinyint] NULL,
	[Score] [int] NULL,
	[IsRewarded] [bit] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_AccountScoreHistoryKey] PRIMARY KEY CLUSTERED 
(
	[AccountScoreHistoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountSourceTypes]    Script Date: 11/23/2018 9:09:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountSourceTypes](
	[AccountSourceTypeKey] [tinyint] NOT NULL,
	[AccountSourceTypeName] [nvarchar](50) NULL,
	[AccountSourceTypeDescription] [nvarchar](200) NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_AccountSourceTypeKey] PRIMARY KEY CLUSTERED 
(
	[AccountSourceTypeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScoreTypes]    Script Date: 11/23/2018 9:09:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScoreTypes](
	[ScoreTypeKey] [tinyint] NOT NULL,
	[ScoreTypeName] [nvarchar](50) NULL,
	[ScoreTypeDescription] [nvarchar](200) NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_ScoreTypeKey] PRIMARY KEY CLUSTERED 
(
	[ScoreTypeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SocialUserFriends]    Script Date: 11/23/2018 9:09:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SocialUserFriends](
	[SocialUserFriendKey] [int] IDENTITY(1,1) NOT NULL,
	[SocialUserKey] [int] NULL,
	[LastName] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SocialUsers]    Script Date: 11/23/2018 9:09:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SocialUsers](
	[SocialUserKey] [int] IDENTITY(1,10) NOT NULL,
	[SocialLoginUserName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[SocialLoginPassword] [nvarchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([AccountKey], [LastName], [FirstName], [InvitedByAccountKey], [AccountSourceTypeKey], [ValidScore], [SocialUserKey], [CreateDate], [ChangeDate]) VALUES (21, N'Li', N'Jay', 0, 0, 0, 1, CAST(N'2018-11-23T17:08:09.083' AS DateTime), CAST(N'2018-11-23T17:08:09.087' AS DateTime))
SET IDENTITY_INSERT [dbo].[Accounts] OFF
INSERT [dbo].[AccountSourceTypes] ([AccountSourceTypeKey], [AccountSourceTypeName], [AccountSourceTypeDescription], [CreateDate]) VALUES (1, N'Facebook', N'Social register from Facebook', CAST(N'2018-11-23T14:29:01.207' AS DateTime))
INSERT [dbo].[AccountSourceTypes] ([AccountSourceTypeKey], [AccountSourceTypeName], [AccountSourceTypeDescription], [CreateDate]) VALUES (2, N'Twitter', N'Social register from Twitter', CAST(N'2018-11-23T14:29:01.207' AS DateTime))
INSERT [dbo].[AccountSourceTypes] ([AccountSourceTypeKey], [AccountSourceTypeName], [AccountSourceTypeDescription], [CreateDate]) VALUES (3, N'Wechat', N'Social register from Wechat', CAST(N'2018-11-23T14:29:01.207' AS DateTime))
INSERT [dbo].[AccountSourceTypes] ([AccountSourceTypeKey], [AccountSourceTypeName], [AccountSourceTypeDescription], [CreateDate]) VALUES (4, N'Weibo', N'Social register from Weibo', CAST(N'2018-11-23T14:29:01.207' AS DateTime))
INSERT [dbo].[ScoreTypes] ([ScoreTypeKey], [ScoreTypeName], [ScoreTypeDescription], [CreateDate]) VALUES (1, N'FEMT', N'Friend Enrollment', CAST(N'2018-11-23T14:29:01.227' AS DateTime))
INSERT [dbo].[ScoreTypes] ([ScoreTypeKey], [ScoreTypeName], [ScoreTypeDescription], [CreateDate]) VALUES (2, N'FFLM', N'Friend first load money', CAST(N'2018-11-23T14:29:01.230' AS DateTime))
INSERT [dbo].[ScoreTypes] ([ScoreTypeKey], [ScoreTypeName], [ScoreTypeDescription], [CreateDate]) VALUES (3, N'FFTM', N'Friend first transfer money', CAST(N'2018-11-23T14:29:01.230' AS DateTime))
INSERT [dbo].[ScoreTypes] ([ScoreTypeKey], [ScoreTypeName], [ScoreTypeDescription], [CreateDate]) VALUES (4, N'FSFD', N'Friend''s friend', CAST(N'2018-11-23T14:29:01.233' AS DateTime))
SET IDENTITY_INSERT [dbo].[SocialUserFriends] ON 

INSERT [dbo].[SocialUserFriends] ([SocialUserFriendKey], [SocialUserKey], [LastName], [FirstName], [Email]) VALUES (1, 1, N'Pan', N'Albert', N'APan@greendotcorp.com')
INSERT [dbo].[SocialUserFriends] ([SocialUserFriendKey], [SocialUserKey], [LastName], [FirstName], [Email]) VALUES (2, 1, N'Xie', N'Amy', N'Amy.Xie@greendotcorp.com')
INSERT [dbo].[SocialUserFriends] ([SocialUserFriendKey], [SocialUserKey], [LastName], [FirstName], [Email]) VALUES (3, 1, N'Ramirez', N'Bernie', N'bramirez2@greendotcorp.com')
INSERT [dbo].[SocialUserFriends] ([SocialUserFriendKey], [SocialUserKey], [LastName], [FirstName], [Email]) VALUES (4, 11, N'Miranda', N'Bryant', N'BMiranda@greendotcorp.com')
INSERT [dbo].[SocialUserFriends] ([SocialUserFriendKey], [SocialUserKey], [LastName], [FirstName], [Email]) VALUES (5, 11, N'Pandya', N'Chintan', N'cpandya@greendotcorp.com')
INSERT [dbo].[SocialUserFriends] ([SocialUserFriendKey], [SocialUserKey], [LastName], [FirstName], [Email]) VALUES (6, 11, N'Ong', N'Deanna', N'dong2@greendotcorp.com')
INSERT [dbo].[SocialUserFriends] ([SocialUserFriendKey], [SocialUserKey], [LastName], [FirstName], [Email]) VALUES (7, 21, N'Fang', N'Gene', N'Gene.Fang@greendotcorp.com')
INSERT [dbo].[SocialUserFriends] ([SocialUserFriendKey], [SocialUserKey], [LastName], [FirstName], [Email]) VALUES (8, 21, N'Kaliappan', N'Govin', N'GKaliappan@greendotcorp.com')
INSERT [dbo].[SocialUserFriends] ([SocialUserFriendKey], [SocialUserKey], [LastName], [FirstName], [Email]) VALUES (9, 21, N'Ye', N'Hennie', N'Hennie.Ye@greendotcorp.com')
INSERT [dbo].[SocialUserFriends] ([SocialUserFriendKey], [SocialUserKey], [LastName], [FirstName], [Email]) VALUES (10, 31, N'Danyan', N'Jack', N'jdanyan@greendotcorp.com')
INSERT [dbo].[SocialUserFriends] ([SocialUserFriendKey], [SocialUserKey], [LastName], [FirstName], [Email]) VALUES (11, 31, N'Phat', N'Jimmy', N'JPhat@greendotcorp.com')
INSERT [dbo].[SocialUserFriends] ([SocialUserFriendKey], [SocialUserKey], [LastName], [FirstName], [Email]) VALUES (12, 31, N'Lee', N'Jonathan', N'HLee@greendotcorp.com')
SET IDENTITY_INSERT [dbo].[SocialUserFriends] OFF
SET IDENTITY_INSERT [dbo].[SocialUsers] ON 

INSERT [dbo].[SocialUsers] ([SocialUserKey], [SocialLoginUserName], [LastName], [FirstName], [SocialLoginPassword]) VALUES (1, N'Jay', N'Li', N'Jay', N'123')
INSERT [dbo].[SocialUsers] ([SocialUserKey], [SocialLoginUserName], [LastName], [FirstName], [SocialLoginPassword]) VALUES (11, N'Bruce', N'Cao', N'Bruce', N'123')
INSERT [dbo].[SocialUsers] ([SocialUserKey], [SocialLoginUserName], [LastName], [FirstName], [SocialLoginPassword]) VALUES (21, N'Macro', N'Cheng', N'Macro', N'123')
INSERT [dbo].[SocialUsers] ([SocialUserKey], [SocialLoginUserName], [LastName], [FirstName], [SocialLoginPassword]) VALUES (31, N'Keen', N'Guo', N'Keen', N'123')
SET IDENTITY_INSERT [dbo].[SocialUsers] OFF
USE [master]
GO
ALTER DATABASE [JBMK] SET  READ_WRITE 
GO
