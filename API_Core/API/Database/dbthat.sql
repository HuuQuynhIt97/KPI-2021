USE [KPI-API-Productions]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NULL,
	[PasswordHash] [varbinary](max) NULL,
	[PasswordSalt] [varbinary](max) NULL,
	[Email] [nvarchar](max) NULL,
	[PermissionID] [int] NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActionPlanDetails]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionPlanDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ActionPlanID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Sent] [bit] NOT NULL,
	[Seen] [bit] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_ActionPlanDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActionPlans]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionPlans](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Deadline] [datetime] NOT NULL,
	[SubmitDate] [datetime] NOT NULL,
	[ApprovedBy] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[DataID] [int] NOT NULL,
	[CommentID] [int] NOT NULL,
	[KPILevelCodeAndPeriod] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[ApprovedStatus] [bit] NOT NULL,
	[Tag] [nvarchar](max) NULL,
	[CreateTime] [datetime] NOT NULL,
	[TagID] [int] NOT NULL,
	[Link] [nvarchar](max) NULL,
	[Auditor] [int] NOT NULL,
	[UpdateSheduleDate] [datetime] NULL,
	[ActualFinishDate] [datetime] NULL,
	[KPILevelCode] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Remark] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NULL,
	[LevelID] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[ParentID] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryKPILevels]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryKPILevels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KPILevelID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_CategoryKPILevels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryLangs]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryLangs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[LanguageID] [nvarchar](max) NULL,
	[CategoryID] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CommentMsg] [nvarchar](max) NULL,
	[UserID] [int] NOT NULL,
	[DataID] [int] NOT NULL,
	[Link] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[CommentedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Data]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Data](
	[ID] [int] NOT NULL,
	[Value] [nvarchar](max) NULL,
	[Period] [nvarchar](max) NULL,
	[Year] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[DateUpload] [nvarchar](max) NULL,
	[Week] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Quarter] [int] NOT NULL,
	[KPILevelCode] [nvarchar](max) NULL,
	[Remark] [nvarchar](max) NULL,
	[Target] [nvarchar](max) NULL,
	[Yearly] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Datas]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Datas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KPILevelCode] [nvarchar](max) NULL,
	[Period] [nvarchar](max) NULL,
	[Value] [nvarchar](max) NULL,
	[Week] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Quarter] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[Yearly] [int] NOT NULL,
	[DateUpload] [nvarchar](max) NULL,
	[Remark] [nvarchar](max) NULL,
	[Target] [nvarchar](max) NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Datas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorMessages]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorMessages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CreateTime] [datetime] NOT NULL,
	[Function] [nvarchar](max) NULL,
 CONSTRAINT [PK_ErrorMessages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favourites]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favourites](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KPILevelCode] [nvarchar](max) NULL,
	[UserID] [int] NOT NULL,
	[Period] [nvarchar](max) NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Favourites] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobType]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_JobType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KPILangs]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KPILangs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[LanguageID] [nvarchar](max) NULL,
	[KPIID] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KPILevels]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KPILevels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KPILevelCode] [nvarchar](max) NULL,
	[UserCheck] [nvarchar](max) NULL,
	[KPIID] [int] NOT NULL,
	[LevelID] [int] NOT NULL,
	[TeamID] [int] NULL,
	[Period] [nvarchar](max) NULL,
	[Weekly] [int] NULL,
	[Monthly] [datetime] NULL,
	[Quarterly] [datetime] NULL,
	[Yearly] [datetime] NULL,
	[Checked] [bit] NULL,
	[WeeklyChecked] [bit] NULL,
	[MonthlyChecked] [bit] NULL,
	[QuarterlyChecked] [bit] NULL,
	[YearlyChecked] [bit] NULL,
	[CheckedPeriod] [bit] NULL,
	[WeeklyPublic] [bit] NULL,
	[MonthlyPublic] [bit] NULL,
	[QuarterlyPublic] [bit] NULL,
	[YearlyPublic] [bit] NULL,
	[TimeCheck] [datetime] NULL,
	[CreateTime] [datetime] NOT NULL,
	[LevelNumber] [int] NOT NULL,
	[WeeklyStandard] [int] NOT NULL,
	[MonthlyStandard] [int] NOT NULL,
	[QuarterlyStandard] [int] NOT NULL,
	[YearlyStandard] [int] NOT NULL,
	[WeeklyTarget] [int] NOT NULL,
	[MonthlyTarget] [int] NOT NULL,
	[QuarterlyTarget] [int] NOT NULL,
	[YearlyTarget] [int] NOT NULL,
	[PIC] [int] NOT NULL,
	[Owner] [int] NOT NULL,
	[OwnerManagerment] [int] NOT NULL,
 CONSTRAINT [PK_KPILevels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KPIs]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KPIs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NULL,
	[LevelID] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[ParentID] [nvarchar](max) NULL,
	[CategoryCode] [nvarchar](max) NULL,
	[CategoryID] [int] NOT NULL,
	[Unit] [int] NOT NULL,
 CONSTRAINT [PK_KPIs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LateOnUpLoads]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LateOnUpLoads](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[NotificationID] [int] NOT NULL,
	[Area] [nvarchar](max) NULL,
	[DeadLine] [nvarchar](max) NULL,
	[KPIName] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NULL,
	[Year] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Levels]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Levels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NULL,
	[ParentID] [int] NULL,
	[ParentCode] [nvarchar](max) NULL,
	[LevelNumber] [int] NULL,
	[State] [bit] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Levels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PropjectID] [int] NOT NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Managers]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Managers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[KPILevelID] [int] NOT NULL,
	[KPILevelCode] [nvarchar](max) NULL,
	[CategoryCode] [nvarchar](max) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Managers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuLangs]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuLangs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LangID] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[MenuID] [int] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_MenuLangs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuRoles]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuRoles](
	[MenuID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
	[Index] [int] NOT NULL,
 CONSTRAINT [PK_MenuRoles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC,
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Link] [nvarchar](max) NULL,
	[FontAwesome] [nvarchar](max) NULL,
	[BackgroudColor] [nvarchar](max) NULL,
	[Position] [int] NOT NULL,
	[Code] [nvarchar](max) NULL,
 CONSTRAINT [PK_Menus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationDetails]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[NotificationID] [int] NOT NULL,
	[Seen] [bit] NOT NULL,
	[Action] [nvarchar](max) NULL,
	[CreateTime] [datetime] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[URL] [nvarchar](max) NULL,
 CONSTRAINT [PK_NotificationDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[KPIName] [nvarchar](max) NULL,
	[Period] [nvarchar](max) NULL,
	[Action] [nvarchar](max) NULL,
	[Link] [nvarchar](max) NULL,
	[CreateTime] [datetime] NOT NULL,
	[Tag] [nvarchar](max) NULL,
	[KPILevelCode] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[CommentID] [int] NOT NULL,
	[ActionplanID] [int] NOT NULL,
	[TaskName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OCCategories]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OCCategories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OCID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_OCCategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OCs]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OCs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_OCs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Owners]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owners](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[KPILevelID] [int] NOT NULL,
	[KPILevelCode] [nvarchar](max) NULL,
	[CategoryCode] [nvarchar](max) NULL,
	[CreatedTime] [datetime] NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Owners] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Participants]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Participants](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[KPILevelID] [int] NOT NULL,
	[KPILevelCode] [nvarchar](max) NULL,
	[CategoryCode] [nvarchar](max) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Participants] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeenComments]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeenComments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CommentID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_SeenComments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[State] [bit] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sponsors]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sponsors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[KPILevelID] [int] NOT NULL,
	[KPILevelCode] [nvarchar](max) NULL,
	[CategoryCode] [nvarchar](max) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Sponsors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StateSendMails]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateSendMails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ToDay] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_StateSendMails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[CommentID] [int] NULL,
	[ActionPlanID] [int] NULL,
	[NotificationID] [int] NULL,
	[IsUpload] [bit] NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[From] [nvarchar](max) NULL,
	[CreatedBy] [int] NOT NULL,
	[Remark] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[DueDate] [datetime2](7) NOT NULL,
	[ParentID] [int] NOT NULL,
	[Level] [int] NOT NULL,
	[JobTypeID] [int] NOT NULL,
	[UserID] [int] NULL,
	[ManagerID] [int] NULL,
	[TeamMemberID] [int] NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamMember]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamMember](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PropjectID] [int] NOT NULL,
 CONSTRAINT [PK_TeamMember] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Units]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Units](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Units] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uploaders]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uploaders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[KPILevelID] [int] NOT NULL,
	[KPILevelCode] [nvarchar](max) NULL,
	[CategoryCode] [nvarchar](max) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Uploaders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Username] [nvarchar](max) NULL,
	[Skype] [nvarchar](max) NULL,
	[Alias] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[FullName] [nvarchar](max) NULL,
	[State] [bit] NOT NULL,
	[LevelID] [int] NOT NULL,
	[Role] [int] NOT NULL,
	[TeamID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Permission] [int] NOT NULL,
	[Owner] [int] NOT NULL,
	[PasswordHash] [varbinary](max) NULL,
	[PasswordSalt] [varbinary](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkingPlans]    Script Date: 3/6/2020 2:05:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkingPlans](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_WorkingPlans] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191212030602_InititalDb', N'3.1.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191224032524_version1.0.1', N'3.1.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191227004747_version1.0.2', N'3.1.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191227005113_version1.0.3', N'3.1.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191227005242_version1.0.4', N'3.1.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191227010144_version1.0.5', N'3.1.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191227013831_version1.0.6', N'3.1.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200107031910_version1.0.7', N'3.1.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200115043108_version1.0.8', N'3.1.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200117064447_1.0.9', N'3.1.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200205034022_InitialDb', N'3.1.1')
GO
SET IDENTITY_INSERT [dbo].[ActionPlanDetails] ON 
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime]) VALUES (1, 1, 297, 0, 0, CAST(N'2020-03-05T14:36:11.383' AS DateTime))
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime]) VALUES (2, 2, 297, 0, 0, CAST(N'2020-03-05T14:39:06.827' AS DateTime))
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime]) VALUES (3, 3, 299, 0, 0, CAST(N'2020-03-05T14:43:38.000' AS DateTime))
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime]) VALUES (4, 4, 299, 0, 0, CAST(N'2020-03-05T15:01:47.083' AS DateTime))
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime]) VALUES (5, 5, 299, 0, 0, CAST(N'2020-03-05T15:40:19.817' AS DateTime))
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime]) VALUES (6, 6, 299, 0, 0, CAST(N'2020-03-06T07:33:45.950' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ActionPlanDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID]) VALUES (15, N'Efficiency', N'IN042020AC', 4, CAST(N'2020-02-11T16:57:36.700' AS DateTime), NULL)
GO
INSERT [dbo].[Categories] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID]) VALUES (16, N'Expense management', N'IN052020OC', 4, CAST(N'2020-02-11T16:58:25.967' AS DateTime), NULL)
GO
INSERT [dbo].[Categories] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID]) VALUES (17, N'Procedure management', N'IN032020OC', 4, CAST(N'2020-02-11T17:00:58.693' AS DateTime), NULL)
GO
INSERT [dbo].[Categories] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID]) VALUES (18, N'Talent', N'IN042020AC', 4, CAST(N'2020-02-11T17:01:40.317' AS DateTime), NULL)
GO
INSERT [dbo].[Categories] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID]) VALUES (20, N'Efficiency', N'IN022020', 3, CAST(N'2020-02-11T17:02:49.330' AS DateTime), NULL)
GO
INSERT [dbo].[Categories] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID]) VALUES (21, N'Expense management', N'IN052020', 3, CAST(N'2020-02-11T17:03:33.047' AS DateTime), NULL)
GO
INSERT [dbo].[Categories] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID]) VALUES (22, N'Procedure management', N'IN032020', 3, CAST(N'2020-02-11T17:04:16.983' AS DateTime), NULL)
GO
INSERT [dbo].[Categories] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID]) VALUES (23, N'Talent team', N'IN042020', 3, CAST(N'2020-02-11T17:04:35.297' AS DateTime), NULL)
GO
INSERT [dbo].[Categories] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID]) VALUES (28, N'Demo Category English', N'XN002', 1, CAST(N'2020-03-05T11:48:51.920' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryKPILevels] ON 
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (2079, 1560, 14, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (2080, 1541, 14, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (2083, 1542, 14, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (2085, 1543, 14, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (2086, 1544, 14, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (2089, 1576, 14, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (2095, 1623, 13, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (2096, 1624, 13, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (2097, 1623, 10, 0)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (2098, 1624, 10, 0)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (2099, 1625, 10, 0)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (2100, 1627, 13, 0)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (2101, 1627, 10, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (2102, 1625, 13, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (2103, 1626, 13, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (2104, 1629, 13, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (2105, 1630, 13, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (2106, 1428, 11, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (2107, 285, 11, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (2108, 274, 11, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (2109, 263, 11, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (2110, 251, 11, 0)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (2111, 241, 11, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (2112, 230, 11, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (3081, 252, 11, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4081, 284, 9, 0)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4082, 284, 8, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4083, 251, 9, 0)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4084, 1415, 9, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4085, 229, 8, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4086, 240, 8, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4087, 1463, 9, 0)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4088, 1463, 8, 0)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4089, 1463, 5, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4090, 251, 5, 0)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4091, 273, 8, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4092, 262, 8, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4093, 251, 8, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4094, 1427, 8, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4095, 1451, 6, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4096, 1439, 6, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4097, 1427, 6, 0)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4098, 1379, 6, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4099, 1367, 6, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4100, 1403, 6, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4101, 1391, 6, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4102, 1563, 5, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4103, 1547, 5, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4104, 1499, 5, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4105, 1487, 5, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4106, 1475, 5, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4107, 1629, 10, 0)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4108, 1563, 9, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4109, 3110, 23, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4127, 3987, 24, 0)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4128, 4208, 27, 1)
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status]) VALUES (4129, 4275, 28, 1)
GO
SET IDENTITY_INSERT [dbo].[CategoryKPILevels] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryLangs] ON 
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (1, N'AAA', N'vi', 15)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (2, N'效率精進', N'zh-TW', 15)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (3, N'Efficiency', N'en', 15)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (4, N'AAA', N'vi', 16)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (5, N'成本管理(費用管控)', N'zh-TW', 16)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (6, N'Expense management', N'en', 16)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (7, N'AAA', N'vi', 17)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (8, N'流程管理', N'zh-TW', 17)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (9, N'Procedure management', N'en', 17)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (10, N'AAA', N'vi', 18)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (11, N'人才圑隊', N'zh-TW', 18)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (12, N'Talent', N'en', 18)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (16, N'AAA', N'vi', 20)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (17, N'效率精進', N'zh-TW', 20)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (18, N'Efficiency', N'en', 20)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (19, N'AAA', N'vi', 21)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (20, N'成本管理(費用管控)', N'zh-TW', 21)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (21, N'Expense management', N'en', 21)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (22, N'AAA', N'vi', 22)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (23, N'流程管理', N'zh-TW', 22)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (24, N'Procedure management', N'en', 22)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (25, N'AAA', N'vi', 23)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (26, N'人才圑隊', N'zh-TW', 23)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (27, N'Talent team', N'en', 23)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (28, N'demo33', N'vi', 24)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (29, N'demo11', N'zh-TW', 24)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (30, N'demo22', N'en', 24)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (40, N'Demo Category Vietnamese', N'vi', 28)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (41, N'Demo Category Chinese', N'zh-TW', 28)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (42, N'Demo Category English', N'en', 28)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (31, N'demo vietnamese', N'vi', 25)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (32, N'demo chinese', N'zh-TW', 25)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (33, N'demo english', N'en', 25)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (34, N'demo vietnamese', N'vi', 26)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (35, N'demo chinese', N'zh-TW', 26)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (36, N'demo english', N'en', 26)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (37, N'Demo Vietnamese', N'vi', 27)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (38, N'Demo Chinese', N'zh-TW', 27)
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID]) VALUES (39, N'Demo English', N'en', 27)
GO
SET IDENTITY_INSERT [dbo].[CategoryLangs] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (39, N'dads', 16, 26195, N'http://10.4.4.92:90/#/dataset/8/m/1/11/2019', N'Remark - 效率精進 - m', CAST(N'2019-12-31T11:18:03.0317408' AS DateTime2))
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (40, N'd', 16, 26191, N'http://10.4.4.92:90/#/dataset/8/m/1/11/2019', N'Remark - 效率精進 - m', CAST(N'2019-12-31T11:19:01.5690462' AS DateTime2))
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (41, N'@henry ', 16, 26191, N'http://10.4.4.92:90/#/dataset/8/m/1/11/2019', N'Remark - 效率精進 - m', CAST(N'2019-12-31T11:31:44.6109223' AS DateTime2))
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (51, N'demo', 16, 27109, N'http://10.4.4.92:90/#/Dataset/8/m/1/12/2019', N'Remark - 效率精進 - m', CAST(N'2020-01-04T11:21:57.1401684' AS DateTime2))
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (52, N'd', 16, 27109, N'http://10.4.4.92:90/#/Dataset/8/m/1/12/2019', N'Remark - 效率精進 - m', CAST(N'2020-01-04T11:22:24.6326745' AS DateTime2))
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (53, N'ddd', 17, 26203, N'http://10.4.4.92:90/#/Dataset/8/q/1/4/2019', N'Remark - 效率精進 - q', CAST(N'2020-01-07T08:35:54.2437494' AS DateTime2))
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (66, N'abc', 16, 26198, N'https://localhost:44309/ChartPeriod/?kpilevelcode=3F010009&catid=8&period=M&year=2019&start=1&end=12&type=remark&comID=66&dataID=26198&title=Remark', N'Remark-', CAST(N'2020-01-08T08:36:43.8439746' AS DateTime2))
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (72, N'dd', 16, 27395, N'http://10.4.4.92:90/#/ChartPeriod/3F010004/8/M/2019/1/12&type=remark&comID=72&dataID=27395&title=Remark-', N'Remark - Month 12 -  KPI Chart  - 目標達成率 - Monthly', CAST(N'2020-01-08T08:41:15.3729463' AS DateTime2))
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (85, N'demo', 12, 27395, N'/ChartPeriod/3F010004/8/M/2019/1/12/remark/85/27395/Remark-', N'Remark - Month 12 -  KPI Chart  - 目標達成率 - Monthly', CAST(N'2020-01-11T11:19:09.5810684' AS DateTime2))
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (86, N'@henry ', 16, 27394, N'/ChartPeriod/3F010004/8/M/2019/1/12/remark/86/27394/Remark-', N'Remark - Month 11 -  KPI Chart  - 目標達成率 - Monthly', CAST(N'2020-01-11T11:27:22.0540335' AS DateTime2))
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (87, N'demo', 16, 26330, N'/ChartPeriod/3F010004/8/M/2019/1/12/remark/87/26330/Remark-', N'Remark - Month 5 -  KPI Chart  - 目標達成率 - Monthly', CAST(N'2020-01-11T12:02:00.8757756' AS DateTime2))
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (88, N'demo', 16, 28113, N'/ChartPeriod/4C110004/11/M/2020/1/12/remark/88/28113/Remark-', N'Remark - Month 1 -  KPI Chart  - 目標達成率 - Monthly', CAST(N'2020-01-11T12:18:48.2502848' AS DateTime2))
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (89, N'demo @henry ', 16, 26335, N'/ChartPeriod/3F010004/8/M/2019/1/12/remark/89/26335/Remark-', N'Remark - Month 10 -  KPI Chart  - 目標達成率 - Monthly', CAST(N'2020-01-11T14:01:58.5334325' AS DateTime2))
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (90, N'@henry demo', 16, 28099, N'/ChartPeriod/3F010009/8/M/2020/1/12/remark/90/28099/Remark-', N'Remark - Month 1 -  KPI Chart  - 全廠IE工時達成率 - Monthly', CAST(N'2020-01-11T14:17:15.4573809' AS DateTime2))
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (95, N'@henry ', 16, 28099, N'/Dataset/8/m/1/12/2020/remark/95/28099/Remark-', N'Remark - 效率精進 - m', CAST(N'2020-01-18T14:23:49.2121037' AS DateTime2))
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (99, N'@henry ', 16, 28099, N'/Dataset/8/m/1/12/2020/remark/99/28099/Remark-on-January-', N'Remark on  January - 全廠IE工時達成率 - Monthly', CAST(N'2020-01-20T10:26:43.5152867' AS DateTime2))
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (100, N'deme from henry', 16, 26330, N'/ChartPeriod/3F010004/8/M/2019/1/12/remark/85/27395/Remark-/remark/100/26330/Remark-on-May-', N'Remark on May -  KPI Chart  - 目標達成率 - Monthly', CAST(N'2020-01-31T09:18:35.5355744' AS DateTime2))
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (101, N'@peter ', 16, 27395, N'/ChartPeriod/3F010004/8/M/2019/1/12/remark/85/27395/Remark-/remark/101/27395/Action-Plan-KPI-Chart-', N'Action Plan KPI Chart - 目標達成率 - MonthlyWorking Plan:Data - 目標達成率 - Monthly', CAST(N'2020-01-31T09:19:15.8679474' AS DateTime2))
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (104, N'@henry ', 16, 26335, N'/ChartPeriod/3F010004/8/M/2019/1/12', N'Remark on October -  KPI Chart  - Goal completion rate - Monthly', CAST(N'2020-02-06T14:19:00.6823940' AS DateTime2))
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (105, N'@henry ', 16, 26330, N'/ChartPeriod/3F010004/8/M/2019/1/12', N'Remark on May -  KPI Chart  - Goal completion rate - Monthly', CAST(N'2020-02-06T14:27:08.4411392' AS DateTime2))
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (106, N'@henry ', 16, 26330, N'/ChartPeriod/3F010004/8/M/2019/1/12/remark/106/26330/Remark-on-May-', N'Remark on May -  KPI Chart  - Goal completion rate - Monthly', CAST(N'2020-02-06T14:29:28.5167410' AS DateTime2))
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (107, N'@henry ', 16, 26330, N'/ChartPeriod/3F010004/8/M/2019/1/12/remark/107/26330/Remark-on-May-', N'Remark on May -  KPI Chart  - Goal completion rate - Monthly', CAST(N'2020-02-06T14:34:51.4318287' AS DateTime2))
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (122, N'@henry ', 16, 28076, N'/ChartPeriod/3F010002/8/M/2019/1/12/remark/122/28076/Remark-on-December-', N'Remark on December -  KPI Chart  - English Name - Monthly', CAST(N'2020-02-10T16:30:44.3211005' AS DateTime2))
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (132, N'@henry ', 16, 28075, N'/ChartPeriod/3F010002/8/M/2019/1/12/remark/132/28075/Remark-on-November-', N'Remark on November -  KPI Chart  - English Name - Monthly', CAST(N'2020-02-11T09:37:59.9878366' AS DateTime2))
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (134, N'@henry ', 16, 28075, N'http://10.4.4.92:90/#/ChartPeriod/3F010002/8/M/2019/1/12/remark/134/28075/Remark-on-November-', N'Remark on November -  KPI Chart  - English Name - Monthly', CAST(N'2020-02-11T15:52:41.7668559' AS DateTime2))
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (136, N'@henry ', 16, 26131, N'/ChartPeriod/3F010002/9/M/2019/1/12/remark/136/26131/Remark-on-October-', N'Remark on October -  KPI Chart  - English Name - Monthly', CAST(N'2020-02-11T16:08:59.1208506' AS DateTime2))
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (138, N'@henry ', 16, 28099, N'/Dataset/9/m/1/12/2020/remark/138/28099/Remark-on-January-', N'Remark on  January - 全廠IE工時達成率 - Monthly', CAST(N'2020-02-12T07:39:23.4924481' AS DateTime2))
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (139, N'@henry ', 16, 28099, N'/Dataset/9/m/1/12/2020/remark/139/28099/Remark-on-January-', N'Remark on  January - 全廠IE工時達成率 - Monthly', CAST(N'2020-02-12T07:49:07.4178150' AS DateTime2))
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate]) VALUES (140, N'@henry ', 16, 28075, N'/ChartPeriod/3F010002/9/M/2019/1/12/remark/140/28075/Remark-on-November-', N'Remark on November -  KPI Chart  - English Name - Monthly', CAST(N'2020-02-12T07:55:11.4374890' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Datas] ON 
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime]) VALUES (14, N'1GR00010002', N'W', N'80', 1, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-03-05T11:57:21.117' AS DateTime))
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime]) VALUES (15, N'1GR00010002', N'W', N'81', 2, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-03-05T11:57:21.117' AS DateTime))
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime]) VALUES (16, N'1GR00010002', N'W', N'85.5', 3, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-03-05T11:57:21.117' AS DateTime))
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime]) VALUES (17, N'1GR00010002', N'W', N'95', 4, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-03-05T11:57:21.117' AS DateTime))
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime]) VALUES (18, N'1GR00010002', N'W', N'0', 5, 0, 0, 0, 2020, NULL, NULL, N'0', CAST(N'2020-03-05T11:57:21.117' AS DateTime))
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime]) VALUES (19, N'1GR00010002', N'W', N'0', 6, 0, 0, 0, 2020, NULL, NULL, N'0', CAST(N'2020-03-05T11:57:21.117' AS DateTime))
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime]) VALUES (20, N'1GR00010002', N'W', N'0', 7, 0, 0, 0, 2020, NULL, NULL, N'0', CAST(N'2020-03-05T11:57:21.117' AS DateTime))
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime]) VALUES (21, N'1GR00010002', N'W', N'0', 8, 0, 0, 0, 2020, NULL, NULL, N'0', CAST(N'2020-03-05T11:57:21.117' AS DateTime))
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime]) VALUES (22, N'1GR00010002', N'W', N'0', 9, 0, 0, 0, 2020, NULL, NULL, N'0', CAST(N'2020-03-05T11:57:21.117' AS DateTime))
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime]) VALUES (23, N'1GR00010002', N'W', N'0', 10, 0, 0, 0, 2020, NULL, NULL, N'0', CAST(N'2020-03-05T11:57:21.117' AS DateTime))
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime]) VALUES (24, N'1GR00010002', N'M', N'0', 0, 1, 0, 0, 2020, NULL, NULL, N'0', CAST(N'2020-03-05T11:57:21.117' AS DateTime))
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime]) VALUES (25, N'1GR00010002', N'M', N'0', 0, 2, 0, 0, 2020, NULL, NULL, N'0', CAST(N'2020-03-05T11:57:21.117' AS DateTime))
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime]) VALUES (26, N'1GR00010002', N'M', N'0', 0, 3, 0, 0, 2020, NULL, NULL, N'0', CAST(N'2020-03-05T11:57:21.117' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Datas] OFF
GO
SET IDENTITY_INSERT [dbo].[ErrorMessages] ON 
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function]) VALUES (85, N'There is already an open DataReader associated with this Command which must be closed first.', CAST(N'2020-02-11T10:08:52.253' AS DateTime), N'Approval')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function]) VALUES (86, N'There is already an open DataReader associated with this Command which must be closed first.', CAST(N'2020-02-11T10:08:53.877' AS DateTime), N'Approval')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function]) VALUES (87, N'There is already an open DataReader associated with this Command which must be closed first.', CAST(N'2020-02-11T10:08:55.093' AS DateTime), N'Approval')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function]) VALUES (88, N'There is already an open DataReader associated with this Command which must be closed first.', CAST(N'2020-02-11T10:08:55.957' AS DateTime), N'Approval')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function]) VALUES (89, N'There is already an open DataReader associated with this Command which must be closed first.', CAST(N'2020-02-11T10:08:56.773' AS DateTime), N'Approval')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function]) VALUES (90, N'There is already an open DataReader associated with this Command which must be closed first.', CAST(N'2020-02-11T10:08:57.563' AS DateTime), N'Approval')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function]) VALUES (91, N'There is already an open DataReader associated with this Command which must be closed first.', CAST(N'2020-02-11T10:09:00.343' AS DateTime), N'Approval')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function]) VALUES (92, N'There is already an open DataReader associated with this Command which must be closed first.', CAST(N'2020-02-11T10:09:01.537' AS DateTime), N'Approval')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function]) VALUES (93, N'There is already an open DataReader associated with this Command which must be closed first.', CAST(N'2020-02-11T11:06:03.520' AS DateTime), N'Approval')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function]) VALUES (94, N'There is already an open DataReader associated with this Command which must be closed first.', CAST(N'2020-02-11T11:06:04.463' AS DateTime), N'Approval')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function]) VALUES (95, N'There is already an open DataReader associated with this Command which must be closed first.', CAST(N'2020-02-11T11:08:38.783' AS DateTime), N'Approval')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function]) VALUES (96, N'There is already an open DataReader associated with this Command which must be closed first.', CAST(N'2020-02-11T11:08:40.870' AS DateTime), N'Approval')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function]) VALUES (97, N'There is already an open DataReader associated with this Command which must be closed first.', CAST(N'2020-02-11T15:41:18.550' AS DateTime), N'Approval')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function]) VALUES (98, N'There is already an open DataReader associated with this Command which must be closed first.', CAST(N'2020-02-11T15:41:20.940' AS DateTime), N'Approval')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function]) VALUES (99, N'There is already an open DataReader associated with this Command which must be closed first.', CAST(N'2020-02-11T15:41:22.477' AS DateTime), N'Approval')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function]) VALUES (100, N'There is already an open DataReader associated with this Command which must be closed first.', CAST(N'2020-02-11T15:41:24.467' AS DateTime), N'Approval')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function]) VALUES (101, N'There is already an open DataReader associated with this Command which must be closed first.', CAST(N'2020-02-11T15:41:25.887' AS DateTime), N'Approval')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function]) VALUES (102, N'There is already an open DataReader associated with this Command which must be closed first.', CAST(N'2020-02-11T15:41:27.063' AS DateTime), N'Approval')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function]) VALUES (103, N'There is already an open DataReader associated with this Command which must be closed first.', CAST(N'2020-02-11T15:41:28.150' AS DateTime), N'Approval')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function]) VALUES (104, N'There is already an open DataReader associated with this Command which must be closed first.', CAST(N'2020-02-11T15:41:29.057' AS DateTime), N'Approval')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function]) VALUES (105, N'There is already an open DataReader associated with this Command which must be closed first.', CAST(N'2020-02-11T15:41:29.720' AS DateTime), N'Approval')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function]) VALUES (106, N'There is already an open DataReader associated with this Command which must be closed first.', CAST(N'2020-02-11T16:01:01.173' AS DateTime), N'Approval')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function]) VALUES (107, N'There is already an open DataReader associated with this Command which must be closed first.', CAST(N'2020-02-11T16:01:31.010' AS DateTime), N'Approval')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function]) VALUES (108, N'There is already an open DataReader associated with this Command which must be closed first.', CAST(N'2020-02-11T16:01:32.127' AS DateTime), N'Approval')
GO
SET IDENTITY_INSERT [dbo].[ErrorMessages] OFF
GO
SET IDENTITY_INSERT [dbo].[Favourites] ON 
GO
INSERT [dbo].[Favourites] ([ID], [KPILevelCode], [UserID], [Period], [CreateTime]) VALUES (1, NULL, 16, NULL, CAST(N'2020-01-31T07:48:59.650' AS DateTime))
GO
INSERT [dbo].[Favourites] ([ID], [KPILevelCode], [UserID], [Period], [CreateTime]) VALUES (2, NULL, 16, NULL, CAST(N'2020-01-31T07:49:08.853' AS DateTime))
GO
INSERT [dbo].[Favourites] ([ID], [KPILevelCode], [UserID], [Period], [CreateTime]) VALUES (3, NULL, 0, NULL, CAST(N'2020-02-12T10:55:12.753' AS DateTime))
GO
INSERT [dbo].[Favourites] ([ID], [KPILevelCode], [UserID], [Period], [CreateTime]) VALUES (4, NULL, 0, NULL, CAST(N'2020-02-12T10:56:56.310' AS DateTime))
GO
INSERT [dbo].[Favourites] ([ID], [KPILevelCode], [UserID], [Period], [CreateTime]) VALUES (5, N'3F010002', 16, N'M', CAST(N'2020-02-12T11:01:17.537' AS DateTime))
GO
INSERT [dbo].[Favourites] ([ID], [KPILevelCode], [UserID], [Period], [CreateTime]) VALUES (6, N'3F010002', 16, N'Q', CAST(N'2020-02-12T11:04:32.970' AS DateTime))
GO
INSERT [dbo].[Favourites] ([ID], [KPILevelCode], [UserID], [Period], [CreateTime]) VALUES (7, N'3F010002', 12, N'M', CAST(N'2020-02-12T13:49:28.520' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Favourites] OFF
GO
SET IDENTITY_INSERT [dbo].[KPILangs] ON 
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (58, N'viet', N'vi', 1102)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (59, N'chinese', N'zh-TW', 1102)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (60, N'eng', N'en', 1102)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (61, N'demo viet', N'vi', 1103)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (62, N'demo chine', N'zh-TW', 1103)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (63, N'demo eng', N'en', 1103)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (64, N'demovi', N'vi', 1104)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (65, N'demo chinese', N'zh-TW', 1104)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (66, N'demo eng', N'en', 1104)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (70, N'demo2', N'vi', 1106)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (71, N'demo2', N'zh-TW', 1106)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (72, N'demo2', N'en', 1106)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (102, N'Vietnamese Name Demo', N'vi', 1107)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (103, N'Chinese Name Demo', N'zh-TW', 1107)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (104, N'English Name Demo', N'en', 1107)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (105, N'demo vietnamese', N'vi', 1108)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (106, N'demo chinese', N'zh-TW', 1108)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (107, N'demo english', N'en', 1108)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (108, N'Demo KPI Vietnamese ', N'vi', 1109)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (109, N'Demo KPI Chinese', N'zh-TW', 1109)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (110, N'Demo KPI English', N'en', 1109)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (111, N'Demo Vietnamese ', N'vi', 1110)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (112, N'Demo Chinese ', N'zh-TW', 1110)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (113, N'Demo English ', N'en', 1110)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (117, N'Demo KPI Vietnamese', N'vi', 1112)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (118, N'Demo KPI Chinese', N'zh-TW', 1112)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (119, N'Demo KPI English', N'en', 1112)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (67, N'demo', N'vi', 1105)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (68, N'demo', N'zh-TW', 1105)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (69, N'demo', N'en', 1105)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (33, N'AAA', N'vi', 1069)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (34, N'異常工時比率', N'zh-TW', 1069)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (35, N'Abnormal W.H. rate', N'en', 1069)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (36, N'AAA', N'vi', 1070)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (37, N'確認產能利用率', N'zh-TW', 1070)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (38, N'Confirming max production capacity', N'en', 1070)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (39, N'AAA', N'vi', 1071)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (40, N'生產目標達成率', N'zh-TW', 1071)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (41, N'Production target achievement rate', N'en', 1071)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (42, N'AAA', N'vi', 1072)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (43, N'績效目標達成率', N'zh-TW', 1072)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (44, N'Performance target achievement rate', N'en', 1072)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (45, N'AAA', N'vi', 1073)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (46, N'全廠IE工時達成率', N'zh-TW', 1073)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (47, N'Achievement rate of IE W.H.', N'en', 1073)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (48, N'AAA', N'vi', 1074)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (49, N'型體效率+/- VA達成率', N'zh-TW', 1074)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (50, N'Model efficiency +/- VA achievement rate', N'en', 1074)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (51, N'AAA', N'vi', 1075)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (52, N'異常費用比例', N'zh-TW', 1075)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (53, N'The ratio of abnormal expense', N'en', 1075)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (54, N'AAA', N'vi', 1076)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (55, N'消耗品費用比率', N'zh-TW', 1076)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (56, N'The ratio of consumption expense', N'en', 1076)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (57, N'AAA', N'vi', 1077)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (58, N'材料成本比率(企劃成本少5%)', N'zh-TW', 1077)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (59, N'The ratio of material cost (5% less than planning cost)', N'en', 1077)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (60, N'AAA', N'vi', 1078)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (61, N'月底在職直間接人員比率', N'zh-TW', 1078)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (62, N'Indirect and indirect staff ratio at the end of the month', N'en', 1078)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (63, N'AAA', N'vi', 1079)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (64, N'月底在職直間接人員比率(不含開發)', N'zh-TW', 1079)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (65, N'Indirect and indirect staff ratio at the end of the month (excluded DEV.)', N'en', 1079)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (66, N'AAA', N'vi', 1080)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (67, N'系統稽核 - MES', N'zh-TW', 1080)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (68, N'System audit - MES', N'en', 1080)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (69, N'AAA', N'vi', 1081)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (70, N'系統稽核 - 4M', N'zh-TW', 1081)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (71, N'System audit - 4M', N'en', 1081)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (72, N'AAA', N'vi', 1082)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (73, N'系統稽核 - 每日管理報告', N'zh-TW', 1082)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (74, N'System audit - production report', N'en', 1082)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (75, N'AAA', N'vi', 1083)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (76, N'系統稽核 - T1/T3', N'zh-TW', 1083)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (77, N'System audit - T1/T3', N'en', 1083)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (78, N'AAA', N'vi', 1084)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (79, N'系統稽核 - 材料準備系統', N'zh-TW', 1084)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (80, N'System audit - MPS', N'en', 1084)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (81, N'AAA', N'vi', 1085)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (82, N'系統稽核 - 數位倉儲', N'zh-TW', 1085)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (83, N'System audit - DWMS', N'en', 1085)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (84, N'AAA', N'vi', 1086)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (85, N'人才發展執行品質', N'zh-TW', 1086)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (86, N'Quality of People Development', N'en', 1086)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (87, N'AAA', N'vi', 1087)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (88, N'組織發展與健全', N'zh-TW', 1087)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (89, N'Robust Organization Development', N'en', 1087)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (90, N'AAA', N'vi', 1088)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (91, N'必修課程完整度管理', N'zh-TW', 1088)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (92, N'Required Training Completion', N'en', 1088)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (93, N'AAA', N'vi', 1089)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (94, N'績效管理執行品質', N'zh-TW', 1089)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (95, N'Quality of Performance Management', N'en', 1089)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (96, N'AAA', N'vi', 1090)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (97, N'工作不滿90天的新進人員離職率', N'zh-TW', 1090)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (98, N'Turnover Rate of Newcomer within 90 days ', N'en', 1090)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (99, N'AAA', N'vi', 1091)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (100, N'一般員工年度離職率', N'zh-TW', 1091)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (101, N'Annual Turnover Rate of Normal employees', N'en', 1091)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (114, N'Demo Vietnamese', N'vi', 1111)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (115, N'Demo Chinese', N'zh-TW', 1111)
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID]) VALUES (116, N'Demo English', N'en', 1111)
GO
SET IDENTITY_INSERT [dbo].[KPILangs] OFF
GO
SET IDENTITY_INSERT [dbo].[KPILevels] ON 
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2688, NULL, NULL, 1069, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:06:52.883' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2689, NULL, NULL, 1069, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:06:52.883' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2690, NULL, NULL, 1069, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:06:52.883' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2691, NULL, NULL, 1069, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:06:52.883' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2692, N'3F020001', N'1', 1069, 72, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1, NULL, NULL, 0, NULL, 0, CAST(N'2020-02-11T18:59:06.353' AS DateTime), CAST(N'2020-02-11T18:59:06.353' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2693, NULL, NULL, 1069, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:06:52.883' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2694, NULL, NULL, 1069, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:06:52.883' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2695, NULL, NULL, 1069, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:06:52.883' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2696, NULL, NULL, 1069, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:06:52.883' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2697, NULL, NULL, 1069, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:06:52.883' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2698, N'4C210001', N'1', 1069, 88, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2020-02-12T10:01:23.313' AS DateTime), CAST(N'2020-02-12T10:01:23.313' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2699, NULL, NULL, 1069, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:06:52.883' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2700, NULL, NULL, 1069, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:06:52.883' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2701, NULL, NULL, 1069, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:06:52.883' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2702, NULL, NULL, 1069, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:06:52.883' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2703, NULL, NULL, 1069, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:06:52.883' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2704, NULL, NULL, 1069, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:06:52.883' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2705, NULL, NULL, 1069, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:06:52.883' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2706, NULL, NULL, 1069, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:06:52.883' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2707, NULL, NULL, 1070, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:11.523' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2708, NULL, NULL, 1070, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:11.523' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2709, NULL, NULL, 1070, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:11.523' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2710, NULL, NULL, 1070, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:11.523' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2711, N'3F020001', N'1', 1070, 72, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1, NULL, NULL, 0, NULL, 0, CAST(N'2020-02-11T18:58:59.277' AS DateTime), CAST(N'2020-02-11T18:58:59.277' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2712, NULL, NULL, 1070, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:11.523' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2713, NULL, NULL, 1070, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:11.523' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2714, NULL, NULL, 1070, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:11.523' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2715, NULL, NULL, 1070, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:11.523' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2716, NULL, NULL, 1070, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:11.523' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2717, N'4C210001', N'1', 1070, 88, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2020-02-11T18:49:19.883' AS DateTime), CAST(N'2020-02-11T18:49:19.883' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2718, NULL, NULL, 1070, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:11.523' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2719, NULL, NULL, 1070, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:11.523' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2720, NULL, NULL, 1070, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:11.523' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2721, NULL, NULL, 1070, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:11.523' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2722, NULL, NULL, 1070, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:11.523' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2723, NULL, NULL, 1070, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:11.523' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2724, NULL, NULL, 1070, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:11.523' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2725, NULL, NULL, 1070, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:11.523' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2726, NULL, NULL, 1071, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:45.617' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2727, NULL, NULL, 1071, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:45.617' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2728, NULL, NULL, 1071, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:45.617' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2729, NULL, NULL, 1071, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:45.617' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2730, N'3F020001', N'1', 1071, 72, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1, NULL, NULL, 0, NULL, 0, CAST(N'2020-02-11T18:58:52.697' AS DateTime), CAST(N'2020-02-11T18:58:52.697' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2731, NULL, NULL, 1071, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:45.617' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2732, NULL, NULL, 1071, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:45.617' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2733, NULL, NULL, 1071, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:45.617' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2734, NULL, NULL, 1071, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:45.617' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2735, NULL, NULL, 1071, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:45.617' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2736, N'4C210001', N'1', 1071, 88, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2020-02-11T18:49:14.713' AS DateTime), CAST(N'2020-02-11T18:49:14.713' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2737, NULL, NULL, 1071, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:45.617' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2738, NULL, NULL, 1071, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:45.617' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2739, NULL, NULL, 1071, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:45.617' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2740, NULL, NULL, 1071, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:45.617' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2741, NULL, NULL, 1071, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:45.617' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2742, NULL, NULL, 1071, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:45.617' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2743, NULL, NULL, 1071, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:45.617' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2744, NULL, NULL, 1071, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:08:45.617' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2745, NULL, NULL, 1072, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:09:45.503' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2746, NULL, NULL, 1072, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:09:45.503' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2747, NULL, NULL, 1072, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:09:45.503' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2748, NULL, NULL, 1072, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:09:45.503' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2749, N'3F020001', N'1', 1072, 72, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), 1, NULL, 1, 0, 1, NULL, NULL, 0, NULL, 0, CAST(N'2020-02-11T18:59:29.307' AS DateTime), CAST(N'2020-02-11T18:59:29.307' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2750, NULL, NULL, 1072, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:09:45.503' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2751, NULL, NULL, 1072, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:09:45.503' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2752, NULL, NULL, 1072, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:09:45.503' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2753, NULL, NULL, 1072, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:09:45.503' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2754, NULL, NULL, 1072, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:09:45.503' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2755, N'4C210001', N'1', 1072, 88, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2020-02-11T18:48:58.683' AS DateTime), CAST(N'2020-02-11T18:48:58.683' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2756, NULL, NULL, 1072, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:09:45.503' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2757, NULL, NULL, 1072, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:09:45.503' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2758, NULL, NULL, 1072, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:09:45.503' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2759, NULL, NULL, 1072, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:09:45.503' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2760, NULL, NULL, 1072, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:09:45.503' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2761, NULL, NULL, 1072, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:09:45.503' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2762, NULL, NULL, 1072, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:09:45.503' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2763, NULL, NULL, 1072, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:09:45.503' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2764, NULL, NULL, 1073, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:10:31.737' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2765, NULL, NULL, 1073, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:10:31.737' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2766, NULL, NULL, 1073, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:10:31.737' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2767, NULL, NULL, 1073, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:10:31.737' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2768, N'3F020001', N'1', 1073, 72, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1, NULL, NULL, 0, NULL, 0, CAST(N'2020-02-11T19:01:38.400' AS DateTime), CAST(N'2020-02-11T19:01:38.400' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2769, NULL, NULL, 1073, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:10:31.737' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2770, NULL, NULL, 1073, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:10:31.737' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2771, NULL, NULL, 1073, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:10:31.737' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2772, NULL, NULL, 1073, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:10:31.737' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2773, NULL, NULL, 1073, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:10:31.737' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2774, N'4C210001', N'1', 1073, 88, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2020-02-11T18:48:52.837' AS DateTime), CAST(N'2020-02-11T18:48:52.837' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2775, NULL, NULL, 1073, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:10:31.737' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2776, NULL, NULL, 1073, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:10:31.737' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2777, NULL, NULL, 1073, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:10:31.737' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2778, NULL, NULL, 1073, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:10:31.737' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2779, NULL, NULL, 1073, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:10:31.737' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2780, NULL, NULL, 1073, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:10:31.737' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2781, NULL, NULL, 1073, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:10:31.737' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2782, NULL, NULL, 1073, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:10:31.737' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2783, NULL, NULL, 1074, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:12:02.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2784, NULL, NULL, 1074, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:12:02.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2785, NULL, NULL, 1074, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:12:02.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2786, NULL, NULL, 1074, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:12:02.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2787, N'3F020001', N'1', 1074, 72, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1, NULL, NULL, 0, NULL, 0, CAST(N'2020-02-11T19:01:44.447' AS DateTime), CAST(N'2020-02-11T19:01:44.447' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2788, NULL, NULL, 1074, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:12:02.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2789, NULL, NULL, 1074, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:12:02.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2790, NULL, NULL, 1074, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:12:02.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2791, NULL, NULL, 1074, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:12:02.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2792, NULL, NULL, 1074, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:12:02.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2793, N'4C210001', N'1', 1074, 88, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2020-02-11T18:48:47.137' AS DateTime), CAST(N'2020-02-11T18:48:47.137' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2794, NULL, NULL, 1074, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:12:02.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2795, NULL, NULL, 1074, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:12:02.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2796, NULL, NULL, 1074, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:12:02.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2797, NULL, NULL, 1074, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:12:02.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2798, NULL, NULL, 1074, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:12:02.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2799, NULL, NULL, 1074, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:12:02.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2800, NULL, NULL, 1074, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:12:02.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2801, NULL, NULL, 1074, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:12:02.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2802, NULL, NULL, 1075, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:14:09.010' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2803, NULL, NULL, 1075, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:14:09.010' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2804, NULL, NULL, 1075, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:14:09.010' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2805, NULL, NULL, 1075, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:14:09.010' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2806, N'3F020001', N'1', 1075, 72, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1, NULL, NULL, 0, NULL, 0, CAST(N'2020-02-11T19:01:49.260' AS DateTime), CAST(N'2020-02-11T19:01:49.260' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2807, NULL, NULL, 1075, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:14:09.010' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2808, NULL, NULL, 1075, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:14:09.010' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2809, NULL, NULL, 1075, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:14:09.010' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2810, NULL, NULL, 1075, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:14:09.010' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2811, NULL, NULL, 1075, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:14:09.010' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2812, NULL, NULL, 1075, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:14:09.010' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2813, N'4C230001', N'1', 1075, 89, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2020-02-11T18:53:34.487' AS DateTime), CAST(N'2020-02-11T18:53:34.487' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2814, NULL, NULL, 1075, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:14:09.010' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2815, NULL, NULL, 1075, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:14:09.010' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2816, NULL, NULL, 1075, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:14:09.010' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2817, NULL, NULL, 1075, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:14:09.010' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2818, NULL, NULL, 1075, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:14:09.010' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2819, NULL, NULL, 1075, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:14:09.010' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2820, NULL, NULL, 1075, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:14:09.010' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2821, NULL, NULL, 1076, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:15:33.773' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2822, NULL, NULL, 1076, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:15:33.773' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2823, NULL, NULL, 1076, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:15:33.773' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2824, NULL, NULL, 1076, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:15:33.773' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2825, N'3F020001', N'1', 1076, 72, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1, NULL, NULL, 0, NULL, 0, CAST(N'2020-02-11T19:01:53.900' AS DateTime), CAST(N'2020-02-11T19:01:53.900' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2826, NULL, NULL, 1076, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:15:33.773' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2827, NULL, NULL, 1076, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:15:33.773' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2828, NULL, NULL, 1076, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:15:33.773' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2829, NULL, NULL, 1076, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:15:33.773' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2830, NULL, NULL, 1076, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:15:33.773' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2831, NULL, NULL, 1076, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:15:33.773' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2832, N'4C230001', N'1', 1076, 89, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2020-02-11T18:53:29.080' AS DateTime), CAST(N'2020-02-11T18:53:29.080' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2833, NULL, NULL, 1076, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:15:33.773' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2834, NULL, NULL, 1076, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:15:33.773' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2835, NULL, NULL, 1076, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:15:33.773' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2836, NULL, NULL, 1076, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:15:33.773' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2837, NULL, NULL, 1076, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:15:33.773' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2838, NULL, NULL, 1076, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:15:33.773' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2839, NULL, NULL, 1076, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:15:33.773' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2840, NULL, NULL, 1077, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:18:45.363' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2841, NULL, NULL, 1077, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:18:45.363' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2842, NULL, NULL, 1077, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:18:45.363' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2843, NULL, NULL, 1077, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:18:45.363' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2844, N'3F020001', N'1', 1077, 72, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1, NULL, NULL, 0, NULL, 0, CAST(N'2020-02-11T19:02:00.307' AS DateTime), CAST(N'2020-02-11T19:02:00.307' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2845, NULL, NULL, 1077, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:18:45.363' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2846, NULL, NULL, 1077, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:18:45.363' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2847, NULL, NULL, 1077, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:18:45.363' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2848, NULL, NULL, 1077, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:18:45.363' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2849, NULL, NULL, 1077, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:18:45.363' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2850, N'4C210001', N'1', 1077, 88, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:48:18.620' AS DateTime), CAST(N'2020-02-11T18:48:18.620' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2851, N'4C230001', N'1', 1077, 89, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2020-02-11T18:53:23.657' AS DateTime), CAST(N'2020-02-11T18:53:23.657' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2852, NULL, NULL, 1077, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:18:45.363' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2853, NULL, NULL, 1077, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:18:45.363' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2854, NULL, NULL, 1077, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:18:45.363' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2855, NULL, NULL, 1077, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:18:45.363' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2856, NULL, NULL, 1077, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:18:45.363' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2857, NULL, NULL, 1077, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:18:45.363' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2858, NULL, NULL, 1077, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:18:45.363' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2859, NULL, NULL, 1078, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:21:58.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2860, NULL, NULL, 1078, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:21:58.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2861, NULL, NULL, 1078, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:21:58.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2862, NULL, NULL, 1078, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:21:58.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2863, N'3F020001', N'1', 1078, 72, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1, NULL, NULL, 0, NULL, 0, CAST(N'2020-02-11T19:02:05.887' AS DateTime), CAST(N'2020-02-11T19:02:05.887' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2864, NULL, NULL, 1078, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:21:58.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2865, NULL, NULL, 1078, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:21:58.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2866, NULL, NULL, 1078, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:21:58.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2867, NULL, NULL, 1078, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:21:58.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2868, NULL, NULL, 1078, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:21:58.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2869, N'4C210001', N'1', 1078, 88, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:48:28.260' AS DateTime), CAST(N'2020-02-11T18:48:28.260' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2870, N'4C230001', N'1', 1078, 89, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2020-02-11T18:53:17.143' AS DateTime), CAST(N'2020-02-11T18:53:17.143' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2871, NULL, NULL, 1078, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:21:58.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2872, NULL, NULL, 1078, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:21:58.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2873, NULL, NULL, 1078, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:21:58.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2874, NULL, NULL, 1078, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:21:58.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2875, NULL, NULL, 1078, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:21:58.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2876, NULL, NULL, 1078, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:21:58.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2877, NULL, NULL, 1078, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:21:58.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2878, NULL, NULL, 1079, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:23:07.480' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2879, NULL, NULL, 1079, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:23:07.480' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2880, NULL, NULL, 1079, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:23:07.480' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2881, NULL, NULL, 1079, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:23:07.480' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2882, N'3F020001', N'1', 1079, 72, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:58:07.387' AS DateTime), CAST(N'2020-02-11T18:58:07.387' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2883, NULL, NULL, 1079, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:23:07.480' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2884, NULL, NULL, 1079, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:23:07.480' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2885, NULL, NULL, 1079, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:23:07.480' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2886, NULL, NULL, 1079, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:23:07.480' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2887, NULL, NULL, 1079, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:23:07.480' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2888, NULL, NULL, 1079, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:23:07.480' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2889, NULL, NULL, 1079, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:23:07.480' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2890, NULL, NULL, 1079, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:23:07.480' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2891, NULL, NULL, 1079, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:23:07.480' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2892, NULL, NULL, 1079, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:23:07.480' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2893, NULL, NULL, 1079, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:23:07.480' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2894, NULL, NULL, 1079, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:23:07.480' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2895, NULL, NULL, 1079, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:23:07.480' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2896, NULL, NULL, 1079, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:23:07.480' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2897, NULL, NULL, 1080, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:22.383' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2898, NULL, NULL, 1080, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:22.383' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2899, NULL, NULL, 1080, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:22.383' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2900, NULL, NULL, 1080, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:22.383' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2901, N'3F020001', N'1', 1080, 72, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1, NULL, NULL, 0, NULL, 0, CAST(N'2020-02-11T19:02:11.150' AS DateTime), CAST(N'2020-02-11T19:02:11.150' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2902, NULL, NULL, 1080, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:22.383' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2903, NULL, NULL, 1080, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:22.383' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2904, NULL, NULL, 1080, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:22.383' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2905, NULL, NULL, 1080, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:22.383' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2906, NULL, NULL, 1080, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:22.383' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2907, N'4C210001', N'1', 1080, 88, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2020-02-11T18:47:25.420' AS DateTime), CAST(N'2020-02-11T18:47:25.420' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2908, N'4C230001', N'1', 1080, 89, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2020-02-11T18:54:29.860' AS DateTime), CAST(N'2020-02-11T18:54:29.860' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2909, NULL, NULL, 1080, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:22.383' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2910, NULL, NULL, 1080, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:22.383' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2911, NULL, NULL, 1080, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:22.383' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2912, NULL, NULL, 1080, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:22.383' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2913, NULL, NULL, 1080, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:22.383' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2914, NULL, NULL, 1080, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:22.383' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2915, NULL, NULL, 1080, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:22.383' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2916, NULL, NULL, 1081, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:37.430' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2917, NULL, NULL, 1081, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:37.430' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2918, NULL, NULL, 1081, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:37.430' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2919, NULL, NULL, 1081, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:37.430' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2920, N'3F020001', N'1', 1081, 72, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1, NULL, NULL, 0, NULL, 0, CAST(N'2020-02-11T19:02:18.120' AS DateTime), CAST(N'2020-02-11T19:02:18.120' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2921, NULL, NULL, 1081, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:37.430' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2922, NULL, NULL, 1081, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:37.430' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2923, NULL, NULL, 1081, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:37.430' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2924, NULL, NULL, 1081, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:37.430' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2925, NULL, NULL, 1081, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:37.430' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2926, N'4C210001', N'1', 1081, 88, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2020-02-11T18:47:17.797' AS DateTime), CAST(N'2020-02-11T18:47:17.797' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2927, N'4C230001', N'1', 1081, 89, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2020-02-11T18:54:23.970' AS DateTime), CAST(N'2020-02-11T18:54:23.970' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2928, NULL, NULL, 1081, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:37.430' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2929, NULL, NULL, 1081, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:37.430' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2930, NULL, NULL, 1081, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:37.430' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2931, NULL, NULL, 1081, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:37.430' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2932, NULL, NULL, 1081, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:37.430' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2933, NULL, NULL, 1081, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:37.430' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2934, NULL, NULL, 1081, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:24:37.430' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2935, NULL, NULL, 1082, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:21.193' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2936, NULL, NULL, 1082, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:21.193' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2937, NULL, NULL, 1082, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:21.193' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2938, NULL, NULL, 1082, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:21.193' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2939, N'3F020001', N'1', 1082, 72, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1, NULL, NULL, 0, NULL, 0, CAST(N'2020-02-11T19:02:24.387' AS DateTime), CAST(N'2020-02-11T19:02:24.387' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2940, NULL, NULL, 1082, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:21.193' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2941, NULL, NULL, 1082, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:21.193' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2942, NULL, NULL, 1082, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:21.193' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2943, NULL, NULL, 1082, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:21.193' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2944, NULL, NULL, 1082, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:21.193' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2945, N'4C210001', N'1', 1082, 88, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2020-02-11T18:47:11.797' AS DateTime), CAST(N'2020-02-11T18:47:11.797' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2946, N'4C230001', N'1', 1082, 89, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2020-02-11T18:54:17.470' AS DateTime), CAST(N'2020-02-11T18:54:17.470' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2947, NULL, NULL, 1082, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:21.193' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2948, NULL, NULL, 1082, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:21.193' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2949, NULL, NULL, 1082, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:21.193' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2950, NULL, NULL, 1082, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:21.193' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2951, NULL, NULL, 1082, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:21.193' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2952, NULL, NULL, 1082, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:21.193' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2953, NULL, NULL, 1082, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:21.193' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2954, NULL, NULL, 1083, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:48.130' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2955, NULL, NULL, 1083, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:48.130' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2956, NULL, NULL, 1083, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:48.130' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2957, NULL, NULL, 1083, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:48.130' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2958, N'3F020001', N'1', 1083, 72, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1, NULL, NULL, 0, NULL, 0, CAST(N'2020-02-11T19:02:29.637' AS DateTime), CAST(N'2020-02-11T19:02:29.637' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2959, NULL, NULL, 1083, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:48.130' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2960, NULL, NULL, 1083, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:48.130' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2961, NULL, NULL, 1083, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:48.130' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2962, NULL, NULL, 1083, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:48.130' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2963, NULL, NULL, 1083, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:48.130' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2964, N'4C210001', N'1', 1083, 88, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2020-02-11T18:47:05.670' AS DateTime), CAST(N'2020-02-11T18:47:05.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2965, N'4C230001', N'1', 1083, 89, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2020-02-11T18:54:11.827' AS DateTime), CAST(N'2020-02-11T18:54:11.827' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2966, NULL, NULL, 1083, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:48.130' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2967, NULL, NULL, 1083, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:48.130' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2968, NULL, NULL, 1083, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:48.130' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2969, NULL, NULL, 1083, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:48.130' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2970, NULL, NULL, 1083, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:48.130' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2971, NULL, NULL, 1083, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:48.130' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2972, NULL, NULL, 1083, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:26:48.130' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2973, NULL, NULL, 1084, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:27:22.330' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2974, NULL, NULL, 1084, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:27:22.330' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2975, NULL, NULL, 1084, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:27:22.330' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2976, NULL, NULL, 1084, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:27:22.330' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2977, N'3F020001', N'1', 1084, 72, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1, NULL, NULL, 0, NULL, 0, CAST(N'2020-02-11T19:02:34.057' AS DateTime), CAST(N'2020-02-11T19:02:34.057' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2978, NULL, NULL, 1084, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:27:22.330' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2979, NULL, NULL, 1084, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:27:22.330' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2980, NULL, NULL, 1084, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:27:22.330' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2981, NULL, NULL, 1084, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:27:22.330' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2982, NULL, NULL, 1084, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:27:22.330' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2983, N'4C210001', N'1', 1084, 88, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2020-02-11T18:46:58.797' AS DateTime), CAST(N'2020-02-11T18:46:58.797' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2984, N'4C230001', N'1', 1084, 89, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2020-02-11T18:54:05.937' AS DateTime), CAST(N'2020-02-11T18:54:05.937' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2985, NULL, NULL, 1084, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:27:22.330' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2986, NULL, NULL, 1084, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:27:22.330' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2987, NULL, NULL, 1084, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:27:22.330' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2988, NULL, NULL, 1084, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:27:22.330' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2989, NULL, NULL, 1084, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:27:22.330' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2990, NULL, NULL, 1084, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:27:22.330' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2991, NULL, NULL, 1084, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:27:22.330' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2992, NULL, NULL, 1085, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:28:36.000' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2993, NULL, NULL, 1085, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:28:36.000' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2994, NULL, NULL, 1085, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:28:36.000' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2995, NULL, NULL, 1085, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:28:36.000' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2996, N'3F020001', N'1', 1085, 72, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1, NULL, NULL, 0, NULL, 0, CAST(N'2020-02-11T19:02:38.760' AS DateTime), CAST(N'2020-02-11T19:02:38.760' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2997, NULL, NULL, 1085, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:28:36.000' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2998, NULL, NULL, 1085, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:28:36.000' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (2999, NULL, NULL, 1085, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:28:36.000' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3000, NULL, NULL, 1085, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:28:36.000' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3001, NULL, NULL, 1085, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:28:36.000' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3002, N'4C210001', N'1', 1085, 88, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2020-02-11T18:46:51.857' AS DateTime), CAST(N'2020-02-11T18:46:51.857' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3003, N'4C230001', N'1', 1085, 89, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2020-02-11T18:53:59.220' AS DateTime), CAST(N'2020-02-11T18:53:59.220' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3004, NULL, NULL, 1085, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:28:36.000' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3005, NULL, NULL, 1085, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:28:36.000' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3006, NULL, NULL, 1085, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:28:36.000' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3007, NULL, NULL, 1085, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:28:36.000' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3008, NULL, NULL, 1085, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:28:36.000' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3009, NULL, NULL, 1085, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:28:36.000' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3010, NULL, NULL, 1085, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T17:28:36.000' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3011, NULL, NULL, 1086, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:07.537' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3012, NULL, NULL, 1086, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:07.537' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3013, NULL, NULL, 1086, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:07.537' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3014, NULL, NULL, 1086, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:07.537' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3015, N'3F020001', N'1', 1086, 72, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1, NULL, NULL, 0, NULL, 0, CAST(N'2020-02-11T19:02:42.650' AS DateTime), CAST(N'2020-02-11T19:02:42.650' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3016, NULL, NULL, 1086, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:07.537' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3017, NULL, NULL, 1086, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:07.537' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3018, NULL, NULL, 1086, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:07.537' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3019, NULL, NULL, 1086, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:07.537' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3020, NULL, NULL, 1086, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:07.537' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3021, NULL, NULL, 1086, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:07.537' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3022, NULL, NULL, 1086, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:07.537' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3023, N'4C220001', N'1', 1086, 90, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2020-02-11T18:56:24.090' AS DateTime), CAST(N'2020-02-11T18:56:24.090' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3024, NULL, NULL, 1086, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:07.537' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3025, NULL, NULL, 1086, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:07.537' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3026, NULL, NULL, 1086, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:07.537' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3027, NULL, NULL, 1086, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:07.537' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3028, NULL, NULL, 1086, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:07.537' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3029, NULL, NULL, 1086, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:07.537' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3030, NULL, NULL, 1087, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:31.033' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3031, NULL, NULL, 1087, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:31.033' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3032, NULL, NULL, 1087, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:31.033' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3033, NULL, NULL, 1087, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:31.033' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3034, N'3F020001', N'1', 1087, 72, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1, NULL, NULL, 0, NULL, 0, CAST(N'2020-02-11T19:02:46.917' AS DateTime), CAST(N'2020-02-11T19:02:46.917' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3035, NULL, NULL, 1087, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:31.033' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3036, NULL, NULL, 1087, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:31.033' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3037, NULL, NULL, 1087, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:31.033' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3038, NULL, NULL, 1087, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:31.033' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3039, NULL, NULL, 1087, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:31.033' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3040, NULL, NULL, 1087, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:31.033' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3041, NULL, NULL, 1087, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:31.033' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3042, N'4C220001', N'1', 1087, 90, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2020-02-11T18:56:17.717' AS DateTime), CAST(N'2020-02-11T18:56:17.717' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3043, NULL, NULL, 1087, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:31.033' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3044, NULL, NULL, 1087, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:31.033' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3045, NULL, NULL, 1087, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:31.033' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3046, NULL, NULL, 1087, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:31.033' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3047, NULL, NULL, 1087, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:31.033' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3048, NULL, NULL, 1087, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:31.033' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3049, NULL, NULL, 1088, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:54.317' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3050, NULL, NULL, 1088, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:54.317' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3051, NULL, NULL, 1088, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:54.317' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3052, NULL, NULL, 1088, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:54.317' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3053, N'3F020001', N'1', 1088, 72, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1, NULL, NULL, 0, NULL, 0, CAST(N'2020-02-11T19:02:51.683' AS DateTime), CAST(N'2020-02-11T19:02:51.683' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3054, NULL, NULL, 1088, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:54.317' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3055, NULL, NULL, 1088, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:54.317' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3056, NULL, NULL, 1088, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:54.317' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3057, NULL, NULL, 1088, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:54.317' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3058, NULL, NULL, 1088, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:54.317' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3059, NULL, NULL, 1088, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:54.317' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3060, NULL, NULL, 1088, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:54.317' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3061, N'4C220001', N'1', 1088, 90, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2020-02-11T18:56:11.903' AS DateTime), CAST(N'2020-02-11T18:56:11.903' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3062, NULL, NULL, 1088, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:54.317' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3063, NULL, NULL, 1088, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:54.317' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3064, NULL, NULL, 1088, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:54.317' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3065, NULL, NULL, 1088, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:54.317' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3066, NULL, NULL, 1088, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:54.317' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3067, NULL, NULL, 1088, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:02:54.317' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3068, NULL, NULL, 1089, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:11.550' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3069, NULL, NULL, 1089, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:11.550' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3070, NULL, NULL, 1089, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:11.550' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3071, NULL, NULL, 1089, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:11.550' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3072, N'3F020001', N'1', 1089, 72, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1, NULL, NULL, 0, NULL, 0, CAST(N'2020-02-11T19:03:14.243' AS DateTime), CAST(N'2020-02-11T19:03:14.243' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3073, NULL, NULL, 1089, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:11.550' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3074, NULL, NULL, 1089, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:11.550' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3075, NULL, NULL, 1089, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:11.550' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3076, NULL, NULL, 1089, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:11.550' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3077, NULL, NULL, 1089, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:11.550' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3078, NULL, NULL, 1089, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:11.550' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3079, NULL, NULL, 1089, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:11.550' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3080, N'4C220001', N'1', 1089, 90, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2020-02-11T18:56:06.607' AS DateTime), CAST(N'2020-02-11T18:56:06.607' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3081, NULL, NULL, 1089, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:11.550' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3082, NULL, NULL, 1089, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:11.550' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3083, NULL, NULL, 1089, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:11.550' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3084, NULL, NULL, 1089, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:11.550' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3085, NULL, NULL, 1089, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:11.550' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3086, NULL, NULL, 1089, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:11.550' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3087, NULL, NULL, 1090, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:32.860' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3088, NULL, NULL, 1090, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:32.860' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3089, NULL, NULL, 1090, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:32.860' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3090, NULL, NULL, 1090, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:32.860' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3091, N'3F020001', N'1', 1090, 72, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1, NULL, NULL, 0, NULL, 0, CAST(N'2020-02-11T19:03:18.887' AS DateTime), CAST(N'2020-02-11T19:03:18.887' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3092, NULL, NULL, 1090, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:32.860' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3093, NULL, NULL, 1090, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:32.860' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3094, NULL, NULL, 1090, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:32.860' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3095, NULL, NULL, 1090, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:32.860' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3096, NULL, NULL, 1090, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:32.860' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3097, NULL, NULL, 1090, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:32.860' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3098, NULL, NULL, 1090, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:32.860' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3099, N'4C220001', N'1', 1090, 90, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2020-02-11T18:56:00.653' AS DateTime), CAST(N'2020-02-11T18:56:00.653' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3100, NULL, NULL, 1090, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:32.860' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3101, NULL, NULL, 1090, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:32.860' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3102, NULL, NULL, 1090, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:32.860' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3103, NULL, NULL, 1090, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:32.860' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3104, NULL, NULL, 1090, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:32.860' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3105, NULL, NULL, 1090, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:32.860' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3106, NULL, NULL, 1091, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:51.797' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3107, NULL, NULL, 1091, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:51.797' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3108, NULL, NULL, 1091, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:51.797' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3109, NULL, NULL, 1091, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:51.797' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3110, N'3F020001', N'1', 1091, 72, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), 1, NULL, 1, NULL, 1, NULL, NULL, 0, NULL, 0, CAST(N'2020-02-11T19:03:23.447' AS DateTime), CAST(N'2020-02-11T19:03:23.447' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3111, NULL, NULL, 1091, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:51.797' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3112, NULL, NULL, 1091, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:51.797' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3113, NULL, NULL, 1091, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:51.797' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3114, NULL, NULL, 1091, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:51.797' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3115, NULL, NULL, 1091, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:51.797' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3116, NULL, NULL, 1091, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:51.797' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3117, NULL, NULL, 1091, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:51.797' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3118, N'4C220001', N'1', 1091, 90, NULL, NULL, NULL, CAST(N'2020-02-29T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, CAST(N'2020-02-11T18:55:54.687' AS DateTime), CAST(N'2020-02-11T18:55:54.687' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3119, NULL, NULL, 1091, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:51.797' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3120, NULL, NULL, 1091, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:51.797' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3121, NULL, NULL, 1091, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:51.797' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3122, NULL, NULL, 1091, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:51.797' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3123, NULL, NULL, 1091, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:51.797' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3124, NULL, NULL, 1091, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-11T18:03:51.797' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3526, NULL, NULL, 1101, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-18T10:17:24.223' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3527, NULL, NULL, 1101, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-18T10:17:24.223' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3528, NULL, NULL, 1101, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-18T10:17:24.223' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3529, NULL, NULL, 1101, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-18T10:17:24.223' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3530, NULL, NULL, 1101, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-18T10:17:24.223' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3531, NULL, NULL, 1101, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-18T10:17:24.223' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3532, NULL, NULL, 1101, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-18T10:17:24.223' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3533, NULL, NULL, 1101, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-18T10:17:24.223' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3534, NULL, NULL, 1101, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-18T10:17:24.223' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3535, NULL, NULL, 1101, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-18T10:17:24.223' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3536, NULL, NULL, 1101, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-18T10:17:24.223' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3537, NULL, NULL, 1101, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-18T10:17:24.223' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3538, NULL, NULL, 1101, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-18T10:17:24.223' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3539, NULL, NULL, 1101, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-18T10:17:24.223' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3540, NULL, NULL, 1101, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-18T10:17:24.223' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3541, NULL, NULL, 1101, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-18T10:17:24.223' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3542, N'3F010001', N'247', 1101, 54, NULL, NULL, 3, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(N'2020-02-18T10:19:01.163' AS DateTime), CAST(N'2020-02-18T10:19:01.163' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3543, NULL, NULL, 1101, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-18T10:17:24.223' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (3544, NULL, NULL, 1101, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-02-18T10:17:24.223' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4219, NULL, NULL, 1069, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:46:58.157' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4220, NULL, NULL, 1089, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:46:58.157' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4221, NULL, NULL, 1088, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:46:58.157' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4222, NULL, NULL, 1087, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:46:58.157' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4223, NULL, NULL, 1086, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:46:58.157' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4224, NULL, NULL, 1085, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:46:58.157' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4225, NULL, NULL, 1084, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:46:58.157' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4226, NULL, NULL, 1083, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:46:58.157' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4227, NULL, NULL, 1082, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:46:58.157' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4228, NULL, NULL, 1081, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:46:58.157' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4229, NULL, NULL, 1090, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:46:58.157' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4230, NULL, NULL, 1080, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:46:58.157' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4231, NULL, NULL, 1078, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:46:58.157' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4232, NULL, NULL, 1077, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:46:58.157' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4233, NULL, NULL, 1076, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:46:58.157' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4234, NULL, NULL, 1075, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:46:58.157' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4235, NULL, NULL, 1074, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:46:58.157' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4236, NULL, NULL, 1073, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:46:58.157' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4237, NULL, NULL, 1072, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:46:58.157' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4238, NULL, NULL, 1071, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:46:58.157' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4239, NULL, NULL, 1070, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:46:58.157' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4240, NULL, NULL, 1079, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:46:58.157' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4241, NULL, NULL, 1091, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:46:58.157' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4242, NULL, NULL, 1069, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:15.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4243, NULL, NULL, 1089, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:15.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4244, NULL, NULL, 1088, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:15.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4245, NULL, NULL, 1087, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:15.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4246, NULL, NULL, 1086, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:15.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4247, NULL, NULL, 1085, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:15.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4248, NULL, NULL, 1084, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:15.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4249, NULL, NULL, 1083, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:15.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4250, NULL, NULL, 1082, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:15.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4251, NULL, NULL, 1081, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:15.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4252, NULL, NULL, 1090, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:15.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4253, NULL, NULL, 1080, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:15.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4254, NULL, NULL, 1078, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:15.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4255, NULL, NULL, 1077, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:15.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4256, NULL, NULL, 1076, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:15.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4257, NULL, NULL, 1075, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:15.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4258, NULL, NULL, 1074, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:15.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4259, NULL, NULL, 1073, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:15.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4260, NULL, NULL, 1072, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:15.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4261, NULL, NULL, 1071, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:15.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4262, NULL, NULL, 1070, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:15.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4263, NULL, NULL, 1079, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:15.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4264, NULL, NULL, 1091, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:15.670' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4265, NULL, NULL, 1112, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:59.753' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4266, NULL, NULL, 1112, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:59.753' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4267, NULL, NULL, 1112, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:59.753' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4268, NULL, NULL, 1112, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:59.753' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4269, NULL, NULL, 1112, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:59.753' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4270, NULL, NULL, 1112, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:59.753' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4271, NULL, NULL, 1112, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:59.753' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4272, NULL, NULL, 1112, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:59.753' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4273, NULL, NULL, 1112, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:59.753' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4274, NULL, NULL, 1112, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:59.753' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4275, N'1GR00010002', N'247', 1112, 119, NULL, NULL, 5, CAST(N'2020-03-17T00:00:00.000' AS DateTime), NULL, NULL, 1, 1, 1, NULL, NULL, NULL, 0, 0, NULL, NULL, CAST(N'2020-03-05T11:49:52.237' AS DateTime), CAST(N'2020-03-05T11:49:52.237' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4276, NULL, NULL, 1112, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:59.753' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4277, NULL, NULL, 1112, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:59.753' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4278, NULL, NULL, 1112, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:59.753' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4279, NULL, NULL, 1112, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:59.753' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4280, NULL, NULL, 1112, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:59.753' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4281, NULL, NULL, 1112, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:59.753' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4282, NULL, NULL, 1112, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:59.753' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4283, NULL, NULL, 1112, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:59.753' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4284, NULL, NULL, 1112, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:59.753' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment]) VALUES (4285, NULL, NULL, 1112, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-03-05T11:47:59.753' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[KPILevels] OFF
GO
SET IDENTITY_INSERT [dbo].[KPIs] ON 
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit]) VALUES (1069, N'Abnormal W.H. rate', N'0001', 0, CAST(N'2020-02-11T17:06:52.853' AS DateTime), NULL, NULL, 0, 1)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit]) VALUES (1070, N'Confirming max production capacity', N'0001', 0, CAST(N'2020-02-11T17:08:11.523' AS DateTime), NULL, NULL, 0, 1)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit]) VALUES (1071, N'Production target achievement rate', N'0001', 0, CAST(N'2020-02-11T17:08:45.600' AS DateTime), NULL, NULL, 0, 1)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit]) VALUES (1072, N'Performance target achievement rate', N'0001', 0, CAST(N'2020-02-11T17:09:45.487' AS DateTime), NULL, NULL, 0, 1)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit]) VALUES (1073, N'Achievement rate of IE W.H.', N'0001', 0, CAST(N'2020-02-11T17:10:31.720' AS DateTime), NULL, NULL, 0, 1)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit]) VALUES (1074, N'Model efficiency +/- VA achievement rate', N'0001', 0, CAST(N'2020-02-11T17:12:02.843' AS DateTime), NULL, NULL, 0, 1)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit]) VALUES (1075, N'The ratio of abnormal expense', N'0001', 0, CAST(N'2020-02-11T17:14:08.997' AS DateTime), NULL, NULL, 0, 1)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit]) VALUES (1076, N'The ratio of consumption expense', N'0001', 0, CAST(N'2020-02-11T17:15:33.743' AS DateTime), NULL, NULL, 0, 1)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit]) VALUES (1077, N'The ratio of material cost (5% less than planning cost)', N'0001', 0, CAST(N'2020-02-11T17:18:45.347' AS DateTime), NULL, NULL, 0, 1)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit]) VALUES (1078, N'Indirect and indirect staff ratio at the end of the month', N'0001', 0, CAST(N'2020-02-11T17:21:58.653' AS DateTime), NULL, NULL, 0, 2)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit]) VALUES (1079, N'Indirect and indirect staff ratio at the end of the month (excluded DEV.)', N'0001', 0, CAST(N'2020-02-11T17:23:07.463' AS DateTime), NULL, NULL, 0, 2)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit]) VALUES (1080, N'System audit - MES', N'0001', 0, CAST(N'2020-02-11T17:24:22.367' AS DateTime), NULL, NULL, 0, 2)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit]) VALUES (1081, N'System audit - 4M', N'0001', 0, CAST(N'2020-02-11T17:24:37.413' AS DateTime), NULL, NULL, 0, 2)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit]) VALUES (1082, N'System audit - production report', N'0001', 0, CAST(N'2020-02-11T17:26:21.147' AS DateTime), NULL, NULL, 0, 2)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit]) VALUES (1083, N'System audit - T1/T3', N'0001', 0, CAST(N'2020-02-11T17:26:48.113' AS DateTime), NULL, NULL, 0, 2)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit]) VALUES (1084, N'System audit - MPS', N'0001', 0, CAST(N'2020-02-11T17:27:22.317' AS DateTime), NULL, NULL, 0, 2)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit]) VALUES (1085, N'System audit - DWMS', N'0001', 0, CAST(N'2020-02-11T17:28:36.000' AS DateTime), NULL, NULL, 0, 2)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit]) VALUES (1086, N'Quality of People Development', N'0001', 0, CAST(N'2020-02-11T18:02:07.520' AS DateTime), NULL, NULL, 0, 2)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit]) VALUES (1087, N'Robust Organization Development', N'0001', 0, CAST(N'2020-02-11T18:02:31.017' AS DateTime), NULL, NULL, 0, 2)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit]) VALUES (1088, N'Required Training Completion', N'0001', 0, CAST(N'2020-02-11T18:02:54.300' AS DateTime), NULL, NULL, 0, 2)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit]) VALUES (1089, N'Quality of Performance Management', N'0001', 0, CAST(N'2020-02-11T18:03:11.533' AS DateTime), NULL, NULL, 0, 2)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit]) VALUES (1090, N'Turnover Rate of Newcomer within 90 days ', N'0001', 0, CAST(N'2020-02-11T18:03:32.847' AS DateTime), NULL, NULL, 0, 2)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit]) VALUES (1091, N'Annual Turnover Rate of Normal employees', N'0001', 0, CAST(N'2020-02-11T18:03:51.797' AS DateTime), NULL, NULL, 0, 2)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit]) VALUES (1112, N'Demo KPI English', N'0002', 1, CAST(N'2020-03-05T11:47:59.730' AS DateTime), NULL, N'0002', 0, 1)
GO
SET IDENTITY_INSERT [dbo].[KPIs] OFF
GO
SET IDENTITY_INSERT [dbo].[LateOnUpLoads] ON 
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (1, 17, 4297, N'SSB->Division II->SHC->Production Center', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'4C110009', N'Monthly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (2, 17, 4297, N'SSB->Division II->SHC->Production Center', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'4C110009', N'Quarterly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (3, 17, 4297, N'SSB->Division II->SHC->Production Center', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'4C110009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (4, 17, 4297, N'SSB->Division II->SHC->Production Center', N'12/20/2019 12:00:00 AM', N'目標達成率', N'4C110004', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (5, 17, 4297, N'SSB->Division II->SHC', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'3F010009', N'Monthly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (6, 17, 4297, N'SSB->Division II->SHC', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'3F010009', N'Quarterly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (7, 17, 4297, N'SSB->Division II->SHC', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'3F010009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (8, 16, 4298, N'SSB->Division II->SHC', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'3F010009', N'Monthly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (9, 16, 4298, N'SSB->Division II->SHC', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'3F010009', N'Quarterly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (10, 16, 4298, N'SSB->Division II->SHC', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'3F010009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (11, 16, 4298, N'SSB->Division II->SHC->Production Center', N'12/20/2019 12:00:00 AM', N'目標達成率', N'4C110004', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (12, 16, 4298, N'SSB->Division II->SHC->Production Center', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'4C110009', N'Monthly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (13, 16, 4298, N'SSB->Division II->SHC->Production Center', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'4C110009', N'Quarterly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (14, 16, 4298, N'SSB->Division II->SHC->Production Center', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'4C110009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (15, 16, 4302, N'SSB->Division II->SHC->Production Center', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'4C110009', N'Monthly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (16, 16, 4302, N'SSB->Division II->SHC->Production Center', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'4C110009', N'Quarterly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (17, 16, 4302, N'SSB->Division II->SHC->Production Center', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'4C110009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (18, 16, 4302, N'SSB->Division II->SHC->Production Center', N'12/20/2019 12:00:00 AM', N'目標達成率', N'4C110004', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (19, 16, 4302, N'SSB->Division II->SHC', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'3F010009', N'Monthly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (20, 16, 4302, N'SSB->Division II->SHC', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'3F010009', N'Quarterly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (21, 16, 4302, N'SSB->Division II->SHC', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'3F010009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (22, 16, 4317, N'SSB->Division II->SHC->Production Center', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'4C110009', N'Monthly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (23, 16, 4317, N'SSB->Division II->SHC->Production Center', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'4C110009', N'Quarterly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (24, 16, 4317, N'SSB->Division II->SHC->Production Center', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'4C110009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (25, 16, 4317, N'SSB->Division II->SHC->Production Center', N'12/20/2019 12:00:00 AM', N'目標達成率', N'4C110004', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (26, 16, 4317, N'SSB->Division II->SHC', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'3F010009', N'Monthly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (27, 16, 4317, N'SSB->Division II->SHC', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'3F010009', N'Quarterly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (28, 16, 4317, N'SSB->Division II->SHC', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'3F010009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (29, 16, 4324, N'SSB->Division II->SHC->Production Center', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'4C110009', N'Monthly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (30, 16, 4324, N'SSB->Division II->SHC->Production Center', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'4C110009', N'Quarterly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (31, 16, 4324, N'SSB->Division II->SHC->Production Center', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'4C110009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (32, 16, 4324, N'SSB->Division II->SHC->Production Center', N'12/20/2019 12:00:00 AM', N'目標達成率', N'4C110004', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (33, 16, 4324, N'SSB->Division II->SHC', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'3F010009', N'Monthly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (34, 16, 4324, N'SSB->Division II->SHC', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'3F010009', N'Quarterly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (35, 16, 4324, N'SSB->Division II->SHC', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'3F010009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (36, 1, 4326, N'SSB->Division II->SHC->Production Center', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'4C110009', N'Monthly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (37, 1, 4326, N'SSB->Division II->SHC->Production Center', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'4C110009', N'Quarterly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (38, 1, 4326, N'SSB->Division II->SHC->Production Center', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'4C110009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (39, 1, 4326, N'SSB->Division II->SHC->Production Center', N'12/20/2019 12:00:00 AM', N'目標達成率', N'4C110004', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (40, 1, 4326, N'SSB->Division II->SHC', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'3F010009', N'Monthly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (41, 1, 4326, N'SSB->Division II->SHC', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'3F010009', N'Quarterly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (42, 1, 4326, N'SSB->Division II->SHC', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'3F010009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (43, 16, 4345, N'SSB->Division II->SHC->Production Center', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'4C110009', N'Monthly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (44, 16, 4345, N'SSB->Division II->SHC->Production Center', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'4C110009', N'Quarterly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (45, 16, 4345, N'SSB->Division II->SHC->Production Center', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'4C110009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (46, 16, 4345, N'SSB->Division II->SHC->Production Center', N'12/20/2019 12:00:00 AM', N'目標達成率', N'4C110004', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (47, 16, 4345, N'SSB->Division II->SHC', N'12/16/2019 12:00:00 AM', N'全廠IE工時達成率', N'3F010009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (48, 1, 4347, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Monthly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (49, 1, 4347, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Quarterly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (50, 1, 4347, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (51, 1, 4347, N'SSB->Division II->SHC->Production Center', N'Friday, 20 December 2019', N'目標達成率', N'4C110004', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (52, 1, 4347, N'SSB->Division II->SHC', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'3F010009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (53, 17, 4349, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Monthly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (54, 17, 4349, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Quarterly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (55, 17, 4349, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (56, 17, 4349, N'SSB->Division II->SHC->Production Center', N'Friday, 20 December 2019', N'目標達成率', N'4C110004', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (57, 17, 4349, N'SSB->Division II->SHC', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'3F010009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (58, 15, 4349, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Monthly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (59, 15, 4349, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Quarterly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (60, 15, 4349, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (61, 15, 4349, N'SSB->Division II->SHC->Production Center', N'Friday, 20 December 2019', N'目標達成率', N'4C110004', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (62, 15, 4349, N'SSB->Division II->SHC', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'3F010009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (63, 16, 4349, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Monthly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (64, 16, 4349, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Quarterly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (65, 16, 4349, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (66, 16, 4349, N'SSB->Division II->SHC->Production Center', N'Friday, 20 December 2019', N'目標達成率', N'4C110004', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (67, 16, 4349, N'SSB->Division II->SHC', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'3F010009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (68, 17, 4351, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Monthly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (69, 17, 4351, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Quarterly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (70, 17, 4351, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (71, 17, 4351, N'SSB->Division II->SHC->Production Center', N'Friday, 20 December 2019', N'目標達成率', N'4C110004', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (72, 17, 4351, N'SSB->Division II->SHC', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'3F010009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (73, 15, 4351, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Monthly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (74, 15, 4351, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Quarterly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (75, 15, 4351, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (76, 15, 4351, N'SSB->Division II->SHC->Production Center', N'Friday, 20 December 2019', N'目標達成率', N'4C110004', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (77, 15, 4351, N'SSB->Division II->SHC', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'3F010009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (78, 16, 4351, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Monthly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (79, 16, 4351, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Quarterly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (80, 16, 4351, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (81, 16, 4351, N'SSB->Division II->SHC->Production Center', N'Friday, 20 December 2019', N'目標達成率', N'4C110004', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (82, 16, 4351, N'SSB->Division II->SHC', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'3F010009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (83, 17, 4361, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Monthly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (84, 17, 4361, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Quarterly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (85, 17, 4361, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (86, 17, 4361, N'SSB->Division II->SHC->Production Center', N'Friday, 20 December 2019', N'目標達成率', N'4C110004', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (87, 17, 4361, N'SSB->Division II->SHC', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'3F010009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (88, 15, 4361, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Monthly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (89, 15, 4361, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Quarterly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (90, 15, 4361, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (91, 15, 4361, N'SSB->Division II->SHC->Production Center', N'Friday, 20 December 2019', N'目標達成率', N'4C110004', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (92, 15, 4361, N'SSB->Division II->SHC', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'3F010009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (93, 16, 4361, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Monthly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (94, 16, 4361, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Quarterly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (95, 16, 4361, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (96, 16, 4361, N'SSB->Division II->SHC->Production Center', N'Friday, 20 December 2019', N'目標達成率', N'4C110004', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (97, 16, 4361, N'SSB->Division II->SHC', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'3F010009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (98, 17, 4365, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Monthly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (99, 17, 4365, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Quarterly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (100, 17, 4365, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (101, 17, 4365, N'SSB->Division II->SHC->Production Center', N'Friday, 20 December 2019', N'目標達成率', N'4C110004', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (102, 17, 4365, N'SSB->Division II->SHC', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'3F010009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (103, 15, 4365, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Monthly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (104, 15, 4365, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Quarterly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (105, 15, 4365, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (106, 15, 4365, N'SSB->Division II->SHC->Production Center', N'Friday, 20 December 2019', N'目標達成率', N'4C110004', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (107, 15, 4365, N'SSB->Division II->SHC', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'3F010009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (108, 16, 4365, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Monthly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (109, 16, 4365, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Quarterly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (110, 16, 4365, N'SSB->Division II->SHC->Production Center', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'4C110009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (111, 16, 4365, N'SSB->Division II->SHC->Production Center', N'Friday, 20 December 2019', N'目標達成率', N'4C110004', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (112, 16, 4365, N'SSB->Division II->SHC', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'3F010009', N'Yearly')
GO
INSERT [dbo].[LateOnUpLoads] ([ID], [UserID], [NotificationID], [Area], [DeadLine], [KPIName], [Code], [Year]) VALUES (113, 17, 4277, N'SSB->Division II->SHC', N'Monday, 16 December 2019', N'全廠IE工時達成率', N'3F010009', N'Yearly')
GO
SET IDENTITY_INSERT [dbo].[LateOnUpLoads] OFF
GO
SET IDENTITY_INSERT [dbo].[Levels] ON 
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime]) VALUES (52, N'SSB', N'GO1', 0, NULL, 1, 0, CAST(N'2019-07-23T14:45:46.473' AS DateTime))
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime]) VALUES (53, N'Division II', N'D01', 52, NULL, 2, 0, CAST(N'2019-07-23T15:08:47.990' AS DateTime))
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime]) VALUES (54, N'SHC', N'F01', 53, NULL, 3, 0, CAST(N'2019-07-23T15:09:41.590' AS DateTime))
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime]) VALUES (55, N'Production Center', N'C11', 54, NULL, 4, 0, CAST(N'2019-07-23T15:11:30.777' AS DateTime))
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime]) VALUES (72, N'CB', N'F02', 53, NULL, 3, 0, CAST(N'2019-08-24T14:07:34.463' AS DateTime))
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime]) VALUES (73, N'SPC', N'F03', 53, NULL, 3, 0, CAST(N'2019-09-09T14:47:40.453' AS DateTime))
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime]) VALUES (74, N'SYF', N'F04', 53, NULL, 3, 0, CAST(N'2019-09-09T14:47:57.330' AS DateTime))
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime]) VALUES (83, N'Administration Center', N'C12', 54, NULL, 4, 0, CAST(N'2019-10-21T16:02:10.317' AS DateTime))
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime]) VALUES (86, N'Operation Center ', N'C13', 54, NULL, 4, 0, CAST(N'2019-10-25T16:19:13.273' AS DateTime))
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime]) VALUES (87, N'Development Center', N'C14', 54, NULL, 4, 0, CAST(N'2019-10-25T16:19:30.207' AS DateTime))
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime]) VALUES (88, N'Production Center', N'C21', 72, NULL, 4, 0, CAST(N'2019-10-31T18:45:28.197' AS DateTime))
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime]) VALUES (89, N'Operation Center ', N'C23', 72, NULL, 4, 0, CAST(N'2019-10-31T18:48:46.680' AS DateTime))
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime]) VALUES (90, N'Administration Center', N'C22', 72, NULL, 4, 0, CAST(N'2019-10-31T18:49:22.853' AS DateTime))
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime]) VALUES (92, N'Operation Center', N'CE0001', 73, NULL, 4, 0, CAST(N'2019-11-29T12:15:02.257' AS DateTime))
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime]) VALUES (93, N'Production Center', N'CE0001', 73, NULL, 4, 0, CAST(N'2019-11-29T12:15:28.803' AS DateTime))
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime]) VALUES (94, N'Administration Center', N'CE0001', 73, NULL, 4, 0, CAST(N'2019-11-29T12:16:16.820' AS DateTime))
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime]) VALUES (95, N'Operation Center', N'CE0001', 74, NULL, 4, 0, CAST(N'2019-11-29T12:17:26.363' AS DateTime))
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime]) VALUES (96, N'Production Center', N'CE0001', 74, NULL, 4, 0, CAST(N'2019-11-29T12:17:32.217' AS DateTime))
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime]) VALUES (97, N'Administration Center', N'CE0001', 74, NULL, 4, 0, CAST(N'2019-11-29T12:17:37.340' AS DateTime))
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime]) VALUES (119, N'SSB2', N'GR0001', 0, NULL, 1, 0, CAST(N'2020-03-05T11:46:58.120' AS DateTime))
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime]) VALUES (120, N'SSB2.1', N'DI0001', 119, NULL, 2, 0, CAST(N'2020-03-05T11:47:15.660' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Levels] OFF
GO
SET IDENTITY_INSERT [dbo].[Managers] ON 
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (15, 7, 273, NULL, NULL, CAST(N'2019-10-14T15:27:36.067' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (16, 6, 273, NULL, NULL, CAST(N'2019-10-14T15:33:04.240' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (19, 5, 284, NULL, NULL, CAST(N'2019-10-15T13:45:24.817' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (20, 5, 273, NULL, NULL, CAST(N'2019-10-15T13:45:39.833' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (21, 5, 262, NULL, NULL, CAST(N'2019-10-15T13:45:59.153' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (35, 5, 229, NULL, NULL, CAST(N'2019-10-16T07:47:17.117' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (1061, 13, 1564, NULL, NULL, CAST(N'2019-11-06T10:14:55.567' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (1062, 13, 1500, NULL, NULL, CAST(N'2019-11-06T11:07:45.533' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2061, 14, 1564, NULL, NULL, CAST(N'2019-11-06T11:46:20.483' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2062, 14, 1488, NULL, NULL, CAST(N'2019-11-06T11:47:40.853' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2063, 14, 1428, NULL, NULL, CAST(N'2019-11-06T11:47:52.487' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2064, 13, 285, NULL, NULL, CAST(N'2019-11-08T11:29:55.807' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2081, 14, 1541, NULL, NULL, CAST(N'2019-12-03T16:37:39.847' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2082, 14, 1542, NULL, NULL, CAST(N'2019-12-03T16:37:41.877' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2083, 14, 1543, NULL, NULL, CAST(N'2019-12-03T16:37:44.567' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2084, 14, 1544, NULL, NULL, CAST(N'2019-12-03T16:37:47.530' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2088, 14, 1560, NULL, NULL, CAST(N'2019-12-03T16:43:02.607' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2091, 14, 1576, NULL, NULL, CAST(N'2019-12-03T16:46:19.487' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2097, 13, 1623, NULL, NULL, CAST(N'2019-12-03T17:08:55.357' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2098, 13, 1624, NULL, NULL, CAST(N'2019-12-03T17:08:57.633' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2101, 10, 1625, NULL, NULL, CAST(N'2019-12-03T17:09:36.770' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2103, 10, 1624, NULL, NULL, CAST(N'2019-12-03T17:17:31.077' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2107, 13, 1625, NULL, NULL, CAST(N'2019-12-03T17:18:11.443' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2108, 13, 1626, NULL, NULL, CAST(N'2019-12-03T17:18:26.387' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2109, 13, 1629, NULL, NULL, CAST(N'2019-12-03T17:18:39.427' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2111, 11, 1428, NULL, NULL, CAST(N'2019-12-03T18:34:52.913' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2113, 11, 274, NULL, NULL, CAST(N'2019-12-03T18:35:10.720' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2114, 11, 263, NULL, NULL, CAST(N'2019-12-03T18:35:14.497' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2116, 11, 241, NULL, NULL, CAST(N'2019-12-03T18:35:19.070' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2117, 11, 230, NULL, NULL, CAST(N'2019-12-03T18:35:23.967' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4073, 10, 1623, NULL, NULL, CAST(N'2019-12-07T07:33:33.907' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4075, 9, 284, NULL, NULL, CAST(N'2019-12-07T10:01:52.330' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4076, 9, 1415, NULL, NULL, CAST(N'2019-12-07T10:02:38.490' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4078, 8, 240, NULL, NULL, CAST(N'2019-12-07T10:04:55.250' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4096, 9, 251, NULL, NULL, CAST(N'2019-12-07T12:04:24.800' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4104, 5, 251, NULL, NULL, CAST(N'2019-12-07T13:30:18.577' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4105, 8, 284, NULL, NULL, CAST(N'2019-12-09T18:30:48.747' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4106, 8, 273, NULL, NULL, CAST(N'2019-12-09T18:31:11.167' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4107, 8, 262, NULL, NULL, CAST(N'2019-12-09T18:31:28.737' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4109, 8, 1427, NULL, NULL, CAST(N'2019-12-09T18:33:07.840' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4111, 6, 1439, NULL, NULL, CAST(N'2019-12-09T18:34:17.367' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4112, 6, 1427, NULL, NULL, CAST(N'2019-12-09T18:34:34.337' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4114, 6, 1451, NULL, NULL, CAST(N'2019-12-09T18:37:03.047' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4115, 6, 1379, NULL, NULL, CAST(N'2019-12-09T18:37:38.107' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4116, 6, 1367, NULL, NULL, CAST(N'2019-12-09T18:37:56.930' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4117, 6, 1403, NULL, NULL, CAST(N'2019-12-09T18:38:35.037' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4118, 6, 1391, NULL, NULL, CAST(N'2019-12-09T18:38:50.817' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4119, 5, 1563, NULL, NULL, CAST(N'2019-12-09T18:41:15.497' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4120, 5, 1547, NULL, NULL, CAST(N'2019-12-09T18:41:34.723' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4122, 5, 1499, NULL, NULL, CAST(N'2019-12-09T18:42:14.840' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4123, 5, 1487, NULL, NULL, CAST(N'2019-12-09T18:42:36.270' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4124, 5, 1475, NULL, NULL, CAST(N'2019-12-09T18:42:51.720' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4125, 5, 1463, NULL, NULL, CAST(N'2019-12-09T18:42:56.433' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4128, 10, 1627, NULL, NULL, CAST(N'2019-12-09T18:45:04.520' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4136, 13, 1630, NULL, NULL, CAST(N'2019-12-10T08:38:56.050' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4137, 10, 1629, NULL, NULL, CAST(N'2019-12-10T08:39:26.490' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4138, 13, 1627, NULL, NULL, CAST(N'2019-12-10T08:42:42.893' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4139, 11, 252, NULL, NULL, CAST(N'2019-12-17T14:46:08.803' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4140, 11, 285, NULL, NULL, CAST(N'2019-12-17T14:46:13.270' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4142, 8, 1487, NULL, NULL, CAST(N'2020-01-15T10:16:37.883' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4145, 8, 1544, NULL, NULL, CAST(N'2020-01-15T10:58:04.217' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4146, 8, 1547, NULL, NULL, CAST(N'2020-01-15T11:15:30.277' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4149, 8, 3249, NULL, NULL, CAST(N'2020-02-05T16:22:47.973' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4189, 32, 0, NULL, NULL, CAST(N'2020-02-08T16:11:55.120' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4191, 32, 3292, NULL, NULL, CAST(N'2020-02-08T16:23:37.637' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4192, 14, 3312, NULL, NULL, CAST(N'2020-02-10T10:56:03.450' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4195, 32, 3312, NULL, NULL, CAST(N'2020-02-11T12:28:45.437' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4199, 32, 3254, NULL, NULL, CAST(N'2020-02-11T15:26:06.077' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4200, 8, 229, NULL, NULL, CAST(N'2020-02-11T15:34:36.763' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4201, 8, 251, NULL, NULL, CAST(N'2020-02-11T15:34:41.407' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4202, 8, 0, NULL, NULL, CAST(N'2020-02-11T15:54:35.843' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4203, 9, 229, NULL, NULL, CAST(N'2020-02-11T15:56:49.810' AS DateTime), 22)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4204, 14, 3555, NULL, NULL, CAST(N'2020-02-18T10:49:22.400' AS DateTime), 306)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4205, 8, 3619, NULL, NULL, CAST(N'2020-02-22T15:13:39.393' AS DateTime), 306)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4207, 27, 4208, NULL, NULL, CAST(N'2020-03-05T11:38:05.733' AS DateTime), 306)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4208, 27, 4208, NULL, NULL, CAST(N'2020-03-05T11:38:05.740' AS DateTime), 253)
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4209, 28, 4275, NULL, NULL, CAST(N'2020-03-05T11:50:36.540' AS DateTime), 306)
GO
SET IDENTITY_INSERT [dbo].[Managers] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuLangs] ON 
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (3, N'vi', N'(2) KPI', 1, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (4, N'en', N'(2) KPI', 1, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (5, N'zh-TW', N'(2) KPI', 1, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (6, N'vi', N'Sở Thích', 2, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (7, N'en', N'Favourites', 2, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (8, N'zh-TW', N'收藏夾', 2, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (9, N'vi', N'Bàn Làm Việc', 3, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (10, N'en', N'Workplaces', 3, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (11, N'zh-TW', N'工作場所', 3, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (12, N'vi', N'(1) Sơ đồ tổ chức', 4, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (13, N'en', N'(1) OC', 4, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (14, N'zh-TW', N'(1) 組織結構圖', 4, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (15, N'vi', N'
(3) Thể loại', 6, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (16, N'en', N'(3) Category', 6, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (17, N'zh-TW', N'(3) 分類目錄', 6, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (18, N'vi', N'(7) Người Dùng', 7, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (19, N'en', N'(7) User', 7, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (20, N'zh-TW', N'(7) 用戶', 7, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (21, N'vi', N'(8) Add User Of OC', 8, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (22, N'en', N'(8) Add User Of OC', 8, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (23, N'zh-TW', N'(8) 添加OC用戶', 8, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (24, N'vi', N'(5) OC KPI', 10, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (25, N'en', N'(5) OC KPI', 10, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (26, N'zh-TW', N'(5) 組織結構圖KPI', 10, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (27, N'vi', N'(6) OC Category KPI', 12, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (28, N'en', N'(6) OC Category KPI', 12, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (29, N'zh-TW', N'(6) OC類KPI', 12, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (30, N'vi', N'KPI', 13, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (31, N'en', N'KPI', 13, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (32, N'zh-TW', N'KPI', 13, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (33, N'vi', N'(4) OC Category', 14, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (34, N'en', N'(4) OC Category', 14, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime]) VALUES (35, N'zh-TW', N'(4) OC類別', 14, CAST(N'2019-12-07T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[MenuLangs] OFF
GO
INSERT [dbo].[MenuRoles] ([MenuID], [RoleID], [Index]) VALUES (1, 1, 2)
GO
INSERT [dbo].[MenuRoles] ([MenuID], [RoleID], [Index]) VALUES (4, 1, 1)
GO
INSERT [dbo].[MenuRoles] ([MenuID], [RoleID], [Index]) VALUES (6, 1, 3)
GO
INSERT [dbo].[MenuRoles] ([MenuID], [RoleID], [Index]) VALUES (7, 1, 7)
GO
INSERT [dbo].[MenuRoles] ([MenuID], [RoleID], [Index]) VALUES (8, 1, 8)
GO
INSERT [dbo].[MenuRoles] ([MenuID], [RoleID], [Index]) VALUES (10, 1, 5)
GO
INSERT [dbo].[MenuRoles] ([MenuID], [RoleID], [Index]) VALUES (12, 1, 6)
GO
INSERT [dbo].[MenuRoles] ([MenuID], [RoleID], [Index]) VALUES (14, 1, 4)
GO
INSERT [dbo].[MenuRoles] ([MenuID], [RoleID], [Index]) VALUES (2, 2, 3)
GO
INSERT [dbo].[MenuRoles] ([MenuID], [RoleID], [Index]) VALUES (3, 2, 2)
GO
INSERT [dbo].[MenuRoles] ([MenuID], [RoleID], [Index]) VALUES (13, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[Menus] ON 
GO
INSERT [dbo].[Menus] ([ID], [Name], [Link], [FontAwesome], [BackgroudColor], [Position], [Code]) VALUES (1, N'(2) KPI', N'/AdminKPI/', N'fas fa-chart-line', N'btn-foursquare', 2, N'KPI')
GO
INSERT [dbo].[Menus] ([ID], [Name], [Link], [FontAwesome], [BackgroudColor], [Position], [Code]) VALUES (2, N'Favourites', N'/Favourite/', N'fas fa-heart', N'btn-foursquare', 3, N'Favourites')
GO
INSERT [dbo].[Menus] ([ID], [Name], [Link], [FontAwesome], [BackgroudColor], [Position], [Code]) VALUES (3, N'Workplaces', N'/Workplace/', N'fa fa-laptop', N'bg-green', 2, N'Workplaces')
GO
INSERT [dbo].[Menus] ([ID], [Name], [Link], [FontAwesome], [BackgroudColor], [Position], [Code]) VALUES (4, N'(1) OC', N'/AdminLevel/', N'fa fa-list-ol', N'bg-orange', 1, N'OC')
GO
INSERT [dbo].[Menus] ([ID], [Name], [Link], [FontAwesome], [BackgroudColor], [Position], [Code]) VALUES (6, N'(3) Categories', N'/AdminCategory/', N'fab fa-gg-circle', N'bg-navy', 3, N'Categories')
GO
INSERT [dbo].[Menus] ([ID], [Name], [Link], [FontAwesome], [BackgroudColor], [Position], [Code]) VALUES (7, N'(7) Users', N'/AdminUser/', N'far fa-user', N'bg-purple', 7, N'Users')
GO
INSERT [dbo].[Menus] ([ID], [Name], [Link], [FontAwesome], [BackgroudColor], [Position], [Code]) VALUES (8, N'(8) Add User Of OC', N'/AddUserToLevel/', N'fa fa-leaf', N'bg-maroon', 8, N'AddUserOfOC')
GO
INSERT [dbo].[Menus] ([ID], [Name], [Link], [FontAwesome], [BackgroudColor], [Position], [Code]) VALUES (10, N'(5)  OC KPI', N'/AdminOC/', N'fa fa-book', N'bg-green', 5, N'OCKPI')
GO
INSERT [dbo].[Menus] ([ID], [Name], [Link], [FontAwesome], [BackgroudColor], [Position], [Code]) VALUES (12, N'(6) OC Category KPI ', N'/CategoryKPILevelAdmin/', N'far fa-gem', N'bg-orange', 6, N'OCCategoryKPI')
GO
INSERT [dbo].[Menus] ([ID], [Name], [Link], [FontAwesome], [BackgroudColor], [Position], [Code]) VALUES (13, N'KPIs', N'/CategoryKPILevel/', N'fas fa-chart-line', N'bg-aqua', 1, N'UserKPI')
GO
INSERT [dbo].[Menus] ([ID], [Name], [Link], [FontAwesome], [BackgroudColor], [Position], [Code]) VALUES (14, N'(4) OC Category', N'/OCCategories/', N'far fa-gem', N'bg-danger', 4, N'OCCategory')
GO
SET IDENTITY_INSERT [dbo].[Menus] OFF
GO
SET IDENTITY_INSERT [dbo].[OCCategories] ON 
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1, 55, 14, 0)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (2, 55, 13, 0)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (3, 55, 11, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (4, 54, 9, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1002, 55, 10, 0)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1003, 83, 13, 0)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1004, 83, 14, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1005, 54, 8, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1006, 54, 6, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1007, 54, 5, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1008, 86, 13, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1009, 86, 14, 0)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1010, 86, 10, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1011, 72, 9, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1012, 72, 8, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1013, 72, 6, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1014, 72, 5, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1015, 73, 9, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1016, 73, 8, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1017, 73, 6, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1018, 73, 5, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1019, 74, 9, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1020, 74, 8, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1021, 74, 6, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1022, 74, 5, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1023, 88, 11, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1024, 89, 13, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1025, 89, 10, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1026, 90, 14, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1027, 94, 14, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1028, 93, 11, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1029, 92, 13, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1030, 92, 10, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1031, 95, 10, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1032, 95, 13, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1033, 96, 11, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1034, 97, 14, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1035, 88, 15, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1036, 88, 17, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1037, 89, 16, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1038, 90, 18, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1039, 83, 18, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1040, 86, 16, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1041, 55, 17, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1042, 55, 15, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1043, 86, 17, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1044, 89, 17, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1045, 54, 23, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1046, 54, 22, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1047, 54, 21, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1048, 54, 20, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1049, 72, 23, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1050, 72, 22, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1051, 72, 21, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1052, 72, 20, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1053, 52, 24, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1054, 109, 26, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1055, 117, 27, 1)
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status]) VALUES (1056, 119, 28, 1)
GO
SET IDENTITY_INSERT [dbo].[OCCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[Owners] ON 
GO
INSERT [dbo].[Owners] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4220, 14, 3555, NULL, NULL, CAST(N'2020-02-18T10:49:22.350' AS DateTime), 300)
GO
INSERT [dbo].[Owners] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4221, 8, 3619, NULL, NULL, CAST(N'2020-02-22T15:13:39.327' AS DateTime), 300)
GO
INSERT [dbo].[Owners] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4223, 27, 4208, NULL, NULL, CAST(N'2020-03-05T11:38:05.690' AS DateTime), 300)
GO
INSERT [dbo].[Owners] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4224, 28, 4275, NULL, NULL, CAST(N'2020-03-05T11:50:36.517' AS DateTime), 300)
GO
SET IDENTITY_INSERT [dbo].[Owners] OFF
GO
SET IDENTITY_INSERT [dbo].[Participants] ON 
GO
INSERT [dbo].[Participants] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (10, 7, 273, NULL, NULL, CAST(N'2019-10-14T15:27:36.057' AS DateTime), 15)
GO
INSERT [dbo].[Participants] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (12, 8, 1487, NULL, NULL, CAST(N'2020-01-15T10:16:37.873' AS DateTime), 12)
GO
INSERT [dbo].[Participants] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (15, 8, 3249, NULL, NULL, CAST(N'2020-02-05T16:22:47.963' AS DateTime), 12)
GO
INSERT [dbo].[Participants] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (23, 8, 0, NULL, NULL, CAST(N'2020-02-08T12:30:34.750' AS DateTime), 2)
GO
INSERT [dbo].[Participants] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (51, 32, 0, NULL, NULL, CAST(N'2020-02-08T16:11:55.117' AS DateTime), 2)
GO
INSERT [dbo].[Participants] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (53, 32, 3292, NULL, NULL, CAST(N'2020-02-08T16:23:37.633' AS DateTime), 15)
GO
INSERT [dbo].[Participants] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (56, 32, 3312, NULL, NULL, CAST(N'2020-02-11T12:28:45.420' AS DateTime), 2)
GO
INSERT [dbo].[Participants] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (60, 32, 3254, NULL, NULL, CAST(N'2020-02-11T15:26:06.033' AS DateTime), 12)
GO
INSERT [dbo].[Participants] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (61, 14, 3555, NULL, NULL, CAST(N'2020-02-18T10:49:22.387' AS DateTime), 297)
GO
INSERT [dbo].[Participants] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (62, 8, 3619, NULL, NULL, CAST(N'2020-02-22T15:13:39.380' AS DateTime), 297)
GO
INSERT [dbo].[Participants] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (64, 27, 4208, NULL, NULL, CAST(N'2020-03-05T11:38:05.720' AS DateTime), 297)
GO
SET IDENTITY_INSERT [dbo].[Participants] OFF
GO
SET IDENTITY_INSERT [dbo].[Permissions] ON 
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (1, N'(SSB) Tim.Hong', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (2, N'(SHC) Erick.Chong', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (3, N'(SHC) Jenny.Wang', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (4, N'(SHC) He.Lai', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (5, N'(SHC) John.Chuang', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (6, N'(SHC) Bj.Huang', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (7, N'(SHC) Karen.Xu', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (8, N'(SHC) Anita.Chien', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (9, N'(SHC) Mel.Kuo', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (10, N'(SHC) Nelson.Cai', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (11, N'(SHC) Eric.Chen', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (12, N'(CB) Johnnie.Wang', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (13, N'(CB) Iris.Nguyen', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (14, N'(CB) Tiffany.Lin', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (15, N'(CB) Liang.Hui.Duan', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (16, N'(CB) Paul.Kao', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (17, N'(CB) Martin.Chen', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (18, N'(CB) Kamy.Tao', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (19, N'(CB) Lilian.Chen', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (20, N'(CB) Ted.Chen', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (21, N'(CB) Lili.Vong', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (22, N'(CB) Reddy.Chandra', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (23, N'(CB) Harry.Nguyen', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (24, N'(CB) Vivian.Yao', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (25, N'(SYF) Edward.Juan', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (26, N'(SYF) Dinda.Ayu', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (27, N'(SYF) Richard.Hsu', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (28, N'(SYF) Hartini', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (29, N'(SYF) Andy.Chiu', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (30, N'(SYF) Thomas.Hung', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (31, N'(SYF) Daniel.Chang', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (32, N'(SYF) Jay.chang', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (33, N'(SYF) Eny.Sulistyawati', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (34, N'(SYF) Chris.Wang', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (35, N'(SPC) Jacques.She', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (36, N'(SPC) Joanna.Wu', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (37, N'(SPC) Cathy.Ge', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (38, N'(SPC) Jill Liao', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (39, N'(SPC) Brian.Lee', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (40, N'(SPC) Susan.Ren', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (41, N'(SPC) Paul.Luo', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (42, N'(SPC) Thet.Nyo', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (43, N'(SPC) Janette.Sapin', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (44, N'(SPC) Shwe.Yee', NULL)
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID]) VALUES (45, N'(SPC) Jen.Ko', NULL)
GO
SET IDENTITY_INSERT [dbo].[Permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([ID], [Code], [Name]) VALUES (1, N'ADMIN', N'Admin')
GO
INSERT [dbo].[Roles] ([ID], [Code], [Name]) VALUES (2, N'USER', N'User')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[SeenComments] ON 
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status]) VALUES (1, 141, 300, 1)
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status]) VALUES (2, 142, 300, 1)
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status]) VALUES (3, 143, 300, 1)
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status]) VALUES (4, 144, 300, 1)
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status]) VALUES (5, 145, 300, 1)
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status]) VALUES (6, 146, 300, 1)
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status]) VALUES (7, 147, 300, 1)
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status]) VALUES (8, 148, 300, 1)
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status]) VALUES (9, 149, 300, 1)
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status]) VALUES (10, 150, 300, 1)
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status]) VALUES (11, 151, 300, 1)
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status]) VALUES (12, 152, 300, 1)
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status]) VALUES (13, 153, 300, 1)
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status]) VALUES (14, 154, 300, 1)
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status]) VALUES (15, 155, 300, 1)
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status]) VALUES (16, 156, 300, 1)
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status]) VALUES (17, 157, 300, 1)
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status]) VALUES (18, 158, 300, 1)
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status]) VALUES (19, 159, 300, 1)
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status]) VALUES (20, 160, 306, 1)
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status]) VALUES (21, 161, 306, 1)
GO
SET IDENTITY_INSERT [dbo].[SeenComments] OFF
GO
SET IDENTITY_INSERT [dbo].[Settings] ON 
GO
INSERT [dbo].[Settings] ([ID], [Code], [Name], [State], [CreatedTime]) VALUES (2, N'ADDCOMMENT', N'ADD COMMENT', 1, CAST(N'2019-11-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Settings] ([ID], [Code], [Name], [State], [CreatedTime]) VALUES (3, N'ADDTASK', N'ADDTASK', 1, CAST(N'2019-11-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Settings] ([ID], [Code], [Name], [State], [CreatedTime]) VALUES (4, N'APPROVAL', N'APPROVAL', 1, CAST(N'2019-11-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Settings] ([ID], [Code], [Name], [State], [CreatedTime]) VALUES (5, N'DONE', N'DONE', 1, CAST(N'2019-11-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Settings] ([ID], [Code], [Name], [State], [CreatedTime]) VALUES (6, N'CHECKDEADLINE', N'CHECKDEADLINE', 1, CAST(N'2019-11-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Settings] ([ID], [Code], [Name], [State], [CreatedTime]) VALUES (7, N'CHECKLATEONUPDATEDATA', N'CHECKLATEONUPDATEDATA', 1, CAST(N'2019-11-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Settings] ([ID], [Code], [Name], [State], [CreatedTime]) VALUES (10, N'MAINTAIN', N'12/24/2019 12:12 GMT', 1, CAST(N'2019-12-21T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Settings] OFF
GO
SET IDENTITY_INSERT [dbo].[Sponsors] ON 
GO
INSERT [dbo].[Sponsors] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (1, 14, 3555, NULL, NULL, CAST(N'2020-02-18T10:49:22.367' AS DateTime), 299)
GO
INSERT [dbo].[Sponsors] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2, 8, 3619, NULL, NULL, CAST(N'2020-02-22T15:13:39.367' AS DateTime), 299)
GO
INSERT [dbo].[Sponsors] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4, 27, 4208, NULL, NULL, CAST(N'2020-03-05T11:38:05.707' AS DateTime), 299)
GO
SET IDENTITY_INSERT [dbo].[Sponsors] OFF
GO
SET IDENTITY_INSERT [dbo].[StateSendMails] ON 
GO
INSERT [dbo].[StateSendMails] ([ID], [ToDay], [Status], [Description]) VALUES (2018, CAST(N'2019-12-04T00:00:00.000' AS DateTime), 1, N'IsSended')
GO
INSERT [dbo].[StateSendMails] ([ID], [ToDay], [Status], [Description]) VALUES (2020, CAST(N'2019-12-05T00:00:00.000' AS DateTime), 1, N'IsSended')
GO
INSERT [dbo].[StateSendMails] ([ID], [ToDay], [Status], [Description]) VALUES (2021, CAST(N'2019-12-06T00:00:00.000' AS DateTime), 1, N'IsSended')
GO
INSERT [dbo].[StateSendMails] ([ID], [ToDay], [Status], [Description]) VALUES (3012, CAST(N'2019-12-07T00:00:00.000' AS DateTime), 1, N'IsSended')
GO
INSERT [dbo].[StateSendMails] ([ID], [ToDay], [Status], [Description]) VALUES (3013, CAST(N'2019-12-09T00:00:00.000' AS DateTime), 1, N'IsSended')
GO
INSERT [dbo].[StateSendMails] ([ID], [ToDay], [Status], [Description]) VALUES (3014, CAST(N'2019-12-10T00:00:00.000' AS DateTime), 1, N'IsSended')
GO
SET IDENTITY_INSERT [dbo].[StateSendMails] OFF
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload]) VALUES (1, 297, 141, 0, 0, 0)
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload]) VALUES (2, 297, 142, 0, 0, 0)
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload]) VALUES (3, 299, 0, 1, 0, 0)
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload]) VALUES (4, 299, 0, 2, 0, 0)
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload]) VALUES (5, 297, 0, 3, 0, 0)
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload]) VALUES (6, 297, 0, 4, 0, 0)
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload]) VALUES (7, 297, 143, 0, 0, 0)
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload]) VALUES (8, 297, 144, 0, 0, 0)
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload]) VALUES (9, 297, 0, 5, 0, 0)
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload]) VALUES (10, 297, 145, 0, 0, 0)
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload]) VALUES (11, 297, 0, 6, 0, 0)
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload]) VALUES (12, 297, 146, 0, 0, 0)
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload]) VALUES (13, 297, 147, 0, 0, 0)
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload]) VALUES (14, 297, 148, 0, 0, 0)
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload]) VALUES (15, 297, 149, 0, 0, 0)
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload]) VALUES (16, 297, 150, 0, 0, 0)
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload]) VALUES (17, 297, 151, 0, 0, 0)
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload]) VALUES (18, 297, 152, 0, 0, 0)
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload]) VALUES (19, 297, 153, 0, 0, 0)
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload]) VALUES (20, 297, 154, 0, 0, 0)
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload]) VALUES (21, 297, 155, 0, 0, 0)
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload]) VALUES (22, 297, 156, 0, 0, 0)
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload]) VALUES (23, 297, 157, 0, 0, 0)
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload]) VALUES (24, 297, 158, 0, 0, 0)
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload]) VALUES (25, 297, 159, 0, 0, 0)
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload]) VALUES (26, 300, 160, 0, 0, 0)
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload]) VALUES (27, 300, 161, 0, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
SET IDENTITY_INSERT [dbo].[Units] ON 
GO
INSERT [dbo].[Units] ([ID], [Name]) VALUES (1, N'Percentage')
GO
INSERT [dbo].[Units] ([ID], [Name]) VALUES (2, N'Numeric')
GO
SET IDENTITY_INSERT [dbo].[Units] OFF
GO
SET IDENTITY_INSERT [dbo].[Uploaders] ON 
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (14, 7, 273, NULL, NULL, CAST(N'2019-10-14T15:27:36.033' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (15, 6, 273, NULL, NULL, CAST(N'2019-10-14T15:33:04.230' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (19, 5, 284, NULL, NULL, CAST(N'2019-10-15T13:45:24.800' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (20, 5, 273, NULL, NULL, CAST(N'2019-10-15T13:45:39.827' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (21, 5, 262, NULL, NULL, CAST(N'2019-10-15T13:45:59.150' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (40, 5, 229, NULL, NULL, CAST(N'2019-10-16T07:47:17.103' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (44, 10, 1626, NULL, NULL, CAST(N'2019-10-26T10:04:45.733' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (47, 10, 1630, NULL, NULL, CAST(N'2019-10-26T10:05:22.920' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (1085, 13, 1564, NULL, NULL, CAST(N'2019-11-06T10:14:55.527' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (1086, 13, 1500, NULL, NULL, CAST(N'2019-11-06T11:07:45.473' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2085, 14, 1564, NULL, NULL, CAST(N'2019-11-06T11:46:20.433' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2086, 14, 1488, NULL, NULL, CAST(N'2019-11-06T11:47:40.850' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2087, 14, 1428, NULL, NULL, CAST(N'2019-11-06T11:47:52.477' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2088, 13, 285, NULL, NULL, CAST(N'2019-11-08T11:29:55.743' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2105, 14, 1541, NULL, NULL, CAST(N'2019-12-03T16:37:39.830' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2106, 14, 1542, NULL, NULL, CAST(N'2019-12-03T16:37:41.870' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2107, 14, 1543, NULL, NULL, CAST(N'2019-12-03T16:37:44.557' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2108, 14, 1544, NULL, NULL, CAST(N'2019-12-03T16:37:47.510' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2112, 14, 1560, NULL, NULL, CAST(N'2019-12-03T16:43:02.600' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2115, 14, 1576, NULL, NULL, CAST(N'2019-12-03T16:46:19.453' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2121, 13, 1623, NULL, NULL, CAST(N'2019-12-03T17:08:55.327' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2122, 13, 1624, NULL, NULL, CAST(N'2019-12-03T17:08:57.623' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2125, 10, 1625, NULL, NULL, CAST(N'2019-12-03T17:09:36.763' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2127, 10, 1624, NULL, NULL, CAST(N'2019-12-03T17:17:31.057' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2131, 13, 1625, NULL, NULL, CAST(N'2019-12-03T17:18:11.430' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2132, 13, 1626, NULL, NULL, CAST(N'2019-12-03T17:18:26.377' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2133, 13, 1629, NULL, NULL, CAST(N'2019-12-03T17:18:39.407' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2135, 11, 1428, NULL, NULL, CAST(N'2019-12-03T18:34:52.880' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2137, 11, 274, NULL, NULL, CAST(N'2019-12-03T18:35:10.710' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2138, 11, 263, NULL, NULL, CAST(N'2019-12-03T18:35:14.477' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2140, 11, 241, NULL, NULL, CAST(N'2019-12-03T18:35:19.037' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (2141, 11, 230, NULL, NULL, CAST(N'2019-12-03T18:35:23.940' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4097, 10, 1623, NULL, NULL, CAST(N'2019-12-07T07:33:33.893' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4099, 9, 284, NULL, NULL, CAST(N'2019-12-07T10:01:52.130' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4100, 9, 1415, NULL, NULL, CAST(N'2019-12-07T10:02:38.480' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4103, 8, 240, NULL, NULL, CAST(N'2019-12-07T10:04:55.230' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4121, 9, 251, NULL, NULL, CAST(N'2019-12-07T12:04:24.740' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4129, 5, 251, NULL, NULL, CAST(N'2019-12-07T13:30:18.567' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4130, 8, 284, NULL, NULL, CAST(N'2019-12-09T18:30:48.677' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4131, 8, 273, NULL, NULL, CAST(N'2019-12-09T18:31:11.147' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4132, 8, 262, NULL, NULL, CAST(N'2019-12-09T18:31:28.693' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4134, 8, 1427, NULL, NULL, CAST(N'2019-12-09T18:33:07.807' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4136, 6, 1439, NULL, NULL, CAST(N'2019-12-09T18:34:17.343' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4137, 6, 1427, NULL, NULL, CAST(N'2019-12-09T18:34:34.323' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4139, 6, 1451, NULL, NULL, CAST(N'2019-12-09T18:37:03.020' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4140, 6, 1379, NULL, NULL, CAST(N'2019-12-09T18:37:38.093' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4141, 6, 1367, NULL, NULL, CAST(N'2019-12-09T18:37:56.907' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4142, 6, 1403, NULL, NULL, CAST(N'2019-12-09T18:38:35.027' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4143, 6, 1391, NULL, NULL, CAST(N'2019-12-09T18:38:50.800' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4144, 5, 1563, NULL, NULL, CAST(N'2019-12-09T18:41:15.470' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4145, 5, 1547, NULL, NULL, CAST(N'2019-12-09T18:41:34.703' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4146, 5, 1499, NULL, NULL, CAST(N'2019-12-09T18:42:14.833' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4147, 5, 1487, NULL, NULL, CAST(N'2019-12-09T18:42:36.260' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4148, 5, 1475, NULL, NULL, CAST(N'2019-12-09T18:42:51.703' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4149, 5, 1463, NULL, NULL, CAST(N'2019-12-09T18:42:56.410' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4152, 10, 1627, NULL, NULL, CAST(N'2019-12-09T18:45:04.493' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4160, 13, 1630, NULL, NULL, CAST(N'2019-12-10T08:38:56.040' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4161, 10, 1629, NULL, NULL, CAST(N'2019-12-10T08:39:26.473' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4162, 13, 1627, NULL, NULL, CAST(N'2019-12-10T08:42:42.877' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4163, 11, 252, NULL, NULL, CAST(N'2019-12-17T14:46:08.707' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4164, 11, 285, NULL, NULL, CAST(N'2019-12-17T14:46:13.227' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4166, 8, 1487, NULL, NULL, CAST(N'2020-01-15T10:16:37.843' AS DateTime), 14)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4168, 8, 1544, NULL, NULL, CAST(N'2020-01-15T10:58:04.090' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4169, 8, 1547, NULL, NULL, CAST(N'2020-01-15T11:15:30.080' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4172, 8, 3249, NULL, NULL, CAST(N'2020-02-05T16:22:47.940' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4214, 32, 0, NULL, NULL, CAST(N'2020-02-08T16:11:55.107' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4216, 32, 3292, NULL, NULL, CAST(N'2020-02-08T16:23:37.620' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4217, 14, 3312, NULL, NULL, CAST(N'2020-02-10T10:56:03.407' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4220, 32, 3312, NULL, NULL, CAST(N'2020-02-11T12:28:45.327' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4224, 32, 3254, NULL, NULL, CAST(N'2020-02-11T15:26:06.000' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4225, 8, 229, NULL, NULL, CAST(N'2020-02-11T15:34:36.707' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4226, 8, 229, NULL, NULL, CAST(N'2020-02-11T15:34:36.730' AS DateTime), 15)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4227, 8, 251, NULL, NULL, CAST(N'2020-02-11T15:34:41.377' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4228, 8, 0, NULL, NULL, CAST(N'2020-02-11T15:54:35.787' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4229, 8, 0, NULL, NULL, CAST(N'2020-02-11T15:54:35.793' AS DateTime), 15)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4230, 9, 229, NULL, NULL, CAST(N'2020-02-11T15:56:49.783' AS DateTime), 17)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4231, 14, 3555, NULL, NULL, CAST(N'2020-02-18T10:49:22.313' AS DateTime), 301)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4232, 8, 3619, NULL, NULL, CAST(N'2020-02-22T15:13:39.293' AS DateTime), 301)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4234, 27, 4208, NULL, NULL, CAST(N'2020-03-05T11:38:05.637' AS DateTime), 301)
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID]) VALUES (4235, 28, 4275, NULL, NULL, CAST(N'2020-03-05T11:50:36.490' AS DateTime), 301)
GO
SET IDENTITY_INSERT [dbo].[Uploaders] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (247, N'', N'admin', NULL, N'Super Admin', NULL, N'shc@1234', NULL, 1, 0, 1, 0, 1, 1, 0, 0x94CF2EE0C7C5BEC3499D0DE778FE54B644BFFAAB1790AE02D1D22DDC7FDF681A32EAE3975C07447395581355F65327609B139432C88EC3E02CAE5F95FA6656F2, 0xD41D6DD658953554E138A943DD45B782784BEDE8673A84C81FB4F0408FF59487CAB7613AE6F2691A0D326346E71B6062EBB4A870E4DACB8E249F64892A5308E622262381D85E0A163514B8F80DBE90E40E83DD5083FB511C9A2041C9D351C12223E461E610B43EB7BBD8C8BC881A8F889582C901F2EBEB87EA1891FEA807140B)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (253, NULL, N'Tim', NULL, N'SSB - Tim.Hong
', N'Tim@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Tim.Hong', 1, 52, 2, 0, 0, 2, 0, 0x07AE2B0B5476EB1CD33C37CBED5C26DF9FF9927419CEA67ADE54885E9B3C1233F53C633DB128864D875BA043E5446C004E810D95433CFC3AA4C5CFAE2F5EFC2F, 0x7DDC675AA87401BBFE10A09B558011EA137A264F7F84EE1E367D0ED868815010E37AFB1A6DC4EA0ABD0D903A06472C8C73E76A7685347DCCB241A21264772295FC96EE3AEEBB4D1D11F680B08C9C9FC143AA169A5C40A3E3230478526E4D688358430E912D07553B14EF4D18400D6174D2F0549B3A1E9EEC30FD3785E98CBF5D)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (254, N'', N'Erick', NULL, N'SHC - Erick.Chong
', N'Erick.chong@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Erick', 1, 54, 2, 0, 0, 2, 0, 0x20D7C07D783F91892D6D1CBAC6FF4CD8D3E69F782F93460162D6D88534F88126DF5CE1F13CF64A180233D82BCDF973689460B098291498A0C7860757CE21974A, 0xA4687102B8914AC9AAF50D24FF35785BEEEB16DCD1792C384FAC8B9B949D4F94A521831E66BA3205825BB8884420535F539BFCE952CE6A3B6456E779CBF55F35BE54883C71AB19B7C301BD2D69C9CB7B60D2F99EE5302C8D31E8760862D31EC1BD33CC288521E2414A01E0E09C5A1ADB71277D64990F056F9FE67E4FB97E9BEB)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (255, NULL, N'Jenny.wang', NULL, N'SHC - Jenny.Wang
', N'Jenny.wang@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Jenny Wang', 1, 54, 2, 0, 0, 2, 0, 0x3CF06769345B3EBDD1D766369537CA0210396EC0A63F67C0BF8F7F7924576AF30E9FB7EBC3D2169FF557227615D20CCF7780F247FE315223EA5FFCAA605B2655, 0xC9C069DDDC06751F39BC020E8F61D01717B3CA13133136C54334061E92977AACFEB209EC115C6A07A736D1A5F4F176C95E42F99515F69E5428295F4D4A5025A71BB3E8B5E1D76E956D6E2A7AEF7265836EFA1FA0E01844856DD142CAB9982D05B3484AD0980253F21EC6413958FA30759F2479829D08FE788281116461B553D4)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (256, NULL, N'Leo', NULL, N'SHC - He.Lai
', N'he.lai@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Leo', 1, 0, 2, 0, 0, 2, 0, 0xC21CAEDFE08CF9A5CFC3B39CD2F2041B5FC114E804C000DF647B78BB448C4D7472600D1C79BA6C17976369E54DFD4A278F54F2DCA518927CF4949B36780C6920, 0x43CED551D6867A5A7402F8FC879D73DB1B2A4CEFEFC73A99A59D286D72B7724922DB7C5C07281FB2297B089DD5B08CE08A4FE6B8F2BE13CD65728B2C0FF16EC892649B3A8BAED2A4872D7C6DEACB98026F3C7708D8D33731761694AF7B4C02DBC9B21E2B1F8187FF49DF4B0256C2CEF3A6E97C3E5F5B711B1225421DF4751BFA)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (257, NULL, N'John chuang', NULL, N'SHC - John.Chuang
', N'john.chuang@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'John Chuang', 1, 0, 2, 0, 0, 2, 0, 0x826149F3A097B93692E3D653BD315AAF447473E5FDF23DE0948976369DABFDD6D37C0A3CD5CFF14B9B9C5F2CE98168B96003176535D7CAA649CAE10DF14B70A2, 0x128D510FDA2CA535E248D4F293060EBB1EBAB69A16F7D84BA666C173ACDE67BB0ACAE5BE579D73BFEFD87BDFF8C429B95BDE0AD75BB796B2EF5E150FA46BF97188876AC55866BDB76D2912ABA16576EE36175FC401EF38C6AF520995941B247D19964A34A3482B4241A094808A1946111FC031746556496A371CA20734D3C994)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (258, NULL, N'Bj', NULL, N'SHC - BJ.Huang
', N'bj.huang@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'BJ Huang', 1, 0, 2, 0, 0, 2, 0, 0x169220E6FB6362291CEF52D622C6732F4A457A2A11098E21E742E8E35BE505425D3C1AFA6CF8E27F00D6F5AAE4B02C773540E0A43CC94E57863ABDF2D20981D5, 0x6FB3D83036717569AA3BEB18DF4B13F0F395B69D4ECC0C5C92004A0875767B20F5E53CB1D587EB7323334AC477CCF00DC4FFECCEAC6C5CC55FD4B257CCF7325656B2BC6DBA252C5263A8B97E8B3FF819DF03D145BA22FCF4A1740D60FED7D447B2E4346A02257D46ABADEDB896BD2EA31BCBC749341293A20ED33C9D577980D2)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (259, NULL, N'Karen', NULL, N'SHC - Karen.Xu
', N'karen.xu@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Karen Xu', 1, 0, 2, 0, 0, 2, 0, 0x01F2912F99CC9C2216F82019465E18950767350F2948E0D24800E82BC921C04EDF14FAF2989F4787F2C4929CE115B06511FD8DDC6530F7E3533048B227E50409, 0x622E370BA735D094F10330E1E141D90955BC59008F26DD1145C8B5B86641B2E1151D5E500801BF9CE90D2AAEC221BE2F5BAEED20EE9F6BDA9820E4E35AF66F21854E941B9FD8AE115334396ABB5BBC27AC4CF795D56B08E645E3179006AC7EC00D5F96092F9853CA2EEF9A7174155D4C908C8AE09DED6DBAAB897C0093C7EAB7)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (260, NULL, N'Anita Chien', NULL, N'SHC - Anita.Chien
', N'anita.chien@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Anita Chien', 1, 0, 2, 0, 0, 2, 0, 0x01066E6B7B25E7B13C3A49BC0DCBE9D327787EA7B980DC23F86720BC7A08513FFED22F7A5CA2D4DFF66C799F8FD8A8C71BD9325CC78B1E475598EBAFCA30363C, 0x7998CAFB59C31BE112D1E7D5285AEE549C9096EE4469AA1B38C1C1A2650361367B80D2FC1E61412235C5DE3F7E2F9CD96B029658C2F74D07FA68ABDF3F83E4D6A80FAA31130BC7F59A90843AD37AE144255CAE76FA80E3589E2049750A9F283F1A8EFBB4D36BBF564635CC15FD107D3730228EECEBB7DC0118D520E466EAAA78)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (261, NULL, N'Mel Kou', NULL, N'SHC - Mel.Kuo
', N'mel.kuo@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Mel Kou', 1, 0, 2, 0, 0, 2, 0, 0x349491AC965CA34A51BCF00A2F052048648628C9117E15C62EFD6EA9115C98E187C2B61F65DA6785F004001BB72661413F72778745D8DC82B9EB94E6BFA7DDF0, 0xCBA9E23D456753B116C4AD8536571FF7E943141284CFB73D400C6820AD28B02263E84F561285435C626022FACB731B96177F6A8C690A67AFDC647EC9E0D6331691B6BA4B72EEAC997EE8E31FB6BBE9BC54DC3A0EA2C5B56B3ED77988118E40FC19882F5B8FBC357ECA66972EF281BA4FC299E1A069AB5F79EFB43BBD81C9B002)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (262, NULL, N'Nelson Cai', NULL, N'SHC - Nelson.Cai
', N'nelson.cai@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Nelson Cai', 1, 0, 2, 0, 0, 2, 0, 0x886A621708D4C340C691517AD605ACB1429E27D8AFCEE8BC33250526A4B06F07B9D780173CD70C15F2582C2C0C6E3E72FBA3CCE5BC2F96B9CF370476F5E214CF, 0xC173B9BA0D781CC0733803BF3B38183DB39C96C5958F2225EF411D1196370D128E87D85AA8358451CB2E5F409638043F239802245342D16C3D8518D71BB5D2C27903C6F1685D85431AD3F1DBD8BBF6D2DDFF4AE35F44D7F7FA598752C1D09D0DCB97EDBA4E850DC406AE722D64B5E6C2C68C1703A7979ED1EB49FFDCE49D37F0)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (263, NULL, N'Eric Chen', NULL, N'SHC - Eric.Chen
', N'Eric.chen@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Eric Chen', 1, 0, 2, 0, 0, 2, 0, 0x9EF98E5E74D48B68E2D0504C739ED47F322C2018666EC164BBF37B377C9FC2C899EF37637EC26D0AD235E212B6F58E2BB4304635624D6BBD57119529D7C247B1, 0x497A7B3A15E7E2C14B334BCAFDC3325DE1F1175145927E4E89C8D04DE5BDE98DE54809F1E4E8CEE39037CD391FE6A5E64723390695DCC80029DA4E4AD53D8EFBEFA46994DC66D9F9CA6FC798874DFBAF66347919C53F15ABCFA576A0261249A08A47E563EFEFB4461EAF014CC0FE698647276083EE5CF10DB8EB9C3AA6C8250A)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (264, NULL, N'Johnnie', NULL, N'CB - Johnnie.Wang
', N'johnnie.wang@cb.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Johnnie Wang', 1, 0, 2, 0, 0, 2, 0, 0x0D87C341EDC992CB1B423ADE879E8ADC955C27DC89F7E38545A2FB05A282598A8905CC0D82F290EF2B3AEE0B3B0033E5159F657A661946155E5828788DDB60A0, 0xEE9A2023F3D7A5AA667FE36DAE15AA72D61619A5C40C005068209E04AB89C2D554E7C54E26427857F58182B812A2A6D0AC64587DD51582CBB1E26FDED00642E778AA7385617118ACE7B846CB7B67414350735AC2634A530D4A05C5A62E48ED66882F190AD8D05BA8597770752522217E4AE843E989ED92CFCED08C9EB4D9B873)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (265, NULL, N'Iris Nguyen', NULL, N'CB - Iris.Nguyen
', N'Iris.nguyen@cb.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Iris Nguyen', 1, 0, 2, 0, 0, 2, 0, 0x32868C231C7A3BE1A04E42C0BA1EE1081E9E2C2AB74D2B13470517BB9635BF1E2A55D4CFA7CF61BB4DD8418CF9BB10664A3D63C1D626FA77E7BB90EF323EEFAD, 0x0457BE99E71FE9BBB1F5017DF4533C5074DF0E2F79DFE8C64855301007B1AF3D5C5792DF5764478843DCABB5FC0110ABC355EE46024000E3AF00ECE267F9E96E435CC07A5A981DAAF9F3C4C48DC79883104DB9BD9AE644B48F14CD769ECE14DC815D8714114D5A4A5929B300B71538234CFA73A2D0A04D44ACCCEF6ACA9B2117)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (266, NULL, N'Tiffany Lin', NULL, N'CB - Tiffany.Lin
', N'tiffany.lin@cb.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Tiffany Lin', 1, 0, 2, 0, 0, 2, 0, 0x17E13ADD39F3630F9634A0F7CB3072E6ACCD953A667DCED77A4997B6DC92A516D5A29BE9AB14DF2648592CD1FE90D13701981D56C2AD9192C656A8A9633A5658, 0xDC166617ACDD85E72452171E90EB167393E9140A52A5F18D38AA034AC82E70DD0BCAD13B12DDE4CF9218E9FE2552FB53665768D4D85355F6189F48EF9890E055B236883074847CFBB8E831E2F9397AD297EFE1D166E56C446E206CEEB0BC9BB69A9B13CD7352AF841C3533A993FA0D3C73A7567BF5400D933136B98DA45894C1)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (267, NULL, N'Luke', NULL, N'CB - Liang.Hui.Duan
', N'Lianghui.duan@cb.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Lianghui Duan', 1, 0, 2, 0, 0, 2, 0, 0x667A821BD6521B9D79F135C07966C58DC1B941B09B9CD431996C3A0F83E9CF88C49B58F5ABD8CF5AA4EF6E2288357392B95C6E563EDF0950982AD15AA9A65968, 0x440BFF1233121BF5BE4909DF3CE50D72F2A2117A230D678592AF34512A815FDA1DB2FA7BA461DB59DA7962934205831373929B8A09A4C328033FCF4E63084916E2B26BDF902061AA7E1AF7C0073BCCEFBFD0D542DBDB23A56295AE3676E7CB369FBF196B639D20A35A4CB12B451FDB2D202366612AD4349559777976DEFD4A80)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (268, NULL, N'paul/martin', NULL, N'CB - Paul.Kao
', N'paul.kao@cb.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Paul Kao', 1, 0, 2, 0, 0, 2, 0, 0x2576E99DEC06407ABBE766A3B84866E687FD97A66CCDC2C2B48AE55D9493BDA38CBD8ED1A82F5744C87191AC907FEDF1BBAF2B5E1F0B6E9C828FC3BF0AA3DD4C, 0xA0993DF475165162E10B86716C24B13C8C539098BB675BEE4CD3D58419348B34048008BBBB9B2656863D3A2AE29A34FEEF19B1342CBC7495B65FE82812E63DAD907E0258F15EBCF80CE50DF0E3C6B77FA1BFC5A007B35CF1C8361FD3B79ED574E7438ED0270821C9CF0DC4BA0458842B33CC5647C4AEBCBD8A9DEBE508A8264D)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (269, NULL, N'Kamy Tao', NULL, N'CB - Kamy.Tao
', N'kamy.tao@cb.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Kamy Tao', 1, 0, 2, 0, 0, 2, 0, 0x4B8D4E64E2BDC5501856E49ABB7C1BB9BFB36559A8DB34E95F039FBEB65F78DEDE654C487628BF3A733A9C7BEAD287A041B66A22EE78277D5820367216946AD7, 0x0F453286870458D8C3D245D9A6241DFB84447460970C0186B626515BDBB283757E5CF0102BEA3B749B879DAC2BE283CB341373744AAD1FD7D979851C055BDA1A3EA5A13EEEB827A30279562C84762561E62EF29D7826DD3EEDDE659D7F22B3013C128884F5F363DBE7D4B74A139013F6440CCEECD3857244C0D42BFDE975808A)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (270, NULL, N'Lilian Chen', NULL, N'CB - Lilian.Chen
', N'lilian.chen@cb.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Lilian Chen', 1, 0, 2, 0, 0, 2, 0, 0x884E74A4D6D4EC814265D2DFB37435B96D8ACDF4AD2DC83AEAE580374A26A501ACD850476AE3842EB47A31F10B1EB8BE92422D52410A6B5788A00DA165607773, 0x5F4789223541BBD05D7F0ACE1F6FEECEC86023A60A31F9D454E3E87D3A6BEC9DF65983EAB52CB4F8ED1C1CC732363625193B5624AC0A3F90E50C8A81F1FFA570DC5FD9F50D6BC380993AA95C6DE6992B446630432D7B1A1F28034D836F37D3D0312BB3BAF3B3D9CE5A7F307F7E64D8482CFA71C9BA43C5BD94097E566646ED42)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (271, NULL, N'Ted Chen', NULL, N'CB - Ted.Chen
', N'ted.chen@cb.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Ted Chen', 1, 0, 2, 0, 0, 2, 0, 0x414EF67EE875CE5C98C4269D3A9BF2A995634D52EFDF17E91E327DA3D4071128F3B3B24A87AB121161FFA13D32D20AC41A1334A2B109F80C1A15ED6F240BFB5B, 0x9F2832D7163A211C81FC84099C76923D88019C2730C01385BA49ACC917F60BF963513F3ABB6B2B6242F15E0D5BB57B6CF21E8F2699F19FA8665230D60406AE50310C4F3CE44AFC4AC1AF74A78437464A6CE34D514C8E0E444E5882443F117A9C0EC34187253886ACBE394CEAC9EECD87F5C8E0A2F10B206C16096B2D2AA177B5)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (272, NULL, N'Lili', NULL, N'CB - Lili.Vong
', N'Lili.vong@cb.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Lili Vong', 1, 0, 2, 0, 0, 2, 0, 0x32DD955B025D42C4A76C3E43AF083168E7205BD6E99AC633BE2545CE0C97B362443DC98675287B83A49AE2DEECD3DC4FBBB46601B84B42CF908CFC8F6AB89516, 0x06E22BE4EFB7B6F6D3BC2410AB884D729A0120E0AB141070ADF067101C2107D9B41E9B3607175461C3238120B1C3EA30F0EF3FEA8C350F9C4DC644E325D638A0ABBA18829466D40E37EEDC2CD6C505EA0694E01BD5A132EB67DB6192C4DC6A62B3F3EC7DF90FFB28749F229AE7462028DE1F7FD4E27D48B1785755BF7B79B2B5)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (273, NULL, N'Reddy Chandra', NULL, N'CB - Reddy.Chandra
', N'Reddy.Chandra@cb.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Reddy Chandra', 1, 0, 2, 0, 0, 2, 0, 0x0753A924532A6E0B1AFA433C31052D102B17F3D9B71D19E2AA37A54952FCDDD3F7FF361287C66356EA70EA3FB6007FD3D9CB3FC9DB80ABDA0807A81BA7CDA635, 0xD8C97D48817BA0ED96F50B972F7688EA5AE16630EF746858FC8949730CBFEC612B0A70CB5D4B66EC0EEA1BD3CFED9ADA6D4FA4831804887D44CE3DDA8513AA4EC8498C43DF772396F72FB3C0D4324D6D762D7FFEB93140CBA842216DE4E96C3EFEB5DB3E0C413A18E4C685B37A008FBED7F5AAFA982931E955FE863B078E81C3)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (274, NULL, N'Harry Nguyen', NULL, N'CB - Harry.Nguyen
', N'harry.nguyen@cb.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Harry Nguyen', 1, 0, 2, 0, 0, 2, 0, 0x3E14C281EE95AB6702CB80927F198B815E80DA7955C528E0302F64DC0EDAA302A8EE950CA742E389B437EEEF3A53B6B34FA75D9241DBA00A35EAAFE24FD4F4ED, 0x270823AC3A7B08B5A66CB935B218D33C1B3CA3BE34F97758C718F72D6F6B631A9AF58660E409059F3635ADFBF861230B643F5F739FD076B6119917E88AF2BA001AFC697D9F8EEDA52E8303F4B9D8C3D09F177F083A45362D7ABD97F79DBD14E9037797AD663032E1C865464C9AC989280F1174F94E8DE56532F1A422BE6A73E4)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (275, NULL, N'Vivian Yao', NULL, N'CB - Vivian.Yao
', N'vivian.yao@cb.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Vivian Yao', 1, 0, 2, 0, 0, 2, 0, 0x562D87C9FF4A1FCB485DB761E339E28288AD49922C2B07E388C8BD359986624925B4AAAC366DCDFCC1C1DF2E0BB20D38D6E425F9F3F973A62E5D92023A1F60E5, 0x64557873712DBDD8569AB25A9CDDDEF4D5C44861A1E851A426DB6ADC26D6739F2E2D700AB58B8BB1CA8FA60BD831B7F801D5F0E7720A9B924A7034DD9B356A0CEB2A641545F2535F4F5E2690C20BE1C986EC540B34B944F745A5AE0F24FB3B27B37884C04B130806696FFD65AC421D95875D05EF33243F45E2A2090178984AC1)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (276, NULL, N'Edward Juan', NULL, N'SYF - Edward Juan', N'Edward.Juan@syf.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Edward Juan', 1, 0, 2, 0, 0, 2, 0, 0x80BE6B5430BD8236FDFF0AE7AEC91780CC3DA5A934CB3EF66277D472DBF83FB044E4D4A75D73EDB9937FE972AB19C79A09F49CA955B979BB0FF1C20C19FD121A, 0x9352A259BE185586E56FF9CDC788C758D9B8E6FC54A5DF321FDC815835CF23346520C69E63536635DA4D63FA8930529BB29A06AEC7A1C6DFAEE5D5CC16C0307F666E42E1E1140F293A45883A7ABD601D1EF9A5024C289F76991E436589274EECB6A5534E795D64B4F03EA9A1AF9C086483CA577D7401EC61566CC0C0E0C94ADB)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (277, NULL, N'Dinda Ayu', NULL, N'SYF - Dinda Ayu', N'dinda.ayu@syf.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Dinda Ayu', 1, 0, 2, 0, 0, 2, 0, 0x81F059EE1C37C506566672382FB3645C0EC8F9C72FAAAE521EBA7BF8E7AA8CAF91D035B715E9119F578968D2BC1E5ED238E172B6EC0121438849FCD7D816E245, 0x6B1F4750867ADE6041563376E4DA95B86F912818AD61DAF339EB6F3747C7B3DCCAF32BE6645E751F18342A8F9B1724134AC46046CBAE7EB2654EA7E3C8A9E0E5C2FDBEAC4620779E5D5A171B7801E29136C883051273135AEB267C8C20E67C9BCDC70F1107DDA10013380014E1EC358F69298D53DC8C4C33E64C4DC710C4F267)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (278, NULL, N'Richard Hsu', NULL, N'SYF - Richard Hsu', N'richard.hsu@syf.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Richard Hsu', 1, 0, 2, 0, 0, 2, 0, 0xBE78510C923CF48BDE2ED09D8583D7820259EEA5D70402F98409A649F918DE2A6F7D5D138ADBD2A682903BC7785AE31BE2704F9B6D1A984B2E06ECCD618900C2, 0x29B1C27D63B911E2C998ABA6C942B04F21F45EAB34522AE943E5E6D7FF6233AFFC98E1420607FD7C47466A3617CA5CC758DAE7EE29066855FC1B4A0AA3C2F346AAFC1C525CD793B289D4E8C3E446367EDF19734C81DB5A10DD752F55A5B9D078CB9C113203B5CD86A69CDE8F9E9C1001165DE44BB0494AD19532DCCC24CFC93A)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (279, NULL, N'Thomas Hung', NULL, N'SYF - Thomas Hung', N'thomas.hung@syf.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Thomas Hung', 1, 0, 2, 0, 0, 2, 0, 0x7EE99BC86A6B252D56A64017E18E21BAFF6D9F51B82CD21D0895543434927930C1346A20952E1BAB2669ABBB629F88BF8F04498A086F998809B4514CE0B7CFA7, 0x6FA1FF7B236B7D3F8111B563A975FD49E6EBE3CDD42E66D7367DEF7BE3369A4B307B8D66E65FF0DCF4D9D0521EE0F4E8E4659412D1954F53543C8CCB1927C96ED5C93151B92601E64B2B24E003AACDA949A05B9E53441A59934D76C3063D2A9A7BD22010F5076ED63CFF0E87BAA45EAC44BC45B24E55FA5EBDCB47A63B94786F)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (280, NULL, N'Daniel Chang', NULL, N'SYF - Daniel Chang', N'daniel.chang@syf.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Daniel Chang', 1, 0, 2, 0, 0, 2, 0, 0xF72252874A70830819C26AFA78D07218533E56DE5545823CC76CE7AF3D6DE1383DE733CC92481AD3342A96439FDCB80657C74B688BEBF0DE6F687E944955A6F2, 0x5F0F24758776D920E4E907573C18A23208434CB070AF3A96F34F04C213657025E6141561B8D2928380524604AC05E3054CDC71702724C2C3E525551D5D3D8B93CDF2F5F535B5099519041E00E57235A0186F04B859D6A89F88A566D44C7CB530CAAB9EC2531D50830497079A0E9CC3746C658BD57294F5582AB7B8A8D08147C7)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (281, NULL, N'Hartini', NULL, N'SYF - Hartini', N'hartini@syf.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Hartini', 1, 0, 2, 0, 0, 2, 0, 0x13489658BE5D68B11740673C0025110C1D5DE103FA7888A8B94394611DCD9061FD72DC5A64D082A67C33EB25D496F65CED930FF63A092F31F67DFFC72CFD75D5, 0xA7DA0A6E3D075C383CA1BCB9403022FCA3C37F382445F39AE93486DB5BBE17D174A00A2048D485985CEA339F5D7A20EF4B00A5DCB2DADC1534B55D6EB007125C06E0860E7E72F4989F6FE87F842F21D96B49F88708C6D5888959B2EFE405B1650276E6EA165429349C0B5F781510F284922F57A3E68F12F0259DA970C6750297)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (282, NULL, N'Jay Chang', NULL, N'SYF - Jay Chang', N'jay.chang@syf.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Jay Chang', 1, 0, 2, 0, 0, 2, 0, 0x78667FBA34068BC0DBA695C6194BFDE1A107771CBB8BFDEE2AE4F2B039C7B470A44EA791F33BEB49572F6656E0F8D3F5E7E3E187440B8EF0798B5140F2551A24, 0x063E0ED46699114F41E0D60983D9D1135A6DE232FB25B5D16421F7DE3D6843E720A2173772FC8814C1BB6C8BD5F48A0B4EEE8647FAF8794933D6893A13082F4554E5A5F4C44C50DFA58DC9BF53A14AB3178FB21C48188975EB8FBDE006A83B52873BF462185EB1DA0E6AAA5533EF56F5830F0F43EA7B2FA4466CDF3D07923DC0)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (283, NULL, N'Andy Chiu', NULL, N'SYF - Andy Chiu', N'andy.chiu@syf.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Andy Chiu', 1, 0, 2, 0, 0, 2, 0, 0xE9DDDE2C224F0C334425EEE13914D4B3B56A2B4C7F694914E2567D1C7B41A957949DB9F779673BEDF8EA62B6C4A7A4F7F59346A08DF5BE3D69DCF4ACD5D48807, 0x5092BA9146117D1098244A463281184A423577DF8D226AC4621E93F78572D1DD97EB60F10120F3D09EDDAB42B3A847C1D7B59B2AD4954A3C37BB0D4EB99466FD14D1C171D8F6177F7FAC53A931E6C919EF41D96D92961F41093124DB2C48B2392E38E0218C38083B4FF016C4F3FD62FFF73558E1001C9D73A558B7980A7A6D90)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (284, NULL, N'Eny Sulistyawati', NULL, N'SYF - Eny Sulistyawati', N'eny.sulistyawati@syf.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Eny Sulistyawati', 1, 0, 2, 0, 0, 2, 0, 0x7A566C8D11B4E6854677B25F67C479E255DF4B033C20CA6172F916C98430E5CDB1EFD0741284C51FAF961D7AC1AB11D24CF54FDB07E10AC8FD34FD4592B731FC, 0x15AF48E553B12C8157A1AAD6CC2E49728DEE987D90C74CBFFE3D8D7987BCBA7EFC7ACD4D4BF850CAD1CCF3C0C1395531432AB33C093780CDDEB621E8975D1FCAED3D62C66293A0A7327C4B3FC8F175FB77757EC0A674EA9726A005B7BEE25FC2DBDCB6989340659671C07EC71EAE5D2564B9EFD7433C1199BFF62F7A3C41B1CA)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (285, NULL, N'Chris Wang', NULL, N'SYF - Chris Wang', N'chris.wang@syf.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Chris Wang', 1, 0, 2, 0, 0, 2, 0, 0xA1EEE849FB066CC3421929661D7AC1F5CAF8CBA5A5C303213FCBCBD75357999BD1808316A09EC0B24DF92FAFD6BB267EA6391C2CBEC8C524F41A933B1E1CB568, 0x4E4420EF51F9398CCEC6096FFD35B85E0DDBCA83B58B2E0B8F09AE5BB10C1CEE1A237AEE229064077B85C905D89D1FA8E7C7085D55B551E8B9025AAD50638AE0A261AEBFCD6BAA643AF83D27E88EF455B3DC814B49D29F4ABA5DA152375BA6529E2B9E68D2D0D4E568F250D7741B8B255D0D9DD9F5BE131FE0A389AD0414FE25)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (286, NULL, N'Jacques She', NULL, N'SPC - Jacques.She
', N'jacques.she@spc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Jacques She', 1, 0, 2, 0, 0, 2, 0, 0x06DAC863374B3CC0E2BEE74A76A859A7809CFB28974D2D7614F754D766E7D6733676B581F91868FAC0EB5C537D5443ACF74D65BCDCE7FB6B75D9777AE15181CE, 0x0BDC435F98A3E4AA51BB24409D9DB85B7A2EE6ED0557B67B4E01755DD9847932998401E565F6F94523D91D96693FF5683F34BA3CAB9B4F4D84ED5105E545E594B09A178361693627A6F57CB32168B1BF05E207BCFC0A9FBD8C0B098E4DC1B6DA4E52B53ADBD6388615F263759D36FD052C45C4A9BBAE687F124239074933CC2D)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (287, NULL, N'Joanna Wu', NULL, N'SPC - Joanna.Wu
', N'joanna.wu@spc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Joanna Wu', 1, 0, 2, 0, 0, 2, 0, 0x36D57A6B6A0B1E71A0FABC25E2D41C90E8F94ACEDA81FDA225A681C58DB2595A8175E690FC559249514EEA75DE56673209DEB9DA33806908D1C4B66C24315A5A, 0x93C379623712AECF6B7E138A0FA3D17FBA551E83D461A4BC7F44270E74508329E5ACE5F7297E605FD3DA77A969083D3949A9EAFF306789247792DA027B8BF3E4284743D2FF9F813AA7E857D8B4E2B167C15578505E8FCA5268A94C47BD1686CB2A6E92F996A7A02723ED9836A54AAF860DB907A46B17419F54A225318CD3C6EA)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (288, NULL, N'Cathy', NULL, N'SPC - Cathy.Ge
', N'cathy.ge@spc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Cathy Ge', 1, 0, 2, 0, 0, 2, 0, 0x47AFB2C364BCE97DB32BCDDCDF492F88278F47169D67116CCF85DA2B18598B94776199004D1846E45A92B480E575F8223ADC8777F0A504A2335B3B746874D031, 0xAA4B7CE5A85B5B3054B638F5F616AA9BC5EE8240DE45CCB66C68A9362C19D5C022F6E8DAB2C951A940FE26437643A02C28D364BF9510651222263932B4F824368D9D97638DD7169915843B4C92EBE01E5BAB836C4DC8DDDE23281BAAE0EB43CB04B6FDFEFCE8B369592ADA81C31204706D48696207EF56AFE780786DBDCE41DB)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (289, NULL, N'Rudy', NULL, N'SSB - Rudy Setiawan', N'rudy.setiawan@syf.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Rudy Setiawan', 1, 0, 2, 0, 0, 2, 0, 0x2792C877CF8B799CEA2D08DDB95BB93FA29486D47B1A9570B541613EF282A8534CAF8A71EC6EAD3536C0C0C1FF6BD97D3EA843F746C278D41A9B4400C910D368, 0x6A7B8E4255B54E28DA66C1CED2F3AA426DA21C5B4FC21CB36DCE501CDEFB3A7F150D6E735E04135716410FC7BA472CC5978B57E6AEE9616E96DE80167B50279AA3BF6FDB52C45D92EE2C265E251C2CA313826E92D412B307D0791CE82F579FA6203C4E31200581ABC4BFE36F804DCD647592DDB65D7683D3AFC541743FD3934A)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (290, NULL, N'Brian Lee', NULL, N'SPC - Brian.Lee
', N'brian.lee@spc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Brian Lee', 1, 0, 2, 0, 0, 2, 0, 0xE1CF09DD6D0895DEAD137923523FA5D6B0CD4A33A233848234161902F3A02C92FD944CEFFB5B8E4E2EE6AD4F26499C0784E36D03B078B9FF5ED6E9E4437D6E1F, 0xD91CFB560AC35A31CD0B88CC96DDFB90EEC02CA6151196229437BCE39BC6025F0EADD81B40B5FC415DBB13BD132ECD570BED91F5D7C39344D427F7FA7591666EF7AC540EDE4B060F6F0AB675A44E567E46567560A4FF1AFA7659408CC0C7CBBC5FC7D658A097D58C404C27EE2F2B509616AD5B98C44EFB21784006C050F73C03)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (291, NULL, N'Susan Ren', NULL, N'SPC - Susan.Ren
', N'susan.ren@spc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Susan Ren', 1, 0, 2, 0, 0, 2, 0, 0x3C8566871CF922FE0510302D5504C45AEF44E4D79C2E27A3D955C0C24845748715DEA1C99326DCE3D850693E6C0F3D17133F5EE617FB5573F9336D645EE98C58, 0x685F7164638541E2B69AB52BA8672AE3E748BAA9CD5DA389AD37F051BA0E025B823E9AA57B4399B3341B61C2831792BD0CCE4ADA89A6D456B9932AB59B40A74F773B31DB889DD97D5D75CE15F7F4A68C78BA2B46EBF91A2A6C7FC1020FC10743D25FAAF8222DFED7FDA9749A42FA924D0B64ED5AF19A699668810A87E11A94A4)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (292, NULL, N'Paul Luo', NULL, N'SPC - Paul.Luo
', N'paul.luo@spc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Paul Luo', 1, 0, 2, 0, 0, 2, 0, 0x78317208D95F357061F7314FF8C1ED16786600A440E7D1BCAD3E92244995E98D26D90744878D8EDC2DE5CAC98BE5C73EB0F46C2E8CC234004BB90FDBC59BA0F0, 0x8E04A8C839422D96645D8DB62A72425331A868EFA6F73496002B6B220EA45D909F136E080C5C21E3B5CA9B204174956A344C6342E9DA3673FCE3996A4B456A828816FD25EB81A4D95FE083BEAF43433B522B36D6F49E4D72AC7AF39CBC04DE8CBA03CB1CB5626DF0414D4148723CC2341987C8F5FAA31C34EBD7618C11BEA3E8)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (293, NULL, N'Thet Nyo', NULL, N'SPC - Thet.Nyo
', N'thet.nyo@spc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Thet Nyo', 1, 0, 2, 0, 0, 2, 0, 0x3B849C571F7155339BEFCE684E7D4929B904B54B0F99C3AEA02BA8D2695BBBEA75E799D1518A3E605F3579C699F84D5331276144AE91613D223F2670AD0F8B11, 0x37F4D2B1E94F70DA34B655E9961C094D9CA9F727E49DD50904AE9DEBA3B0F8C8C86C991FCDF6458DFAD2A1D14A4BBAFE119080D9BEB09E2E4FABD8A7372D7A103A3FCC11BFD5CAE3ED7E6E1C64931C5B90C635192B838F135691EFA82B279814CCBF23FCB9094A821F4778B88F72E5121FABA9DAB37D776705117A712AE063F5)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (294, NULL, N'Janette Sapin', NULL, N'SPC - Janette.Sapin
', N'janette@spc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Janette', 1, 0, 2, 0, 0, 2, 0, 0x7FD1AA69D219F4883E5420028813E59EA8D2D13DF251E888EA1467C4C490322BDCF89D50B00C34406E12C55F6DD15C81372DBB8A01A3B4D07A428473A8489189, 0xECE725C4FCA23D4C9643DD9814F3FF8223D07F9118D66434D5041F6505BDFECA4815A1F6DC0C8DA6FAB79B364B34DFB0ED6FDB6134D351B894427AB361467CF07035AC7A5250B7B9F153E014CB635F57DEF0A031BABDCA06B4A7197D276E1DB3B5D4DE5E41C937AAF49C28BEA2615A8ECF47E617C0364CA687FC03F8ED3E2427)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (295, NULL, N'Shwe Yee', NULL, N'SPC - Shwe.Yee
', N'shwe.yee.myint@spc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Shwe Yee ', 1, 0, 2, 0, 0, 2, 0, 0xAD2C4644B7E0809104B2FE3A51F6EDAC764CBFE13A3F56534867AD65CF7C95B5002E7B8B172F4B4AA0A1C4D64BFC26D19EB37F3CFD6AB150C681A7B5F6B306D8, 0xBB3D8D43AF0204E0E107602B469CDB5D07131248EC06C8762E112A68BBBD53362B1B5760108F208621E5F8B014D04CDAD8644C3A83BA3B53207A7073915A3BB9B8EA46941C53C420123CA605D51B23333987FAB7CD9105CB00B2C4D9FC223182873D83092E8D5CC10DB3C0FE99E9B9EA7016C0456B52B7216F73BEFA0848019C)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (296, NULL, N'Jen Ko', NULL, N'SPC - Jen.Ko
', N'jen.ko@spc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Jen Ko', 1, 0, 2, 0, 0, 2, 0, 0x8B99F3B6DC695898B477669D2CEB0E9F37F1EC26F0827054BD39CEC4569ED32C37AF98C69CF7233ECAD0A9B14C96F995EE9B8BCE6D1518D920FF950295ED1310, 0x94146405DD44DD4CEFDCA3A79055E70DDBB35C00F162F381D4541CBF9094368B61509E231408B81602DD7FE9D5B91BAAA09925FE97DBD77F1EFA3FB293EAECCBB95B7D4C46AA0976E432C5921A899ECF43B89ED8DE33CF721E0138E894A3725897AB051B7C2B3E2AB633E782CE85B06C049D3AB35E62FBEA16BA62355A74B765)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (297, NULL, N'henry', NULL, N'SHC - Sy Pham', N'Leo.Doan@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Sy Pham', 1, 119, 2, 0, 0, 2, 0, 0x0F80A64D1613F236AAD5379A6A6AA6F24462C76B9DCA61B7C7C2595DDC1673C239C2E219EA33417D57256ADEFEA3C98E1F570FC3403DFE9B6CD51B7DC9EE90C5, 0x774CB01E45D3F8C530A600B5B426240027CB539EC77AC9B51515EF3D410871F4C7EACEC03FD8DA03534402DE7EA9B4A9616E9163EB43A682C29FC5D3470DF69FC84AF407E6B7BB26249D1C7A3E692382795A2B586B2F386C26CBC5D4CB3EDE7DD4D71A6746134826E99ADE227A3490C3C99D78AEF84FBF9DE88090E73E351414)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (298, NULL, N'ryan', NULL, NULL, N'Sy.Pham@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', NULL, 1, 0, 2, 0, 0, 2, 0, 0x24DE70DF75390449DB8F5D5BD02AAF1ACE7242B983526C69A09D5CF178312D78F969CD41EF446085FDFD705C5F971956D9FDEE01D76175E13B1173FB52029EB1, 0x0AACA2F070528B2C91BA63CD4B9633E8DD44E0E07B1C276F7B54A9DB6B8F0B9401CC2A863C1CF4ABD552344B5D6E7A7DEFC07A03D400EACB1275C8449794D81283EA56388F5C083D0F164C1F62461E49C8A0334C7B891E80E0319BCDB3B3328120A366DED90103AE75DC3A7C19DC4067F8470F72497F9AB99F8EBB9C628FA511)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (299, NULL, N'peter', NULL, N'SHC - Peter Tran', N'Leo.Doan@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Peter Tran', 1, 0, 2, 0, 0, 2, 0, 0x659E4F25B5BD149B610F37C7788396F659522861B65A7ACD0D94AF9538FE07E4F9ADC41FDEAF444D7C64581FD4E8C1F20F3923CBC63BBAC656DA05C59E1ED666, 0xCAD6A62278522A64C32EED5122584828FAE3BC44CAD296FA362F35A550E732616ECDB9A04BCC1627E6B990C6E16D85972DA57EBB5630080B02D8F874FC339364B8A19A936C156875F2546A565E9C240064D74A90BE79A3B2D06ADCF8E6E6B0CA40337DA7816B02D184086FD501C8C6F300DD53C42EF6885C6FE8298879F32148)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (300, N'', N'Swook', NULL, N'SHC - Swook Lu', N'Leo.Doan@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Swook Lu', 1, 119, 2, 0, 0, 2, 0, 0x1DFDD04573DCF69DBF24EAD33BF74BD6AFF9ED9DB4C65FB5EEE68ED06E97778026D358D47F2A9C5FDD6815F1FBA2E196972263C36E9B3C35E95FA690B809137C, 0xAA39CCCB16ADECBF3FC1A4A72907A7C9804DDC789C85784BCB1D58583A1C943BA640B8769647CC40A1EA8C18839CF96BEAEB3B08F2D96A96A8273779CADD601227CBB20C6347D7CBACE7BD8390D909FD7D702D13171A99060A94002125203BBC69ADC165DC807C6A2753CB12A41A90872EB3CF289F91A8282F93B51C39C6FEA4)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (301, NULL, N'Irene', NULL, N'SHC - Irene', N'Leo.Doan@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Irene ', 1, 0, 2, 0, 0, 2, 0, 0x13210A08ABC5C776027526C381A88599EB8B47FE8EC060B302316BCB6B977142C935D59B934FB7246BF3DB2A037D981F2ADDF60B7694B509151BE29AF6D8CC5A, 0x3756323AF38070EF0264EB8DA731DFC8BC289AA67AD59AA68A086F76841A7201CAF99C306172DCC6E8093EDB99A99C586FAB0E85E75B39E75CDE5A790BE1E6AF64EED341D45519C930782D536C39C70D353B122F23CF21B97862552166FBC6746E6A7F8FD9294CEE1B38F4A1F2F6E4E609096234045777E93AD535EB4528730E)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (302, NULL, N'shc', NULL, N'', N'Sy.Pham@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', NULL, 1, 0, 2, 0, 0, 2, 0, 0xB89FCA20BBBF024CD162D0532C3507DFCB47B5AE3B72BE626A9D71292B35181581D78060AAEED351DC4738E532BD22E0176FE913382AA5E0AF660AE3B91AF49A, 0x75D6B3493807DF7ED95390FF4B7F4129F0356C4ED1AA050486FD319565AAD42B7737F0303AE157736173981078132BEF704288BBE6F3D421D72881EFE92DA72EC9A652A90A78D68598FD0893A6347FE23D451A42E1BDCB2E95CBDEDE19F99C03CC29B80E1891870833C09188A9DFABBF5050534C27594E670E399354350DC080)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (303, NULL, N'cb', NULL, N'', N'Sy.Pham@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', NULL, 1, 0, 2, 0, 0, 2, 0, 0x02596DE3E9C14723EE3B99E6A942CAE45D88BAD11CE346ACFA0EA2B0A913E81C124102BCED870D450B26285D88AA3094B450794FE52684DF73FA7AEE3A02B8D4, 0x42A1647ED8182894C75493445C0541B7D25C9E63AD9EF6AAE34EFA4F967754F4D137F149170363D432423C0BCC1CAC4D2E5D01E65F5E22961460E14E0D021BCD04F1931040AAE9A5ED60338DDA214C933718BBF31C1C9BEA545C0D50E93A65DC318A2E18D3985E2D12026FA32D6607A78615E6547D5B1BCF348BD3ACF2AC32AF)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (304, N'', N'spc', NULL, N'', N'Sy.Pham@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', NULL, 1, 0, 2, 0, 0, 2, 0, 0x58EA90DB172256C01CFA906064826E9E678F74DE4503CFEB8DDF52FBDCAF53AAF4F9C08EF8261EFEAE1450C90638EFA324D364E2174D972D355A1982D4EB2D0B, 0xEBE14E0C5C813E4852043EDA9E78011D1FCDFED004AFA383A8127CB0075B388297ED2BF8F21DD9CF67EA44E0A714C240661B2C9B0AD01CBE574FD8101736C5D9FA24E0BDEF73AE31327F7F804F02B920F95C612D58CDCE92EB4D5414A4410186A39F7B77281D16871DA4ED897499A9AF209B9CE62621F51B84EF30C4EB211A79)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (305, NULL, N'syf', NULL, N'', N'Sy.Pham@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', NULL, 1, 0, 2, 0, 0, 2, 0, 0x51D253AE41568B6F2BCD8C651E512FCE58B49873552AD601860CB7AE4BD8BDA3C1486190362A94795F36EB4ED1DF911D81AD2B568A69805B707290E6D6EBE9B8, 0x4E1E12C1F11E9EA802D384D53F54BE48143B748A2A845C546AF38A68258DC70E98C7EE01523DE8308231F6B36CF809B55C73715032EB8B9E5F62300259293EDCCDD81D94FD8ADAD57B8335B84806EE7480195E2D8F5E6814FB15C322DCB81BE80266C703895806ABF641A8160B75808773BFA52AB2FAFA8CC637AD7034E87E7D)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (306, NULL, N'mei.chang', NULL, N'SHC - Mei Chang', N'Leo.Doan@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Mei Chang', 1, 119, 2, 0, 0, 2, 0, 0x0066FBB024B9917AD8788DBC14BFF1DA513AF7D8492B3F2005D1AEF5E6423D684455AC9F3352575F4F4CFA9EE58B2BE15BFAFAB41A3170E44CF9BB9A96266FF8, 0x84EE6C33742D8A887C5BEBC9BE542848B984FF072AC23F2D8A9E5CBA62C2CA93F60B21A95A4BA3FB37903754E2A9B7454450789D64B17D35B088AA768122863F9B305FC549601C9F55F11F73929119B26E32227603724C7F8116A133496D0F9B525386D5564974E728553B232400E953385D47D98944F52B2C94D3D314D23DA3)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (307, NULL, N'cheris', NULL, N'SHC - Cheris Chen', N'cheris.chen@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Cheris Chen', 1, 0, 2, 0, 0, 2, 0, 0xB5E306141D8A9523702066ACB8EB8A11E02E5BC0E599538A12FAECB0F07D0BAB37F74551784F076C19B10498165620EDDFAFE97F6565EB51E23A9C5478AE286B, 0xE8EB033C99FA83464A869A4EB3ABAD42B77260EC915D9F3BA142EA5A576C875D5EA03BBBBE6412FD8F90F721443EB8F3558F2C85EFB02868E44088E98C90F23A7A95A7399912CCFA3CB1A56858300E2295CFC30368B33C0C32F6AB99F030D3C387171302E8D7572C851705A6E34D075AC7123EAE9806A74F7DB3BCAA48A7DD5D)
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt]) VALUES (308, N'', N'yiting.zeng', NULL, N'SHC - YiTing Zeng', N'YiTing.Zeng@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'YiTing Zeng', 1, 0, 2, 0, 0, 2, 0, 0x0007852ADDA6AC97BD7546671E16A0BDBE7C4DD9AD1B99710F937D269CA93B2C333E3C9A165613CF8836869EB4A528FD2CECC43B82D6F37DA4A16A4283D924F0, 0x5ACA813350FEC9B2D44ED854EA12A5642733A639B7089E76398761E27C054E83C1191B5D3367EE142D461C23DD160E0A6DB8C82B4F5664DD4BA8EE215E9ACCF9DE9B58B1CDB42894936F571AC3795F41FF0C20CEFCF5C840B49ED2BBB27FFD31574FF96DDEDC452C3DD26A65DA06F5C24C8F6C91D8F08A794450FA911C9B060C)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkingPlans] ON 
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime]) VALUES (72, N'4C120001W', N'demo', CAST(N'2020-02-18T10:42:35.4137161' AS DateTime2))
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime]) VALUES (73, N'3F010001W', N'Not avaiable! demo ', CAST(N'2020-02-18T11:00:15.1040576' AS DateTime2))
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime]) VALUES (74, N'3F020002W', N'Not avaiable! demo', CAST(N'2020-03-04T08:12:09.4424560' AS DateTime2))
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime]) VALUES (75, N'2DI00010004W', N'Not avaiable!', CAST(N'2020-03-04T08:40:09.2090862' AS DateTime2))
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime]) VALUES (76, N'2DI00010004M', N'Not avaiable!', CAST(N'2020-03-04T08:40:17.4378665' AS DateTime2))
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime]) VALUES (77, N'1GO10004W', N'Not avaiable! demo', CAST(N'2020-03-04T14:39:15.5506813' AS DateTime2))
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime]) VALUES (78, N'1GR00010002W', N'demo working plan ', CAST(N'2020-03-04T16:38:07.5769369' AS DateTime2))
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime]) VALUES (79, N'1GR00010002M', N'demo working plan', CAST(N'2020-03-04T16:38:24.1669166' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[WorkingPlans] OFF
GO
ALTER TABLE [dbo].[MenuRoles] ADD  DEFAULT ((0)) FOR [Index]
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Accounts_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Accounts] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Manager] CHECK CONSTRAINT [FK_Manager_Accounts_UserID]
GO
ALTER TABLE [dbo].[MenuLangs]  WITH CHECK ADD  CONSTRAINT [FK_MenuLangs_Menus_MenuID] FOREIGN KEY([MenuID])
REFERENCES [dbo].[Menus] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MenuLangs] CHECK CONSTRAINT [FK_MenuLangs_Menus_MenuID]
GO
ALTER TABLE [dbo].[MenuRoles]  WITH CHECK ADD  CONSTRAINT [FK_MenuRoles_Menus_MenuID] FOREIGN KEY([MenuID])
REFERENCES [dbo].[Menus] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MenuRoles] CHECK CONSTRAINT [FK_MenuRoles_Menus_MenuID]
GO
ALTER TABLE [dbo].[MenuRoles]  WITH CHECK ADD  CONSTRAINT [FK_MenuRoles_Roles_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MenuRoles] CHECK CONSTRAINT [FK_MenuRoles_Roles_RoleID]
GO
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Accounts_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Accounts] ([ID])
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Accounts_UserID]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Accounts_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Accounts] ([ID])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_Accounts_UserID]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_JobType_JobTypeID] FOREIGN KEY([JobTypeID])
REFERENCES [dbo].[JobType] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_JobType_JobTypeID]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Manager_ManagerID] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Manager] ([ID])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_Manager_ManagerID]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_TeamMember_TeamMemberID] FOREIGN KEY([TeamMemberID])
REFERENCES [dbo].[TeamMember] ([ID])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_TeamMember_TeamMemberID]
GO
ALTER TABLE [dbo].[TeamMember]  WITH CHECK ADD  CONSTRAINT [FK_TeamMember_Accounts_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Accounts] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TeamMember] CHECK CONSTRAINT [FK_TeamMember_Accounts_UserID]
GO
