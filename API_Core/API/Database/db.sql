USE [KPI991]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/20/2020 3:15:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 7/20/2020 3:15:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Username] [nvarchar](max) NULL,
	[PasswordHash] [varbinary](max) NULL,
	[PasswordSalt] [varbinary](max) NULL,
	[Email] [nvarchar](max) NULL,
	[PermissionID] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActionPlanDetails]    Script Date: 7/20/2020 3:15:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionPlanDetails](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ActionPlanID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Sent] [bit] NOT NULL,
	[Seen] [bit] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_ActionPlanDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActionPlans]    Script Date: 7/20/2020 3:15:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionPlans](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
	[Remark] [nvarchar](max) NULL,
	[KPILevelID] [int] NULL,
	[FileName] [nvarchar](max) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_ActionPlans] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/20/2020 3:15:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NULL,
	[LevelID] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[ParentID] [nvarchar](max) NULL,
	[UserID] [int] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryKPILevels]    Script Date: 7/20/2020 3:15:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryKPILevels](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[KPILevelID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[ModifyBy] [nvarchar](max) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_CategoryKPILevels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryLangs]    Script Date: 7/20/2020 3:15:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryLangs](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](max) NULL,
	[LanguageID] [nvarchar](max) NULL,
	[CategoryID] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_CategoryLangs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 7/20/2020 3:15:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CommentMsg] [nvarchar](max) NULL,
	[UserID] [int] NOT NULL,
	[DataID] [int] NOT NULL,
	[Link] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[CommentedDate] [datetime2](7) NOT NULL,
	[Pin] [bit] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Data]    Script Date: 7/20/2020 3:15:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Data](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
	[Yearly] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Data] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Datas]    Script Date: 7/20/2020 3:15:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Datas](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[KPILevelCode] [nvarchar](max) NULL,
	[Period] [nvarchar](max) NULL,
	[Value] [nvarchar](max) NULL,
	[Week] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Half] [int] NOT NULL,
	[Quarter] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[Yearly] [int] NOT NULL,
	[DateUpload] [nvarchar](max) NULL,
	[Remark] [nvarchar](max) NULL,
	[Target] [nvarchar](max) NULL,
	[CreateTime] [datetime] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Datas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorMessages]    Script Date: 7/20/2020 3:15:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorMessages](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CreateTime] [datetime] NOT NULL,
	[Function] [nvarchar](max) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_ErrorMessages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favourites]    Script Date: 7/20/2020 3:15:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favourites](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[KPILevelCode] [nvarchar](max) NULL,
	[UserID] [int] NOT NULL,
	[Period] [nvarchar](max) NULL,
	[CreateTime] [datetime] NOT NULL,
	[Link] [nvarchar](max) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Favourites] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryActionPlans]    Script Date: 7/20/2020 3:15:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryActionPlans](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Action] [nvarchar](max) NULL,
	[ActionPlanID] [int] NULL,
	[ActualFinishDate] [datetime] NULL,
	[UpdateSheduleDate] [datetime] NULL,
	[UserID] [int] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_HistoryActionPlan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobType]    Script Date: 7/20/2020 3:15:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobType](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KPILangs]    Script Date: 7/20/2020 3:15:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KPILangs](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](max) NULL,
	[LanguageID] [nvarchar](max) NULL,
	[KPIID] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_KPILangs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KPILevels]    Script Date: 7/20/2020 3:15:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KPILevels](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[KPILevelCode] [nvarchar](max) NULL,
	[UserCheck] [nvarchar](max) NULL,
	[KPIID] [int] NOT NULL,
	[LevelID] [int] NOT NULL,
	[TeamID] [int] NULL,
	[Period] [nvarchar](max) NULL,
	[Weekly] [int] NULL,
	[Monthly] [datetime] NULL,
	[HalfYear] [datetime] NULL,
	[Quarterly] [datetime] NULL,
	[Yearly] [datetime] NULL,
	[Checked] [bit] NULL,
	[WeeklyChecked] [bit] NULL,
	[MonthlyChecked] [bit] NULL,
	[HalfYearChecked] [bit] NULL,
	[QuarterlyChecked] [bit] NULL,
	[YearlyChecked] [bit] NULL,
	[CheckedPeriod] [bit] NULL,
	[WeeklyPublic] [bit] NULL,
	[MonthlyPublic] [bit] NULL,
	[HalfYearPublic] [bit] NULL,
	[QuarterlyPublic] [bit] NULL,
	[YearlyPublic] [bit] NULL,
	[TimeCheck] [datetime] NULL,
	[CreateTime] [datetime] NOT NULL,
	[LevelNumber] [int] NOT NULL,
	[WeeklyStandard] [int] NOT NULL,
	[MonthlyStandard] [int] NOT NULL,
	[HalfYearStandard] [int] NOT NULL,
	[QuarterlyStandard] [int] NOT NULL,
	[YearlyStandard] [int] NOT NULL,
	[WeeklyTarget] [int] NOT NULL,
	[MonthlyTarget] [int] NOT NULL,
	[HalfYearTarget] [int] NOT NULL,
	[QuarterlyTarget] [int] NOT NULL,
	[YearlyTarget] [int] NOT NULL,
	[PIC] [int] NOT NULL,
	[Owner] [int] NOT NULL,
	[OwnerManagerment] [int] NOT NULL,
	[ModifyBy] [nvarchar](max) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_KPILevels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KPIs]    Script Date: 7/20/2020 3:15:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KPIs](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NULL,
	[LevelID] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[ParentID] [nvarchar](max) NULL,
	[CategoryCode] [nvarchar](max) NULL,
	[CategoryID] [int] NOT NULL,
	[Unit] [int] NOT NULL,
	[UserID] [int] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_KPIs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LateOnUpLoads]    Script Date: 7/20/2020 3:15:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LateOnUpLoads](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[UserID] [int] NOT NULL,
	[NotificationID] [int] NOT NULL,
	[Area] [nvarchar](max) NULL,
	[DeadLine] [nvarchar](max) NULL,
	[KPIName] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NULL,
	[Year] [nvarchar](max) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_LateOnUpLoads] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Levels]    Script Date: 7/20/2020 3:15:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Levels](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NULL,
	[ParentID] [int] NULL,
	[ParentCode] [nvarchar](max) NULL,
	[LevelNumber] [int] NULL,
	[State] [bit] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Levels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 7/20/2020 3:15:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[UserID] [int] NOT NULL,
	[PropjectID] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Managers]    Script Date: 7/20/2020 3:15:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Managers](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CategoryID] [int] NOT NULL,
	[KPILevelID] [int] NOT NULL,
	[KPILevelCode] [nvarchar](max) NULL,
	[CategoryCode] [nvarchar](max) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Managers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuLangs]    Script Date: 7/20/2020 3:15:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuLangs](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[LangID] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[MenuID] [int] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_MenuLangs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuRoles]    Script Date: 7/20/2020 3:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuRoles](
	[MenuID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
	[Index] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 7/20/2020 3:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Link] [nvarchar](max) NULL,
	[FontAwesome] [nvarchar](max) NULL,
	[BackgroudColor] [nvarchar](max) NULL,
	[Position] [int] NOT NULL,
	[Code] [nvarchar](max) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Menus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationDetails]    Script Date: 7/20/2020 3:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationDetails](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[UserID] [int] NOT NULL,
	[NotificationID] [int] NOT NULL,
	[Seen] [bit] NOT NULL,
	[Action] [nvarchar](max) NULL,
	[CreateTime] [datetime] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[URL] [nvarchar](max) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_NotificationDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 7/20/2020 3:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OCCategories]    Script Date: 7/20/2020 3:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OCCategories](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OCID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[ModifyBy] [nvarchar](max) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_OCCategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OCs]    Script Date: 7/20/2020 3:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OCs](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](max) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_OCs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Owners]    Script Date: 7/20/2020 3:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owners](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CategoryID] [int] NOT NULL,
	[KPILevelID] [int] NOT NULL,
	[KPILevelCode] [nvarchar](max) NULL,
	[CategoryCode] [nvarchar](max) NULL,
	[CreatedTime] [datetime] NULL,
	[UserID] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Owners] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Participants]    Script Date: 7/20/2020 3:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Participants](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CategoryID] [int] NOT NULL,
	[KPILevelID] [int] NOT NULL,
	[KPILevelCode] [nvarchar](max) NULL,
	[CategoryCode] [nvarchar](max) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Participants] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 7/20/2020 3:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](max) NULL,
	[UserID] [int] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/20/2020 3:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeenComments]    Script Date: 7/20/2020 3:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeenComments](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CommentID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_SeenComments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 7/20/2020 3:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[State] [bit] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sponsors]    Script Date: 7/20/2020 3:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sponsors](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CategoryID] [int] NOT NULL,
	[KPILevelID] [int] NOT NULL,
	[KPILevelCode] [nvarchar](max) NULL,
	[CategoryCode] [nvarchar](max) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Sponsors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StateSendMails]    Script Date: 7/20/2020 3:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateSendMails](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ToDay] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_StateSendMails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 7/20/2020 3:15:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[UserID] [int] NULL,
	[CommentID] [int] NULL,
	[ActionPlanID] [int] NULL,
	[NotificationID] [int] NULL,
	[IsUpload] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 7/20/2020 3:15:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamMember]    Script Date: 7/20/2020 3:15:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamMember](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[UserID] [int] NOT NULL,
	[PropjectID] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Units]    Script Date: 7/20/2020 3:15:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Units](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](max) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Units] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uploaders]    Script Date: 7/20/2020 3:15:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uploaders](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CategoryID] [int] NOT NULL,
	[KPILevelID] [int] NOT NULL,
	[KPILevelCode] [nvarchar](max) NULL,
	[CategoryCode] [nvarchar](max) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Uploaders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/20/2020 3:15:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
	[CreatedBy] [nvarchar](max) NULL,
	[UserID] [int] NULL,
	[ModifyBy] [nvarchar](max) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkingPlans]    Script Date: 7/20/2020 3:15:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkingPlans](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_WorkingPlans] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (36, 40, 297, 0, 0, CAST(N'2020-05-20T12:06:57.163' AS DateTime), N'3321c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (37, 41, 299, 0, 0, CAST(N'2020-05-22T08:34:01.553' AS DateTime), N'3421c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (38, 42, 305, 0, 0, CAST(N'2020-05-22T08:45:18.983' AS DateTime), N'3521c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (39, 43, 299, 0, 0, CAST(N'2020-05-22T09:03:53.667' AS DateTime), N'3621c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (40, 49, 299, 0, 0, CAST(N'2020-05-22T09:29:04.090' AS DateTime), N'3721c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (41, 53, 299, 0, 0, CAST(N'2020-05-22T09:48:18.393' AS DateTime), N'3821c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (42, 54, 299, 0, 0, CAST(N'2020-05-22T09:55:43.620' AS DateTime), N'3921c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (43, 56, 299, 0, 0, CAST(N'2020-05-22T10:02:00.733' AS DateTime), N'3a21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (44, 57, 299, 0, 0, CAST(N'2020-05-22T12:21:47.460' AS DateTime), N'3b21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (45, 58, 299, 0, 0, CAST(N'2020-05-25T09:57:15.900' AS DateTime), N'3c21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (46, 59, 299, 0, 0, CAST(N'2020-05-25T11:21:23.783' AS DateTime), N'3d21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (47, 60, 299, 0, 0, CAST(N'2020-05-25T12:23:15.837' AS DateTime), N'3e21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (48, 61, 299, 0, 0, CAST(N'2020-05-27T09:56:00.583' AS DateTime), N'3f21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (49, 62, 299, 0, 0, CAST(N'2020-05-27T10:03:32.310' AS DateTime), N'4021c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (50, 63, 299, 0, 0, CAST(N'2020-05-27T10:07:54.193' AS DateTime), N'4121c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (51, 64, 299, 0, 0, CAST(N'2020-05-27T10:13:32.100' AS DateTime), N'4221c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (52, 65, 299, 0, 0, CAST(N'2020-05-27T10:15:39.673' AS DateTime), N'4321c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (53, 66, 299, 0, 0, CAST(N'2020-05-27T10:21:22.620' AS DateTime), N'4421c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (54, 67, 299, 0, 0, CAST(N'2020-05-27T10:33:10.940' AS DateTime), N'4521c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (55, 68, 299, 0, 0, CAST(N'2020-05-27T10:49:52.160' AS DateTime), N'4621c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (56, 69, 299, 0, 0, CAST(N'2020-05-27T10:52:39.857' AS DateTime), N'4721c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (57, 70, 299, 0, 0, CAST(N'2020-05-27T11:04:31.813' AS DateTime), N'4821c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (58, 71, 299, 0, 0, CAST(N'2020-05-27T11:07:16.603' AS DateTime), N'4921c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (59, 72, 299, 0, 0, CAST(N'2020-05-27T11:11:07.973' AS DateTime), N'4a21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (60, 73, 299, 0, 0, CAST(N'2020-05-27T11:16:39.183' AS DateTime), N'4b21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (61, 74, 299, 0, 0, CAST(N'2020-05-27T11:22:16.973' AS DateTime), N'4c21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (62, 75, 299, 0, 0, CAST(N'2020-05-27T11:24:30.883' AS DateTime), N'4d21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (63, 76, 299, 0, 0, CAST(N'2020-05-27T11:25:54.720' AS DateTime), N'4e21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (64, 77, 299, 0, 0, CAST(N'2020-05-27T11:33:39.473' AS DateTime), N'4f21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (65, 78, 305, 0, 0, CAST(N'2020-05-27T11:43:00.460' AS DateTime), N'5021c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (66, 79, 299, 0, 0, CAST(N'2020-05-27T11:43:36.380' AS DateTime), N'5121c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (67, 80, 299, 0, 0, CAST(N'2020-05-27T11:51:24.660' AS DateTime), N'5221c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (68, 81, 299, 0, 0, CAST(N'2020-05-27T11:53:06.813' AS DateTime), N'5321c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (69, 82, 299, 0, 0, CAST(N'2020-05-27T12:03:39.297' AS DateTime), N'5421c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (70, 83, 299, 0, 0, CAST(N'2020-05-27T12:20:46.833' AS DateTime), N'5521c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (71, 84, 297, 0, 0, CAST(N'2020-05-28T10:59:08.830' AS DateTime), N'5621c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (72, 84, 299, 0, 0, CAST(N'2020-05-28T10:59:08.837' AS DateTime), N'5721c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (73, 85, 299, 0, 0, CAST(N'2020-05-28T10:59:14.183' AS DateTime), N'5821c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (74, 86, 299, 0, 0, CAST(N'2020-05-28T11:32:10.217' AS DateTime), N'5921c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (75, 87, 299, 0, 0, CAST(N'2020-05-28T11:33:19.367' AS DateTime), N'5a21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (76, 88, 301, 0, 0, CAST(N'2020-05-28T11:58:48.813' AS DateTime), N'5b21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (77, 89, 299, 0, 0, CAST(N'2020-06-09T08:54:51.673' AS DateTime), N'5c21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (78, 90, 299, 0, 0, CAST(N'2020-06-09T08:58:26.030' AS DateTime), N'5d21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (79, 91, 299, 0, 0, CAST(N'2020-06-09T09:37:40.450' AS DateTime), N'5e21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (80, 92, 299, 0, 0, CAST(N'2020-06-09T09:43:30.977' AS DateTime), N'5f21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (81, 93, 257, 0, 0, CAST(N'2020-06-17T14:20:29.633' AS DateTime), N'6021c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (82, 94, 259, 0, 0, CAST(N'2020-06-18T16:35:51.080' AS DateTime), N'6121c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (83, 95, 299, 0, 0, CAST(N'2020-06-19T07:30:38.767' AS DateTime), N'6221c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (84, 96, 299, 0, 0, CAST(N'2020-06-19T08:23:47.107' AS DateTime), N'6321c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (85, 97, 299, 0, 0, CAST(N'2020-06-19T11:08:18.947' AS DateTime), N'6421c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (86, 98, 299, 0, 0, CAST(N'2020-06-19T12:12:24.563' AS DateTime), N'6521c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (87, 99, 299, 0, 0, CAST(N'2020-06-19T14:39:43.060' AS DateTime), N'6621c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (88, 100, 297, 0, 0, CAST(N'2020-06-19T15:35:28.653' AS DateTime), N'6721c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (89, 101, 297, 0, 0, CAST(N'2020-07-06T09:51:02.847' AS DateTime), N'6821c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (90, 116, 299, 0, 0, CAST(N'2020-07-09T10:52:22.437' AS DateTime), N'52617d97-97c1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlanDetails] ([ID], [ActionPlanID], [UserID], [Sent], [Seen], [CreateTime], [rowguid]) VALUES (91, 117, 299, 0, 0, CAST(N'2020-07-09T11:13:30.163' AS DateTime), N'3a021d8b-9ac1-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[ActionPlanDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[ActionPlans] ON 
GO
INSERT [dbo].[ActionPlans] ([ID], [Title], [Deadline], [SubmitDate], [ApprovedBy], [UserID], [DataID], [CommentID], [KPILevelCodeAndPeriod], [Description], [Status], [ApprovedStatus], [Tag], [CreateTime], [TagID], [Link], [Auditor], [UpdateSheduleDate], [ActualFinishDate], [KPILevelCode], [Name], [Remark], [KPILevelID], [FileName], [rowguid]) VALUES (86, N'ddd', CAST(N'2020-05-28T00:00:00.000' AS DateTime), CAST(N'2020-05-28T00:00:00.000' AS DateTime), 0, 300, 1006, 342, N'30003H', N'ddd', 0, 0, N'SHC - Sy Pham,SHC - Irene', CAST(N'2020-05-28T11:32:10.033' AS DateTime), 0, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', 299, CAST(N'2020-06-18T00:00:00.000' AS DateTime), NULL, N'30003', N'KPI BY LEO E', NULL, 1073, NULL, N'6921c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlans] ([ID], [Title], [Deadline], [SubmitDate], [ApprovedBy], [UserID], [DataID], [CommentID], [KPILevelCodeAndPeriod], [Description], [Status], [ApprovedStatus], [Tag], [CreateTime], [TagID], [Link], [Auditor], [UpdateSheduleDate], [ActualFinishDate], [KPILevelCode], [Name], [Remark], [KPILevelID], [FileName], [rowguid]) VALUES (87, N'ddd2', CAST(N'2020-05-28T00:00:00.000' AS DateTime), CAST(N'2020-05-28T00:00:00.000' AS DateTime), 0, 300, 1006, 342, N'30003H', N'ddd2', 1, 0, N'SHC - Sy Pham,SHC - Irene', CAST(N'2020-05-28T11:33:19.337' AS DateTime), 0, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', 299, CAST(N'2020-06-20T00:00:00.000' AS DateTime), CAST(N'2020-06-18T11:40:28.067' AS DateTime), N'30003', N'KPI BY LEO E', NULL, 1073, NULL, N'6a21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlans] ([ID], [Title], [Deadline], [SubmitDate], [ApprovedBy], [UserID], [DataID], [CommentID], [KPILevelCodeAndPeriod], [Description], [Status], [ApprovedStatus], [Tag], [CreateTime], [TagID], [Link], [Auditor], [UpdateSheduleDate], [ActualFinishDate], [KPILevelCode], [Name], [Remark], [KPILevelID], [FileName], [rowguid]) VALUES (88, N'ddd3', CAST(N'2020-05-28T00:00:00.000' AS DateTime), CAST(N'2020-05-28T00:00:00.000' AS DateTime), 0, 300, 1006, 342, N'30003H', N'ddd3', 1, 0, N'SHC - Sy Pham', CAST(N'2020-05-28T11:58:48.627' AS DateTime), 0, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', 301, CAST(N'2020-06-20T00:00:00.000' AS DateTime), CAST(N'2020-06-17T16:18:56.133' AS DateTime), N'30003', N'KPI BY LEO E', NULL, 1073, NULL, N'6b21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlans] ([ID], [Title], [Deadline], [SubmitDate], [ApprovedBy], [UserID], [DataID], [CommentID], [KPILevelCodeAndPeriod], [Description], [Status], [ApprovedStatus], [Tag], [CreateTime], [TagID], [Link], [Auditor], [UpdateSheduleDate], [ActualFinishDate], [KPILevelCode], [Name], [Remark], [KPILevelID], [FileName], [rowguid]) VALUES (89, N'demo 6/9', CAST(N'2020-09-06T00:00:00.000' AS DateTime), CAST(N'2020-09-06T00:00:00.000' AS DateTime), 0, 300, 1006, 342, N'30003H', N'demo', 0, 0, N'SHC - Sy Pham', CAST(N'2020-06-09T08:54:51.483' AS DateTime), 0, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', 299, CAST(N'2020-06-19T00:00:00.000' AS DateTime), NULL, N'30003', N'KPI BY LEO E', NULL, 1073, NULL, N'6c21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlans] ([ID], [Title], [Deadline], [SubmitDate], [ApprovedBy], [UserID], [DataID], [CommentID], [KPILevelCodeAndPeriod], [Description], [Status], [ApprovedStatus], [Tag], [CreateTime], [TagID], [Link], [Auditor], [UpdateSheduleDate], [ActualFinishDate], [KPILevelCode], [Name], [Remark], [KPILevelID], [FileName], [rowguid]) VALUES (92, N'9:434', CAST(N'2020-06-15T00:00:00.000' AS DateTime), CAST(N'2020-09-06T00:00:00.000' AS DateTime), 0, 300, 1002, 309, N'30001H', N'9h434', 0, 0, N'SHC - Sy Pham', CAST(N'2020-06-09T09:43:30.960' AS DateTime), 0, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', 299, CAST(N'2020-06-26T00:00:00.000' AS DateTime), NULL, N'30001', N'KPI UploadE', N'aaa123', 15, NULL, N'6d21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlans] ([ID], [Title], [Deadline], [SubmitDate], [ApprovedBy], [UserID], [DataID], [CommentID], [KPILevelCodeAndPeriod], [Description], [Status], [ApprovedStatus], [Tag], [CreateTime], [TagID], [Link], [Auditor], [UpdateSheduleDate], [ActualFinishDate], [KPILevelCode], [Name], [Remark], [KPILevelID], [FileName], [rowguid]) VALUES (93, N'dddddd', CAST(N'2020-06-17T00:00:00.000' AS DateTime), CAST(N'2020-06-17T00:00:00.000' AS DateTime), 0, 300, 1006, 315, N'30003H', N'dddd', 0, 0, N'SHC - Jenny Wang
', CAST(N'2020-06-17T14:20:29.473' AS DateTime), 0, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', 257, NULL, NULL, N'30003', N'KPI BY LEO E', NULL, 1073, NULL, N'6e21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlans] ([ID], [Title], [Deadline], [SubmitDate], [ApprovedBy], [UserID], [DataID], [CommentID], [KPILevelCodeAndPeriod], [Description], [Status], [ApprovedStatus], [Tag], [CreateTime], [TagID], [Link], [Auditor], [UpdateSheduleDate], [ActualFinishDate], [KPILevelCode], [Name], [Remark], [KPILevelID], [FileName], [rowguid]) VALUES (97, N'demo attack1', CAST(N'2020-06-19T00:00:00.000' AS DateTime), CAST(N'2020-06-19T00:00:00.000' AS DateTime), 0, 300, 1006, 342, N'30003H', N'demo attack', 0, 0, N'SHC - Sy Pham', CAST(N'2020-06-19T11:08:18.860' AS DateTime), 0, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', 299, NULL, NULL, N'30003', N'KPI BY LEO E', NULL, 1073, N'exceldocument.xlsx', N'6f21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlans] ([ID], [Title], [Deadline], [SubmitDate], [ApprovedBy], [UserID], [DataID], [CommentID], [KPILevelCodeAndPeriod], [Description], [Status], [ApprovedStatus], [Tag], [CreateTime], [TagID], [Link], [Auditor], [UpdateSheduleDate], [ActualFinishDate], [KPILevelCode], [Name], [Remark], [KPILevelID], [FileName], [rowguid]) VALUES (99, N'demo root cause', CAST(N'2020-06-19T00:00:00.000' AS DateTime), CAST(N'2020-06-19T00:00:00.000' AS DateTime), 300, 300, 1006, 371, N'30003H', N'demo root cause', 0, 1, N'SHC - Sy Pham', CAST(N'2020-06-19T14:39:43.017' AS DateTime), 0, N'/ChartPeriod/30003/1036/H/2020/1/2/task/371/1006/Action-Plan-on-January-', 299, CAST(N'2020-06-23T00:00:00.000' AS DateTime), CAST(N'2020-06-26T08:52:22.767' AS DateTime), N'30003', N'KPI BY LEO E', NULL, 1073, N'DataUpload.xlsx', N'7021c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlans] ([ID], [Title], [Deadline], [SubmitDate], [ApprovedBy], [UserID], [DataID], [CommentID], [KPILevelCodeAndPeriod], [Description], [Status], [ApprovedStatus], [Tag], [CreateTime], [TagID], [Link], [Auditor], [UpdateSheduleDate], [ActualFinishDate], [KPILevelCode], [Name], [Remark], [KPILevelID], [FileName], [rowguid]) VALUES (100, N'demo pic', CAST(N'2020-06-19T00:00:00.000' AS DateTime), CAST(N'2020-06-19T00:00:00.000' AS DateTime), 300, 300, 1006, 371, N'30003H', N'demo pic', 0, 1, N'user by Leo', CAST(N'2020-06-19T15:35:28.640' AS DateTime), 0, N'/ChartPeriod/30003/1036/H/2020/1/2/task/371/1006/Action-Plan-on-January-', 297, NULL, CAST(N'2020-06-26T08:52:20.790' AS DateTime), N'30003', N'KPI BY LEO E', NULL, 1073, NULL, N'7121c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlans] ([ID], [Title], [Deadline], [SubmitDate], [ApprovedBy], [UserID], [DataID], [CommentID], [KPILevelCodeAndPeriod], [Description], [Status], [ApprovedStatus], [Tag], [CreateTime], [TagID], [Link], [Auditor], [UpdateSheduleDate], [ActualFinishDate], [KPILevelCode], [Name], [Remark], [KPILevelID], [FileName], [rowguid]) VALUES (101, N'demo data week', CAST(N'2020-06-07T00:00:00.000' AS DateTime), CAST(N'2020-06-07T00:00:00.000' AS DateTime), 0, 300, 1033, 372, N'30005W', N'demo data week', 0, 0, N'SHC - Peter Tran', CAST(N'2020-07-06T09:51:02.807' AS DateTime), 0, N'/ChartPeriod/30005/1037/W/2020/1/53/task/372/1033/Action-Plan-on-April-', 297, NULL, NULL, N'30005', N'KPI DEMO WEEK', NULL, 1130, NULL, N'7221c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlans] ([ID], [Title], [Deadline], [SubmitDate], [ApprovedBy], [UserID], [DataID], [CommentID], [KPILevelCodeAndPeriod], [Description], [Status], [ApprovedStatus], [Tag], [CreateTime], [TagID], [Link], [Auditor], [UpdateSheduleDate], [ActualFinishDate], [KPILevelCode], [Name], [Remark], [KPILevelID], [FileName], [rowguid]) VALUES (102, N'demo data week', CAST(N'2020-06-07T00:00:00.000' AS DateTime), CAST(N'2020-06-07T00:00:00.000' AS DateTime), 0, 300, 1033, 372, N'30005W', N'demo data week', 0, 0, N'SHC - Peter Tran', CAST(N'2020-06-06T09:51:02.807' AS DateTime), 0, N'/ChartPeriod/30005/1037/W/2020/1/53/task/372/1033/Action-Plan-on-April-', 297, NULL, NULL, N'30005', N'KPI DEMO WEEK', NULL, 1130, NULL, N'7321c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlans] ([ID], [Title], [Deadline], [SubmitDate], [ApprovedBy], [UserID], [DataID], [CommentID], [KPILevelCodeAndPeriod], [Description], [Status], [ApprovedStatus], [Tag], [CreateTime], [TagID], [Link], [Auditor], [UpdateSheduleDate], [ActualFinishDate], [KPILevelCode], [Name], [Remark], [KPILevelID], [FileName], [rowguid]) VALUES (103, N'demo data week', CAST(N'2020-06-07T00:00:00.000' AS DateTime), CAST(N'2020-06-07T00:00:00.000' AS DateTime), 0, 300, 1033, 372, N'30005W', N'demo data week', 0, 0, N'SHC - Peter Tran', CAST(N'2020-05-06T09:51:02.807' AS DateTime), 0, N'/ChartPeriod/30005/1037/W/2020/1/53/task/372/1033/Action-Plan-on-April-', 297, NULL, NULL, N'30005', N'KPI DEMO WEEK', NULL, 1130, NULL, N'7421c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlans] ([ID], [Title], [Deadline], [SubmitDate], [ApprovedBy], [UserID], [DataID], [CommentID], [KPILevelCodeAndPeriod], [Description], [Status], [ApprovedStatus], [Tag], [CreateTime], [TagID], [Link], [Auditor], [UpdateSheduleDate], [ActualFinishDate], [KPILevelCode], [Name], [Remark], [KPILevelID], [FileName], [rowguid]) VALUES (104, N'demo data week', CAST(N'2020-06-07T00:00:00.000' AS DateTime), CAST(N'2020-06-07T00:00:00.000' AS DateTime), 0, 300, 1033, 372, N'30005W', N'demo data week', 0, 0, N'SHC - Peter Tran', CAST(N'2020-04-06T09:51:02.807' AS DateTime), 0, N'/ChartPeriod/30005/1037/W/2020/1/53/task/372/1033/Action-Plan-on-April-', 297, NULL, NULL, N'30005', N'KPI DEMO WEEK', NULL, 1130, NULL, N'7521c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlans] ([ID], [Title], [Deadline], [SubmitDate], [ApprovedBy], [UserID], [DataID], [CommentID], [KPILevelCodeAndPeriod], [Description], [Status], [ApprovedStatus], [Tag], [CreateTime], [TagID], [Link], [Auditor], [UpdateSheduleDate], [ActualFinishDate], [KPILevelCode], [Name], [Remark], [KPILevelID], [FileName], [rowguid]) VALUES (105, N'demo data week', CAST(N'2020-06-07T00:00:00.000' AS DateTime), CAST(N'2020-06-07T00:00:00.000' AS DateTime), 0, 300, 1033, 372, N'30005W', N'demo data week', 0, 0, N'SHC - Peter Tran', CAST(N'2020-03-06T09:51:02.807' AS DateTime), 0, N'/ChartPeriod/30005/1037/W/2020/1/53/task/372/1033/Action-Plan-on-April-', 297, NULL, NULL, N'30005', N'KPI DEMO WEEK', NULL, 1130, NULL, N'7621c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlans] ([ID], [Title], [Deadline], [SubmitDate], [ApprovedBy], [UserID], [DataID], [CommentID], [KPILevelCodeAndPeriod], [Description], [Status], [ApprovedStatus], [Tag], [CreateTime], [TagID], [Link], [Auditor], [UpdateSheduleDate], [ActualFinishDate], [KPILevelCode], [Name], [Remark], [KPILevelID], [FileName], [rowguid]) VALUES (106, N'demo data week', CAST(N'2020-06-07T00:00:00.000' AS DateTime), CAST(N'2020-06-07T00:00:00.000' AS DateTime), 0, 300, 1033, 372, N'30005W', N'demo data week', 0, 0, N'SHC - Peter Tran', CAST(N'2020-02-06T09:51:02.807' AS DateTime), 0, N'/ChartPeriod/30005/1037/W/2020/1/53/task/372/1033/Action-Plan-on-April-', 297, NULL, NULL, N'30005', N'KPI DEMO WEEK', NULL, 1130, NULL, N'7721c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlans] ([ID], [Title], [Deadline], [SubmitDate], [ApprovedBy], [UserID], [DataID], [CommentID], [KPILevelCodeAndPeriod], [Description], [Status], [ApprovedStatus], [Tag], [CreateTime], [TagID], [Link], [Auditor], [UpdateSheduleDate], [ActualFinishDate], [KPILevelCode], [Name], [Remark], [KPILevelID], [FileName], [rowguid]) VALUES (107, N'demo data week', CAST(N'2020-06-07T00:00:00.000' AS DateTime), CAST(N'2020-06-07T00:00:00.000' AS DateTime), 0, 300, 1033, 372, N'30005W', N'demo data week', 0, 0, N'SHC - Peter Tran', CAST(N'2020-01-06T09:51:02.807' AS DateTime), 0, N'/ChartPeriod/30005/1037/W/2020/1/53/task/372/1033/Action-Plan-on-April-', 297, NULL, NULL, N'30005', N'KPI DEMO WEEK', NULL, 1130, NULL, N'7821c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlans] ([ID], [Title], [Deadline], [SubmitDate], [ApprovedBy], [UserID], [DataID], [CommentID], [KPILevelCodeAndPeriod], [Description], [Status], [ApprovedStatus], [Tag], [CreateTime], [TagID], [Link], [Auditor], [UpdateSheduleDate], [ActualFinishDate], [KPILevelCode], [Name], [Remark], [KPILevelID], [FileName], [rowguid]) VALUES (108, N'demo data week', CAST(N'2020-06-07T00:00:00.000' AS DateTime), CAST(N'2020-06-07T00:00:00.000' AS DateTime), 0, 300, 1033, 372, N'30005W', N'demo data week', 0, 0, N'SHC - Peter Tran', CAST(N'2020-06-06T09:51:02.807' AS DateTime), 0, N'/ChartPeriod/30005/1037/W/2020/1/53/task/372/1033/Action-Plan-on-April-', 297, NULL, NULL, N'30005', N'KPI DEMO WEEK', NULL, 1130, NULL, N'7921c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlans] ([ID], [Title], [Deadline], [SubmitDate], [ApprovedBy], [UserID], [DataID], [CommentID], [KPILevelCodeAndPeriod], [Description], [Status], [ApprovedStatus], [Tag], [CreateTime], [TagID], [Link], [Auditor], [UpdateSheduleDate], [ActualFinishDate], [KPILevelCode], [Name], [Remark], [KPILevelID], [FileName], [rowguid]) VALUES (109, N'demo data week', CAST(N'2020-06-07T00:00:00.000' AS DateTime), CAST(N'2020-06-07T00:00:00.000' AS DateTime), 0, 300, 1033, 372, N'30005W', N'demo data week', 0, 0, N'SHC - Peter Tran', CAST(N'2020-08-06T09:51:02.807' AS DateTime), 0, N'/ChartPeriod/30005/1037/W/2020/1/53/task/372/1033/Action-Plan-on-April-', 297, NULL, NULL, N'30005', N'KPI DEMO WEEK', NULL, 1130, NULL, N'7a21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlans] ([ID], [Title], [Deadline], [SubmitDate], [ApprovedBy], [UserID], [DataID], [CommentID], [KPILevelCodeAndPeriod], [Description], [Status], [ApprovedStatus], [Tag], [CreateTime], [TagID], [Link], [Auditor], [UpdateSheduleDate], [ActualFinishDate], [KPILevelCode], [Name], [Remark], [KPILevelID], [FileName], [rowguid]) VALUES (110, N'demo data week', CAST(N'2020-06-07T00:00:00.000' AS DateTime), CAST(N'2020-06-07T00:00:00.000' AS DateTime), 0, 300, 1033, 372, N'30005W', N'demo data week', 0, 0, N'SHC - Peter Tran', CAST(N'2020-09-06T09:51:02.807' AS DateTime), 0, N'/ChartPeriod/30005/1037/W/2020/1/53/task/372/1033/Action-Plan-on-April-', 297, NULL, NULL, N'30005', N'KPI DEMO WEEK', NULL, 1130, NULL, N'7b21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlans] ([ID], [Title], [Deadline], [SubmitDate], [ApprovedBy], [UserID], [DataID], [CommentID], [KPILevelCodeAndPeriod], [Description], [Status], [ApprovedStatus], [Tag], [CreateTime], [TagID], [Link], [Auditor], [UpdateSheduleDate], [ActualFinishDate], [KPILevelCode], [Name], [Remark], [KPILevelID], [FileName], [rowguid]) VALUES (111, N'demo data week', CAST(N'2020-06-07T00:00:00.000' AS DateTime), CAST(N'2020-06-07T00:00:00.000' AS DateTime), 0, 300, 1033, 372, N'30005W', N'demo data week', 0, 0, N'SHC - Peter Tran', CAST(N'2020-10-06T09:51:02.807' AS DateTime), 0, N'/ChartPeriod/30005/1037/W/2020/1/53/task/372/1033/Action-Plan-on-April-', 297, NULL, NULL, N'30005', N'KPI DEMO WEEK', NULL, 1130, NULL, N'7c21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlans] ([ID], [Title], [Deadline], [SubmitDate], [ApprovedBy], [UserID], [DataID], [CommentID], [KPILevelCodeAndPeriod], [Description], [Status], [ApprovedStatus], [Tag], [CreateTime], [TagID], [Link], [Auditor], [UpdateSheduleDate], [ActualFinishDate], [KPILevelCode], [Name], [Remark], [KPILevelID], [FileName], [rowguid]) VALUES (112, N'demo data week', CAST(N'2020-06-07T00:00:00.000' AS DateTime), CAST(N'2020-06-07T00:00:00.000' AS DateTime), 0, 300, 1033, 372, N'30005W', N'demo data week', 0, 0, N'SHC - Peter Tran', CAST(N'2020-11-06T09:51:02.807' AS DateTime), 0, N'/ChartPeriod/30005/1037/W/2020/1/53/task/372/1033/Action-Plan-on-April-', 297, NULL, NULL, N'30005', N'KPI DEMO WEEK', NULL, 1130, NULL, N'7d21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlans] ([ID], [Title], [Deadline], [SubmitDate], [ApprovedBy], [UserID], [DataID], [CommentID], [KPILevelCodeAndPeriod], [Description], [Status], [ApprovedStatus], [Tag], [CreateTime], [TagID], [Link], [Auditor], [UpdateSheduleDate], [ActualFinishDate], [KPILevelCode], [Name], [Remark], [KPILevelID], [FileName], [rowguid]) VALUES (113, N'demo data week', CAST(N'2020-06-07T00:00:00.000' AS DateTime), CAST(N'2020-06-07T00:00:00.000' AS DateTime), 0, 300, 1033, 372, N'30005W', N'demo data week', 0, 0, N'SHC - Peter Tran', CAST(N'2020-12-06T09:51:02.807' AS DateTime), 0, N'/ChartPeriod/30005/1037/W/2020/1/53/task/372/1033/Action-Plan-on-April-', 297, NULL, NULL, N'30005', N'KPI DEMO WEEK', NULL, 1130, NULL, N'7e21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlans] ([ID], [Title], [Deadline], [SubmitDate], [ApprovedBy], [UserID], [DataID], [CommentID], [KPILevelCodeAndPeriod], [Description], [Status], [ApprovedStatus], [Tag], [CreateTime], [TagID], [Link], [Auditor], [UpdateSheduleDate], [ActualFinishDate], [KPILevelCode], [Name], [Remark], [KPILevelID], [FileName], [rowguid]) VALUES (114, N'demo data week2019', CAST(N'2020-06-07T00:00:00.000' AS DateTime), CAST(N'2020-06-07T00:00:00.000' AS DateTime), 0, 300, 1033, 372, N'30005W', N'demo data week', 0, 0, N'SHC - Peter Tran', CAST(N'2019-12-06T09:51:02.807' AS DateTime), 0, N'/ChartPeriod/30005/1037/W/2020/1/53/task/372/1033/Action-Plan-on-April-', 297, NULL, NULL, N'30005', N'KPI DEMO WEEK', NULL, 1130, NULL, N'7f21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ActionPlans] ([ID], [Title], [Deadline], [SubmitDate], [ApprovedBy], [UserID], [DataID], [CommentID], [KPILevelCodeAndPeriod], [Description], [Status], [ApprovedStatus], [Tag], [CreateTime], [TagID], [Link], [Auditor], [UpdateSheduleDate], [ActualFinishDate], [KPILevelCode], [Name], [Remark], [KPILevelID], [FileName], [rowguid]) VALUES (117, N'demo new', CAST(N'2020-09-07T00:00:00.000' AS DateTime), CAST(N'2020-09-07T00:00:00.000' AS DateTime), 0, 300, 1006, 342, N'30003H', N'demo new', 0, 0, N'SHC - Sy Pham', CAST(N'2020-07-09T11:13:30.120' AS DateTime), 0, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', 299, NULL, NULL, N'30003', N'KPI BY LEO E', NULL, 1073, N'Concept for LAB homepage.pptx', N'39021d8b-9ac1-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[ActionPlans] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [UserID], [rowguid]) VALUES (36, N'Category UploadE', N'XC003', 3, CAST(N'2020-04-29T14:04:49.443' AS DateTime), NULL, 300, N'8021c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Categories] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [UserID], [rowguid]) VALUES (1035, N'Category By Swook', N'XC008', 4, CAST(N'2020-05-04T10:23:37.073' AS DateTime), NULL, 300, N'8121c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Categories] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [UserID], [rowguid]) VALUES (1036, N'Category by Leo E', N'XCVN5', 3, CAST(N'2020-05-25T10:04:12.953' AS DateTime), NULL, 247, N'8221c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Categories] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [UserID], [rowguid]) VALUES (1037, N'Category demo week', N'XC00256', 3, CAST(N'2020-07-06T09:41:21.547' AS DateTime), NULL, 300, N'8321c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Categories] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [UserID], [rowguid]) VALUES (1039, N'category transaction demo', N'CB45454', 3, CAST(N'2020-07-08T12:19:15.140' AS DateTime), NULL, 300, N'eb823990-dac0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Categories] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [UserID], [rowguid]) VALUES (1040, N'category demo level 3', N'DF345', 3, CAST(N'2020-07-08T15:43:23.390' AS DateTime), NULL, 247, N'b088a414-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Categories] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [UserID], [rowguid]) VALUES (1041, N'category demo over', N'DV3456', 4, CAST(N'2020-07-14T09:00:34.850' AS DateTime), NULL, 300, N'f41a9bcd-75c5-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryKPILevels] ON 
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status], [ModifyBy], [rowguid]) VALUES (4150, 15, 36, 1, N'SHC - Irene', N'8421c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status], [ModifyBy], [rowguid]) VALUES (5150, 1010, 1035, 1, N'SHC - Swook Lu', N'8521c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status], [ModifyBy], [rowguid]) VALUES (5151, 1073, 1036, 1, N'Super Admin', N'8621c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status], [ModifyBy], [rowguid]) VALUES (5152, 1130, 1037, 1, N'SHC - Swook Lu', N'8721c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status], [ModifyBy], [rowguid]) VALUES (5153, 1146, 1039, 1, N'Super Admin', N'6700fcc0-dac0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status], [ModifyBy], [rowguid]) VALUES (5154, 1165, 1040, 1, N'Super Admin', N'94bb9527-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status], [ModifyBy], [rowguid]) VALUES (5155, 1218, 1041, 1, N'SHC - Swook Lu', N'7e985cdd-75c5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status], [ModifyBy], [rowguid]) VALUES (5156, 1237, 1041, 1, N'SHC - Swook Lu', N'7df6b1a4-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status], [ModifyBy], [rowguid]) VALUES (5157, 1256, 1041, 1, N'SHC - Swook Lu', N'4185d43f-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status], [ModifyBy], [rowguid]) VALUES (5158, 1130, 1036, 1, N'SHC - Swook Lu', N'6fabab21-edc7-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryKPILevels] ([ID], [KPILevelID], [CategoryID], [Status], [ModifyBy], [rowguid]) VALUES (5159, 15, 1036, 1, N'SHC - Swook Lu', N'a5ae402a-edc7-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[CategoryKPILevels] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryLangs] ON 
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID], [rowguid]) VALUES (97, N'Category UploadV', N'vi', 36, N'8821c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID], [rowguid]) VALUES (98, N'Category UploadC', N'zh-TW', 36, N'8921c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID], [rowguid]) VALUES (99, N'Category UploadE', N'en', 36, N'8a21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID], [rowguid]) VALUES (1094, N'Category By Swook', N'vi', 1035, N'8b21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID], [rowguid]) VALUES (1095, N'Category By Swook', N'zh-TW', 1035, N'8c21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID], [rowguid]) VALUES (1096, N'Category By Swook', N'en', 1035, N'8d21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID], [rowguid]) VALUES (1097, N'Category by Leo V', N'vi', 1036, N'8e21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID], [rowguid]) VALUES (1098, N'Category by Leo C', N'zh-TW', 1036, N'8f21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID], [rowguid]) VALUES (1099, N'Category by Leo E', N'en', 1036, N'9021c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID], [rowguid]) VALUES (1100, N'Category demo week', N'vi', 1037, N'9121c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID], [rowguid]) VALUES (1101, N'Category demo week', N'zh-TW', 1037, N'9221c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID], [rowguid]) VALUES (1102, N'Category demo week', N'en', 1037, N'9321c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID], [rowguid]) VALUES (1103, N'Category demo transaction', N'vi', 1038, N'71b68405-fcbf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID], [rowguid]) VALUES (1104, N'Category demo transaction', N'zh-TW', 1038, N'72b68405-fcbf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID], [rowguid]) VALUES (1105, N'Category demo transaction', N'en', 1038, N'73b68405-fcbf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID], [rowguid]) VALUES (1106, N'category transaction demo', N'vi', 1039, N'ec823990-dac0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID], [rowguid]) VALUES (1107, N'category transaction demo', N'zh-TW', 1039, N'ed823990-dac0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID], [rowguid]) VALUES (1108, N'category transaction demo', N'en', 1039, N'ee823990-dac0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID], [rowguid]) VALUES (1109, N'category demo level 3', N'vi', 1040, N'b188a414-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID], [rowguid]) VALUES (1110, N'category demo level 3', N'zh-TW', 1040, N'b288a414-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID], [rowguid]) VALUES (1111, N'category demo level 3', N'en', 1040, N'b388a414-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID], [rowguid]) VALUES (1112, N'category demo over', N'vi', 1041, N'f51a9bcd-75c5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID], [rowguid]) VALUES (1113, N'category demo over', N'zh-TW', 1041, N'f61a9bcd-75c5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[CategoryLangs] ([ID], [Name], [LanguageID], [CategoryID], [rowguid]) VALUES (1114, N'category demo over', N'en', 1041, N'f71a9bcd-75c5-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[CategoryLangs] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate], [Pin], [rowguid]) VALUES (309, N'@henry ', 300, 1002, N'/ChartPeriod/30001/36/H/2020/1/2/remark/309/1002/Remark-on-January-', N'Remark on January -  KPI Chart  - KPI UploadE - Half Year', CAST(N'2020-05-20T11:55:54.7885258' AS DateTime2), 0, N'9421c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate], [Pin], [rowguid]) VALUES (310, N'@henry ', 300, 1004, N'/ChartPeriod/40002/1035/H/2020/1/2/remark/310/1004/Remark-on-January-', N'Remark on January -  KPI Chart  - KPI By Swook - Half Year', CAST(N'2020-05-22T08:27:36.1639800' AS DateTime2), 0, N'9521c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate], [Pin], [rowguid]) VALUES (311, N'@henry ', 300, 1005, N'/ChartPeriod/40002/1035/H/2020/1/2/remark/311/1005/Remark-on-February-', N'Remark on February -  KPI Chart  - KPI By Swook - Half Year', CAST(N'2020-05-22T09:19:16.4894383' AS DateTime2), 0, N'9621c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate], [Pin], [rowguid]) VALUES (314, N'@henry ', 300, 1005, N'/ChartPeriod/40002/1035/H/2020/1/2/remark/314/1005/Remark-on-February-', N'Remark on February -  KPI Chart  - KPI By Swook - Half Year', CAST(N'2020-05-25T09:18:03.4951228' AS DateTime2), 0, N'9721c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate], [Pin], [rowguid]) VALUES (315, N'@henry ', 300, 1006, N'/ChartPeriod/30003/1036/H/2020/1/2/remark/315/1006/Remark-on-January-', N'Remark on January -  KPI Chart  - KPI BY LEO E - Half Year', CAST(N'2020-05-25T11:21:02.4737295' AS DateTime2), 0, N'9821c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate], [Pin], [rowguid]) VALUES (342, N'@SHC - Sy Pham', 300, 1006, N'/ChartPeriod/30003/1036/H/2020/1/2/remark/342/1006/Remark-on-January-', N'Remark on January -  KPI Chart  - KPI BY LEO E - Half Year', CAST(N'2020-05-28T10:29:15.7499102' AS DateTime2), 1, N'9921c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate], [Pin], [rowguid]) VALUES (343, N'vo day nao @SHC - Sy Pham', 300, 1004, N'/ChartPeriod/40002/1035/H/2020/1/2/remark/343/1004/Remark-on-January-', N'Remark on January -  KPI Chart  - KPI By Swook - Half Year', CAST(N'2020-05-28T11:09:29.1526635' AS DateTime2), 0, N'9a21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Comments] ([ID], [CommentMsg], [UserID], [DataID], [Link], [Title], [CommentedDate], [Pin], [rowguid]) VALUES (372, N'demo data week', 300, 1033, N'/ChartPeriod/30005/1037/W/2020/1/53/remark/372/1033/Remark-on-April-', N'Remark on April -  KPI Chart  - KPI DEMO WEEK - Weekly', CAST(N'2020-07-06T09:48:21.2872618' AS DateTime2), 1, N'9d21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Datas] ON 
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1002, N'30001', N'H', N'-1', 0, 0, 1, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-05-04T07:45:59.540' AS DateTime), N'9e21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1003, N'30001', N'H', N'85', 0, 0, 2, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-05-04T07:45:59.540' AS DateTime), N'9f21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1004, N'40002', N'H', N'85', 0, 0, 1, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-05-04T10:38:33.747' AS DateTime), N'a021c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1005, N'40002', N'H', N'91', 0, 0, 2, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-05-04T10:38:33.747' AS DateTime), N'a121c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1006, N'30003', N'H', N'85', 0, 0, 1, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-05-25T10:08:06.703' AS DateTime), N'a221c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1007, N'30003', N'H', N'91', 0, 0, 2, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-05-25T10:08:06.703' AS DateTime), N'a321c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1008, N'30005', N'W', N'83', 1, 0, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'a421c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1009, N'30005', N'W', N'95', 28, 0, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'a521c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1010, N'30005', N'W', N'95', 27, 0, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'a621c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1011, N'30005', N'W', N'95', 26, 0, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'a721c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1012, N'30005', N'W', N'95', 25, 0, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'a821c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1013, N'30005', N'W', N'95', 24, 0, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'a921c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1014, N'30005', N'W', N'95', 23, 0, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'aa21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1015, N'30005', N'W', N'95', 22, 0, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'ab21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1016, N'30005', N'W', N'95', 21, 0, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'ac21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1017, N'30005', N'W', N'95', 20, 0, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'ad21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1018, N'30005', N'W', N'70', 19, 0, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'ae21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1019, N'30005', N'W', N'70', 18, 0, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'af21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1020, N'30005', N'W', N'70', 17, 0, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'b021c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1021, N'30005', N'W', N'70', 16, 0, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'b121c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1022, N'30005', N'W', N'70', 15, 0, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'b221c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1023, N'30005', N'W', N'70', 14, 0, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'b321c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1024, N'30005', N'W', N'30', 13, 0, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'b421c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1025, N'30005', N'W', N'15', 12, 0, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'b521c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1026, N'30005', N'W', N'55', 11, 0, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'b621c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1027, N'30005', N'W', N'90', 10, 0, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'b721c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1028, N'30005', N'W', N'86', 9, 0, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'b821c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1029, N'30005', N'W', N'75', 8, 0, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'b921c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1030, N'30005', N'W', N'45.6', 7, 0, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'ba21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1031, N'30005', N'W', N'81', 6, 0, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'bb21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1032, N'30005', N'W', N'85.2', 5, 0, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'bc21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1033, N'30005', N'W', N'56.5', 4, 0, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'bd21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1034, N'30005', N'W', N'91', 3, 0, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'be21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1035, N'30005', N'W', N'80', 2, 0, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'bf21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1036, N'30003', N'H', N'0', 0, 0, 3, 0, 0, 2020, NULL, NULL, N'0', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'c021c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1037, N'30001', N'H', N'0', 0, 0, 3, 0, 0, 2020, NULL, NULL, N'0', CAST(N'2020-07-06T09:46:30.563' AS DateTime), N'c121c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1038, N'30005', N'Q', N'95', 0, 0, 0, 1, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T11:06:56.883' AS DateTime), N'c221c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1039, N'30005', N'Q', N'85', 0, 0, 0, 2, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T11:06:56.883' AS DateTime), N'c321c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1040, N'30005', N'Q', N'75', 0, 0, 0, 3, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T11:06:56.883' AS DateTime), N'c421c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1041, N'30005', N'Y', N'75.8', 0, 0, 0, 0, 2011, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T11:06:56.883' AS DateTime), N'c521c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1042, N'30005', N'Y', N'75.8', 0, 0, 0, 0, 2012, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T11:06:56.883' AS DateTime), N'c621c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1043, N'30005', N'Y', N'75.8', 0, 0, 0, 0, 2013, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T11:06:56.883' AS DateTime), N'c721c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1044, N'30005', N'Y', N'75.8', 0, 0, 0, 0, 2014, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T11:06:56.883' AS DateTime), N'c821c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1045, N'30005', N'Y', N'75.8', 0, 0, 0, 0, 2015, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T11:06:56.883' AS DateTime), N'c921c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1046, N'30005', N'Y', N'75.8', 0, 0, 0, 0, 2016, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T11:06:56.883' AS DateTime), N'ca21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1047, N'30005', N'Y', N'75.8', 0, 0, 0, 0, 2017, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T11:06:56.883' AS DateTime), N'cb21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1048, N'30005', N'Y', N'75.8', 0, 0, 0, 0, 2018, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T11:06:56.883' AS DateTime), N'cc21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1049, N'30005', N'Y', N'75.8', 0, 0, 0, 0, 2019, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T11:06:56.883' AS DateTime), N'cd21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1050, N'30005', N'Y', N'75.8', 0, 0, 0, 0, 2020, 2020, NULL, NULL, N'90', CAST(N'2020-07-06T11:06:56.883' AS DateTime), N'ce21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1051, N'3F030004', N'M', N'75.9', 0, 1, 0, 0, 0, 2020, NULL, NULL, N'91', CAST(N'2020-07-08T12:23:25.657' AS DateTime), N'4cf18525-dbc0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1052, N'3F030004', N'M', N'75.10', 0, 2, 0, 0, 0, 2020, NULL, NULL, N'92', CAST(N'2020-07-08T12:23:25.657' AS DateTime), N'4df18525-dbc0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1053, N'3F030004', N'M', N'75.11', 0, 3, 0, 0, 0, 2020, NULL, NULL, N'93', CAST(N'2020-07-08T12:23:25.657' AS DateTime), N'4ef18525-dbc0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1054, N'3F030004', N'M', N'75.12', 0, 4, 0, 0, 0, 2020, NULL, NULL, N'94', CAST(N'2020-07-08T12:23:25.657' AS DateTime), N'4ff18525-dbc0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1055, N'3F030004', N'M', N'75.13', 0, 5, 0, 0, 0, 2020, NULL, NULL, N'95', CAST(N'2020-07-08T12:23:25.657' AS DateTime), N'50f18525-dbc0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1056, N'3F030004', N'M', N'75.14', 0, 6, 0, 0, 0, 2020, NULL, NULL, N'96', CAST(N'2020-07-08T12:23:25.657' AS DateTime), N'51f18525-dbc0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1057, N'3F030004', N'M', N'75.15', 0, 7, 0, 0, 0, 2020, NULL, NULL, N'97', CAST(N'2020-07-08T12:23:25.657' AS DateTime), N'52f18525-dbc0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1058, N'30001', N'M', N'82', 0, 1, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-08T15:40:06.460' AS DateTime), N'2d93629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1059, N'30005', N'M', N'0', 0, 5, 0, 0, 0, 2020, NULL, NULL, N'0', CAST(N'2020-07-08T15:40:06.460' AS DateTime), N'2e93629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1060, N'30005', N'M', N'0', 0, 4, 0, 0, 0, 2020, NULL, NULL, N'0', CAST(N'2020-07-08T15:40:06.460' AS DateTime), N'2f93629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1061, N'30005', N'M', N'0', 0, 3, 0, 0, 0, 2020, NULL, NULL, N'0', CAST(N'2020-07-08T15:40:06.460' AS DateTime), N'3093629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1062, N'30005', N'M', N'0', 0, 2, 0, 0, 0, 2020, NULL, NULL, N'0', CAST(N'2020-07-08T15:40:06.460' AS DateTime), N'3193629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1063, N'30005', N'M', N'0', 0, 1, 0, 0, 0, 2020, NULL, NULL, N'0', CAST(N'2020-07-08T15:40:06.460' AS DateTime), N'3293629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1064, N'30003', N'M', N'48', 0, 7, 0, 0, 0, 2020, NULL, NULL, N'85', CAST(N'2020-07-08T15:40:06.460' AS DateTime), N'3393629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1065, N'30003', N'M', N'95', 0, 6, 0, 0, 0, 2020, NULL, NULL, N'85', CAST(N'2020-07-08T15:40:06.460' AS DateTime), N'3493629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1066, N'30003', N'M', N'90', 0, 5, 0, 0, 0, 2020, NULL, NULL, N'85', CAST(N'2020-07-08T15:40:06.460' AS DateTime), N'3593629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1067, N'30005', N'M', N'0', 0, 6, 0, 0, 0, 2020, NULL, NULL, N'0', CAST(N'2020-07-08T15:40:06.460' AS DateTime), N'3693629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1068, N'30003', N'M', N'75', 0, 4, 0, 0, 0, 2020, NULL, NULL, N'85', CAST(N'2020-07-08T15:40:06.460' AS DateTime), N'3793629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1069, N'30003', N'M', N'60', 0, 2, 0, 0, 0, 2020, NULL, NULL, N'85', CAST(N'2020-07-08T15:40:06.460' AS DateTime), N'3893629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1070, N'30003', N'M', N'59', 0, 1, 0, 0, 0, 2020, NULL, NULL, N'85', CAST(N'2020-07-08T15:40:06.460' AS DateTime), N'3993629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1071, N'30001', N'M', N'82', 0, 7, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-08T15:40:06.460' AS DateTime), N'3a93629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1072, N'30001', N'M', N'82', 0, 6, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-08T15:40:06.460' AS DateTime), N'3b93629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1073, N'30001', N'M', N'82', 0, 5, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-08T15:40:06.460' AS DateTime), N'3c93629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1074, N'30001', N'M', N'82', 0, 4, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-08T15:40:06.460' AS DateTime), N'3d93629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1075, N'30001', N'M', N'82', 0, 3, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-08T15:40:06.460' AS DateTime), N'3e93629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1076, N'30001', N'M', N'82', 0, 2, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-08T15:40:06.460' AS DateTime), N'3f93629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1077, N'30003', N'M', N'65', 0, 3, 0, 0, 0, 2020, NULL, NULL, N'85', CAST(N'2020-07-08T15:40:06.460' AS DateTime), N'4093629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1078, N'30005', N'M', N'0', 0, 7, 0, 0, 0, 2020, NULL, NULL, N'0', CAST(N'2020-07-08T15:40:06.460' AS DateTime), N'4193629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1079, N'3F030006', N'Q', N'85', 0, 0, 0, 1, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-08T15:45:59.957' AS DateTime), N'cf09f871-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1080, N'3F030006', N'Q', N'92', 0, 0, 0, 2, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-08T15:45:59.957' AS DateTime), N'd009f871-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1081, N'3F030006', N'Q', N'45', 0, 0, 0, 3, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-08T15:45:59.957' AS DateTime), N'd109f871-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1082, N'40002', N'H', N'0', 0, 0, 3, 0, 0, 2020, NULL, NULL, N'0', CAST(N'2020-07-09T13:44:07.913' AS DateTime), N'ae912d96-afc1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1083, N'30005', N'W', N'0', 29, 0, 0, 0, 0, 2020, NULL, NULL, N'0', CAST(N'2020-07-14T09:04:17.133' AS DateTime), N'adcb1b9d-76c5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1084, N'4C140007', N'M', N'85', 0, 1, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-14T09:04:17.133' AS DateTime), N'aecb1b9d-76c5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1085, N'4C140007', N'M', N'88', 0, 2, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-14T09:04:17.133' AS DateTime), N'afcb1b9d-76c5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1086, N'4C140007', N'M', N'92', 0, 3, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-14T09:04:17.133' AS DateTime), N'b0cb1b9d-76c5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1087, N'4C140007', N'M', N'95', 0, 4, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-14T09:04:17.133' AS DateTime), N'b1cb1b9d-76c5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1088, N'4C140007', N'M', N'99', 0, 5, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-14T09:04:17.133' AS DateTime), N'b2cb1b9d-76c5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1089, N'4C140007', N'M', N'83', 0, 6, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-14T09:04:17.133' AS DateTime), N'b3cb1b9d-76c5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1090, N'4C140007', N'M', N'80', 0, 7, 0, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-14T09:04:17.133' AS DateTime), N'b4cb1b9d-76c5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1091, N'4C140007', N'Q', N'91', 0, 0, 0, 1, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-14T09:50:22.410' AS DateTime), N'9f73ded4-7cc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1092, N'4C140007', N'Q', N'92', 0, 0, 0, 2, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-14T09:50:22.410' AS DateTime), N'a073ded4-7cc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1093, N'4C140007', N'Q', N'89', 0, 0, 0, 3, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-14T09:50:22.410' AS DateTime), N'a173ded4-7cc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1094, N'4C140007', N'H', N'91', 0, 0, 1, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-14T10:00:15.190' AS DateTime), N'0c98112b-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1095, N'4C140007', N'H', N'92', 0, 0, 2, 0, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-14T10:00:15.190' AS DateTime), N'0d98112b-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1096, N'4C140007', N'H', N'0', 0, 0, 3, 0, 0, 2020, NULL, NULL, N'0', CAST(N'2020-07-14T10:00:15.190' AS DateTime), N'0e98112b-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1097, N'4C140008', N'Q', N'91', 0, 0, 0, 1, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-14T10:05:30.017' AS DateTime), N'862654df-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1098, N'4C140008', N'Q', N'92', 0, 0, 0, 2, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-14T10:05:30.017' AS DateTime), N'872654df-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1099, N'4C140008', N'Q', N'0', 0, 0, 0, 3, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-14T10:05:30.017' AS DateTime), N'882654df-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1100, N'4C140009', N'Q', N'87', 0, 0, 0, 1, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-14T10:09:31.370' AS DateTime), N'5039266f-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1101, N'4C140009', N'Q', N'88', 0, 0, 0, 2, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-14T10:09:31.370' AS DateTime), N'5139266f-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Datas] ([ID], [KPILevelCode], [Period], [Value], [Week], [Month], [Half], [Quarter], [Year], [Yearly], [DateUpload], [Remark], [Target], [CreateTime], [rowguid]) VALUES (1102, N'4C140009', N'Q', N'91', 0, 0, 0, 3, 0, 2020, NULL, NULL, N'90', CAST(N'2020-07-14T10:09:31.370' AS DateTime), N'5239266f-7fc5-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[Datas] OFF
GO
SET IDENTITY_INSERT [dbo].[ErrorMessages] ON 
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function], [rowguid]) VALUES (110, N'Failure sending mail.', CAST(N'2020-05-04T16:01:35.303' AS DateTime), N'[KPI System-02] Comment', N'cf21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function], [rowguid]) VALUES (111, N'Failure sending mail.', CAST(N'2020-05-22T09:51:14.383' AS DateTime), N'[KPI System-03] Action Plan (Add Task - Assign Auditor)', N'd021c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function], [rowguid]) VALUES (112, N'Failure sending mail.', CAST(N'2020-05-22T09:51:14.383' AS DateTime), N'[KPI System-03] Action Plan (Add Task)', N'd121c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function], [rowguid]) VALUES (113, N'Failure sending mail.', CAST(N'2020-05-22T10:06:38.647' AS DateTime), N'[KPI System-03] Action Plan (Add Task - Assign Auditor)', N'd221c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function], [rowguid]) VALUES (114, N'Failure sending mail.', CAST(N'2020-05-22T10:06:38.633' AS DateTime), N'[KPI System-03] Action Plan (Add Task)', N'd321c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function], [rowguid]) VALUES (115, N'Failure sending mail.', CAST(N'2020-05-27T12:04:29.477' AS DateTime), N'[KPI System-03] Action Plan (Add Task) - 行動方案(增加任務)', N'd421c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function], [rowguid]) VALUES (116, N'Failure sending mail.', CAST(N'2020-05-27T12:04:29.477' AS DateTime), N'[KPI System-03] Action Plan (Add Task - Assign Auditor) - 行動方案(增加任務-稽核者)', N'd521c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function], [rowguid]) VALUES (117, N'Failure sending mail.', CAST(N'2020-05-28T08:27:09.260' AS DateTime), N'[KPI System-02] Comment', N'd621c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function], [rowguid]) VALUES (118, N'Failure sending mail.', CAST(N'2020-05-28T08:40:03.803' AS DateTime), N'[KPI System-02] Comment', N'd721c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function], [rowguid]) VALUES (119, N'Failure sending mail.', CAST(N'2020-06-09T08:52:48.867' AS DateTime), N'[KPI System-00] Action Plan (Change Sheduledate on the task)', N'd821c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function], [rowguid]) VALUES (120, N'Failure sending mail.', CAST(N'2020-06-09T10:55:49.477' AS DateTime), N'[KPI System-05] Change Sheduledate ', N'd921c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function], [rowguid]) VALUES (121, N'Failure sending mail.', CAST(N'2020-06-19T08:26:11.093' AS DateTime), N'[KPI System-03] Action Plan (Add Action plan) - 行動方案(增加任務)', N'da21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function], [rowguid]) VALUES (122, N'Failure sending mail.', CAST(N'2020-07-14T10:01:15.240' AS DateTime), N'[KPI System] Upload Data successfully(上傳資料成功)', N'482dc848-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[ErrorMessages] ([ID], [Name], [CreateTime], [Function], [rowguid]) VALUES (123, N'Failure sending mail.', CAST(N'2020-07-14T10:01:34.803' AS DateTime), N'[KPI System] Over Target (未達到目標)', N'394d0c53-7ec5-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[ErrorMessages] OFF
GO
SET IDENTITY_INSERT [dbo].[Favourites] ON 
GO
INSERT [dbo].[Favourites] ([ID], [KPILevelCode], [UserID], [Period], [CreateTime], [Link], [rowguid]) VALUES (19, N'30003', 300, N'H', CAST(N'2020-06-24T09:06:04.870' AS DateTime), N'/ChartPeriod/30003/1036/H/2020/1/2', N'db21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[Favourites] OFF
GO
SET IDENTITY_INSERT [dbo].[HistoryActionPlans] ON 
GO
INSERT [dbo].[HistoryActionPlans] ([ID], [Action], [ActionPlanID], [ActualFinishDate], [UpdateSheduleDate], [UserID], [rowguid]) VALUES (7, N'UpdateSheduleDate', 90, NULL, CAST(N'2020-06-18T00:00:00.000' AS DateTime), 300, N'dc21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[HistoryActionPlans] ([ID], [Action], [ActionPlanID], [ActualFinishDate], [UpdateSheduleDate], [UserID], [rowguid]) VALUES (8, N'UpdateSheduleDate', 90, NULL, CAST(N'2020-06-19T00:00:00.000' AS DateTime), 300, N'dd21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[HistoryActionPlans] ([ID], [Action], [ActionPlanID], [ActualFinishDate], [UpdateSheduleDate], [UserID], [rowguid]) VALUES (10, N'ActualFinishDate', 88, CAST(N'2020-06-17T00:00:00.000' AS DateTime), NULL, 297, N'de21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[HistoryActionPlans] ([ID], [Action], [ActionPlanID], [ActualFinishDate], [UpdateSheduleDate], [UserID], [rowguid]) VALUES (12, N'UpdateSheduleDate', 88, NULL, CAST(N'2020-06-19T00:00:00.000' AS DateTime), 300, N'df21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[HistoryActionPlans] ([ID], [Action], [ActionPlanID], [ActualFinishDate], [UpdateSheduleDate], [UserID], [rowguid]) VALUES (15, N'ActualFinishDate', 88, CAST(N'2020-06-17T08:49:00.000' AS DateTime), NULL, 297, N'e021c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[HistoryActionPlans] ([ID], [Action], [ActionPlanID], [ActualFinishDate], [UpdateSheduleDate], [UserID], [rowguid]) VALUES (17, N'UpdateSheduleDate', 88, NULL, CAST(N'2020-06-20T00:00:00.000' AS DateTime), 300, N'e121c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[HistoryActionPlans] ([ID], [Action], [ActionPlanID], [ActualFinishDate], [UpdateSheduleDate], [UserID], [rowguid]) VALUES (18, N'ActualFinishDate', 89, CAST(N'2020-06-17T08:52:16.000' AS DateTime), NULL, 297, N'e221c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[HistoryActionPlans] ([ID], [Action], [ActionPlanID], [ActualFinishDate], [UpdateSheduleDate], [UserID], [rowguid]) VALUES (28, N'UpdateSheduleDate', 89, NULL, CAST(N'2020-06-19T00:00:00.000' AS DateTime), 300, N'e321c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[HistoryActionPlans] ([ID], [Action], [ActionPlanID], [ActualFinishDate], [UpdateSheduleDate], [UserID], [rowguid]) VALUES (29, N'UpdateSheduleDate', 89, NULL, CAST(N'2020-06-20T00:00:00.000' AS DateTime), 300, N'e421c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[HistoryActionPlans] ([ID], [Action], [ActionPlanID], [ActualFinishDate], [UpdateSheduleDate], [UserID], [rowguid]) VALUES (30, N'UpdateSheduleDate', 89, NULL, CAST(N'2020-06-26T00:00:00.000' AS DateTime), 300, N'e521c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[HistoryActionPlans] ([ID], [Action], [ActionPlanID], [ActualFinishDate], [UpdateSheduleDate], [UserID], [rowguid]) VALUES (31, N'UpdateSheduleDate', 89, NULL, CAST(N'2020-06-27T00:00:00.000' AS DateTime), 300, N'e621c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[HistoryActionPlans] ([ID], [Action], [ActionPlanID], [ActualFinishDate], [UpdateSheduleDate], [UserID], [rowguid]) VALUES (32, N'ActualFinishDate', 89, CAST(N'2020-06-17T04:11:17.000' AS DateTime), NULL, 297, N'e721c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[HistoryActionPlans] ([ID], [Action], [ActionPlanID], [ActualFinishDate], [UpdateSheduleDate], [UserID], [rowguid]) VALUES (33, N'ActualFinishDate', 88, CAST(N'2020-06-17T16:18:56.000' AS DateTime), NULL, 297, N'e821c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[HistoryActionPlans] ([ID], [Action], [ActionPlanID], [ActualFinishDate], [UpdateSheduleDate], [UserID], [rowguid]) VALUES (34, N'UpdateSheduleDate', 89, NULL, CAST(N'2020-06-19T00:00:00.000' AS DateTime), 300, N'e921c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[HistoryActionPlans] ([ID], [Action], [ActionPlanID], [ActualFinishDate], [UpdateSheduleDate], [UserID], [rowguid]) VALUES (35, N'ActualFinishDate', 87, CAST(N'2020-06-18T11:40:28.000' AS DateTime), NULL, 297, N'ea21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[HistoryActionPlans] ([ID], [Action], [ActionPlanID], [ActualFinishDate], [UpdateSheduleDate], [UserID], [rowguid]) VALUES (36, N'ActualFinishDate', 99, CAST(N'2020-06-19T14:41:11.000' AS DateTime), NULL, 297, N'eb21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[HistoryActionPlans] ([ID], [Action], [ActionPlanID], [ActualFinishDate], [UpdateSheduleDate], [UserID], [rowguid]) VALUES (37, N'UpdateSheduleDate', 99, NULL, CAST(N'2020-06-23T00:00:00.000' AS DateTime), 300, N'ec21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[HistoryActionPlans] OFF
GO
SET IDENTITY_INSERT [dbo].[KPILangs] ON 
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (165, N'KPI UploadV', N'vi', 1099, N'ed21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (166, N'KPI UploadC', N'zh-TW', 1099, N'ee21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (167, N'KPI UploadE', N'en', 1099, N'ef21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1162, N'KPI By Swook', N'vi', 2098, N'f021c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1163, N'KPI By Swook', N'zh-TW', 2098, N'f121c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1164, N'KPI By Swook', N'en', 2098, N'f221c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1165, N'demo', N'vi', 2099, N'f321c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1166, N'demo', N'zh-TW', 2099, N'f421c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1167, N'demo', N'en', 2099, N'f521c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1168, N'demo v1', N'vi', 2100, N'f621c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1169, N'demo c1', N'zh-TW', 2100, N'f721c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1170, N'demo e1', N'en', 2100, N'f821c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1171, N'KPI BY LEO V', N'vi', 2101, N'f921c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1172, N'KPI BY LEO C', N'zh-TW', 2101, N'fa21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1173, N'KPI BY LEO E', N'en', 2101, N'fb21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1174, N'KPI Demo Transaction DB', N'vi', 2102, N'fc21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1175, N'KPI Demo Transaction DB', N'zh-TW', 2102, N'fd21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1176, N'KPI Demo Transaction DB', N'en', 2102, N'fe21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1177, N'Demo Transaction DB', N'vi', 2103, N'ff21c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1178, N'Demo Transaction DB', N'zh-TW', 2103, N'0022c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1179, N'Demo Transaction DB', N'en', 2103, N'0122c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1180, N'KPI DEMO WEEK', N'vi', 2104, N'0222c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1181, N'KPI DEMO WEEK', N'zh-TW', 2104, N'0322c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1182, N'KPI DEMO WEEK', N'en', 2104, N'0422c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1183, N'KPI DEMO TRANSACTION', N'vi', 2105, N'904402f7-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1184, N'KPI DEMO TRANSACTION', N'zh-TW', 2105, N'914402f7-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1185, N'KPI DEMO TRANSACTION', N'en', 2105, N'924402f7-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1186, N'demo level 3', N'vi', 2106, N'5591de07-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1187, N'demo level 3', N'zh-TW', 2106, N'5691de07-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1188, N'demo level 3', N'en', 2106, N'5791de07-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1189, N'demo over local', N'vi', 2107, N'44c32a5e-6ac5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1190, N'demo over china', N'zh-TW', 2107, N'45c32a5e-6ac5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1191, N'demo over eng', N'en', 2107, N'46c32a5e-6ac5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1192, N'demo over 2', N'vi', 2108, N'c57a9c6d-6ac5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1193, N'demo over 2', N'zh-TW', 2108, N'c67a9c6d-6ac5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1194, N'demo over 2', N'en', 2108, N'c77a9c6d-6ac5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1195, N'demo over', N'vi', 2109, N'35fe623f-6bc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1196, N'demo over', N'zh-TW', 2109, N'36fe623f-6bc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1197, N'demo over', N'en', 2109, N'37fe623f-6bc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1198, N'test over', N'vi', 2110, N'813cf293-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1199, N'test over', N'zh-TW', 2110, N'823cf293-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1200, N'test over', N'en', 2110, N'833cf293-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1201, N'test below target', N'vi', 2111, N'0b129836-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1202, N'test below target', N'zh-TW', 2111, N'0c129836-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1203, N'test below target', N'en', 2111, N'0d129836-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1204, N'asdasd', N'vi', 2112, N'dad77d87-36c6-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1205, N'asdasd', N'zh-TW', 2112, N'dbd77d87-36c6-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILangs] ([ID], [Name], [LanguageID], [KPIID], [rowguid]) VALUES (1206, N'asdasd', N'en', 2112, N'dcd77d87-36c6-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[KPILangs] OFF
GO
SET IDENTITY_INSERT [dbo].[KPILevels] ON 
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1, NULL, NULL, 1099, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-04-29T14:04:20.837' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'0522c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (2, NULL, NULL, 1099, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-04-29T14:04:20.837' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'0622c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (3, NULL, NULL, 1099, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-04-29T14:04:20.837' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'0722c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (4, NULL, NULL, 1099, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-04-29T14:04:20.837' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'0822c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (5, NULL, NULL, 1099, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-04-29T14:04:20.837' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'0922c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (6, NULL, NULL, 1099, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-04-29T14:04:20.837' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'0a22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (7, NULL, NULL, 1099, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-04-29T14:04:20.837' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'0b22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (8, NULL, NULL, 1099, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-04-29T14:04:20.837' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'0c22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (9, NULL, NULL, 1099, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-04-29T14:04:20.837' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'0d22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (10, NULL, NULL, 1099, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-04-29T14:04:20.837' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'0e22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (11, NULL, NULL, 1099, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-04-29T14:04:20.837' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'0f22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (12, NULL, NULL, 1099, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-04-29T14:04:20.837' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'1022c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (13, NULL, NULL, 1099, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-04-29T14:04:20.837' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'1122c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (14, NULL, NULL, 1099, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-04-29T14:04:20.837' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'1222c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (15, N'30001', N'247', 1099, 54, NULL, NULL, 5, CAST(N'2020-07-08T00:00:00.000' AS DateTime), CAST(N'2020-04-29T00:00:00.000' AS DateTime), NULL, NULL, 1, 0, 1, 1, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, CAST(N'2020-07-08T15:34:48.290' AS DateTime), CAST(N'2020-07-08T15:34:48.290' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'1322c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (16, NULL, NULL, 1099, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-04-29T14:04:20.837' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'1422c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (17, NULL, NULL, 1099, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-04-29T14:04:20.837' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'1522c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (18, NULL, NULL, 1099, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-04-29T14:04:20.837' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'1622c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (19, NULL, NULL, 1099, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-04-29T14:04:20.837' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'1722c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1002, NULL, NULL, 2098, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-04T10:23:09.987' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'1822c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1003, NULL, NULL, 2098, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-04T10:23:09.987' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'1922c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1004, NULL, NULL, 2098, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-04T10:23:09.987' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'1a22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1005, NULL, NULL, 2098, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-04T10:23:09.987' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'1b22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1006, NULL, NULL, 2098, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-04T10:23:09.987' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'1c22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1007, NULL, NULL, 2098, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-04T10:23:09.987' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'1d22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1008, NULL, NULL, 2098, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-04T10:23:09.987' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'1e22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1009, NULL, NULL, 2098, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-04T10:23:09.987' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'1f22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1010, N'40002', N'300', 2098, 83, NULL, NULL, NULL, NULL, CAST(N'2020-05-06T00:00:00.000' AS DateTime), NULL, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, CAST(N'2020-05-07T12:05:32.880' AS DateTime), CAST(N'2020-05-07T12:05:32.880' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'2022c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1011, NULL, NULL, 2098, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-04T10:23:09.987' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'2122c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1012, NULL, NULL, 2098, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-04T10:23:09.987' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'2222c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1013, NULL, NULL, 2098, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-04T10:23:09.987' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'2322c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1014, NULL, NULL, 2098, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-04T10:23:09.987' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'2422c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1015, NULL, NULL, 2098, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-04T10:23:09.987' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'2522c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1016, N'30002', N'247', 2098, 54, NULL, NULL, NULL, CAST(N'2020-07-08T00:00:00.000' AS DateTime), NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2020-07-08T15:34:42.733' AS DateTime), CAST(N'2020-07-08T15:34:42.733' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'2622c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1017, NULL, NULL, 2098, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-04T10:23:09.987' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'2722c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1018, NULL, NULL, 2098, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-04T10:23:09.987' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'2822c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1019, NULL, NULL, 2098, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-04T10:23:09.987' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'2922c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1020, NULL, NULL, 2098, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-04T10:23:09.987' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'2a22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1059, NULL, NULL, 2101, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-25T10:03:38.793' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'2b22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1060, NULL, NULL, 2101, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-25T10:03:38.793' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'2c22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1061, NULL, NULL, 2101, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-25T10:03:38.793' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'2d22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1062, NULL, NULL, 2101, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-25T10:03:38.793' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'2e22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1063, NULL, NULL, 2101, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-25T10:03:38.793' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'2f22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1064, NULL, NULL, 2101, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-25T10:03:38.793' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'3022c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1065, NULL, NULL, 2101, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-25T10:03:38.793' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'3122c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1066, NULL, NULL, 2101, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-25T10:03:38.793' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'3222c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1067, N'40003', N'300', 2101, 83, NULL, NULL, NULL, CAST(N'2020-07-17T00:00:00.000' AS DateTime), NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2020-07-17T12:22:24.677' AS DateTime), CAST(N'2020-07-17T12:22:24.677' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'3322c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1068, NULL, NULL, 2101, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-25T10:03:38.793' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'3422c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1069, NULL, NULL, 2101, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-25T10:03:38.793' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'3522c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1070, N'3F030003', N'247', 2101, 73, NULL, NULL, NULL, CAST(N'2020-07-17T00:00:00.000' AS DateTime), NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2020-07-17T13:57:26.073' AS DateTime), CAST(N'2020-07-17T13:57:26.073' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'3622c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1071, N'3F020003', N'247', 2101, 72, NULL, NULL, NULL, CAST(N'2020-07-17T00:00:00.000' AS DateTime), NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2020-07-17T13:57:07.727' AS DateTime), CAST(N'2020-07-17T13:57:07.727' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'3722c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1072, NULL, NULL, 2101, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-25T10:03:38.793' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'3822c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1073, N'30003', N'306', 2101, 54, NULL, NULL, NULL, CAST(N'2020-07-08T00:00:00.000' AS DateTime), CAST(N'2020-05-25T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, 1, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, CAST(N'2020-07-13T09:28:56.750' AS DateTime), CAST(N'2020-07-13T09:28:56.750' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'SHC - Mei Chang', N'3922c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1074, NULL, NULL, 2101, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-25T10:03:38.793' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'3a22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1075, NULL, NULL, 2101, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-25T10:03:38.793' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'3b22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1076, NULL, NULL, 2101, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-25T10:03:38.793' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'3c22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1077, NULL, NULL, 2101, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-25T10:03:38.793' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'3d22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1116, NULL, NULL, 2104, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-06T09:40:57.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'3e22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1117, NULL, NULL, 2104, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-06T09:40:57.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'3f22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1118, NULL, NULL, 2104, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-06T09:40:57.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'4022c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1119, NULL, NULL, 2104, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-06T09:40:57.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'4122c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1120, NULL, NULL, 2104, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-06T09:40:57.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'4222c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1121, NULL, NULL, 2104, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-06T09:40:57.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'4322c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1122, NULL, NULL, 2104, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-06T09:40:57.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'4422c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1123, NULL, NULL, 2104, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-06T09:40:57.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'4522c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1124, NULL, NULL, 2104, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-06T09:40:57.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'4622c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1125, NULL, NULL, 2104, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-06T09:40:57.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'4722c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1126, NULL, NULL, 2104, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-06T09:40:57.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'4822c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1127, NULL, NULL, 2104, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-06T09:40:57.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'4922c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1128, NULL, N'247', 2104, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-17T13:57:00.667' AS DateTime), CAST(N'2020-07-17T13:57:00.667' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'4a22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1129, NULL, NULL, 2104, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-06T09:40:57.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'4b22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1130, N'30005', N'247', 2104, 54, NULL, NULL, 2, CAST(N'2020-07-08T00:00:00.000' AS DateTime), NULL, CAST(N'2020-07-06T00:00:00.000' AS DateTime), CAST(N'2020-07-06T00:00:00.000' AS DateTime), 1, 1, 1, NULL, 1, 1, NULL, 1, 1, NULL, 1, 1, CAST(N'2020-07-08T15:34:56.510' AS DateTime), CAST(N'2020-07-08T15:34:56.510' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'4c22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1131, NULL, NULL, 2104, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-06T09:40:57.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'4d22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1132, NULL, NULL, 2104, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-06T09:40:57.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'4e22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1133, NULL, NULL, 2104, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-06T09:40:57.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'4f22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1134, NULL, NULL, 2104, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-06T09:40:57.877' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'5022c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1135, NULL, NULL, 2105, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-07T09:38:40.590' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'934402f7-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1136, NULL, NULL, 2105, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-07T09:38:40.590' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'944402f7-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1137, NULL, NULL, 2105, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-07T09:38:40.590' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'954402f7-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1138, NULL, NULL, 2105, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-07T09:38:40.590' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'964402f7-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1139, NULL, NULL, 2105, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-07T09:38:40.590' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'974402f7-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1140, NULL, NULL, 2105, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-07T09:38:40.590' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'984402f7-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1141, NULL, NULL, 2105, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-07T09:38:40.590' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'994402f7-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1142, NULL, NULL, 2105, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-07T09:38:40.590' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'9a4402f7-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1143, NULL, NULL, 2105, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-07T09:38:40.590' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'9b4402f7-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1144, NULL, NULL, 2105, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-07T09:38:40.590' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'9c4402f7-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1145, NULL, NULL, 2105, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-07T09:38:40.590' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'9d4402f7-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1146, N'3F030004', N'247', 2105, 73, NULL, NULL, NULL, CAST(N'2020-07-08T00:00:00.000' AS DateTime), NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2020-07-08T12:19:42.010' AS DateTime), CAST(N'2020-07-08T12:19:42.010' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'9e4402f7-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1147, NULL, NULL, 2105, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-07T09:38:40.590' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'9f4402f7-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1148, NULL, NULL, 2105, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-07T09:38:40.590' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'a04402f7-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1149, NULL, NULL, 2105, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-07T09:38:40.590' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'a14402f7-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1150, NULL, NULL, 2105, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-07T09:38:40.590' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'a24402f7-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1151, NULL, NULL, 2105, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-07T09:38:40.590' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'a34402f7-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1152, NULL, NULL, 2105, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-07T09:38:40.590' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'a44402f7-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1153, NULL, NULL, 2105, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-07T09:38:40.590' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'a54402f7-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1154, NULL, NULL, 2106, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-08T15:43:02.013' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'5891de07-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1155, NULL, NULL, 2106, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-08T15:43:02.013' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'5991de07-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1156, NULL, NULL, 2106, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-08T15:43:02.013' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'5a91de07-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1157, NULL, NULL, 2106, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-08T15:43:02.013' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'5b91de07-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1158, NULL, NULL, 2106, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-08T15:43:02.013' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'5c91de07-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1159, NULL, NULL, 2106, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-08T15:43:02.013' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'5d91de07-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1160, NULL, NULL, 2106, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-08T15:43:02.013' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'5e91de07-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1161, NULL, NULL, 2106, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-08T15:43:02.013' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'5f91de07-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1162, NULL, NULL, 2106, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-08T15:43:02.013' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'6091de07-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1163, NULL, NULL, 2106, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-08T15:43:02.013' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'6191de07-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1164, NULL, NULL, 2106, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-08T15:43:02.013' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'6291de07-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1165, N'3F030006', N'247', 2106, 73, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-08T00:00:00.000' AS DateTime), NULL, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2020-07-08T15:43:43.473' AS DateTime), CAST(N'2020-07-08T15:43:43.473' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'6391de07-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1166, NULL, NULL, 2106, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-08T15:43:02.013' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'6491de07-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1167, NULL, NULL, 2106, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-08T15:43:02.013' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'6591de07-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1168, N'30006', N'306', 2106, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-13T09:11:31.067' AS DateTime), CAST(N'2020-07-13T09:11:31.067' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'SHC - Mei Chang', N'6691de07-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1169, NULL, NULL, 2106, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-08T15:43:02.013' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'6791de07-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1170, NULL, NULL, 2106, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-08T15:43:02.013' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'6891de07-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1171, NULL, NULL, 2106, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-08T15:43:02.013' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'6991de07-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1172, NULL, NULL, 2106, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-08T15:43:02.013' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'6a91de07-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1211, NULL, NULL, 2109, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T07:45:01.423' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'38fe623f-6bc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1212, NULL, NULL, 2109, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T07:45:01.423' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'39fe623f-6bc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1213, NULL, NULL, 2109, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T07:45:01.423' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'3afe623f-6bc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1214, NULL, NULL, 2109, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T07:45:01.423' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'3bfe623f-6bc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1215, NULL, NULL, 2109, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T07:45:01.423' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'3cfe623f-6bc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1216, NULL, NULL, 2109, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T07:45:01.423' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'3dfe623f-6bc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1217, NULL, NULL, 2109, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T07:45:01.423' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'3efe623f-6bc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1218, N'4C140007', N'300', 2109, 87, NULL, NULL, NULL, CAST(N'2020-07-14T00:00:00.000' AS DateTime), CAST(N'2020-07-14T00:00:00.000' AS DateTime), CAST(N'2020-07-14T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 1, 1, NULL, NULL, NULL, 1, 1, 1, NULL, CAST(N'2020-07-14T09:58:31.357' AS DateTime), CAST(N'2020-07-14T09:58:31.357' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'3ffe623f-6bc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1219, NULL, NULL, 2109, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T07:45:01.423' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'40fe623f-6bc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1220, NULL, NULL, 2109, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T07:45:01.423' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'41fe623f-6bc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1221, NULL, NULL, 2109, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T07:45:01.423' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'42fe623f-6bc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1222, NULL, NULL, 2109, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T07:45:01.423' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'43fe623f-6bc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1223, NULL, NULL, 2109, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T07:45:01.423' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'44fe623f-6bc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1224, NULL, NULL, 2109, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T07:45:01.423' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'45fe623f-6bc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1225, NULL, NULL, 2109, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T07:45:01.423' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'46fe623f-6bc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1226, NULL, NULL, 2109, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T07:45:01.423' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'47fe623f-6bc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1227, NULL, NULL, 2109, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T07:45:01.423' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'48fe623f-6bc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1228, NULL, NULL, 2109, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T07:45:01.423' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'49fe623f-6bc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1229, NULL, NULL, 2109, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T07:45:01.423' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'4afe623f-6bc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1230, NULL, NULL, 2110, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:03:23.767' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'843cf293-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1231, NULL, NULL, 2110, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:03:23.767' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'853cf293-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1232, NULL, NULL, 2110, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:03:23.767' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'863cf293-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1233, NULL, NULL, 2110, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:03:23.767' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'873cf293-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1234, NULL, NULL, 2110, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:03:23.767' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'883cf293-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1235, NULL, NULL, 2110, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:03:23.767' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'893cf293-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1236, NULL, NULL, 2110, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:03:23.767' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'8a3cf293-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1237, N'4C140008', N'300', 2110, 87, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T00:00:00.000' AS DateTime), NULL, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2020-07-14T10:03:40.973' AS DateTime), CAST(N'2020-07-14T10:03:40.973' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'8b3cf293-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1238, NULL, NULL, 2110, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:03:23.767' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'8c3cf293-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1239, NULL, NULL, 2110, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:03:23.767' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'8d3cf293-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1240, NULL, NULL, 2110, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:03:23.767' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'8e3cf293-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1241, NULL, NULL, 2110, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:03:23.767' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'8f3cf293-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1242, NULL, NULL, 2110, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:03:23.767' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'903cf293-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1243, NULL, NULL, 2110, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:03:23.767' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'913cf293-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1244, NULL, NULL, 2110, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:03:23.767' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'923cf293-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1245, NULL, NULL, 2110, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:03:23.767' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'933cf293-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1246, NULL, NULL, 2110, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:03:23.767' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'943cf293-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1247, NULL, NULL, 2110, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:03:23.767' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'953cf293-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1248, NULL, NULL, 2110, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:03:23.767' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'963cf293-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1249, NULL, NULL, 2111, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:07:56.600' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'0e129836-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1250, NULL, NULL, 2111, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:07:56.600' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'0f129836-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1251, NULL, NULL, 2111, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:07:56.600' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'10129836-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1252, NULL, NULL, 2111, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:07:56.600' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'11129836-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1253, NULL, NULL, 2111, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:07:56.600' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'12129836-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1254, NULL, NULL, 2111, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:07:56.600' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'13129836-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1255, NULL, NULL, 2111, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:07:56.600' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'14129836-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1256, N'4C140009', N'300', 2111, 87, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T00:00:00.000' AS DateTime), NULL, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, CAST(N'2020-07-14T10:08:12.087' AS DateTime), CAST(N'2020-07-14T10:08:12.087' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'15129836-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1257, NULL, NULL, 2111, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:07:56.600' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'16129836-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1258, NULL, NULL, 2111, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:07:56.600' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'17129836-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1259, NULL, NULL, 2111, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:07:56.600' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'18129836-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1260, NULL, NULL, 2111, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:07:56.600' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'19129836-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1261, NULL, NULL, 2111, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:07:56.600' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'1a129836-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1262, NULL, NULL, 2111, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:07:56.600' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'1b129836-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1263, NULL, N'306', 2111, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-15T08:30:06.910' AS DateTime), CAST(N'2020-07-15T08:30:06.910' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'1c129836-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1264, NULL, NULL, 2111, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:07:56.600' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'1d129836-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1265, NULL, NULL, 2111, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:07:56.600' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'1e129836-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1266, NULL, NULL, 2111, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:07:56.600' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'1f129836-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[KPILevels] ([ID], [KPILevelCode], [UserCheck], [KPIID], [LevelID], [TeamID], [Period], [Weekly], [Monthly], [HalfYear], [Quarterly], [Yearly], [Checked], [WeeklyChecked], [MonthlyChecked], [HalfYearChecked], [QuarterlyChecked], [YearlyChecked], [CheckedPeriod], [WeeklyPublic], [MonthlyPublic], [HalfYearPublic], [QuarterlyPublic], [YearlyPublic], [TimeCheck], [CreateTime], [LevelNumber], [WeeklyStandard], [MonthlyStandard], [HalfYearStandard], [QuarterlyStandard], [YearlyStandard], [WeeklyTarget], [MonthlyTarget], [HalfYearTarget], [QuarterlyTarget], [YearlyTarget], [PIC], [Owner], [OwnerManagerment], [ModifyBy], [rowguid]) VALUES (1267, NULL, NULL, 2111, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-07-14T10:07:56.600' AS DateTime), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, N'20129836-7fc5-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[KPILevels] OFF
GO
SET IDENTITY_INSERT [dbo].[KPIs] ON 
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit], [UserID], [rowguid], [Status]) VALUES (1099, N'KPI UploadE', N'0001', 1, CAST(N'2020-04-29T14:04:20.647' AS DateTime), NULL, N'0001', 0, 1, 300, N'5122c773-fabf-ea11-8313-1c1b0dc54b21', 0)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit], [UserID], [rowguid], [Status]) VALUES (2098, N'KPI By Swook', N'0002', 1, CAST(N'2020-05-04T10:23:09.903' AS DateTime), NULL, N'0002', 0, 2, 300, N'5222c773-fabf-ea11-8313-1c1b0dc54b21', 0)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit], [UserID], [rowguid], [Status]) VALUES (2101, N'KPI BY LEO E', N'0003', 1, CAST(N'2020-05-25T10:03:38.777' AS DateTime), NULL, N'0003', 0, 1, 247, N'5322c773-fabf-ea11-8313-1c1b0dc54b21', 0)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit], [UserID], [rowguid], [Status]) VALUES (2104, N'KPI DEMO WEEK', N'0005', 1, CAST(N'2020-07-06T09:40:57.720' AS DateTime), NULL, N'0005', 0, 1, 300, N'5422c773-fabf-ea11-8313-1c1b0dc54b21', 0)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit], [UserID], [rowguid], [Status]) VALUES (2105, N'KPI DEMO TRANSACTION', N'0004', 1, CAST(N'2020-07-07T09:38:40.033' AS DateTime), NULL, N'0004', 0, 1, 247, N'8f4402f7-fabf-ea11-8313-1c1b0dc54b21', 1)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit], [UserID], [rowguid], [Status]) VALUES (2106, N'demo level 3', N'0006', 1, CAST(N'2020-07-08T15:43:01.963' AS DateTime), NULL, N'0006', 0, 2, 247, N'5491de07-f7c0-ea11-8313-1c1b0dc54b21', 0)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit], [UserID], [rowguid], [Status]) VALUES (2109, N'demo over', N'0007', 1, CAST(N'2020-07-14T07:45:01.380' AS DateTime), NULL, N'0007', 0, 1, 300, N'34fe623f-6bc5-ea11-8313-1c1b0dc54b21', 0)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit], [UserID], [rowguid], [Status]) VALUES (2110, N'test over', N'0008', 1, CAST(N'2020-07-14T10:03:23.580' AS DateTime), NULL, N'0008', 0, 1, 300, N'803cf293-7ec5-ea11-8313-1c1b0dc54b21', 1)
GO
INSERT [dbo].[KPIs] ([ID], [Name], [Code], [LevelID], [CreateTime], [ParentID], [CategoryCode], [CategoryID], [Unit], [UserID], [rowguid], [Status]) VALUES (2111, N'test below target', N'0009', 1, CAST(N'2020-07-14T10:07:56.563' AS DateTime), NULL, N'0009', 0, 2, 300, N'0a129836-7fc5-ea11-8313-1c1b0dc54b21', 0)
GO
SET IDENTITY_INSERT [dbo].[KPIs] OFF
GO
SET IDENTITY_INSERT [dbo].[Levels] ON 
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime], [rowguid]) VALUES (52, N'SSB', N'GO1', 0, NULL, 1, 0, CAST(N'2019-07-23T14:45:46.473' AS DateTime), N'5522c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime], [rowguid]) VALUES (53, N'Division II', NULL, 52, NULL, 2, 0, CAST(N'2019-07-23T15:08:47.990' AS DateTime), N'5622c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime], [rowguid]) VALUES (54, N'SHC', NULL, 53, NULL, 3, 0, CAST(N'2019-07-23T15:09:41.590' AS DateTime), N'5722c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime], [rowguid]) VALUES (55, N'Production Center', N'C11', 54, NULL, 4, 0, CAST(N'2019-07-23T15:11:30.777' AS DateTime), N'5822c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime], [rowguid]) VALUES (72, N'CB', N'F02', 53, NULL, 3, 0, CAST(N'2019-08-24T14:07:34.463' AS DateTime), N'5922c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime], [rowguid]) VALUES (73, N'SPC', N'F03', 53, NULL, 3, 0, CAST(N'2019-09-09T14:47:40.453' AS DateTime), N'5a22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime], [rowguid]) VALUES (74, N'SYF', N'F04', 53, NULL, 3, 0, CAST(N'2019-09-09T14:47:57.330' AS DateTime), N'5b22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime], [rowguid]) VALUES (83, N'Administration Center', NULL, 54, NULL, 4, 0, CAST(N'2019-10-21T16:02:10.317' AS DateTime), N'5c22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime], [rowguid]) VALUES (86, N'Operation Center ', NULL, 54, NULL, 4, 0, CAST(N'2019-10-25T16:19:13.273' AS DateTime), N'5d22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime], [rowguid]) VALUES (87, N'Development Center', N'C14', 54, NULL, 4, 0, CAST(N'2019-10-25T16:19:30.207' AS DateTime), N'5e22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime], [rowguid]) VALUES (88, N'Production Center', N'C21', 72, NULL, 4, 0, CAST(N'2019-10-31T18:45:28.197' AS DateTime), N'5f22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime], [rowguid]) VALUES (89, N'Operation Center ', N'C23', 72, NULL, 4, 0, CAST(N'2019-10-31T18:48:46.680' AS DateTime), N'6022c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime], [rowguid]) VALUES (90, N'Administration Center', N'C22', 72, NULL, 4, 0, CAST(N'2019-10-31T18:49:22.853' AS DateTime), N'6122c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime], [rowguid]) VALUES (92, N'Operation Center', NULL, 73, NULL, 4, 0, CAST(N'2019-11-29T12:15:02.257' AS DateTime), N'6222c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime], [rowguid]) VALUES (93, N'Production Center', N'CE0001', 73, NULL, 4, 0, CAST(N'2019-11-29T12:15:28.803' AS DateTime), N'6322c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime], [rowguid]) VALUES (94, N'Administration Center', N'CE0001', 73, NULL, 4, 0, CAST(N'2019-11-29T12:16:16.820' AS DateTime), N'6422c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime], [rowguid]) VALUES (95, N'Operation Center', N'CE0001', 74, NULL, 4, 0, CAST(N'2019-11-29T12:17:26.363' AS DateTime), N'6522c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime], [rowguid]) VALUES (96, N'Production Center', N'CE0001', 74, NULL, 4, 0, CAST(N'2019-11-29T12:17:32.217' AS DateTime), N'6622c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Levels] ([ID], [Name], [Code], [ParentID], [ParentCode], [LevelNumber], [State], [CreateTime], [rowguid]) VALUES (97, N'Administration Center', N'CE0001', 74, NULL, 4, 0, CAST(N'2019-11-29T12:17:37.340' AS DateTime), N'6722c773-fabf-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[Levels] OFF
GO
SET IDENTITY_INSERT [dbo].[Managers] ON 
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5283, 36, 15, NULL, NULL, CAST(N'2020-05-04T14:27:29.750' AS DateTime), 306, N'6822c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5292, 1036, 1073, NULL, NULL, CAST(N'2020-06-22T12:12:15.423' AS DateTime), 300, N'6a22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5294, 1039, 1146, NULL, NULL, CAST(N'2020-07-08T12:21:14.237' AS DateTime), 306, N'149206d7-dac0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5295, 1040, 1165, NULL, NULL, CAST(N'2020-07-08T15:44:31.843' AS DateTime), 254, N'28ba653d-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5296, 1037, 1130, NULL, NULL, CAST(N'2020-07-09T10:21:13.203' AS DateTime), 306, N'49fd353d-93c1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5297, 1037, 1130, NULL, NULL, CAST(N'2020-07-09T10:21:13.233' AS DateTime), 254, N'4afd353d-93c1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5298, 1035, 1010, NULL, NULL, CAST(N'2020-07-09T13:42:45.753' AS DateTime), 306, N'a7fe0465-afc1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5299, 1041, 1218, NULL, NULL, CAST(N'2020-07-14T09:01:22.707' AS DateTime), 306, N'fa7504ea-75c5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5300, 1041, 1237, NULL, NULL, CAST(N'2020-07-14T10:04:05.787' AS DateTime), 306, N'479bfdac-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5301, 1041, 1256, NULL, NULL, CAST(N'2020-07-14T10:08:30.227' AS DateTime), 306, N'4d60a04a-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5302, 1036, 1130, NULL, NULL, CAST(N'2020-07-17T12:20:02.917' AS DateTime), 306, N'a4ae402a-edc7-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Managers] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5303, 1036, 15, NULL, NULL, CAST(N'2020-07-17T12:20:14.583' AS DateTime), 261, N'72234031-edc7-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[Managers] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuLangs] ON 
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (3, N'vi', N'(2) KPI', 1, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'6c22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (4, N'en', N'(2) KPI', 1, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'6d22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (5, N'zh-TW', N'(2) KPI', 1, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'6e22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (6, N'vi', N'Sở Thích', 2, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'6f22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (7, N'en', N'Favourites', 2, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'7022c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (8, N'zh-TW', N'收藏夾', 2, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'7122c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (9, N'vi', N'Bàn Làm Việc', 3, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'7222c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (10, N'en', N'Workplaces', 3, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'7322c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (11, N'zh-TW', N'工作場所', 3, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'7422c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (12, N'vi', N'(1) Sơ đồ tổ chức', 4, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'7522c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (13, N'en', N'(1) OC', 4, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'7622c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (14, N'zh-TW', N'(1) 組織結構圖', 4, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'7722c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (15, N'vi', N'
(3) Thể loại', 6, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'7822c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (16, N'en', N'(3) Category', 6, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'7922c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (17, N'zh-TW', N'(3) 分類目錄', 6, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'7a22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (18, N'vi', N'(7) Người Dùng', 7, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'7b22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (19, N'en', N'(7) User', 7, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'7c22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (20, N'zh-TW', N'(7) 用戶', 7, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'7d22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (21, N'vi', N'(8) OC User', 8, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'7e22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (22, N'en', N'(8) OC User', 8, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'7f22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (23, N'zh-TW', N'(8) 添加OC用戶', 8, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'8022c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (24, N'vi', N'(5) OC KPI', 10, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'8122c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (25, N'en', N'(5) OC KPI', 10, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'8222c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (26, N'zh-TW', N'(5) 組織結構圖KPI', 10, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'8322c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (27, N'vi', N'(6) OC Category KPI', 12, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'8422c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (28, N'en', N'(6) OC Category KPI', 12, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'8522c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (29, N'zh-TW', N'(6) OC類KPI', 12, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'8622c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (30, N'vi', N'KPI', 13, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'8722c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (31, N'en', N'KPI', 13, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'8822c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (32, N'zh-TW', N'KPI', 13, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'8922c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (33, N'vi', N'(4) OC Category', 14, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'8a22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (34, N'en', N'(4) OC Category', 14, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'8b22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (35, N'zh-TW', N'(4) OC類別', 14, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'8c22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (38, N'vi', N'KPI Overview', 20, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'8d22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (40, N'en', N'KPI Overview', 20, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'8e22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (41, N'zh-TW', N'KPI總覽', 20, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'8f22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (44, N'vi', N'KPI Overview', 22, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'9022c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (45, N'en', N'KPI Overview', 22, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'9122c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuLangs] ([ID], [LangID], [Name], [MenuID], [CreatedTime], [rowguid]) VALUES (46, N'zh-TW', N'KPI總覽', 22, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'9222c773-fabf-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[MenuLangs] OFF
GO
INSERT [dbo].[MenuRoles] ([MenuID], [RoleID], [Index], [rowguid]) VALUES (1, 1, 2, N'9322c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuRoles] ([MenuID], [RoleID], [Index], [rowguid]) VALUES (4, 1, 1, N'9422c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuRoles] ([MenuID], [RoleID], [Index], [rowguid]) VALUES (6, 1, 3, N'9522c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuRoles] ([MenuID], [RoleID], [Index], [rowguid]) VALUES (7, 1, 7, N'9622c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuRoles] ([MenuID], [RoleID], [Index], [rowguid]) VALUES (8, 1, 8, N'9722c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuRoles] ([MenuID], [RoleID], [Index], [rowguid]) VALUES (10, 1, 5, N'9822c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuRoles] ([MenuID], [RoleID], [Index], [rowguid]) VALUES (12, 1, 6, N'9922c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuRoles] ([MenuID], [RoleID], [Index], [rowguid]) VALUES (14, 1, 4, N'9a22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuRoles] ([MenuID], [RoleID], [Index], [rowguid]) VALUES (2, 2, 3, N'9b22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuRoles] ([MenuID], [RoleID], [Index], [rowguid]) VALUES (3, 2, 2, N'9c22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuRoles] ([MenuID], [RoleID], [Index], [rowguid]) VALUES (13, 2, 1, N'9d22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuRoles] ([MenuID], [RoleID], [Index], [rowguid]) VALUES (20, 2, 5, N'9e22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[MenuRoles] ([MenuID], [RoleID], [Index], [rowguid]) VALUES (22, 1, 9, N'9f22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[Menus] ON 
GO
INSERT [dbo].[Menus] ([ID], [Name], [Link], [FontAwesome], [BackgroudColor], [Position], [Code], [rowguid]) VALUES (1, N'(2) KPI', N'/AdminKPI/', N'fas fa-chart-line', N'btn-foursquare', 2, N'(2) KPI', N'a022c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Menus] ([ID], [Name], [Link], [FontAwesome], [BackgroudColor], [Position], [Code], [rowguid]) VALUES (2, N'Favourites', N'/Favourite/', N'fas fa-heart', N'btn-foursquare', 5, N'Favourites', N'a122c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Menus] ([ID], [Name], [Link], [FontAwesome], [BackgroudColor], [Position], [Code], [rowguid]) VALUES (3, N'Workplaces', N'/Workplace/', N'fa fa-laptop', N'bg-green', 6, N'Workplaces', N'a222c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Menus] ([ID], [Name], [Link], [FontAwesome], [BackgroudColor], [Position], [Code], [rowguid]) VALUES (4, N'(1) OC', N'/AdminLevel/', N'fa fa-list-ol', N'bg-orange', 1, N'(1) OC', N'a322c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Menus] ([ID], [Name], [Link], [FontAwesome], [BackgroudColor], [Position], [Code], [rowguid]) VALUES (6, N'(3) Categories', N'/AdminCategory/', N'fab fa-gg-circle', N'bg-navy', 3, N'(3) Categories', N'a422c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Menus] ([ID], [Name], [Link], [FontAwesome], [BackgroudColor], [Position], [Code], [rowguid]) VALUES (7, N'(7) Users', N'/AdminUser/', N'far fa-user', N'bg-purple', 7, N'(7) Users', N'a522c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Menus] ([ID], [Name], [Link], [FontAwesome], [BackgroudColor], [Position], [Code], [rowguid]) VALUES (8, N'(8) OC User', N'/AddUserToLevel/', N'fa fa-leaf', N'bg-maroon', 8, N'(8) OC User', N'a622c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Menus] ([ID], [Name], [Link], [FontAwesome], [BackgroudColor], [Position], [Code], [rowguid]) VALUES (10, N'(5)  OC KPI', N'/AdminOC/', N'fa fa-book', N'bg-green', 5, N'(5)  OC KPI', N'a722c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Menus] ([ID], [Name], [Link], [FontAwesome], [BackgroudColor], [Position], [Code], [rowguid]) VALUES (12, N'(6) OC Category KPI ', N'/CategoryKPILevelAdmin/', N'far fa-gem', N'bg-orange', 6, N'(6) OC Category KPI ', N'a822c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Menus] ([ID], [Name], [Link], [FontAwesome], [BackgroudColor], [Position], [Code], [rowguid]) VALUES (13, N'KPIs', N'/CategoryKPILevel/', N'fas fa-chart-line', N'bg-aqua', 4, N'KPIs', N'a922c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Menus] ([ID], [Name], [Link], [FontAwesome], [BackgroudColor], [Position], [Code], [rowguid]) VALUES (14, N'(4) OC Category', N'/OCCategories/', N'far fa-gem', N'bg-danger', 4, N'(4) OC Category', N'aa22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Menus] ([ID], [Name], [Link], [FontAwesome], [BackgroudColor], [Position], [Code], [rowguid]) VALUES (20, N'KPI Overview', N'/Overview/', N'fas fa-search-plus', N'bg-danger', 6, N'KPI Overview', N'ab22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Menus] ([ID], [Name], [Link], [FontAwesome], [BackgroudColor], [Position], [Code], [rowguid]) VALUES (22, N'KPI Overview', N'/Overview', N'fas fa-search-plus', N'bg-danger', 9, N'KPI Overview', N'ac22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[Menus] OFF
GO
SET IDENTITY_INSERT [dbo].[NotificationDetails] ON 
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (354, 297, 1367, 0, NULL, CAST(N'2020-05-20T11:55:55.060' AS DateTime), NULL, NULL, N'ad22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (355, 297, 1368, 0, NULL, CAST(N'2020-05-20T12:06:57.210' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'ae22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (356, 299, 1369, 0, NULL, CAST(N'2020-05-20T12:06:57.210' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'af22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (357, 297, 1370, 1, NULL, CAST(N'2020-05-22T08:27:36.417' AS DateTime), NULL, NULL, N'b022c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (358, 299, 1371, 0, NULL, CAST(N'2020-05-22T08:34:01.593' AS DateTime), NULL, N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', N'b122c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (359, 297, 1372, 0, NULL, CAST(N'2020-05-22T08:34:01.593' AS DateTime), NULL, N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', N'b222c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (360, 305, 1373, 0, NULL, CAST(N'2020-05-22T08:45:19.013' AS DateTime), NULL, N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', N'b322c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (361, 314, 1374, 0, NULL, CAST(N'2020-05-22T08:45:19.013' AS DateTime), NULL, N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', N'b422c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (362, 299, 1375, 0, NULL, CAST(N'2020-05-22T09:03:53.800' AS DateTime), NULL, N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', N'b522c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (363, 314, 1376, 0, NULL, CAST(N'2020-05-22T09:03:53.800' AS DateTime), NULL, N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', N'b622c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (364, 297, 1376, 0, NULL, CAST(N'2020-05-22T09:03:53.800' AS DateTime), NULL, N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', N'b722c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (365, 297, 1377, 0, NULL, CAST(N'2020-05-22T09:19:16.603' AS DateTime), NULL, NULL, N'b822c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (366, 299, 1378, 0, NULL, CAST(N'2020-05-22T09:29:04.163' AS DateTime), NULL, N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', N'b922c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (367, 297, 1379, 0, NULL, CAST(N'2020-05-22T09:29:04.163' AS DateTime), NULL, N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', N'ba22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (368, 299, 1380, 0, NULL, CAST(N'2020-05-22T09:50:15.563' AS DateTime), NULL, N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', N'bb22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (369, 297, 1381, 1, NULL, CAST(N'2020-05-22T09:50:08.093' AS DateTime), NULL, N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', N'bc22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (370, 299, 1382, 0, NULL, CAST(N'2020-05-22T09:55:43.693' AS DateTime), NULL, N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', N'bd22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (371, 299, 1384, 0, NULL, CAST(N'2020-05-22T10:06:09.863' AS DateTime), NULL, N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', N'be22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (372, 301, 1385, 1, NULL, CAST(N'2020-05-22T10:06:03.687' AS DateTime), NULL, N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', N'bf22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (373, 297, 1385, 1, NULL, CAST(N'2020-05-22T10:05:59.523' AS DateTime), NULL, N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', N'c022c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (374, 299, 1386, 0, NULL, CAST(N'2020-05-22T10:09:21.883' AS DateTime), NULL, N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', N'c122c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (375, 300, 1386, 1, NULL, CAST(N'2020-05-22T10:09:21.883' AS DateTime), NULL, N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', N'c222c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (376, 297, 1387, 1, NULL, CAST(N'2020-05-22T10:09:35.880' AS DateTime), NULL, N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', N'c322c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (377, 301, 1387, 0, NULL, CAST(N'2020-05-22T10:09:35.880' AS DateTime), NULL, N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', N'c422c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (378, 299, 1388, 0, NULL, CAST(N'2020-05-22T12:21:47.520' AS DateTime), NULL, N'/ChartPeriod/40002/1035/H/2020/1/2/task/311/1005/Action-Plan-on-February-', N'c522c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (379, 297, 1389, 0, NULL, CAST(N'2020-05-22T12:21:47.520' AS DateTime), NULL, N'/ChartPeriod/40002/1035/H/2020/1/2/task/311/1005/Action-Plan-on-February-', N'c622c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (380, 297, 1390, 0, NULL, CAST(N'2020-05-25T09:11:59.960' AS DateTime), NULL, NULL, N'c722c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (381, 297, 1391, 0, NULL, CAST(N'2020-05-25T09:14:45.290' AS DateTime), NULL, NULL, N'c822c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (382, 297, 1392, 0, NULL, CAST(N'2020-05-25T09:18:03.667' AS DateTime), NULL, NULL, N'c922c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (383, 299, 1393, 0, NULL, CAST(N'2020-05-25T09:57:15.963' AS DateTime), NULL, N'/ChartPeriod/40002/1035/H/2020/1/2/task/314/1005/Action-Plan-on-February-', N'ca22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (384, 297, 1394, 1, NULL, CAST(N'2020-05-25T09:57:15.963' AS DateTime), NULL, N'/ChartPeriod/40002/1035/H/2020/1/2/task/314/1005/Action-Plan-on-February-', N'cb22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (385, 299, 1395, 0, NULL, CAST(N'2020-05-25T09:59:20.637' AS DateTime), NULL, N'/ChartPeriod/40002/1035/H/2020/1/2/task/314/1005/Action-Plan-on-February-', N'cc22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (386, 300, 1395, 1, NULL, CAST(N'2020-05-25T09:59:20.637' AS DateTime), NULL, N'/ChartPeriod/40002/1035/H/2020/1/2/task/314/1005/Action-Plan-on-February-', N'cd22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (387, 297, 1396, 0, NULL, CAST(N'2020-05-25T10:01:00.210' AS DateTime), NULL, N'/ChartPeriod/40002/1035/H/2020/1/2/task/314/1005/Action-Plan-on-February-', N'ce22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (388, 300, 1397, 1, NULL, CAST(N'2020-05-25T10:08:06.837' AS DateTime), N'KPI BY LEO E ( SSB->Division II->SHC ) ', N'http://10.4.0.76:8069/#/ChartPeriod/30003/1036/H/2020/1/6', N'cf22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (389, 306, 1397, 0, NULL, CAST(N'2020-05-25T10:08:06.837' AS DateTime), N'KPI BY LEO E ( SSB->Division II->SHC ) ', N'http://10.4.0.76:8069/#/ChartPeriod/30003/1036/H/2020/1/6', N'd022c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (390, 301, 1397, 0, NULL, CAST(N'2020-05-25T10:08:06.837' AS DateTime), N'KPI BY LEO E ( SSB->Division II->SHC ) ', N'http://10.4.0.76:8069/#/ChartPeriod/30003/1036/H/2020/1/6', N'd122c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (391, 301, 1398, 0, NULL, CAST(N'2020-05-25T10:08:06.860' AS DateTime), N'KPI By Swook ( SSB->Division II->SHC->Administration Center ) ', N'http://10.4.0.76:8069/#/ChartPeriod/40002/1035/H/2020/1/6', N'd222c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (392, 300, 1398, 1, NULL, CAST(N'2020-05-25T10:08:06.860' AS DateTime), N'KPI By Swook ( SSB->Division II->SHC->Administration Center ) ', N'http://10.4.0.76:8069/#/ChartPeriod/40002/1035/H/2020/1/6', N'd322c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (393, 306, 1398, 0, NULL, CAST(N'2020-05-25T10:08:06.860' AS DateTime), N'KPI By Swook ( SSB->Division II->SHC->Administration Center ) ', N'http://10.4.0.76:8069/#/ChartPeriod/40002/1035/H/2020/1/6', N'd422c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (394, 297, 1399, 0, NULL, CAST(N'2020-05-25T11:21:02.733' AS DateTime), NULL, NULL, N'd522c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (395, 299, 1400, 0, NULL, CAST(N'2020-05-25T11:21:23.900' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'd622c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (396, 297, 1401, 0, NULL, CAST(N'2020-05-25T11:21:23.900' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'd722c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (397, 299, 1402, 0, NULL, CAST(N'2020-05-25T12:23:15.890' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'd822c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (398, 297, 1403, 1, NULL, CAST(N'2020-05-25T12:23:15.890' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'd922c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (399, 299, 1404, 0, NULL, CAST(N'2020-05-25T12:25:33.393' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'da22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (400, 300, 1404, 1, NULL, CAST(N'2020-05-25T12:25:33.393' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'db22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (401, 297, 1405, 1, NULL, CAST(N'2020-05-25T12:25:58.170' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'dc22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (402, 299, 1406, 0, NULL, CAST(N'2020-05-27T09:56:00.653' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'dd22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (403, 305, 1407, 0, NULL, CAST(N'2020-05-27T09:56:00.653' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'de22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (404, 299, 1408, 0, NULL, CAST(N'2020-05-27T10:03:32.397' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'df22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (405, 305, 1409, 0, NULL, CAST(N'2020-05-27T10:03:32.393' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'e022c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (406, 299, 1410, 0, NULL, CAST(N'2020-05-27T10:07:54.267' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'e122c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (407, 305, 1411, 0, NULL, CAST(N'2020-05-27T10:07:54.267' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'e222c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (408, 299, 1412, 0, NULL, CAST(N'2020-05-27T10:13:32.170' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'e322c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (409, 305, 1413, 0, NULL, CAST(N'2020-05-27T10:13:32.170' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'e422c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (410, 299, 1414, 0, NULL, CAST(N'2020-05-27T10:15:39.743' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'e522c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (411, 255, 1415, 0, NULL, CAST(N'2020-05-27T10:15:39.743' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'e622c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (412, 255, 1416, 0, NULL, CAST(N'2020-05-27T10:18:22.557' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'e722c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (413, 299, 1417, 0, NULL, CAST(N'2020-05-27T10:21:22.680' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'e822c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (414, 297, 1418, 0, NULL, CAST(N'2020-05-27T10:21:22.680' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'e922c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (415, 299, 1419, 0, NULL, CAST(N'2020-05-27T10:38:23.730' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'ea22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (416, 297, 1420, 0, NULL, CAST(N'2020-05-27T10:38:21.627' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'eb22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (417, 299, 1421, 0, NULL, CAST(N'2020-05-27T10:49:52.260' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'ec22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (418, 297, 1422, 0, NULL, CAST(N'2020-05-27T10:49:52.257' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'ed22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (419, 299, 1423, 0, NULL, CAST(N'2020-05-27T10:52:39.943' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'ee22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (420, 263, 1424, 0, NULL, CAST(N'2020-05-27T10:52:39.940' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'ef22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (421, 297, 1425, 0, NULL, CAST(N'2020-05-27T10:59:08.530' AS DateTime), NULL, NULL, N'f022c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (422, 299, 1426, 0, NULL, CAST(N'2020-05-27T11:04:31.883' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'f122c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (423, 253, 1427, 0, NULL, CAST(N'2020-05-27T11:04:31.883' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'f222c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (424, 299, 1428, 0, NULL, CAST(N'2020-05-27T11:07:16.670' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'f322c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (425, 259, 1429, 0, NULL, CAST(N'2020-05-27T11:07:16.670' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'f422c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (426, 299, 1430, 0, NULL, CAST(N'2020-05-27T11:11:08.047' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'f522c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (427, 270, 1431, 0, NULL, CAST(N'2020-05-27T11:11:08.047' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'f622c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (428, 299, 1432, 0, NULL, CAST(N'2020-05-27T11:16:39.270' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'f722c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (429, 270, 1433, 0, NULL, CAST(N'2020-05-27T11:16:39.270' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'f822c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (430, 299, 1434, 0, NULL, CAST(N'2020-05-27T11:22:17.100' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'f922c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (431, 270, 1435, 0, NULL, CAST(N'2020-05-27T11:22:17.100' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'fa22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (432, 299, 1436, 0, NULL, CAST(N'2020-05-27T11:24:30.980' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'fb22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (433, 270, 1437, 0, NULL, CAST(N'2020-05-27T11:24:30.980' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'fc22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (434, 299, 1438, 0, NULL, CAST(N'2020-05-27T11:25:54.813' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'fd22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (435, 297, 1439, 0, NULL, CAST(N'2020-05-27T11:25:54.813' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'fe22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (436, 299, 1440, 0, NULL, CAST(N'2020-05-27T11:36:28.340' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'ff22c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (437, 297, 1441, 0, NULL, CAST(N'2020-05-27T11:36:20.747' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'0023c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (438, 299, 1442, 0, NULL, CAST(N'2020-05-27T11:43:36.423' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'0123c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (439, 305, 1443, 0, NULL, CAST(N'2020-05-27T11:43:36.423' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'0223c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (440, 299, 1444, 0, NULL, CAST(N'2020-05-27T11:51:24.767' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'0323c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (441, 297, 1445, 0, NULL, CAST(N'2020-05-27T11:51:24.763' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'0423c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (442, 299, 1446, 0, NULL, CAST(N'2020-05-27T11:53:06.973' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'0523c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (443, 297, 1447, 0, NULL, CAST(N'2020-05-27T11:53:06.973' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'0623c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (444, 299, 1448, 1, NULL, CAST(N'2020-05-27T12:03:57.897' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'0723c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (445, 297, 1449, 0, NULL, CAST(N'2020-05-27T12:03:53.693' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'0823c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (446, 299, 1450, 0, NULL, CAST(N'2020-05-27T12:20:46.893' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'0923c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (447, 297, 1451, 0, NULL, CAST(N'2020-05-27T12:20:46.893' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'0a23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (448, 299, 1452, 0, NULL, CAST(N'2020-05-27T16:10:20.453' AS DateTime), NULL, NULL, N'0b23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (449, 299, 1453, 1, NULL, CAST(N'2020-05-27T16:25:23.547' AS DateTime), NULL, NULL, N'0c23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (450, 299, 1454, 0, NULL, CAST(N'2020-05-27T16:27:16.367' AS DateTime), NULL, NULL, N'0d23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (451, 299, 1455, 0, NULL, CAST(N'2020-05-27T16:30:58.817' AS DateTime), NULL, NULL, N'0e23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (452, 299, 1456, 0, NULL, CAST(N'2020-05-27T16:31:17.040' AS DateTime), NULL, NULL, N'0f23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (453, 299, 1457, 0, NULL, CAST(N'2020-05-27T16:38:54.957' AS DateTime), NULL, NULL, N'1023c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (454, 299, 1458, 0, NULL, CAST(N'2020-05-28T07:55:02.437' AS DateTime), NULL, NULL, N'1123c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (455, 299, 1459, 1, NULL, CAST(N'2020-05-28T08:04:32.287' AS DateTime), NULL, NULL, N'1223c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (456, 299, 1460, 0, NULL, CAST(N'2020-05-28T08:22:12.317' AS DateTime), NULL, NULL, N'1323c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (457, 297, 1460, 0, NULL, CAST(N'2020-05-28T08:22:12.313' AS DateTime), NULL, NULL, N'1423c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (458, 299, 1461, 0, NULL, CAST(N'2020-05-28T08:26:48.013' AS DateTime), NULL, NULL, N'1523c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (459, 297, 1461, 0, NULL, CAST(N'2020-05-28T08:26:48.013' AS DateTime), NULL, NULL, N'1623c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (460, 299, 1462, 0, NULL, CAST(N'2020-05-28T08:30:28.057' AS DateTime), NULL, NULL, N'1723c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (461, 299, 1463, 0, NULL, CAST(N'2020-05-28T08:39:45.833' AS DateTime), NULL, NULL, N'1823c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (462, 297, 1463, 0, NULL, CAST(N'2020-05-28T08:39:45.833' AS DateTime), NULL, NULL, N'1923c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (463, 314, 1464, 0, NULL, CAST(N'2020-05-28T08:49:15.227' AS DateTime), NULL, NULL, N'1a23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (464, 299, 1464, 0, NULL, CAST(N'2020-05-28T08:49:15.227' AS DateTime), NULL, NULL, N'1b23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (465, 299, 1465, 0, NULL, CAST(N'2020-05-28T08:51:17.263' AS DateTime), NULL, NULL, N'1c23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (466, 299, 1466, 0, NULL, CAST(N'2020-05-28T10:16:16.143' AS DateTime), NULL, NULL, N'1d23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (467, 299, 1467, 0, NULL, CAST(N'2020-05-28T10:16:50.810' AS DateTime), NULL, NULL, N'1e23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (468, 297, 1467, 0, NULL, CAST(N'2020-05-28T10:16:50.810' AS DateTime), NULL, NULL, N'1f23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (469, 299, 1468, 0, NULL, CAST(N'2020-05-28T10:28:38.187' AS DateTime), NULL, NULL, N'2023c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (470, 299, 1469, 0, NULL, CAST(N'2020-05-28T10:28:57.993' AS DateTime), NULL, NULL, N'2123c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (471, 297, 1469, 0, NULL, CAST(N'2020-05-28T10:28:57.993' AS DateTime), NULL, NULL, N'2223c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (472, 297, 1470, 0, NULL, CAST(N'2020-05-28T10:29:15.787' AS DateTime), NULL, NULL, N'2323c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (473, 299, 1471, 0, NULL, CAST(N'2020-05-28T10:59:14.223' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'2423c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (474, 297, 1472, 0, NULL, CAST(N'2020-05-28T10:59:14.223' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'2523c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (475, 297, 1473, 0, NULL, CAST(N'2020-05-28T11:09:29.203' AS DateTime), NULL, NULL, N'2623c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (476, 299, 1474, 0, NULL, CAST(N'2020-05-28T11:32:10.327' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'2723c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (477, 301, 1475, 0, NULL, CAST(N'2020-05-28T11:32:10.327' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'2823c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (478, 297, 1475, 0, NULL, CAST(N'2020-05-28T11:32:10.327' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'2923c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (479, 299, 1476, 0, NULL, CAST(N'2020-05-28T11:33:19.410' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'2a23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (480, 301, 1477, 0, NULL, CAST(N'2020-05-28T11:33:19.410' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'2b23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (481, 297, 1477, 1, NULL, CAST(N'2020-05-28T11:33:19.410' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'2c23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (482, 299, 1478, 0, NULL, CAST(N'2020-05-28T11:33:50.660' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'2d23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (483, 300, 1478, 1, NULL, CAST(N'2020-05-28T11:33:50.660' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'2e23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (484, 297, 1479, 0, NULL, CAST(N'2020-05-28T11:34:08.030' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'2f23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (485, 301, 1479, 1, NULL, CAST(N'2020-05-28T11:34:08.030' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3023c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (486, 301, 1480, 0, NULL, CAST(N'2020-05-28T11:58:48.880' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3123c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (487, 297, 1481, 0, NULL, CAST(N'2020-05-28T11:58:48.880' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3223c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (488, 297, 1482, 0, NULL, CAST(N'2020-05-28T16:06:02.053' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3323c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (489, 301, 1482, 0, NULL, CAST(N'2020-05-28T16:06:02.057' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3423c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (490, 297, 1483, 0, NULL, CAST(N'2020-05-28T16:07:06.537' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3523c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (491, 301, 1483, 0, NULL, CAST(N'2020-05-28T16:07:06.537' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3623c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (492, 297, 1484, 0, NULL, CAST(N'2020-05-28T16:14:07.297' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3723c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (493, 301, 1484, 0, NULL, CAST(N'2020-05-28T16:14:07.297' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3823c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (494, 297, 1485, 0, NULL, CAST(N'2020-05-28T16:14:09.920' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3923c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (495, 301, 1485, 0, NULL, CAST(N'2020-05-28T16:14:09.920' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3a23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (496, 297, 1486, 0, NULL, CAST(N'2020-05-28T16:16:07.177' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3b23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (497, 301, 1486, 0, NULL, CAST(N'2020-05-28T16:16:07.177' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3c23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (498, 297, 1487, 0, NULL, CAST(N'2020-05-28T16:17:03.677' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3d23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (499, 301, 1487, 0, NULL, CAST(N'2020-05-28T16:17:03.677' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3e23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (500, 297, 1488, 0, NULL, CAST(N'2020-05-28T16:17:06.757' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3f23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (501, 301, 1488, 0, NULL, CAST(N'2020-05-28T16:17:06.757' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4023c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (502, 297, 1489, 0, NULL, CAST(N'2020-05-28T16:17:07.657' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4123c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (503, 301, 1489, 0, NULL, CAST(N'2020-05-28T16:17:07.657' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4223c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (504, 297, 1490, 0, NULL, CAST(N'2020-05-28T16:17:08.330' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4323c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (505, 301, 1490, 0, NULL, CAST(N'2020-05-28T16:17:08.330' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4423c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (506, 297, 1491, 0, NULL, CAST(N'2020-05-28T16:17:09.150' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4523c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (507, 301, 1491, 0, NULL, CAST(N'2020-05-28T16:17:09.150' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4623c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (508, 297, 1492, 0, NULL, CAST(N'2020-05-28T16:17:09.853' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4723c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (509, 301, 1492, 0, NULL, CAST(N'2020-05-28T16:17:09.853' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4823c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (510, 297, 1493, 0, NULL, CAST(N'2020-05-28T16:27:32.403' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4923c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (511, 301, 1493, 0, NULL, CAST(N'2020-05-28T16:27:32.403' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4a23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (512, 297, 1494, 1, NULL, CAST(N'2020-05-28T16:27:33.953' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4b23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (513, 301, 1494, 0, NULL, CAST(N'2020-05-28T16:27:33.953' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4c23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (514, 300, 1496, 0, NULL, CAST(N'2020-06-05T13:57:37.407' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4d23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (515, 300, 1495, 0, NULL, CAST(N'2020-06-05T13:57:55.993' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4e23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (516, 301, 1496, 0, NULL, CAST(N'2020-06-05T13:57:41.787' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4f23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (517, 301, 1495, 0, NULL, CAST(N'2020-06-05T14:04:34.323' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'5023c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (518, 297, 1496, 0, NULL, CAST(N'2020-06-05T13:57:41.787' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'5123c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (519, 297, 1495, 0, NULL, CAST(N'2020-06-05T14:04:36.813' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'5223c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (520, 300, 1497, 0, NULL, CAST(N'2020-06-09T08:10:09.903' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'5323c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (521, 299, 1497, 0, NULL, CAST(N'2020-06-09T08:10:14.060' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'5423c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (522, 297, 1497, 0, NULL, CAST(N'2020-06-09T08:10:16.440' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'5523c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (523, 301, 1497, 0, NULL, CAST(N'2020-06-09T08:10:19.247' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'5623c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (524, 300, 1498, 0, NULL, CAST(N'2020-06-09T08:22:21.297' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'5723c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (525, 299, 1498, 0, NULL, CAST(N'2020-06-09T08:22:21.297' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'5823c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (526, 297, 1498, 0, NULL, CAST(N'2020-06-09T08:22:21.297' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'5923c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (527, 301, 1498, 0, NULL, CAST(N'2020-06-09T08:22:21.297' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'5a23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (528, 300, 1499, 0, NULL, CAST(N'2020-06-09T08:51:32.423' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'5b23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (529, 299, 1499, 0, NULL, CAST(N'2020-06-09T08:51:34.457' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'5c23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (530, 297, 1499, 0, NULL, CAST(N'2020-06-09T08:51:36.597' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'5d23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (531, 301, 1499, 0, NULL, CAST(N'2020-06-09T08:51:40.100' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'5e23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (532, 299, 1500, 0, NULL, CAST(N'2020-06-09T08:54:51.747' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'5f23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (533, 297, 1501, 1, NULL, CAST(N'2020-06-09T08:54:51.747' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'6023c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (534, 300, 1502, 0, NULL, CAST(N'2020-06-09T08:55:31.967' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'6123c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (535, 299, 1502, 0, NULL, CAST(N'2020-06-09T08:55:31.967' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'6223c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (536, 297, 1502, 0, NULL, CAST(N'2020-06-09T08:55:31.967' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'6323c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (537, 299, 1503, 0, NULL, CAST(N'2020-06-09T08:58:26.107' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'6423c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (538, 305, 1504, 0, NULL, CAST(N'2020-06-09T08:58:26.107' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'6523c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (539, 300, 1505, 0, NULL, CAST(N'2020-06-09T09:00:32.117' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'6623c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (540, 299, 1505, 0, NULL, CAST(N'2020-06-09T09:00:32.117' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'6723c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (541, 305, 1505, 0, NULL, CAST(N'2020-06-09T09:00:32.117' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'6823c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (542, 299, 1506, 0, NULL, CAST(N'2020-06-09T09:37:40.523' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'6923c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (543, 297, 1507, 0, NULL, CAST(N'2020-06-09T09:37:40.523' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'6a23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (544, 299, 1508, 0, NULL, CAST(N'2020-06-09T09:43:31.007' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'6b23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (545, 297, 1509, 0, NULL, CAST(N'2020-06-09T09:43:31.007' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'6c23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (546, 300, 1510, 0, NULL, CAST(N'2020-06-09T09:47:41.293' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'6d23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (547, 299, 1510, 0, NULL, CAST(N'2020-06-09T09:47:43.383' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'6e23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (548, 297, 1510, 0, NULL, CAST(N'2020-06-09T09:47:44.573' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'6f23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (549, 300, 1511, 0, NULL, CAST(N'2020-06-09T09:52:02.630' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'7023c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (550, 299, 1511, 0, NULL, CAST(N'2020-06-09T09:52:02.633' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'7123c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (551, 297, 1511, 0, NULL, CAST(N'2020-06-09T09:52:02.633' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'7223c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (552, 300, 1512, 0, NULL, CAST(N'2020-06-09T09:58:16.700' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'7323c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (553, 299, 1512, 0, NULL, CAST(N'2020-06-09T09:58:16.700' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'7423c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (554, 297, 1512, 0, NULL, CAST(N'2020-06-09T09:58:16.700' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'7523c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (555, 300, 1513, 0, NULL, CAST(N'2020-06-09T09:59:55.597' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'7623c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (556, 299, 1513, 0, NULL, CAST(N'2020-06-09T09:59:56.693' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'7723c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (557, 297, 1513, 0, NULL, CAST(N'2020-06-09T09:59:57.820' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'7823c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (558, 300, 1514, 0, NULL, CAST(N'2020-06-09T10:17:05.150' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'7923c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (559, 299, 1514, 0, NULL, CAST(N'2020-06-09T10:17:05.150' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'7a23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (560, 297, 1514, 0, NULL, CAST(N'2020-06-09T10:17:05.150' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'7b23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (561, 300, 1515, 0, NULL, CAST(N'2020-06-09T10:19:48.937' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'7c23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (562, 299, 1515, 0, NULL, CAST(N'2020-06-09T10:19:48.937' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'7d23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (563, 297, 1515, 0, NULL, CAST(N'2020-06-09T10:19:48.937' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'7e23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (564, 300, 1516, 0, NULL, CAST(N'2020-06-09T10:21:58.550' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'7f23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (565, 299, 1516, 0, NULL, CAST(N'2020-06-09T10:22:00.793' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'8023c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (566, 297, 1516, 0, NULL, CAST(N'2020-06-09T10:22:02.097' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'8123c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (567, 300, 1517, 0, NULL, CAST(N'2020-06-09T10:26:33.733' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'8223c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (568, 299, 1517, 0, NULL, CAST(N'2020-06-09T10:26:34.950' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'8323c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (569, 297, 1517, 0, NULL, CAST(N'2020-06-09T10:26:36.097' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'8423c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (570, 300, 1518, 0, NULL, CAST(N'2020-06-09T10:30:49.890' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'8523c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (571, 299, 1518, 0, NULL, CAST(N'2020-06-09T10:30:54.223' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'8623c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (572, 297, 1518, 0, NULL, CAST(N'2020-06-09T10:30:55.647' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'8723c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (573, 300, 1519, 0, NULL, CAST(N'2020-06-09T10:38:09.827' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'8823c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (574, 299, 1519, 0, NULL, CAST(N'2020-06-09T10:38:11.703' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'8923c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (575, 297, 1519, 0, NULL, CAST(N'2020-06-09T10:38:12.957' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'8a23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (576, 300, 1520, 0, NULL, CAST(N'2020-06-09T10:52:16.660' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'8b23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (577, 299, 1520, 0, NULL, CAST(N'2020-06-09T10:52:19.593' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'8c23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (578, 297, 1520, 1, NULL, CAST(N'2020-06-09T10:52:21.297' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'8d23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (579, 300, 1521, 0, NULL, CAST(N'2020-06-09T10:55:35.537' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'8e23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (580, 299, 1521, 0, NULL, CAST(N'2020-06-09T10:55:35.537' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'8f23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (581, 297, 1521, 0, NULL, CAST(N'2020-06-09T10:55:35.537' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'9023c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (582, 300, 1522, 0, NULL, CAST(N'2020-06-09T10:58:18.300' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'9123c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (583, 299, 1522, 0, NULL, CAST(N'2020-06-09T10:58:18.300' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'9223c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (584, 297, 1522, 0, NULL, CAST(N'2020-06-09T10:58:18.300' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'9323c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (585, 300, 1523, 1, NULL, CAST(N'2020-06-09T10:58:27.450' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'9423c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (586, 299, 1523, 0, NULL, CAST(N'2020-06-09T10:58:27.450' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'9523c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (587, 297, 1523, 1, NULL, CAST(N'2020-06-09T10:58:27.450' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'9623c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (588, 300, 1524, 1, NULL, CAST(N'2020-06-09T11:00:33.950' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'9723c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (589, 299, 1524, 0, NULL, CAST(N'2020-06-09T11:00:33.950' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'9823c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (590, 297, 1524, 1, NULL, CAST(N'2020-06-09T11:00:33.950' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'9923c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (591, 300, 1525, 0, NULL, CAST(N'2020-06-09T11:03:12.330' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'9a23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (592, 299, 1525, 0, NULL, CAST(N'2020-06-09T11:03:12.330' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'9b23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (593, 297, 1525, 0, NULL, CAST(N'2020-06-09T11:03:12.330' AS DateTime), NULL, N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', N'9c23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (594, 300, 1526, 1, NULL, CAST(N'2020-06-09T14:01:34.293' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'9d23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (595, 299, 1526, 0, NULL, CAST(N'2020-06-09T14:01:34.293' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'9e23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (596, 305, 1526, 0, NULL, CAST(N'2020-06-09T14:01:34.293' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'9f23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (597, 300, 1527, 0, NULL, CAST(N'2020-06-09T14:03:19.907' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'a023c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (598, 299, 1527, 0, NULL, CAST(N'2020-06-09T14:03:19.907' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'a123c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (599, 305, 1527, 0, NULL, CAST(N'2020-06-09T14:03:19.907' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'a223c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (600, 300, 1528, 0, NULL, CAST(N'2020-06-09T16:06:02.300' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'a323c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (601, 299, 1528, 0, NULL, CAST(N'2020-06-09T16:06:02.300' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'a423c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (602, 305, 1528, 0, NULL, CAST(N'2020-06-09T16:06:02.300' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'a523c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (603, 297, 1529, 0, NULL, CAST(N'2020-06-15T09:21:53.877' AS DateTime), NULL, NULL, N'a623c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (604, 300, 1530, 0, NULL, CAST(N'2020-06-15T11:45:06.577' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'a723c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (605, 299, 1530, 0, NULL, CAST(N'2020-06-15T11:45:06.577' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'a823c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (606, 297, 1530, 0, NULL, CAST(N'2020-06-15T11:45:06.577' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'a923c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (607, 301, 1530, 0, NULL, CAST(N'2020-06-15T11:45:06.577' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'aa23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (608, 297, 1531, 0, NULL, CAST(N'2020-06-15T15:01:29.440' AS DateTime), NULL, NULL, N'ab23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (609, 297, 1532, 0, NULL, CAST(N'2020-06-15T15:21:27.053' AS DateTime), NULL, NULL, N'ac23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (610, 300, 1533, 0, NULL, CAST(N'2020-06-16T12:02:16.700' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'ad23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (611, 299, 1533, 0, NULL, CAST(N'2020-06-16T12:02:16.700' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'ae23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (612, 297, 1533, 0, NULL, CAST(N'2020-06-16T12:02:16.700' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'af23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (613, 301, 1533, 0, NULL, CAST(N'2020-06-16T12:02:16.700' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'b023c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (614, 297, 1534, 0, NULL, CAST(N'2020-06-16T12:26:56.073' AS DateTime), NULL, NULL, N'b123c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (615, 300, 1535, 0, NULL, CAST(N'2020-06-16T16:07:50.237' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'b223c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (616, 299, 1535, 0, NULL, CAST(N'2020-06-16T16:07:50.240' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'b323c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (617, 297, 1535, 0, NULL, CAST(N'2020-06-16T16:07:50.240' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'b423c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (618, 301, 1535, 0, NULL, CAST(N'2020-06-16T16:07:50.240' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'b523c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (619, 300, 1536, 0, NULL, CAST(N'2020-06-16T16:09:32.497' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'b623c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (620, 299, 1536, 0, NULL, CAST(N'2020-06-16T16:09:32.497' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'b723c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (621, 297, 1536, 0, NULL, CAST(N'2020-06-16T16:09:32.497' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'b823c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (622, 301, 1536, 0, NULL, CAST(N'2020-06-16T16:09:32.497' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'b923c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (623, 299, 1537, 0, NULL, CAST(N'2020-06-16T16:09:47.770' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'ba23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (624, 300, 1537, 1, NULL, CAST(N'2020-06-16T16:09:47.770' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'bb23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (625, 300, 1538, 0, NULL, CAST(N'2020-06-16T16:10:04.437' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'bc23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (626, 299, 1538, 0, NULL, CAST(N'2020-06-16T16:10:04.437' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'bd23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (627, 297, 1538, 0, NULL, CAST(N'2020-06-16T16:10:04.437' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'be23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (628, 301, 1538, 0, NULL, CAST(N'2020-06-16T16:10:04.437' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'bf23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (629, 300, 1539, 0, NULL, CAST(N'2020-06-17T08:14:46.913' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'c023c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (630, 299, 1539, 0, NULL, CAST(N'2020-06-17T08:14:46.913' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'c123c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (631, 305, 1539, 0, NULL, CAST(N'2020-06-17T08:14:46.913' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'c223c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (632, 300, 1540, 0, NULL, CAST(N'2020-06-17T08:15:09.663' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'c323c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (633, 299, 1540, 0, NULL, CAST(N'2020-06-17T08:15:09.663' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'c423c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (634, 305, 1540, 0, NULL, CAST(N'2020-06-17T08:15:09.663' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'c523c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (635, 299, 1541, 0, NULL, CAST(N'2020-06-17T08:27:04.293' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'c623c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (636, 300, 1541, 0, NULL, CAST(N'2020-06-17T08:27:04.293' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'c723c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (637, 301, 1542, 0, NULL, CAST(N'2020-06-17T08:27:18.387' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'c823c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (638, 300, 1542, 0, NULL, CAST(N'2020-06-17T08:27:18.387' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'c923c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (639, 300, 1543, 0, NULL, CAST(N'2020-06-17T08:28:18.287' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'ca23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (640, 299, 1543, 0, NULL, CAST(N'2020-06-17T08:28:18.287' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'cb23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (641, 297, 1543, 0, NULL, CAST(N'2020-06-17T08:28:18.287' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'cc23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (642, 300, 1544, 0, NULL, CAST(N'2020-06-17T08:28:22.667' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'cd23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (643, 301, 1544, 0, NULL, CAST(N'2020-06-17T08:28:22.667' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'ce23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (644, 297, 1544, 0, NULL, CAST(N'2020-06-17T08:28:22.667' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'cf23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (645, 299, 1545, 0, NULL, CAST(N'2020-06-17T08:45:40.110' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'd023c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (646, 300, 1545, 0, NULL, CAST(N'2020-06-17T08:45:40.110' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'd123c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (647, 299, 1546, 0, NULL, CAST(N'2020-06-17T08:46:14.307' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'd223c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (648, 300, 1546, 0, NULL, CAST(N'2020-06-17T08:46:14.307' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'd323c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (649, 299, 1547, 0, NULL, CAST(N'2020-06-17T08:46:33.160' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'd423c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (650, 300, 1547, 0, NULL, CAST(N'2020-06-17T08:46:33.160' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'd523c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (651, 301, 1548, 0, NULL, CAST(N'2020-06-17T08:49:28.707' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'd623c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (652, 300, 1548, 0, NULL, CAST(N'2020-06-17T08:49:28.707' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'd723c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (653, 300, 1549, 0, NULL, CAST(N'2020-06-17T08:52:03.197' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'd823c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (654, 299, 1549, 0, NULL, CAST(N'2020-06-17T08:52:03.197' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'd923c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (655, 297, 1549, 0, NULL, CAST(N'2020-06-17T08:52:03.197' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'da23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (656, 300, 1550, 0, NULL, CAST(N'2020-06-17T08:52:06.103' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'db23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (657, 301, 1550, 0, NULL, CAST(N'2020-06-17T08:52:06.103' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'dc23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (658, 297, 1550, 0, NULL, CAST(N'2020-06-17T08:52:06.103' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'dd23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (659, 299, 1551, 0, NULL, CAST(N'2020-06-17T08:52:16.507' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'de23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (660, 300, 1551, 0, NULL, CAST(N'2020-06-17T08:52:16.507' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'df23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (661, 300, 1552, 0, NULL, CAST(N'2020-06-17T08:54:09.513' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'e023c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (662, 299, 1552, 0, NULL, CAST(N'2020-06-17T08:54:09.513' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'e123c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (663, 297, 1552, 0, NULL, CAST(N'2020-06-17T08:54:09.513' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'e223c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (664, 300, 1553, 0, NULL, CAST(N'2020-06-17T09:28:42.067' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'e323c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (665, 299, 1553, 0, NULL, CAST(N'2020-06-17T09:28:42.067' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'e423c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (666, 297, 1553, 0, NULL, CAST(N'2020-06-17T09:28:42.067' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'e523c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (667, 300, 1554, 0, NULL, CAST(N'2020-06-17T09:28:53.103' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'e623c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (668, 299, 1554, 0, NULL, CAST(N'2020-06-17T09:28:53.103' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'e723c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (669, 297, 1554, 0, NULL, CAST(N'2020-06-17T09:28:53.103' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'e823c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (670, 300, 1555, 0, NULL, CAST(N'2020-06-17T09:30:09.537' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'e923c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (671, 299, 1555, 0, NULL, CAST(N'2020-06-17T09:30:09.537' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'ea23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (672, 297, 1555, 0, NULL, CAST(N'2020-06-17T09:30:09.537' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'eb23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (673, 300, 1556, 0, NULL, CAST(N'2020-06-17T09:31:35.433' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'ec23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (674, 299, 1556, 0, NULL, CAST(N'2020-06-17T09:31:35.433' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'ed23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (675, 297, 1556, 0, NULL, CAST(N'2020-06-17T09:31:35.433' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'ee23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (676, 300, 1557, 0, NULL, CAST(N'2020-06-17T09:32:54.243' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'ef23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (677, 299, 1557, 0, NULL, CAST(N'2020-06-17T09:32:54.243' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'f023c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (678, 297, 1557, 0, NULL, CAST(N'2020-06-17T09:32:54.243' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'f123c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (679, 300, 1558, 0, NULL, CAST(N'2020-06-17T09:34:06.563' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'f223c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (680, 299, 1558, 0, NULL, CAST(N'2020-06-17T09:34:06.563' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'f323c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (681, 297, 1558, 0, NULL, CAST(N'2020-06-17T09:34:06.563' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'f423c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (682, 300, 1559, 0, NULL, CAST(N'2020-06-17T09:35:11.277' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'f523c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (683, 299, 1559, 0, NULL, CAST(N'2020-06-17T09:35:11.277' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'f623c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (684, 297, 1559, 0, NULL, CAST(N'2020-06-17T09:35:11.277' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'f723c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (685, 300, 1560, 0, NULL, CAST(N'2020-06-17T09:36:14.447' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'f823c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (686, 299, 1560, 0, NULL, CAST(N'2020-06-17T09:36:14.447' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'f923c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (687, 297, 1560, 0, NULL, CAST(N'2020-06-17T09:36:14.447' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'fa23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (688, 300, 1561, 0, NULL, CAST(N'2020-06-17T09:38:11.090' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'fb23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (689, 299, 1561, 0, NULL, CAST(N'2020-06-17T09:38:11.090' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'fc23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (690, 305, 1561, 0, NULL, CAST(N'2020-06-17T09:38:11.090' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'fd23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (691, 300, 1562, 0, NULL, CAST(N'2020-06-17T09:39:28.677' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'fe23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (692, 299, 1562, 0, NULL, CAST(N'2020-06-17T09:39:28.677' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'ff23c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (693, 297, 1562, 0, NULL, CAST(N'2020-06-17T09:39:28.677' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'0024c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (694, 300, 1563, 0, NULL, CAST(N'2020-06-17T09:40:16.950' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'0124c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (695, 299, 1563, 0, NULL, CAST(N'2020-06-17T09:40:16.950' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'0224c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (696, 297, 1563, 0, NULL, CAST(N'2020-06-17T09:40:16.950' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'0324c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (697, 300, 1564, 0, NULL, CAST(N'2020-06-17T09:41:04.807' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'0424c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (698, 299, 1564, 0, NULL, CAST(N'2020-06-17T09:41:04.807' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'0524c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (699, 305, 1564, 0, NULL, CAST(N'2020-06-17T09:41:04.807' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'0624c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (700, 300, 1565, 0, NULL, CAST(N'2020-06-17T09:42:24.323' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'0724c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (701, 299, 1565, 0, NULL, CAST(N'2020-06-17T09:42:24.323' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'0824c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (702, 305, 1565, 0, NULL, CAST(N'2020-06-17T09:42:24.323' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'0924c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (703, 300, 1566, 0, NULL, CAST(N'2020-06-17T09:42:56.137' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'0a24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (704, 299, 1566, 0, NULL, CAST(N'2020-06-17T09:42:56.137' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'0b24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (705, 297, 1566, 0, NULL, CAST(N'2020-06-17T09:42:56.137' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'0c24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (706, 300, 1567, 0, NULL, CAST(N'2020-06-17T09:46:23.140' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'0d24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (707, 299, 1567, 0, NULL, CAST(N'2020-06-17T09:46:23.140' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'0e24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (708, 297, 1567, 0, NULL, CAST(N'2020-06-17T09:46:23.140' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'0f24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (709, 300, 1568, 0, NULL, CAST(N'2020-06-17T09:47:00.083' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'1024c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (710, 299, 1568, 0, NULL, CAST(N'2020-06-17T09:47:00.083' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'1124c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (711, 297, 1568, 0, NULL, CAST(N'2020-06-17T09:47:00.083' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'1224c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (712, 300, 1569, 0, NULL, CAST(N'2020-06-17T09:53:02.767' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'1324c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (713, 299, 1569, 0, NULL, CAST(N'2020-06-17T09:53:02.767' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'1424c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (714, 297, 1569, 0, NULL, CAST(N'2020-06-17T09:53:02.767' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'1524c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (715, 300, 1570, 0, NULL, CAST(N'2020-06-17T09:53:52.993' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'1624c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (716, 299, 1570, 0, NULL, CAST(N'2020-06-17T09:53:52.993' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'1724c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (717, 297, 1570, 0, NULL, CAST(N'2020-06-17T09:53:52.993' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'1824c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (718, 300, 1571, 0, NULL, CAST(N'2020-06-17T09:54:42.263' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'1924c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (719, 299, 1571, 0, NULL, CAST(N'2020-06-17T09:54:42.263' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'1a24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (720, 297, 1571, 0, NULL, CAST(N'2020-06-17T09:54:42.263' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'1b24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (721, 300, 1572, 0, NULL, CAST(N'2020-06-17T09:56:56.567' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'1c24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (722, 299, 1572, 0, NULL, CAST(N'2020-06-17T09:56:56.567' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'1d24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (723, 297, 1572, 0, NULL, CAST(N'2020-06-17T09:56:56.567' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'1e24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (724, 300, 1573, 0, NULL, CAST(N'2020-06-17T10:11:35.057' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'1f24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (725, 299, 1573, 0, NULL, CAST(N'2020-06-17T10:11:35.057' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'2024c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (726, 297, 1573, 0, NULL, CAST(N'2020-06-17T10:11:35.057' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'2124c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (727, 300, 1574, 0, NULL, CAST(N'2020-06-17T10:12:13.563' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'2224c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (728, 299, 1574, 0, NULL, CAST(N'2020-06-17T10:12:13.563' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'2324c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (729, 297, 1574, 0, NULL, CAST(N'2020-06-17T10:12:13.563' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'2424c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (730, 297, 1575, 0, NULL, CAST(N'2020-06-17T12:02:30.210' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'2524c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (731, 297, 1576, 0, NULL, CAST(N'2020-06-17T12:04:16.843' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'2624c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (732, 297, 1577, 0, NULL, CAST(N'2020-06-17T12:07:20.490' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'2724c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (733, 297, 1578, 0, NULL, CAST(N'2020-06-17T12:07:23.593' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'2824c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (734, 297, 1579, 0, NULL, CAST(N'2020-06-17T12:09:44.623' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'2924c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (735, 297, 1580, 0, NULL, CAST(N'2020-06-17T12:09:49.667' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'2a24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (736, 297, 1581, 0, NULL, CAST(N'2020-06-17T12:12:02.820' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'2b24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (737, 297, 1582, 0, NULL, CAST(N'2020-06-17T12:12:06.780' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'2c24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (738, 300, 1583, 0, NULL, CAST(N'2020-06-17T12:15:23.643' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'2d24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (739, 299, 1583, 0, NULL, CAST(N'2020-06-17T12:15:23.643' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'2e24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (740, 297, 1583, 0, NULL, CAST(N'2020-06-17T12:15:23.643' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'2f24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (741, 300, 1584, 0, NULL, CAST(N'2020-06-17T12:16:17.180' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3024c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (742, 299, 1584, 0, NULL, CAST(N'2020-06-17T12:16:17.180' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3124c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (743, 297, 1584, 0, NULL, CAST(N'2020-06-17T12:16:17.180' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3224c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (744, 300, 1585, 0, NULL, CAST(N'2020-06-17T12:19:15.680' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3324c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (745, 299, 1585, 0, NULL, CAST(N'2020-06-17T12:19:15.680' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3424c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (746, 297, 1585, 0, NULL, CAST(N'2020-06-17T12:19:15.680' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3524c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (747, 300, 1586, 0, NULL, CAST(N'2020-06-17T12:21:48.710' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3624c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (748, 299, 1586, 0, NULL, CAST(N'2020-06-17T12:21:48.710' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3724c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (749, 297, 1586, 0, NULL, CAST(N'2020-06-17T12:21:48.710' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3824c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (750, 300, 1587, 0, NULL, CAST(N'2020-06-17T13:30:11.100' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3924c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (751, 299, 1587, 0, NULL, CAST(N'2020-06-17T13:30:11.100' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3a24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (752, 297, 1587, 0, NULL, CAST(N'2020-06-17T13:30:11.100' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3b24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (753, 300, 1588, 0, NULL, CAST(N'2020-06-17T14:00:11.397' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3c24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (754, 299, 1588, 0, NULL, CAST(N'2020-06-17T14:00:11.397' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3d24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (755, 297, 1588, 0, NULL, CAST(N'2020-06-17T14:00:11.397' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3e24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (756, 257, 1589, 0, NULL, CAST(N'2020-06-17T14:20:29.700' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'3f24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (757, 255, 1590, 0, NULL, CAST(N'2020-06-17T14:20:29.700' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', N'4024c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (758, 300, 1591, 0, NULL, CAST(N'2020-06-17T16:08:43.180' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4124c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (759, 299, 1591, 0, NULL, CAST(N'2020-06-17T16:08:43.180' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4224c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (760, 297, 1591, 0, NULL, CAST(N'2020-06-17T16:08:43.180' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4324c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (761, 299, 1592, 0, NULL, CAST(N'2020-06-17T16:11:17.663' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4424c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (762, 300, 1592, 1, NULL, CAST(N'2020-06-17T16:11:17.663' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4524c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (763, 301, 1593, 0, NULL, CAST(N'2020-06-17T16:18:56.157' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4624c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (764, 300, 1593, 1, NULL, CAST(N'2020-06-17T16:18:56.157' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4724c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (765, 297, 1594, 0, NULL, CAST(N'2020-06-18T09:33:12.793' AS DateTime), NULL, NULL, N'4824c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (766, 300, 1595, 0, NULL, CAST(N'2020-06-18T11:11:57.110' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4924c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (767, 299, 1595, 0, NULL, CAST(N'2020-06-18T11:11:57.110' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4a24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (768, 297, 1595, 0, NULL, CAST(N'2020-06-18T11:11:57.110' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4b24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (769, 299, 1596, 0, NULL, CAST(N'2020-06-18T11:40:28.117' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4c24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (770, 300, 1596, 1, NULL, CAST(N'2020-06-18T11:40:28.117' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4d24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (771, 299, 1597, 0, NULL, CAST(N'2020-06-19T07:30:38.837' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4e24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (772, 297, 1598, 0, NULL, CAST(N'2020-06-19T07:30:38.837' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'4f24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (773, 299, 1599, 0, NULL, CAST(N'2020-06-19T08:24:37.580' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'5024c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (774, 297, 1600, 0, NULL, CAST(N'2020-06-19T08:24:30.570' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'5124c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (775, 299, 1601, 0, NULL, CAST(N'2020-06-19T11:08:19.013' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'5224c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (776, 297, 1602, 0, NULL, CAST(N'2020-06-19T11:08:19.013' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'5324c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (777, 299, 1603, 0, NULL, CAST(N'2020-06-19T12:12:24.630' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'5424c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (778, 297, 1604, 1, NULL, CAST(N'2020-06-19T12:12:24.630' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'5524c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (779, 299, 1605, 0, NULL, CAST(N'2020-06-19T14:39:43.120' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/371/1006/Action-Plan-on-January-', N'5624c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (780, 297, 1606, 1, NULL, CAST(N'2020-06-19T14:39:43.120' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/371/1006/Action-Plan-on-January-', N'5724c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (781, 299, 1607, 0, NULL, CAST(N'2020-06-19T14:41:11.263' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/371/1006/Action-Plan-on-January-', N'5824c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (782, 300, 1607, 1, NULL, CAST(N'2020-06-19T14:41:11.263' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/371/1006/Action-Plan-on-January-', N'5924c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (783, 300, 1608, 0, NULL, CAST(N'2020-06-19T14:41:57.407' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/371/1006/Action-Plan-on-January-', N'5a24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (784, 299, 1608, 0, NULL, CAST(N'2020-06-19T14:41:57.407' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/371/1006/Action-Plan-on-January-', N'5b24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (785, 297, 1608, 0, NULL, CAST(N'2020-06-19T14:41:57.407' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/371/1006/Action-Plan-on-January-', N'5c24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (786, 306, 1609, 0, NULL, CAST(N'2020-06-19T15:25:47.700' AS DateTime), N'KPI UploadE ( SSB->Division II->SHC ) ', N'http://10.4.0.76:8069/#/ChartPeriod/30001/36/H/2020/1/6', N'5d24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (787, 300, 1609, 1, NULL, CAST(N'2020-06-19T15:25:47.700' AS DateTime), N'KPI UploadE ( SSB->Division II->SHC ) ', N'http://10.4.0.76:8069/#/ChartPeriod/30001/36/H/2020/1/6', N'5e24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (788, 301, 1609, 0, NULL, CAST(N'2020-06-19T15:25:47.700' AS DateTime), N'KPI UploadE ( SSB->Division II->SHC ) ', N'http://10.4.0.76:8069/#/ChartPeriod/30001/36/H/2020/1/6', N'5f24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (789, 297, 1610, 0, NULL, CAST(N'2020-06-19T15:35:28.690' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/371/1006/Action-Plan-on-January-', N'6024c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (790, 314, 1611, 0, NULL, CAST(N'2020-06-19T15:35:28.690' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/371/1006/Action-Plan-on-January-', N'6124c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (791, 314, 1612, 0, NULL, CAST(N'2020-06-26T08:52:20.980' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/371/1006/Action-Plan-on-January-', N'6224c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (792, 297, 1613, 0, NULL, CAST(N'2020-06-26T08:52:22.783' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/371/1006/Action-Plan-on-January-', N'6324c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (793, 301, 1614, 0, NULL, CAST(N'2020-07-06T09:46:31.220' AS DateTime), N'KPI UploadE ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30001/36/H/2020/1/6', N'6424c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (794, 301, 1614, 0, NULL, CAST(N'2020-07-06T09:46:31.220' AS DateTime), N'KPI BY LEO E ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30003/1036/H/2020/1/6', N'6524c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (795, 301, 1614, 0, NULL, CAST(N'2020-07-06T09:46:31.220' AS DateTime), N'KPI DEMO WEEK ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30005/1037/W/2020/1/53', N'6624c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (796, 299, 1614, 0, NULL, CAST(N'2020-07-06T09:46:31.220' AS DateTime), N'KPI UploadE ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30001/36/H/2020/1/6', N'6724c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (797, 299, 1614, 0, NULL, CAST(N'2020-07-06T09:46:31.220' AS DateTime), N'KPI BY LEO E ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30003/1036/H/2020/1/6', N'6824c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (798, 299, 1614, 0, NULL, CAST(N'2020-07-06T09:46:31.220' AS DateTime), N'KPI DEMO WEEK ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30005/1037/W/2020/1/53', N'6924c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (799, 306, 1614, 0, NULL, CAST(N'2020-07-06T09:46:31.220' AS DateTime), N'KPI UploadE ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30001/36/H/2020/1/6', N'6a24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (800, 306, 1614, 0, NULL, CAST(N'2020-07-06T09:46:31.220' AS DateTime), N'KPI BY LEO E ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30003/1036/H/2020/1/6', N'6b24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (801, 306, 1614, 0, NULL, CAST(N'2020-07-06T09:46:31.220' AS DateTime), N'KPI DEMO WEEK ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30005/1037/W/2020/1/53', N'6c24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (802, 300, 1614, 0, NULL, CAST(N'2020-07-06T09:46:31.220' AS DateTime), N'KPI UploadE ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30001/36/H/2020/1/6', N'6d24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (803, 300, 1614, 0, NULL, CAST(N'2020-07-06T09:46:31.220' AS DateTime), N'KPI BY LEO E ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30003/1036/H/2020/1/6', N'6e24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (804, 300, 1614, 0, NULL, CAST(N'2020-07-06T09:46:31.220' AS DateTime), N'KPI DEMO WEEK ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30005/1037/W/2020/1/53', N'6f24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (805, 297, 1615, 1, NULL, CAST(N'2020-07-06T09:51:02.890' AS DateTime), NULL, N'/ChartPeriod/30005/1037/W/2020/1/53/task/372/1033/Action-Plan-on-April-', N'7024c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (806, 299, 1616, 0, NULL, CAST(N'2020-07-06T09:51:02.890' AS DateTime), NULL, N'/ChartPeriod/30005/1037/W/2020/1/53/task/372/1033/Action-Plan-on-April-', N'7124c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (807, 301, 1617, 0, NULL, CAST(N'2020-07-06T11:06:57.393' AS DateTime), N'KPI DEMO WEEK ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod//30005/1037/Q/2020/1/4', N'7224c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (808, 299, 1617, 0, NULL, CAST(N'2020-07-06T11:06:57.393' AS DateTime), N'KPI DEMO WEEK ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod//30005/1037/Q/2020/1/4', N'7324c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (809, 300, 1617, 0, NULL, CAST(N'2020-07-06T11:06:57.393' AS DateTime), N'KPI DEMO WEEK ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod//30005/1037/Q/2020/1/4', N'7424c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (810, 306, 1617, 0, NULL, CAST(N'2020-07-06T11:06:57.393' AS DateTime), N'KPI DEMO WEEK ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod//30005/1037/Q/2020/1/4', N'7524c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (811, 301, 1618, 0, NULL, CAST(N'2020-07-08T12:23:26.127' AS DateTime), N'KPI DEMO TRANSACTION ( SSB->Division II->SPC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/3F030004/1039/M/2020/1/12', N'54f18525-dbc0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (812, 299, 1618, 0, NULL, CAST(N'2020-07-08T12:23:26.127' AS DateTime), N'KPI DEMO TRANSACTION ( SSB->Division II->SPC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/3F030004/1039/M/2020/1/12', N'55f18525-dbc0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (813, 300, 1618, 0, NULL, CAST(N'2020-07-08T12:23:26.127' AS DateTime), N'KPI DEMO TRANSACTION ( SSB->Division II->SPC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/3F030004/1039/M/2020/1/12', N'56f18525-dbc0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (814, 306, 1618, 0, NULL, CAST(N'2020-07-08T12:23:26.127' AS DateTime), N'KPI DEMO TRANSACTION ( SSB->Division II->SPC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/3F030004/1039/M/2020/1/12', N'57f18525-dbc0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (815, 301, 1619, 0, NULL, CAST(N'2020-07-08T12:23:26.357' AS DateTime), N'KPI DEMO WEEK ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30005/1037/Y/2020/2020/2020', N'59f18525-dbc0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (816, 299, 1619, 0, NULL, CAST(N'2020-07-08T12:23:26.357' AS DateTime), N'KPI DEMO WEEK ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30005/1037/Y/2020/2020/2020', N'5af18525-dbc0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (817, 300, 1619, 0, NULL, CAST(N'2020-07-08T12:23:26.357' AS DateTime), N'KPI DEMO WEEK ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30005/1037/Y/2020/2020/2020', N'5bf18525-dbc0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (818, 306, 1619, 0, NULL, CAST(N'2020-07-08T12:23:26.357' AS DateTime), N'KPI DEMO WEEK ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30005/1037/Y/2020/2020/2020', N'5cf18525-dbc0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (819, 301, 1620, 0, NULL, CAST(N'2020-07-08T15:40:07.007' AS DateTime), N'KPI DEMO WEEK ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30005/1037/M/2020/1/12', N'4393629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (820, 301, 1620, 0, NULL, CAST(N'2020-07-08T15:40:07.007' AS DateTime), N'KPI BY LEO E ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30003/1036/M/2020/1/12', N'4493629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (821, 301, 1620, 0, NULL, CAST(N'2020-07-08T15:40:07.007' AS DateTime), N'KPI UploadE ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30001/36/M/2020/1/12', N'4593629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (822, 299, 1620, 0, NULL, CAST(N'2020-07-08T15:40:07.007' AS DateTime), N'KPI DEMO WEEK ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30005/1037/M/2020/1/12', N'4693629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (823, 299, 1620, 0, NULL, CAST(N'2020-07-08T15:40:07.007' AS DateTime), N'KPI BY LEO E ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30003/1036/M/2020/1/12', N'4793629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (824, 299, 1620, 0, NULL, CAST(N'2020-07-08T15:40:07.007' AS DateTime), N'KPI UploadE ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30001/36/M/2020/1/12', N'4893629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (825, 300, 1620, 0, NULL, CAST(N'2020-07-08T15:40:07.007' AS DateTime), N'KPI DEMO WEEK ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30005/1037/M/2020/1/12', N'4993629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (826, 300, 1620, 0, NULL, CAST(N'2020-07-08T15:40:07.007' AS DateTime), N'KPI BY LEO E ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30003/1036/M/2020/1/12', N'4a93629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (827, 300, 1620, 0, NULL, CAST(N'2020-07-08T15:40:07.007' AS DateTime), N'KPI UploadE ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30001/36/M/2020/1/12', N'4b93629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (828, 306, 1620, 0, NULL, CAST(N'2020-07-08T15:40:07.007' AS DateTime), N'KPI DEMO WEEK ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30005/1037/M/2020/1/12', N'4c93629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (829, 306, 1620, 0, NULL, CAST(N'2020-07-08T15:40:07.007' AS DateTime), N'KPI BY LEO E ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30003/1036/M/2020/1/12', N'4d93629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (830, 306, 1620, 0, NULL, CAST(N'2020-07-08T15:40:07.007' AS DateTime), N'KPI UploadE ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30001/36/M/2020/1/12', N'4e93629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (831, 297, 1621, 0, NULL, CAST(N'2020-07-08T15:46:00.110' AS DateTime), N'demo level 3 ( SSB->Division II->SPC ) ', N'http://10.10.0.34:8069/#/ChartPeriod//3F030006/1040/Q/2020/1/4', N'd309f871-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (832, 299, 1621, 0, NULL, CAST(N'2020-07-08T15:46:00.110' AS DateTime), N'demo level 3 ( SSB->Division II->SPC ) ', N'http://10.10.0.34:8069/#/ChartPeriod//3F030006/1040/Q/2020/1/4', N'd409f871-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (833, 254, 1621, 0, NULL, CAST(N'2020-07-08T15:46:00.110' AS DateTime), N'demo level 3 ( SSB->Division II->SPC ) ', N'http://10.10.0.34:8069/#/ChartPeriod//3F030006/1040/Q/2020/1/4', N'd509f871-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (834, 299, 1623, 0, NULL, CAST(N'2020-07-09T10:51:42.653' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'21deb47f-97c1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (835, 297, 1623, 0, NULL, CAST(N'2020-07-09T10:51:42.653' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'22deb47f-97c1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (836, 299, 1624, 0, NULL, CAST(N'2020-07-09T10:52:22.530' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'56617d97-97c1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (837, 297, 1625, 0, NULL, CAST(N'2020-07-09T10:52:22.530' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'57617d97-97c1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (838, 299, 1626, 0, NULL, CAST(N'2020-07-09T11:13:30.333' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3e021d8b-9ac1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (839, 297, 1627, 1, NULL, CAST(N'2020-07-09T11:13:30.333' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'3f021d8b-9ac1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (840, 306, 1628, 0, NULL, CAST(N'2020-07-09T13:44:08.333' AS DateTime), N'KPI By Swook ( SSB->Division II->SHC->Administration Center ) ', N'http://10.10.0.34:8069/#/ChartPeriod/40002/1035/H/2020/1/6', N'b0912d96-afc1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (841, 300, 1628, 1, NULL, CAST(N'2020-07-09T13:44:08.333' AS DateTime), N'KPI By Swook ( SSB->Division II->SHC->Administration Center ) ', N'http://10.10.0.34:8069/#/ChartPeriod/40002/1035/H/2020/1/6', N'b1912d96-afc1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (842, 301, 1628, 0, NULL, CAST(N'2020-07-09T13:44:08.333' AS DateTime), N'KPI By Swook ( SSB->Division II->SHC->Administration Center ) ', N'http://10.10.0.34:8069/#/ChartPeriod/40002/1035/H/2020/1/6', N'b2912d96-afc1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (843, 301, 1629, 0, NULL, CAST(N'2020-07-09T13:44:08.607' AS DateTime), N'KPI By Swook ( SSB->Division II->SHC->Administration Center ) ', N'http://10.10.0.34:8069/#/ChartPeriod/40002/1035/H/2020/1/6', N'b4912d96-afc1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (844, 300, 1629, 1, NULL, CAST(N'2020-07-09T13:44:08.607' AS DateTime), N'KPI By Swook ( SSB->Division II->SHC->Administration Center ) ', N'http://10.10.0.34:8069/#/ChartPeriod/40002/1035/H/2020/1/6', N'b5912d96-afc1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (845, 306, 1629, 0, NULL, CAST(N'2020-07-09T13:44:08.607' AS DateTime), N'KPI By Swook ( SSB->Division II->SHC->Administration Center ) ', N'http://10.10.0.34:8069/#/ChartPeriod/40002/1035/H/2020/1/6', N'b6912d96-afc1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (846, 301, 1630, 0, NULL, CAST(N'2020-07-14T09:12:54.490' AS DateTime), N'demo over ( SSB->Division II->SHC->Development Center ) ', N'http://10.10.0.34:8069/#/ChartPeriod/4C140007/1041/M/2020/1/12', N'3c0ce582-77c5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (847, 301, 1630, 0, NULL, CAST(N'2020-07-14T09:12:54.490' AS DateTime), N'KPI DEMO WEEK ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30005/1037/W/2020/1/53', N'3d0ce582-77c5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (848, 299, 1630, 0, NULL, CAST(N'2020-07-14T09:12:54.490' AS DateTime), N'demo over ( SSB->Division II->SHC->Development Center ) ', N'http://10.10.0.34:8069/#/ChartPeriod/4C140007/1041/M/2020/1/12', N'3e0ce582-77c5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (849, 299, 1630, 0, NULL, CAST(N'2020-07-14T09:12:54.490' AS DateTime), N'KPI DEMO WEEK ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30005/1037/W/2020/1/53', N'3f0ce582-77c5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (850, 300, 1630, 0, NULL, CAST(N'2020-07-14T09:12:54.490' AS DateTime), N'demo over ( SSB->Division II->SHC->Development Center ) ', N'http://10.10.0.34:8069/#/ChartPeriod/4C140007/1041/M/2020/1/12', N'400ce582-77c5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (851, 300, 1630, 0, NULL, CAST(N'2020-07-14T09:12:54.490' AS DateTime), N'KPI DEMO WEEK ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30005/1037/W/2020/1/53', N'410ce582-77c5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (852, 306, 1630, 0, NULL, CAST(N'2020-07-14T09:12:54.490' AS DateTime), N'demo over ( SSB->Division II->SHC->Development Center ) ', N'http://10.10.0.34:8069/#/ChartPeriod/4C140007/1041/M/2020/1/12', N'420ce582-77c5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (853, 306, 1630, 0, NULL, CAST(N'2020-07-14T09:12:54.490' AS DateTime), N'KPI DEMO WEEK ( SSB->Division II->SHC ) ', N'http://10.10.0.34:8069/#/ChartPeriod/30005/1037/W/2020/1/53', N'430ce582-77c5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (854, 306, 1631, 0, NULL, CAST(N'2020-07-14T09:22:35.463' AS DateTime), N'demo over ( SSB->Division II->SHC->Development Center ) ', N'http://10.10.0.34:8069/#/ChartPeriod/4C140007/1041/M/2020/1/12', N'be032bdc-78c5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (855, 300, 1631, 0, NULL, CAST(N'2020-07-14T09:22:35.467' AS DateTime), N'demo over ( SSB->Division II->SHC->Development Center ) ', N'http://10.10.0.34:8069/#/ChartPeriod/4C140007/1041/M/2020/1/12', N'bf032bdc-78c5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (856, 301, 1631, 0, NULL, CAST(N'2020-07-14T09:22:35.467' AS DateTime), N'demo over ( SSB->Division II->SHC->Development Center ) ', N'http://10.10.0.34:8069/#/ChartPeriod/4C140007/1041/M/2020/1/12', N'c0032bdc-78c5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (857, 301, 1632, 0, NULL, CAST(N'2020-07-14T09:52:08.940' AS DateTime), N'demo over ( SSB->Division II->SHC->Development Center ) ', N'http://10.10.0.34:8069/#/ChartPeriod//4C140007/1041/Q/2020/1/4', N'4ba43000-7dc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (858, 300, 1632, 0, NULL, CAST(N'2020-07-14T09:52:08.940' AS DateTime), N'demo over ( SSB->Division II->SHC->Development Center ) ', N'http://10.10.0.34:8069/#/ChartPeriod//4C140007/1041/Q/2020/1/4', N'4ca43000-7dc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (859, 306, 1632, 0, NULL, CAST(N'2020-07-14T09:52:08.940' AS DateTime), N'demo over ( SSB->Division II->SHC->Development Center ) ', N'http://10.10.0.34:8069/#/ChartPeriod//4C140007/1041/Q/2020/1/4', N'4da43000-7dc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (860, 301, 1633, 1, NULL, CAST(N'2020-07-14T10:00:28.257' AS DateTime), N'demo over ( SSB->Division II->SHC->Development Center ) ', N'http://10.10.0.34:8069/#/ChartPeriod/4C140007/1041/H/2020/1/6', N'1098112b-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (861, 300, 1633, 0, NULL, CAST(N'2020-07-14T10:00:28.257' AS DateTime), N'demo over ( SSB->Division II->SHC->Development Center ) ', N'http://10.10.0.34:8069/#/ChartPeriod/4C140007/1041/H/2020/1/6', N'1198112b-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (862, 306, 1633, 0, NULL, CAST(N'2020-07-14T10:00:28.257' AS DateTime), N'demo over ( SSB->Division II->SHC->Development Center ) ', N'http://10.10.0.34:8069/#/ChartPeriod/4C140007/1041/H/2020/1/6', N'1298112b-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (863, 301, 1634, 0, NULL, CAST(N'2020-07-14T10:05:30.363' AS DateTime), N'test over ( SSB->Division II->SHC->Development Center ) ', N'http://10.10.0.34:8069/#/ChartPeriod//4C140008/1041/Q/2020/1/4', N'8a2654df-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (864, 300, 1634, 0, NULL, CAST(N'2020-07-14T10:05:30.363' AS DateTime), N'test over ( SSB->Division II->SHC->Development Center ) ', N'http://10.10.0.34:8069/#/ChartPeriod//4C140008/1041/Q/2020/1/4', N'8b2654df-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (865, 306, 1634, 0, NULL, CAST(N'2020-07-14T10:05:30.363' AS DateTime), N'test over ( SSB->Division II->SHC->Development Center ) ', N'http://10.10.0.34:8069/#/ChartPeriod//4C140008/1041/Q/2020/1/4', N'8c2654df-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (866, 301, 1635, 0, NULL, CAST(N'2020-07-14T10:09:31.550' AS DateTime), N'test below target ( SSB->Division II->SHC->Development Center ) ', N'http://10.10.0.34:8069/#/ChartPeriod//4C140009/1041/Q/2020/1/4', N'5439266f-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (867, 300, 1635, 0, NULL, CAST(N'2020-07-14T10:09:31.550' AS DateTime), N'test below target ( SSB->Division II->SHC->Development Center ) ', N'http://10.10.0.34:8069/#/ChartPeriod//4C140009/1041/Q/2020/1/4', N'5539266f-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (868, 306, 1635, 0, NULL, CAST(N'2020-07-14T10:09:31.550' AS DateTime), N'test below target ( SSB->Division II->SHC->Development Center ) ', N'http://10.10.0.34:8069/#/ChartPeriod//4C140009/1041/Q/2020/1/4', N'5639266f-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (869, 297, 1636, 0, NULL, CAST(N'2020-07-17T15:21:13.740' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'8d014d78-06c8-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (870, 297, 1637, 0, NULL, CAST(N'2020-07-17T15:24:03.940' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'89483edf-06c8-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (871, 297, 1638, 0, NULL, CAST(N'2020-07-17T15:25:12.770' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'47e84208-07c8-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (872, 297, 1639, 0, NULL, CAST(N'2020-07-17T15:29:20.597' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'782bf79b-07c8-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (873, 297, 1640, 0, NULL, CAST(N'2020-07-17T15:32:54.920' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'48cbb91b-08c8-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[NotificationDetails] ([ID], [UserID], [NotificationID], [Seen], [Action], [CreateTime], [Content], [URL], [rowguid]) VALUES (874, 297, 1641, 0, NULL, CAST(N'2020-07-17T15:34:00.793' AS DateTime), NULL, N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', N'819a0043-08c8-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[NotificationDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Notifications] ON 
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1367, 300, NULL, NULL, N'Comment', N'/ChartPeriod/30001/36/H/2020/1/2/remark/309/1002/Remark-on-January-', CAST(N'2020-05-20T11:55:55.033' AS DateTime), N'SHC - Sy Pham', NULL, N'Remark on January -  KPI Chart  - KPI UploadE - Half Year', N'@henry ', 309, 0, NULL, N'7624c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1368, 300, N'KPI UploadE', NULL, N'Task-Auditor', N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', CAST(N'2020-05-20T12:06:57.193' AS DateTime), N'Sy Pham,Peter Tran', NULL, N'Action Plan on January -  KPI Chart  - KPI UploadE - Half Year', N'demo', 0, 40, N'demo', N'7724c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1369, 300, N'KPI UploadE', NULL, N'Task', N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', CAST(N'2020-05-20T12:06:57.207' AS DateTime), N'Sy Pham,Peter Tran', NULL, N'Action Plan on January -  KPI Chart  - KPI UploadE - Half Year', N'demo', 0, 40, N'demo', N'7824c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1370, 300, NULL, NULL, N'Comment', N'/ChartPeriod/40002/1035/H/2020/1/2/remark/310/1004/Remark-on-January-', CAST(N'2020-05-22T08:27:36.393' AS DateTime), N'SHC - Sy Pham', NULL, N'Remark on January -  KPI Chart  - KPI By Swook - Half Year', N'@henry ', 310, 0, NULL, N'7924c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1371, 300, N'KPI By Swook', NULL, N'Task-Auditor', N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', CAST(N'2020-05-22T08:34:01.577' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI By Swook - Half Year', N'demo', 0, 41, N'demo task', N'7a24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1372, 300, N'KPI By Swook', NULL, N'Task', N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', CAST(N'2020-05-22T08:34:01.590' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI By Swook - Half Year', N'demo', 0, 41, N'demo task', N'7b24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1373, 300, N'KPI By Swook', NULL, N'Task-Auditor', N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', CAST(N'2020-05-22T08:45:19.000' AS DateTime), N'SY PHAM,90097', NULL, N'Action Plan on January -  KPI Chart  - KPI By Swook - Half Year', N'demo', 0, 42, N'demo task', N'7c24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1374, 300, N'KPI By Swook', NULL, N'Task', N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', CAST(N'2020-05-22T08:45:19.010' AS DateTime), N'SY PHAM,90097', NULL, N'Action Plan on January -  KPI Chart  - KPI By Swook - Half Year', N'demo', 0, 42, N'demo task', N'7d24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1375, 300, N'KPI By Swook', NULL, N'Task-Auditor', N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', CAST(N'2020-05-22T09:03:53.770' AS DateTime), N'Peter Tran,Sy Pham,90097', NULL, N'Action Plan on January -  KPI Chart  - KPI By Swook - Half Year', N'demo', 0, 43, N'demo 2', N'7e24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1376, 300, N'KPI By Swook', NULL, N'Task', N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', CAST(N'2020-05-22T09:03:53.790' AS DateTime), N'Peter Tran,Sy Pham,90097', NULL, N'Action Plan on January -  KPI Chart  - KPI By Swook - Half Year', N'demo', 0, 43, N'demo 2', N'7f24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1377, 300, NULL, NULL, N'Comment', N'/ChartPeriod/40002/1035/H/2020/1/2/remark/311/1005/Remark-on-February-', CAST(N'2020-05-22T09:19:16.583' AS DateTime), N'SHC - Sy Pham', NULL, N'Remark on February -  KPI Chart  - KPI By Swook - Half Year', N'@henry ', 311, 0, NULL, N'8024c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1378, 300, N'KPI By Swook', NULL, N'Task-Auditor', N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', CAST(N'2020-05-22T09:29:04.143' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI By Swook - Half Year', N'ddd', 0, 49, N'ddd', N'8124c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1379, 300, N'KPI By Swook', NULL, N'Task', N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', CAST(N'2020-05-22T09:29:04.163' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI By Swook - Half Year', N'ddd', 0, 49, N'ddd', N'8224c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1380, 300, N'KPI By Swook', NULL, N'Task-Auditor', N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', CAST(N'2020-05-22T09:49:52.227' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI By Swook - Half Year', N'ddd', 0, 53, N'ddd', N'8324c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1381, 300, N'KPI By Swook', NULL, N'Task', N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', CAST(N'2020-05-22T09:49:54.510' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI By Swook - Half Year', N'ddd', 0, 53, N'ddd', N'8424c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1382, 300, N'KPI By Swook', NULL, N'Task-Auditor', N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', CAST(N'2020-05-22T09:55:43.670' AS DateTime), N'Peter Tran', NULL, N'Action Plan on January -  KPI Chart  - KPI By Swook - Half Year', N'demo', 0, 54, N'demo 2', N'8524c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1383, 300, N'KPI By Swook', NULL, N'Task', N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', CAST(N'2020-05-22T09:55:43.690' AS DateTime), N'Peter Tran', NULL, N'Action Plan on January -  KPI Chart  - KPI By Swook - Half Year', N'demo', 0, 54, N'demo 2', N'8624c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1384, 300, N'KPI By Swook', NULL, N'Task-Auditor', N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', CAST(N'2020-05-22T10:05:19.303' AS DateTime), N'Peter Tran,Sy Pham,Irene ', NULL, N'Action Plan on January -  KPI Chart  - KPI By Swook - Half Year', N'ddd', 0, 56, N'ddd', N'8724c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1385, 300, N'KPI By Swook', NULL, N'Task', N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', CAST(N'2020-05-22T10:05:34.263' AS DateTime), N'Peter Tran,Sy Pham,Irene ', NULL, N'Action Plan on January -  KPI Chart  - KPI By Swook - Half Year', N'ddd', 0, 56, N'ddd', N'8824c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1386, 297, N'KPI By Swook', NULL, N'Done', N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', CAST(N'2020-05-22T10:09:21.823' AS DateTime), NULL, NULL, N'ddd', N'ddd', 0, 56, N'ddd', N'8924c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1387, 300, N'KPI By Swook', NULL, N'Approval', N'/ChartPeriod/40002/1035/H/2020/1/2/task/310/1004/Action-Plan-on-January-', CAST(N'2020-05-22T10:09:35.870' AS DateTime), NULL, NULL, N'ddd', N'ddd', 0, 56, N'ddd', N'8a24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1388, 300, N'KPI By Swook', NULL, N'Task-Auditor', N'/ChartPeriod/40002/1035/H/2020/1/2/task/311/1005/Action-Plan-on-February-', CAST(N'2020-05-22T12:21:47.500' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on February -  KPI Chart  - KPI By Swook - Half Year', N'ddd', 0, 57, N'ddd', N'8b24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1389, 300, N'KPI By Swook', NULL, N'Task', N'/ChartPeriod/40002/1035/H/2020/1/2/task/311/1005/Action-Plan-on-February-', CAST(N'2020-05-22T12:21:47.517' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on February -  KPI Chart  - KPI By Swook - Half Year', N'ddd', 0, 57, N'ddd', N'8c24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1390, 300, NULL, NULL, N'Comment', N'/ChartPeriod/40002/1035/H/2020/1/2/remark/312/1005/Remark-on-February-', CAST(N'2020-05-25T09:11:59.937' AS DateTime), N'SHC - Sy Pham', NULL, N'Remark on February -  KPI Chart  - KPI By Swook - Half Year', N'@henry ', 312, 0, NULL, N'8d24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1391, 300, NULL, NULL, N'Comment', N'/ChartPeriod/40002/1035/H/2020/1/2/remark/313/1005/Remark-on-February-', CAST(N'2020-05-25T09:14:45.270' AS DateTime), N'SHC - Sy Pham', NULL, N'Remark on February -  KPI Chart  - KPI By Swook - Half Year', N'@henry ', 313, 0, NULL, N'8e24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1392, 300, NULL, NULL, N'Comment', N'/ChartPeriod/40002/1035/H/2020/1/2/remark/314/1005/Remark-on-February-', CAST(N'2020-05-25T09:18:03.643' AS DateTime), N'SHC - Sy Pham', NULL, N'Remark on February -  KPI Chart  - KPI By Swook - Half Year', N'@henry ', 314, 0, NULL, N'8f24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1393, 300, N'KPI By Swook', NULL, N'Task-Auditor', N'/ChartPeriod/40002/1035/H/2020/1/2/task/314/1005/Action-Plan-on-February-', CAST(N'2020-05-25T09:57:15.943' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on February -  KPI Chart  - KPI By Swook - Half Year', N'demo', 0, 58, N'demo 25-5', N'9024c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1394, 300, N'KPI By Swook', NULL, N'Task', N'/ChartPeriod/40002/1035/H/2020/1/2/task/314/1005/Action-Plan-on-February-', CAST(N'2020-05-25T09:57:15.960' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on February -  KPI Chart  - KPI By Swook - Half Year', N'demo', 0, 58, N'demo 25-5', N'9124c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1395, 297, N'KPI By Swook', NULL, N'Done', N'/ChartPeriod/40002/1035/H/2020/1/2/task/314/1005/Action-Plan-on-February-', CAST(N'2020-05-25T09:59:20.633' AS DateTime), NULL, NULL, N'demo 25-5', N'demo', 0, 58, N'demo 25-5', N'9224c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1396, 300, N'KPI By Swook', NULL, N'Approval', N'/ChartPeriod/40002/1035/H/2020/1/2/task/314/1005/Action-Plan-on-February-', CAST(N'2020-05-25T10:01:00.207' AS DateTime), NULL, NULL, N'demo 25-5', N'demo', 0, 58, N'demo 25-5', N'9324c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1397, 301, NULL, NULL, N'Upload', N'http://10.4.0.76:8069/#/Home/ListSubNotificationDetail/', CAST(N'2020-05-25T10:08:06.773' AS DateTime), NULL, NULL, NULL, N'You have just uploaded some KPIs.', 0, 0, N'Upload KPI Data', N'9424c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1398, 301, NULL, NULL, N'Upload', N'http://10.4.0.76:8069/#/Home/ListSubNotificationDetail/', CAST(N'2020-05-25T10:08:06.853' AS DateTime), NULL, NULL, NULL, N'You have just uploaded some KPIs.', 0, 0, N'Upload KPI Data', N'9524c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1399, 300, NULL, NULL, N'Comment', N'/ChartPeriod/30003/1036/H/2020/1/2/remark/315/1006/Remark-on-January-', CAST(N'2020-05-25T11:21:02.710' AS DateTime), N'SHC - Sy Pham', NULL, N'Remark on January -  KPI Chart  - KPI BY LEO E - Half Year', N'@henry ', 315, 0, NULL, N'9624c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1400, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-25T11:21:23.870' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'demo', 0, 59, N'demo 11:21', N'9724c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1401, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-25T11:21:23.897' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'demo', 0, 59, N'demo 11:21', N'9824c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1402, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-25T12:23:15.867' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'12:23', 0, 60, N'demo 12:23', N'9924c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1403, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-25T12:23:15.883' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'12:23', 0, 60, N'demo 12:23', N'9a24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1404, 297, N'KPI BY LEO E', NULL, N'Done', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-25T12:25:33.387' AS DateTime), NULL, NULL, N'demo 12:23', N'12:23', 0, 60, N'demo 12:23', N'9b24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1405, 300, N'KPI BY LEO E', NULL, N'Approval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-25T12:25:58.137' AS DateTime), NULL, NULL, N'demo 12:23', N'12:23', 0, 60, N'demo 12:23', N'9c24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1406, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T09:56:00.630' AS DateTime), N'Peter Tran,SY PHAM', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'demo', 0, 61, N'demo auditor action plan', N'9d24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1407, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T09:56:00.650' AS DateTime), N'Peter Tran,SY PHAM', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'demo', 0, 61, N'demo auditor action plan', N'9e24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1408, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T10:03:32.367' AS DateTime), N'Peter Tran,SY PHAM', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 62, N'asdasd', N'9f24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1409, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T10:03:32.387' AS DateTime), N'Peter Tran,SY PHAM', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 62, N'asdasd', N'a024c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1410, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T10:07:54.240' AS DateTime), N'Peter Tran,SY PHAM', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 63, N'asdasd', N'a124c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1411, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T10:07:54.263' AS DateTime), N'Peter Tran,SY PHAM', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 63, N'asdasd', N'a224c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1412, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T10:13:32.147' AS DateTime), N'Peter Tran,SY PHAM', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 64, N'asdasd', N'a324c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1413, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T10:13:32.167' AS DateTime), N'Peter Tran,SY PHAM', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 64, N'asdasd', N'a424c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1414, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T10:15:39.720' AS DateTime), N'Peter Tran,Jenny Wang', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 65, N'asdasd', N'a524c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1415, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T10:15:39.740' AS DateTime), N'Peter Tran,Jenny Wang', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 65, N'asdasd', N'a624c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1416, 300, N'KPI BY LEO E', NULL, N'Approval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T10:18:22.493' AS DateTime), NULL, NULL, N'asdasd123123', N'asdasd', 0, 65, N'asdasd123123', N'a724c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1417, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T10:21:22.657' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 66, N'asdasd', N'a824c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1418, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T10:21:22.677' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 66, N'asdasd', N'a924c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1419, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T10:38:01.043' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asasdasd', 0, 67, N'asdasd', N'aa24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1420, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T10:38:11.817' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asasdasd', 0, 67, N'asdasd', N'ab24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1421, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T10:49:52.217' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asasdasd', 0, 68, N'asdasd', N'ac24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1422, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T10:49:52.253' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asasdasd', 0, 68, N'asdasd', N'ad24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1423, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T10:52:39.913' AS DateTime), N'Peter Tran,Eric Chen', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 69, N'asdasd', N'ae24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1424, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T10:52:39.933' AS DateTime), N'Peter Tran,Eric Chen', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 69, N'asdasd', N'af24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1425, 300, NULL, NULL, N'Comment', N'/ChartPeriod/30003/1036/H/2020/1/2/remark/316/1006/Remark-on-January-', CAST(N'2020-05-27T10:59:08.497' AS DateTime), N'SHC - Sy Pham', NULL, N'Remark on January -  KPI Chart  - KPI BY LEO E - Half Year', N'@henry ', 316, 0, NULL, N'b024c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1426, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T11:04:31.860' AS DateTime), N'Peter Tran,Tim.Hong', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 70, N'asd', N'b124c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1427, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T11:04:31.880' AS DateTime), N'Peter Tran,Tim.Hong', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 70, N'asd', N'b224c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1428, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T11:07:16.647' AS DateTime), N'Peter Tran,Karen Xu', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'dasdasd', 0, 71, N'asdas', N'b324c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1429, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T11:07:16.663' AS DateTime), N'Peter Tran,Karen Xu', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'dasdasd', 0, 71, N'asdas', N'b424c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1430, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T11:11:08.023' AS DateTime), N'Peter Tran,Lilian Chen', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 72, N'asdasd', N'b524c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1431, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T11:11:08.043' AS DateTime), N'Peter Tran,Lilian Chen', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 72, N'asdasd', N'b624c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1432, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T11:16:39.240' AS DateTime), N'Peter Tran,Lilian Chen', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 73, N'asdasd', N'b724c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1433, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T11:16:39.267' AS DateTime), N'Peter Tran,Lilian Chen', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 73, N'asdasd', N'b824c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1434, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T11:22:17.060' AS DateTime), N'Peter Tran,Lilian Chen', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 74, N'asdasd', N'b924c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1435, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T11:22:17.090' AS DateTime), N'Peter Tran,Lilian Chen', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 74, N'asdasd', N'ba24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1436, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T11:24:30.947' AS DateTime), N'Peter Tran,Lilian Chen', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 75, N'asdasd', N'bb24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1437, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T11:24:30.973' AS DateTime), N'Peter Tran,Lilian Chen', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 75, N'asdasd', N'bc24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1438, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T11:25:54.777' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 76, N'asdasd', N'bd24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1439, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T11:25:54.807' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 76, N'asdasd', N'be24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1440, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T11:36:02.283' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 77, N'asdasd', N'bf24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1441, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T11:36:06.783' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 77, N'asdasd', N'c024c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1442, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T11:43:36.400' AS DateTime), N'Peter Tran,SY PHAM', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 79, N'asdasd', N'c124c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1443, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T11:43:36.420' AS DateTime), N'Peter Tran,SY PHAM', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 79, N'asdasd', N'c224c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1444, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T11:51:24.727' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 80, N'asdasd', N'c324c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1445, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T11:51:24.757' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 80, N'asdasd', N'c424c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1446, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T11:53:06.943' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 81, N'asdasd', N'c524c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1447, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T11:53:06.967' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 81, N'asdasd', N'c624c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1448, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T12:03:52.157' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 82, N'asdasd', N'c724c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1449, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T12:03:52.427' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'asdasd', 0, 82, N'asdasd', N'c824c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1450, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T12:20:46.870' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'ac', 0, 83, N'demo acp', N'c924c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1451, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-27T12:20:46.890' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'ac', 0, 83, N'demo acp', N'ca24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1452, 297, NULL, NULL, N'Comment', N'/ChartPeriod/30003/1036/H/2020/1/2/remark/317/1006/Remark-on-January-', CAST(N'2020-05-27T16:10:20.430' AS DateTime), N'SHC - Peter Tran', NULL, N'Remark on January -  KPI Chart  - KPI BY LEO E - Half Year', N'@peter ', 317, 0, NULL, N'cb24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1453, 300, NULL, NULL, N'Comment', N'/ChartPeriod/30003/1036/H/2020/1/2/remark/320/1006/Remark-on-January-', CAST(N'2020-05-27T16:25:23.513' AS DateTime), N'SHC - Peter Tran', NULL, N'Remark on January -  KPI Chart  - KPI BY LEO E - Half Year', N'@peter ', 320, 0, NULL, N'cc24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1454, 300, NULL, NULL, N'Comment', N'/ChartPeriod/30003/1036/H/2020/1/2/remark/321/1006/Remark-on-January-', CAST(N'2020-05-27T16:27:16.353' AS DateTime), N'SHC - Peter Tran', NULL, N'Remark on January -  KPI Chart  - KPI BY LEO E - Half Year', N'@peter ', 321, 0, NULL, N'cd24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1455, 300, NULL, NULL, N'Comment', N'/ChartPeriod/30003/1036/H/2020/1/2/remark/324/1006/Remark-on-January-', CAST(N'2020-05-27T16:30:58.803' AS DateTime), N'SHC - Peter Tran', NULL, N'Remark on January -  KPI Chart  - KPI BY LEO E - Half Year', N'@peter ', 324, 0, NULL, N'ce24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1456, 300, NULL, NULL, N'Comment', N'/ChartPeriod/30003/1036/H/2020/1/2/remark/325/1006/Remark-on-January-', CAST(N'2020-05-27T16:31:17.027' AS DateTime), N'SHC - Peter Tran', NULL, N'Remark on January -  KPI Chart  - KPI BY LEO E - Half Year', N'@peter ', 325, 0, NULL, N'cf24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1457, 300, NULL, NULL, N'Comment', N'/ChartPeriod/30003/1036/H/2020/1/2/remark/327/1006/Remark-on-January-', CAST(N'2020-05-27T16:38:54.950' AS DateTime), N'SHC - Peter Tran', NULL, N'Remark on January -  KPI Chart  - KPI BY LEO E - Half Year', N'@peter ', 327, 0, NULL, N'd024c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1458, 300, NULL, NULL, N'Comment', N'/ChartPeriod/30003/1036/H/2020/2/2/remark/329/1006/Remark-on-January-', CAST(N'2020-05-28T07:55:02.410' AS DateTime), N'SHC - Peter Tran', NULL, N'Remark on January -  KPI Chart  - KPI BY LEO E - Half Year', N'SHC - Peter Tran', 329, 0, NULL, N'd124c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1459, 300, NULL, NULL, N'Comment', N'/ChartPeriod/30003/1036/H/2020/1/2/remark/330/1006/Remark-on-January-', CAST(N'2020-05-28T08:04:32.260' AS DateTime), N'SHC - Peter Tran', NULL, N'Remark on January -  KPI Chart  - KPI BY LEO E - Half Year', N'@SHC - Peter Tran', 330, 0, NULL, N'd224c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1460, 300, NULL, NULL, N'Comment', N'/ChartPeriod/30003/1036/H/2020/1/2/remark/331/1006/Remark-on-January-', CAST(N'2020-05-28T08:22:02.257' AS DateTime), N'SHC - Sy Pham,SHC - Peter Tran', NULL, N'Remark on January -  KPI Chart  - KPI BY LEO E - Half Year', N'@peter @henry ', 331, 0, NULL, N'd324c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1461, 300, NULL, NULL, N'Comment', N'/ChartPeriod/30003/1036/H/2020/1/2/remark/332/1006/Remark-on-January-', CAST(N'2020-05-28T08:26:44.903' AS DateTime), N'SHC - Sy Pham,SHC - Peter Tran', NULL, N'Remark on January -  KPI Chart  - KPI BY LEO E - Half Year', N'@SHC - Peter Tran,@SHC - Sy Pham', 332, 0, NULL, N'd424c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1462, 300, NULL, NULL, N'Comment', N'/ChartPeriod/30003/1036/H/2020/1/2/remark/333/1006/Remark-on-January-', CAST(N'2020-05-28T08:30:28.033' AS DateTime), N'SHC - Peter Tran', NULL, N'Remark on January -  KPI Chart  - KPI BY LEO E - Half Year', N'@SHC - Peter Tran', 333, 0, NULL, N'd524c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1463, 300, NULL, NULL, N'Comment', N'/ChartPeriod/30003/1036/H/2020/1/2/remark/335/1006/Remark-on-January-', CAST(N'2020-05-28T08:39:34.377' AS DateTime), N'SHC - Sy Pham,SHC - Peter Tran', NULL, N'Remark on January -  KPI Chart  - KPI BY LEO E - Half Year', N'@SHC - Peter Tran @SHC - Sy Pham', 335, 0, NULL, N'd624c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1464, 300, NULL, NULL, N'Comment', N'/ChartPeriod/30003/1036/H/2020/1/2/remark/336/1006/Remark-on-January-', CAST(N'2020-05-28T08:49:13.007' AS DateTime), N'SHC - Peter Tran,user by Leo', NULL, N'Remark on January -  KPI Chart  - KPI BY LEO E - Half Year', N'<p><b style=''color:red''>@SHC - Peter Tran @user by Leo</b></p>', 336, 0, NULL, N'd724c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1465, 300, NULL, NULL, N'Comment', N'/ChartPeriod/30003/1036/H/2020/1/2/remark/337/1006/Remark-on-January-', CAST(N'2020-05-28T08:51:17.220' AS DateTime), N'SHC - Peter Tran', NULL, N'Remark on January -  KPI Chart  - KPI BY LEO E - Half Year', N'@SHC - Peter Tran', 337, 0, NULL, N'd824c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1466, 300, NULL, NULL, N'Comment', N'/ChartPeriod/30003/1036/H/2020/1/2/remark/338/1006/Remark-on-January-', CAST(N'2020-05-28T10:16:16.117' AS DateTime), N'SHC - Peter Tran', NULL, N'Remark on January -  KPI Chart  - KPI BY LEO E - Half Year', N'vo day nao @peter @SHC - Peter Tran', 338, 0, NULL, N'd924c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1467, 300, NULL, NULL, N'Comment', N'/ChartPeriod/30003/1036/H/2020/1/2/remark/339/1006/Remark-on-January-', CAST(N'2020-05-28T10:16:50.800' AS DateTime), N'SHC - Sy Pham,SHC - Peter Tran', NULL, N'Remark on January -  KPI Chart  - KPI BY LEO E - Half Year', N'vo day @peter @henry @SHC - Peter Tran @SHC - Sy Pham', 339, 0, NULL, N'da24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1468, 300, NULL, NULL, N'Comment', N'/ChartPeriod/30003/1036/H/2020/1/2/remark/340/1006/Remark-on-January-', CAST(N'2020-05-28T10:28:38.163' AS DateTime), N'SHC - Peter Tran', NULL, N'Remark on January -  KPI Chart  - KPI BY LEO E - Half Year', N'vo day nao @SHC - Peter Tran', 340, 0, NULL, N'db24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1469, 300, NULL, NULL, N'Comment', N'/ChartPeriod/30003/1036/H/2020/1/2/remark/341/1006/Remark-on-January-', CAST(N'2020-05-28T10:28:57.987' AS DateTime), N'SHC - Sy Pham,SHC - Peter Tran', NULL, N'Remark on January -  KPI Chart  - KPI BY LEO E - Half Year', N'vo day nao @SHC - Peter Tran @SHC - Sy Pham', 341, 0, NULL, N'dc24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1470, 300, NULL, NULL, N'Comment', N'/ChartPeriod/30003/1036/H/2020/1/2/remark/342/1006/Remark-on-January-', CAST(N'2020-05-28T10:29:15.780' AS DateTime), N'SHC - Sy Pham', NULL, N'Remark on January -  KPI Chart  - KPI BY LEO E - Half Year', N'@SHC - Sy Pham', 342, 0, NULL, N'dd24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1471, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-28T10:59:14.203' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'demo', 0, 85, N'demo 28/5', N'de24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1472, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-05-28T10:59:14.220' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'demo', 0, 85, N'demo 28/5', N'df24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1473, 300, NULL, NULL, N'Comment', N'/ChartPeriod/40002/1035/H/2020/1/2/remark/343/1004/Remark-on-January-', CAST(N'2020-05-28T11:09:29.193' AS DateTime), N'SHC - Sy Pham', NULL, N'Remark on January -  KPI Chart  - KPI By Swook - Half Year', N'vo day nao @SHC - Sy Pham', 343, 0, NULL, N'e024c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1474, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-05-28T11:32:10.307' AS DateTime), N'Peter Tran,Sy Pham,Irene ', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'ddd', 0, 86, N'ddd', N'e124c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1475, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-05-28T11:32:10.323' AS DateTime), N'Peter Tran,Sy Pham,Irene ', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'ddd', 0, 86, N'ddd', N'e224c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1476, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-05-28T11:33:19.400' AS DateTime), N'Peter Tran,Sy Pham,Irene ', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'ddd2', 0, 87, N'ddd2', N'e324c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1477, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-05-28T11:33:19.407' AS DateTime), N'Peter Tran,Sy Pham,Irene ', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'ddd2', 0, 87, N'ddd2', N'e424c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1478, 297, N'KPI BY LEO E', NULL, N'Done', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-05-28T11:33:50.657' AS DateTime), NULL, NULL, N'ddd2', N'ddd2', 0, 87, N'ddd2', N'e524c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1479, 300, N'KPI BY LEO E', NULL, N'Approval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-05-28T11:34:08.023' AS DateTime), NULL, NULL, N'ddd2', N'ddd2', 0, 87, N'ddd2', N'e624c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1480, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-05-28T11:58:48.857' AS DateTime), N'Irene ,Sy Pham', NULL, N'Action Plan on January  -  KPI Chart   - KPI BY LEO E -  Half Year', N'ddd3', 0, 88, N'ddd3', N'e724c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1481, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-05-28T11:58:48.877' AS DateTime), N'Irene ,Sy Pham', NULL, N'Action Plan on January  -  KPI Chart   - KPI BY LEO E -  Half Year', N'ddd3', 0, 88, N'ddd3', N'e824c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1482, 300, N'KPI BY LEO E', NULL, N'Approval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-05-28T16:06:01.910' AS DateTime), NULL, NULL, N'ddd', N'ddd', 0, 86, N'ddd', N'e924c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1483, 300, N'KPI BY LEO E', NULL, N'UpdateApproval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-05-28T16:07:06.460' AS DateTime), NULL, NULL, N'ddd', N'ddd', 0, 86, N'ddd', N'ea24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1484, 299, N'KPI BY LEO E', NULL, N'Approval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-05-28T16:14:07.223' AS DateTime), NULL, NULL, N'ddd', N'ddd', 0, 86, N'ddd', N'eb24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1485, 299, N'KPI BY LEO E', NULL, N'UpdateApproval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-05-28T16:14:09.910' AS DateTime), NULL, NULL, N'ddd', N'ddd', 0, 86, N'ddd', N'ec24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1486, 300, N'KPI BY LEO E', NULL, N'Approval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-05-28T16:16:07.107' AS DateTime), NULL, NULL, N'ddd', N'ddd', 0, 86, N'ddd', N'ed24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1487, 300, N'KPI BY LEO E', NULL, N'UpdateApproval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-05-28T16:17:03.670' AS DateTime), NULL, NULL, N'ddd', N'ddd', 0, 86, N'ddd', N'ee24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1488, 300, N'KPI BY LEO E', NULL, N'Approval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-05-28T16:17:06.750' AS DateTime), NULL, NULL, N'ddd', N'ddd', 0, 86, N'ddd', N'ef24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1489, 300, N'KPI BY LEO E', NULL, N'UpdateApproval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-05-28T16:17:07.647' AS DateTime), NULL, NULL, N'ddd', N'ddd', 0, 86, N'ddd', N'f024c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1490, 300, N'KPI BY LEO E', NULL, N'Approval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-05-28T16:17:08.323' AS DateTime), NULL, NULL, N'ddd', N'ddd', 0, 86, N'ddd', N'f124c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1491, 300, N'KPI BY LEO E', NULL, N'UpdateApproval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-05-28T16:17:09.140' AS DateTime), NULL, NULL, N'ddd', N'ddd', 0, 86, N'ddd', N'f224c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1492, 300, N'KPI BY LEO E', NULL, N'Approval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-05-28T16:17:09.840' AS DateTime), NULL, NULL, N'ddd', N'ddd', 0, 86, N'ddd', N'f324c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1493, 299, N'KPI BY LEO E', NULL, N'UpdateApproval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-05-28T16:27:32.333' AS DateTime), NULL, NULL, N'ddd', N'ddd', 0, 86, N'ddd', N'f424c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1494, 299, N'KPI BY LEO E', NULL, N'Approval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-05-28T16:27:33.947' AS DateTime), NULL, NULL, N'ddd', N'ddd', 0, 86, N'ddd', N'f524c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1500, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-09T08:54:51.723' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'demo', 0, 89, N'demo 6/9', N'f624c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1501, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-09T08:54:51.743' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'demo', 0, 89, N'demo 6/9', N'f724c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1503, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-09T08:58:26.080' AS DateTime), N'Peter Tran,SY PHAM', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'demooo', 0, 90, N'demoooo', N'f824c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1504, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-09T08:58:26.103' AS DateTime), N'Peter Tran,SY PHAM', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'demooo', 0, 90, N'demoooo', N'f924c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1506, 300, N'KPI UploadE', NULL, N'Task-Auditor', N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', CAST(N'2020-06-09T09:37:40.497' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI UploadE - Half Year', N'demo 9:37', 0, 91, N'demo 9:37', N'fa24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1507, 300, N'KPI UploadE', NULL, N'Task', N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', CAST(N'2020-06-09T09:37:40.517' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI UploadE - Half Year', N'demo 9:37', 0, 91, N'demo 9:37', N'fb24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1508, 300, N'KPI UploadE', NULL, N'Task-Auditor', N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', CAST(N'2020-06-09T09:43:30.997' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI UploadE - Half Year', N'9h43', 0, 92, N'9:43', N'fc24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1509, 300, N'KPI UploadE', NULL, N'Task', N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', CAST(N'2020-06-09T09:43:31.000' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI UploadE - Half Year', N'9h43', 0, 92, N'9:43', N'fd24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1510, 300, N'KPI UploadE', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', CAST(N'2020-06-09T09:47:37.917' AS DateTime), NULL, NULL, N'9:43', N'9:43', 0, 92, N'9:43', N'fe24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1511, 300, N'KPI UploadE', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', CAST(N'2020-06-09T09:51:58.707' AS DateTime), NULL, NULL, N'9:43', N'9:43', 0, 92, N'9:43', N'ff24c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1512, 300, N'KPI UploadE', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', CAST(N'2020-06-09T09:58:16.593' AS DateTime), NULL, NULL, N'9:43', N'9:43', 0, 92, N'9:43', N'0025c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1513, 300, N'KPI UploadE', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', CAST(N'2020-06-09T09:59:53.297' AS DateTime), NULL, NULL, N'9:43', N'9:43', 0, 92, N'9:43', N'0125c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1514, 300, N'KPI UploadE', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', CAST(N'2020-06-09T10:17:05.043' AS DateTime), NULL, NULL, N'9:43', N'9:43', 0, 92, N'9:43', N'0225c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1515, 300, N'KPI UploadE', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', CAST(N'2020-06-09T10:19:48.867' AS DateTime), NULL, NULL, N'9:43', N'9:43', 0, 92, N'9:43', N'0325c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1516, 300, N'KPI UploadE', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', CAST(N'2020-06-09T10:21:54.173' AS DateTime), NULL, NULL, N'9:43', N'9:43', 0, 92, N'9:43', N'0425c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1517, 300, N'KPI UploadE', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', CAST(N'2020-06-09T10:26:27.237' AS DateTime), NULL, NULL, N'9:43', N'9:43', 0, 92, N'9:43', N'0525c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1518, 300, N'KPI UploadE', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', CAST(N'2020-06-09T10:30:41.130' AS DateTime), NULL, NULL, N'9:43', N'9:43', 0, 92, N'9:43', N'0625c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1519, 300, N'KPI UploadE', NULL, N'Remark', N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', CAST(N'2020-06-09T10:38:05.410' AS DateTime), NULL, NULL, N'9:43', N'aaa', 0, 92, N'9:43', N'0725c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1520, 300, N'KPI UploadE', NULL, N'Remark', N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', CAST(N'2020-06-09T10:52:10.963' AS DateTime), NULL, NULL, N'9:43', N'aaa1', 0, 92, N'9:43', N'0825c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1521, 300, N'KPI UploadE', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', CAST(N'2020-06-09T10:55:33.267' AS DateTime), NULL, NULL, N'9:43', N'9:43', 0, 92, N'9:43', N'0925c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1522, 300, N'KPI UploadE', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', CAST(N'2020-06-09T10:58:18.230' AS DateTime), NULL, NULL, N'9:43', N'9:43', 0, 92, N'9:43', N'0a25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1523, 300, N'KPI UploadE', NULL, N'Remark', N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', CAST(N'2020-06-09T10:58:27.440' AS DateTime), NULL, NULL, N'9:43', N'aaa12', 0, 92, N'9:43', N'0b25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1524, 300, N'KPI UploadE', NULL, N'Remark', N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', CAST(N'2020-06-09T11:00:33.880' AS DateTime), NULL, NULL, N'9:43', N'aaa123', 0, 92, N'9:43', N'0c25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1525, 300, N'KPI UploadE', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30001/36/H/2020/1/2/task/309/1002/Action-Plan-on-January-', CAST(N'2020-06-09T11:03:12.323' AS DateTime), NULL, NULL, N'9:43', N'9:43', 0, 92, N'9:43', N'0d25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1526, 300, N'KPI BY LEO E', NULL, N'Remark', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-09T14:01:34.223' AS DateTime), NULL, NULL, N'demoooo', N'remark 2:01', 0, 90, N'demoooo', N'0e25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1527, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-09T14:03:19.903' AS DateTime), NULL, NULL, N'demoooo', N'demoooo', 0, 90, N'demoooo', N'0f25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1528, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-09T16:06:02.283' AS DateTime), NULL, NULL, N'demoooo', N'demoooo', 0, 90, N'demoooo', N'1025c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1529, 300, NULL, NULL, N'Comment', N'/ChartPeriod/30003/1036/H/2020/1/2/remark/344/1006/Remark-on-January-', CAST(N'2020-06-15T09:21:53.853' AS DateTime), N'SHC - Sy Pham', NULL, N'Remark on January -  KPI Chart  - KPI BY LEO E - Half Year', N'@SHC - Sy Pham', 344, 0, NULL, N'1125c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1530, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-15T11:45:06.497' AS DateTime), NULL, NULL, N'ddd2', N'ddd2', 0, 87, N'ddd2', N'1225c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1531, 300, NULL, NULL, N'Comment', N'/ChartPeriod/30003/1036/H/2020/1/2/remark/345/1006/Remark-on-January-', CAST(N'2020-06-15T15:01:29.417' AS DateTime), N'SHC - Sy Pham', NULL, N'Remark on January -  KPI Chart  - KPI BY LEO E - Half Year', N'blalla @SHC - Sy Pham', 345, 0, NULL, N'1325c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1532, 300, NULL, NULL, N'Comment', N'/ChartPeriod/30003/1036/H/2020/1/2/remark/350/1006/Remark-on-January-', CAST(N'2020-06-15T15:21:27.027' AS DateTime), N'SHC - Sy Pham', NULL, N'Remark on January -  KPI Chart  - KPI BY LEO E - Half Year', N'vo day nao @SHC - Sy Pham', 350, 0, NULL, N'1425c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1533, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-16T12:02:16.673' AS DateTime), NULL, NULL, N'ddd', N'ddd', 0, 86, N'ddd', N'1525c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1534, 300, NULL, NULL, N'Comment', N'/ChartPeriod/30003/1036/H/2020/1/2/remark/352/1006/Remark-on-January-', CAST(N'2020-06-16T12:26:56.063' AS DateTime), N'SHC - Sy Pham', NULL, N'Remark on January -  KPI Chart  - KPI BY LEO E - Half Year', N'ballala @SHC - Sy Pham', 352, 0, NULL, N'1625c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1535, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-16T16:07:50.180' AS DateTime), NULL, NULL, N'ddd2', N'ddd2', 0, 87, N'ddd2', N'1725c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1536, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-16T16:09:32.437' AS DateTime), NULL, NULL, N'ddd2', N'ddd2', 0, 87, N'ddd2', N'1825c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1537, 297, N'KPI BY LEO E', NULL, N'Done', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-16T16:09:47.767' AS DateTime), NULL, NULL, N'ddd2', N'ddd2', 0, 87, N'ddd2', N'1925c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1538, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-16T16:10:04.433' AS DateTime), NULL, NULL, N'ddd2', N'ddd2', 0, 87, N'ddd2', N'1a25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1539, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T08:14:46.890' AS DateTime), NULL, NULL, N'demoooo', N'demoooo', 0, 90, N'demoooo', N'1b25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1540, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T08:15:09.657' AS DateTime), NULL, NULL, N'demoooo', N'demoooo', 0, 90, N'demoooo', N'1c25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1541, 297, N'KPI BY LEO E', NULL, N'Done', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T08:27:04.290' AS DateTime), NULL, NULL, N'demo 6/9', N'demo', 0, 89, N'demo 6/9', N'1d25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1542, 297, N'KPI BY LEO E', NULL, N'Done', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T08:27:18.383' AS DateTime), NULL, NULL, N'ddd3', N'ddd3', 0, 88, N'ddd3', N'1e25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1543, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T08:28:18.277' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'1f25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1544, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T08:28:22.663' AS DateTime), NULL, NULL, N'ddd3', N'ddd3', 0, 88, N'ddd3', N'2025c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1545, 297, N'KPI BY LEO E', NULL, N'Done', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T08:45:40.057' AS DateTime), NULL, NULL, N'demo 6/9', N'demo', 0, 89, N'demo 6/9', N'2125c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1546, 297, N'KPI BY LEO E', NULL, N'Done', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T08:46:14.303' AS DateTime), NULL, NULL, N'demo 6/9', N'demo', 0, 89, N'demo 6/9', N'2225c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1547, 297, N'KPI BY LEO E', NULL, N'Done', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T08:46:33.150' AS DateTime), NULL, NULL, N'demo 6/9', N'demo', 0, 89, N'demo 6/9', N'2325c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1548, 297, N'KPI BY LEO E', NULL, N'Done', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T08:49:28.650' AS DateTime), NULL, NULL, N'ddd3', N'ddd3', 0, 88, N'ddd3', N'2425c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1549, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T08:52:03.183' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'2525c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1550, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T08:52:06.097' AS DateTime), NULL, NULL, N'ddd3', N'ddd3', 0, 88, N'ddd3', N'2625c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1551, 297, N'KPI BY LEO E', NULL, N'Done', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T08:52:16.503' AS DateTime), NULL, NULL, N'demo 6/9', N'demo', 0, 89, N'demo 6/9', N'2725c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1552, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T08:54:09.507' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'2825c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1553, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T09:28:42.053' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'2925c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1554, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T09:28:53.097' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'2a25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1555, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T09:30:09.530' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'2b25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1556, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T09:31:35.427' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'2c25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1557, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T09:32:54.237' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'2d25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1558, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T09:34:06.557' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'2e25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1559, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T09:35:11.270' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'2f25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1560, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T09:36:14.440' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'3025c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1561, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T09:38:11.083' AS DateTime), NULL, NULL, N'demoooo', N'demoooo', 0, 90, N'demoooo', N'3125c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1562, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T09:39:28.670' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'3225c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1563, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T09:40:16.940' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'3325c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1564, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T09:41:04.800' AS DateTime), NULL, NULL, N'demoooo', N'demoooo', 0, 90, N'demoooo', N'3425c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1565, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T09:42:24.313' AS DateTime), NULL, NULL, N'demoooo', N'demoooo', 0, 90, N'demoooo', N'3525c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1566, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T09:42:56.130' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'3625c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1567, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T09:46:23.130' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'3725c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1568, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T09:47:00.080' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'3825c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1569, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T09:53:02.760' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'3925c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1570, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T09:53:52.987' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'3a25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1571, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T09:54:42.257' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'3b25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1572, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T09:56:56.560' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'3c25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1573, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T10:11:35.053' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'3d25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1574, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T10:12:13.560' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'3e25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1575, 300, N'KPI BY LEO E', NULL, N'Approval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T12:02:30.150' AS DateTime), NULL, NULL, N'demo 6/9', N'demo', 0, 89, N'demo 6/9', N'3f25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1576, 300, N'KPI BY LEO E', NULL, N'UpdateApproval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T12:04:16.833' AS DateTime), NULL, NULL, N'demo 6/9', N'demo', 0, 89, N'demo 6/9', N'4025c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1577, 300, N'KPI BY LEO E', NULL, N'Approval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T12:07:20.427' AS DateTime), NULL, NULL, N'demo 6/9', N'demo', 0, 89, N'demo 6/9', N'4125c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1578, 300, N'KPI BY LEO E', NULL, N'UpdateApproval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T12:07:23.583' AS DateTime), NULL, NULL, N'demo 6/9', N'demo', 0, 89, N'demo 6/9', N'4225c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1579, 300, N'KPI BY LEO E', NULL, N'Approval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T12:09:44.563' AS DateTime), NULL, NULL, N'demo 6/9', N'demo', 0, 89, N'demo 6/9', N'4325c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1580, 300, N'KPI BY LEO E', NULL, N'UpdateApproval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T12:09:49.657' AS DateTime), NULL, NULL, N'demo 6/9', N'demo', 0, 89, N'demo 6/9', N'4425c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1581, 300, N'KPI BY LEO E', NULL, N'Approval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T12:12:02.753' AS DateTime), NULL, NULL, N'demo 6/9', N'demo', 0, 89, N'demo 6/9', N'4525c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1582, 300, N'KPI BY LEO E', NULL, N'UpdateApproval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T12:12:06.773' AS DateTime), NULL, NULL, N'demo 6/9', N'demo', 0, 89, N'demo 6/9', N'4625c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1583, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T12:15:23.627' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'4725c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1584, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T12:16:17.170' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'4825c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1585, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T12:19:15.673' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'4925c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1586, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T12:21:48.703' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'4a25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1587, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T13:30:11.093' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'4b25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1588, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T14:00:11.390' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'4c25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1589, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-06-17T14:20:29.677' AS DateTime), N'John Chuang,Jenny Wang', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'dddd', 0, 93, N'dddddd', N'4d25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1590, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/315/1006/Action-Plan-on-January-', CAST(N'2020-06-17T14:20:29.697' AS DateTime), N'John Chuang,Jenny Wang', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'dddd', 0, 93, N'dddddd', N'4e25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1591, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T16:08:43.157' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'4f25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1592, 297, N'KPI BY LEO E', NULL, N'Done', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T16:11:17.660' AS DateTime), NULL, NULL, N'demo 6/9', N'demo', 0, 89, N'demo 6/9', N'5025c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1593, 297, N'KPI BY LEO E', NULL, N'Done', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-17T16:18:56.150' AS DateTime), NULL, NULL, N'ddd3', N'ddd3', 0, 88, N'ddd3', N'5125c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1594, 300, NULL, NULL, N'Comment', N'/ChartPeriod/30003/1036/H/2020/1/2/remark/360/1006/Remark-on-January-', CAST(N'2020-06-18T09:33:12.767' AS DateTime), N'SHC - Sy Pham', NULL, N'Remark on January -  KPI Chart  - KPI BY LEO E - Half Year', N'vo day nao @SHC - Sy Pham', 360, 0, NULL, N'5225c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1595, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-18T11:11:57.093' AS DateTime), NULL, NULL, N'demo 6/9', N'demo 6/9', 0, 89, N'demo 6/9', N'5325c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1596, 297, N'KPI BY LEO E', NULL, N'Done', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-18T11:40:28.110' AS DateTime), NULL, NULL, N'ddd2', N'ddd2', 0, 87, N'ddd2', N'5425c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1597, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-19T07:30:38.813' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'ddd', 0, 95, N'dddd', N'5525c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1598, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-19T07:30:38.833' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'ddd', 0, 95, N'dddd', N'5625c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1599, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-19T08:24:21.877' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'demo', 0, 96, N'demo', N'5725c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1600, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-19T08:24:22.697' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'demo', 0, 96, N'demo', N'5825c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1601, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-19T11:08:18.993' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'demo attack', 0, 97, N'demo attack', N'5925c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1602, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-19T11:08:19.010' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'demo attack', 0, 97, N'demo attack', N'5a25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1603, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-19T12:12:24.607' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'demo attack 2', 0, 98, N'demo attack 2', N'5b25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1604, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-06-19T12:12:24.623' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'demo attack 2', 0, 98, N'demo attack 2', N'5c25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1605, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/371/1006/Action-Plan-on-January-', CAST(N'2020-06-19T14:39:43.100' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'demo root cause', 0, 99, N'demo root cause', N'5d25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1606, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/371/1006/Action-Plan-on-January-', CAST(N'2020-06-19T14:39:43.117' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'demo root cause', 0, 99, N'demo root cause', N'5e25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1607, 297, N'KPI BY LEO E', NULL, N'Done', N'/ChartPeriod/30003/1036/H/2020/1/2/task/371/1006/Action-Plan-on-January-', CAST(N'2020-06-19T14:41:11.257' AS DateTime), NULL, NULL, N'demo root cause', N'demo root cause', 0, 99, N'demo root cause', N'5f25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1608, 300, N'KPI BY LEO E', NULL, N'UpdateSheduleDate', N'/ChartPeriod/30003/1036/H/2020/1/2/task/371/1006/Action-Plan-on-January-', CAST(N'2020-06-19T14:41:57.393' AS DateTime), NULL, NULL, N'demo root cause', N'demo root cause', 0, 99, N'demo root cause', N'6025c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1609, 301, NULL, NULL, N'Upload', N'http://10.4.0.76:8069/#/Home/ListSubNotificationDetail/', CAST(N'2020-06-19T15:25:47.623' AS DateTime), NULL, NULL, NULL, N'You have just uploaded some KPIs.', 0, 0, N'Upload KPI Data', N'6125c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1610, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/371/1006/Action-Plan-on-January-', CAST(N'2020-06-19T15:35:28.680' AS DateTime), N'Sy Pham,90097', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'demo pic', 0, 100, N'demo pic', N'6225c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1611, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/371/1006/Action-Plan-on-January-', CAST(N'2020-06-19T15:35:28.683' AS DateTime), N'Sy Pham,90097', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'demo pic', 0, 100, N'demo pic', N'6325c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1612, 300, N'KPI BY LEO E', NULL, N'Approval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/371/1006/Action-Plan-on-January-', CAST(N'2020-06-26T08:52:20.917' AS DateTime), NULL, NULL, N'demo pic', N'demo pic', 0, 100, N'demo pic', N'6425c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1613, 300, N'KPI BY LEO E', NULL, N'Approval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/371/1006/Action-Plan-on-January-', CAST(N'2020-06-26T08:52:22.777' AS DateTime), NULL, NULL, N'demo root cause', N'demo root cause', 0, 99, N'demo root cause', N'6525c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1614, 301, NULL, NULL, N'Upload', N'http://10.10.0.34:8069/#/Home/ListSubNotificationDetail/', CAST(N'2020-07-06T09:46:31.027' AS DateTime), NULL, NULL, NULL, N'You have just uploaded some KPIs.', 0, 0, N'Upload KPI Data', N'6625c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1615, 300, N'KPI DEMO WEEK', NULL, N'Task-Auditor', N'/ChartPeriod/30005/1037/W/2020/1/53/task/372/1033/Action-Plan-on-April-', CAST(N'2020-07-06T09:51:02.883' AS DateTime), N'Sy Pham,Peter Tran', NULL, N'Action Plan on April -  KPI Chart  - KPI DEMO WEEK - Weekly', N'demo data week', 0, 101, N'demo data week', N'6725c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1616, 300, N'KPI DEMO WEEK', NULL, N'Task', N'/ChartPeriod/30005/1037/W/2020/1/53/task/372/1033/Action-Plan-on-April-', CAST(N'2020-07-06T09:51:02.890' AS DateTime), N'Sy Pham,Peter Tran', NULL, N'Action Plan on April -  KPI Chart  - KPI DEMO WEEK - Weekly', N'demo data week', 0, 101, N'demo data week', N'6825c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1617, 301, NULL, NULL, N'Upload', N'http://10.10.0.34:8069/#/Home/ListSubNotificationDetail/', CAST(N'2020-07-06T11:06:57.257' AS DateTime), NULL, NULL, NULL, N'You have just uploaded some KPIs.', 0, 0, N'Upload KPI Data', N'6925c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1618, 301, NULL, NULL, N'Upload', N'http://10.10.0.34:8069/#/Home/ListSubNotificationDetail/', CAST(N'2020-07-08T12:23:25.917' AS DateTime), NULL, NULL, NULL, N'You have just uploaded some KPIs.', 0, 0, N'Upload KPI Data', N'53f18525-dbc0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1619, 301, NULL, NULL, N'Upload', N'http://10.10.0.34:8069/#/Home/ListSubNotificationDetail/', CAST(N'2020-07-08T12:23:26.333' AS DateTime), NULL, NULL, NULL, N'You have just uploaded some KPIs.', 0, 0, N'Upload KPI Data', N'58f18525-dbc0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1620, 301, NULL, NULL, N'Upload', N'http://10.10.0.34:8069/#/Home/ListSubNotificationDetail/', CAST(N'2020-07-08T15:40:06.847' AS DateTime), NULL, NULL, NULL, N'You have just uploaded some KPIs.', 0, 0, N'Upload KPI Data', N'4293629f-f6c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1621, 297, NULL, NULL, N'Upload', N'http://10.10.0.34:8069/#/Home/ListSubNotificationDetail/', CAST(N'2020-07-08T15:46:00.043' AS DateTime), NULL, NULL, NULL, N'You have just uploaded some KPIs.', 0, 0, N'Upload KPI Data', N'd209f871-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1622, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-07-09T10:51:42.607' AS DateTime), N'Sy Pham,Peter Tran', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', NULL, 0, 115, NULL, N'1fdeb47f-97c1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1623, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-07-09T10:51:42.650' AS DateTime), N'Sy Pham,Peter Tran', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', NULL, 0, 115, NULL, N'20deb47f-97c1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1624, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-07-09T10:52:22.523' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', NULL, 0, 116, NULL, N'54617d97-97c1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1625, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-07-09T10:52:22.527' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', NULL, 0, 116, NULL, N'55617d97-97c1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1626, 300, N'KPI BY LEO E', NULL, N'Task-Auditor', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-07-09T11:13:30.300' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'demo new', 0, 117, N'demo new', N'3c021d8b-9ac1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1627, 300, N'KPI BY LEO E', NULL, N'Task', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-07-09T11:13:30.330' AS DateTime), N'Peter Tran,Sy Pham', NULL, N'Action Plan on January -  KPI Chart  - KPI BY LEO E - Half Year', N'demo new', 0, 117, N'demo new', N'3d021d8b-9ac1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1628, 301, NULL, NULL, N'Upload', N'http://10.10.0.34:8069/#/Home/ListSubNotificationDetail/', CAST(N'2020-07-09T13:44:08.193' AS DateTime), NULL, NULL, NULL, N'You have just uploaded some KPIs.', 0, 0, N'Upload KPI Data', N'af912d96-afc1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1629, 301, NULL, NULL, N'Upload', N'http://10.10.0.34:8069/#/Home/ListSubNotificationDetail/', CAST(N'2020-07-09T13:44:08.473' AS DateTime), NULL, NULL, NULL, N'You have just uploaded some KPIs.', 0, 0, N'Upload KPI Data', N'b3912d96-afc1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1630, 301, NULL, NULL, N'Upload', N'http://10.10.0.34:8069/#/Home/ListSubNotificationDetail/', CAST(N'2020-07-14T09:12:48.573' AS DateTime), NULL, NULL, NULL, N'You have just uploaded some KPIs.', 0, 0, N'Upload KPI Data', N'3b0ce582-77c5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1631, 301, NULL, NULL, N'Upload', N'http://10.10.0.34:8069/#/Home/ListSubNotificationDetail/', CAST(N'2020-07-14T09:22:27.817' AS DateTime), NULL, NULL, NULL, N'You have just uploaded some KPIs.', 0, 0, N'Upload KPI Data', N'bd032bdc-78c5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1632, 301, NULL, NULL, N'Upload', N'http://10.10.0.34:8069/#/Home/ListSubNotificationDetail/', CAST(N'2020-07-14T09:52:06.253' AS DateTime), NULL, NULL, NULL, N'You have just uploaded some KPIs.', 0, 0, N'Upload KPI Data', N'4aa43000-7dc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1633, 301, NULL, NULL, N'Upload', N'http://10.10.0.34:8069/#/Home/ListSubNotificationDetail/', CAST(N'2020-07-14T10:00:28.020' AS DateTime), NULL, NULL, NULL, N'You have just uploaded some KPIs.', 0, 0, N'Upload KPI Data', N'0f98112b-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1634, 301, NULL, NULL, N'Upload', N'http://10.10.0.34:8069/#/Home/ListSubNotificationDetail/', CAST(N'2020-07-14T10:05:30.233' AS DateTime), NULL, NULL, NULL, N'You have just uploaded some KPIs.', 0, 0, N'Upload KPI Data', N'892654df-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1635, 301, NULL, NULL, N'Upload', N'http://10.10.0.34:8069/#/Home/ListSubNotificationDetail/', CAST(N'2020-07-14T10:09:31.503' AS DateTime), NULL, NULL, NULL, N'You have just uploaded some KPIs.', 0, 0, N'Upload KPI Data', N'5339266f-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1636, 300, N'KPI BY LEO E', NULL, N'Approval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-07-17T15:19:58.867' AS DateTime), NULL, NULL, N'demo new', N'demo new', 0, 117, N'demo new', N'8c014d78-06c8-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1637, 300, N'KPI BY LEO E', NULL, N'UpdateApproval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-07-17T15:24:03.857' AS DateTime), NULL, NULL, N'demo new', N'demo new', 0, 117, N'demo new', N'88483edf-06c8-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1638, 300, N'KPI BY LEO E', NULL, N'Approval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-07-17T15:25:12.660' AS DateTime), NULL, NULL, N'demo new', N'demo new', 0, 117, N'demo new', N'46e84208-07c8-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1639, 300, N'KPI BY LEO E', NULL, N'UpdateApproval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-07-17T15:29:20.467' AS DateTime), NULL, NULL, N'demo new', N'demo new', 0, 117, N'demo new', N'772bf79b-07c8-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1640, 300, N'KPI BY LEO E', NULL, N'Approval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-07-17T15:32:54.823' AS DateTime), NULL, NULL, N'demo new', N'demo new', 0, 117, N'demo new', N'47cbb91b-08c8-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Notifications] ([ID], [UserID], [KPIName], [Period], [Action], [Link], [CreateTime], [Tag], [KPILevelCode], [Title], [Content], [CommentID], [ActionplanID], [TaskName], [rowguid]) VALUES (1641, 300, N'KPI BY LEO E', NULL, N'UpdateApproval', N'/ChartPeriod/30003/1036/H/2020/1/2/task/342/1006/Action-Plan-on-January-', CAST(N'2020-07-17T15:34:00.757' AS DateTime), NULL, NULL, N'demo new', N'demo new', 0, 117, N'demo new', N'809a0043-08c8-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[Notifications] OFF
GO
SET IDENTITY_INSERT [dbo].[OCCategories] ON 
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status], [ModifyBy], [rowguid]) VALUES (1084, 54, 35, 1, N'SHC - Swook Lu', N'6a25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status], [ModifyBy], [rowguid]) VALUES (1085, 54, 36, 1, N'SHC - Swook Lu', N'6b25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status], [ModifyBy], [rowguid]) VALUES (2084, 83, 1035, 1, N'SHC - Swook Lu', N'6c25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status], [ModifyBy], [rowguid]) VALUES (2085, 54, 1036, 1, N'Super Admin', N'6d25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status], [ModifyBy], [rowguid]) VALUES (2086, 54, 1037, 1, N'SHC - Swook Lu', N'6e25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status], [ModifyBy], [rowguid]) VALUES (2087, 73, 1039, 1, N'Super Admin', N'd462f6ba-dac0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status], [ModifyBy], [rowguid]) VALUES (2088, 73, 1040, 1, N'Super Admin', N'b488a414-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[OCCategories] ([ID], [OCID], [CategoryID], [Status], [ModifyBy], [rowguid]) VALUES (2089, 87, 1041, 1, N'SHC - Swook Lu', N'8fa8d5d4-75c5-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[OCCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[Owners] ON 
GO
INSERT [dbo].[Owners] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5273, 36, 15, NULL, NULL, CAST(N'2020-05-04T14:27:29.730' AS DateTime), 300, N'6f25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Owners] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5282, 1036, 1073, NULL, NULL, CAST(N'2020-06-22T12:12:15.400' AS DateTime), 300, N'7125c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Owners] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5284, 1039, 1146, NULL, NULL, CAST(N'2020-07-08T12:21:14.147' AS DateTime), 300, N'129206d7-dac0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Owners] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5285, 1040, 1165, NULL, NULL, CAST(N'2020-07-08T15:44:31.807' AS DateTime), 299, N'27ba653d-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Owners] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5286, 1037, 1130, NULL, NULL, CAST(N'2020-07-09T10:21:12.993' AS DateTime), 300, N'46fd353d-93c1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Owners] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5287, 1035, 1010, NULL, NULL, CAST(N'2020-07-09T13:42:45.687' AS DateTime), 300, N'a6fe0465-afc1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Owners] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5288, 1041, 1218, NULL, NULL, CAST(N'2020-07-14T09:01:22.657' AS DateTime), 300, N'f97504ea-75c5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Owners] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5289, 1041, 1237, NULL, NULL, CAST(N'2020-07-14T10:04:05.743' AS DateTime), 300, N'469bfdac-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Owners] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5290, 1041, 1256, NULL, NULL, CAST(N'2020-07-14T10:08:30.200' AS DateTime), 300, N'4c60a04a-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Owners] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5291, 1036, 1130, NULL, NULL, CAST(N'2020-07-17T12:20:02.867' AS DateTime), 300, N'a3ae402a-edc7-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Owners] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5292, 1036, 15, NULL, NULL, CAST(N'2020-07-17T12:20:14.570' AS DateTime), 300, N'71234031-edc7-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[Owners] OFF
GO
SET IDENTITY_INSERT [dbo].[Participants] ON 
GO
INSERT [dbo].[Participants] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (111, 1037, 1130, NULL, NULL, CAST(N'2020-07-09T10:21:13.137' AS DateTime), 297, N'48fd353d-93c1-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[Participants] OFF
GO
SET IDENTITY_INSERT [dbo].[Permissions] ON 
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (1, N'(SSB) Tim.Hong', NULL, N'7425c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (2, N'(SHC) Erick.Chong', NULL, N'7525c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (3, N'(SHC) Jenny.Wang', NULL, N'7625c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (4, N'(SHC) He.Lai', NULL, N'7725c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (5, N'(SHC) John.Chuang', NULL, N'7825c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (6, N'(SHC) Bj.Huang', NULL, N'7925c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (7, N'(SHC) Karen.Xu', NULL, N'7a25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (8, N'(SHC) Anita.Chien', NULL, N'7b25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (9, N'(SHC) Mel.Kuo', NULL, N'7c25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (10, N'(SHC) Nelson.Cai', NULL, N'7d25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (11, N'(SHC) Eric.Chen', NULL, N'7e25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (12, N'(CB) Johnnie.Wang', NULL, N'7f25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (13, N'(CB) Iris.Nguyen', NULL, N'8025c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (14, N'(CB) Tiffany.Lin', NULL, N'8125c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (15, N'(CB) Liang.Hui.Duan', NULL, N'8225c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (16, N'(CB) Paul.Kao', NULL, N'8325c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (17, N'(CB) Martin.Chen', NULL, N'8425c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (18, N'(CB) Kamy.Tao', NULL, N'8525c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (19, N'(CB) Lilian.Chen', NULL, N'8625c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (20, N'(CB) Ted.Chen', NULL, N'8725c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (21, N'(CB) Lili.Vong', NULL, N'8825c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (22, N'(CB) Reddy.Chandra', NULL, N'8925c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (23, N'(CB) Harry.Nguyen', NULL, N'8a25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (24, N'(CB) Vivian.Yao', NULL, N'8b25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (25, N'(SYF) Edward.Juan', NULL, N'8c25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (26, N'(SYF) Dinda.Ayu', NULL, N'8d25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (27, N'(SYF) Richard.Hsu', NULL, N'8e25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (28, N'(SYF) Hartini', NULL, N'8f25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (29, N'(SYF) Andy.Chiu', NULL, N'9025c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (30, N'(SYF) Thomas.Hung', NULL, N'9125c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (31, N'(SYF) Daniel.Chang', NULL, N'9225c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (32, N'(SYF) Jay.chang', NULL, N'9325c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (33, N'(SYF) Eny.Sulistyawati', NULL, N'9425c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (34, N'(SYF) Chris.Wang', NULL, N'9525c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (35, N'(SPC) Jacques.She', NULL, N'9625c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (36, N'(SPC) Joanna.Wu', NULL, N'9725c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (37, N'(SPC) Cathy.Ge', NULL, N'9825c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (38, N'(SPC) Jill Liao', NULL, N'9925c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (39, N'(SPC) Brian.Lee', NULL, N'9a25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (40, N'(SPC) Susan.Ren', NULL, N'9b25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (41, N'(SPC) Paul.Luo', NULL, N'9c25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (42, N'(SPC) Thet.Nyo', NULL, N'9d25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (43, N'(SPC) Janette.Sapin', NULL, N'9e25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (44, N'(SPC) Shwe.Yee', NULL, N'9f25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Permissions] ([ID], [Name], [UserID], [rowguid]) VALUES (45, N'(SPC) Jen.Ko', NULL, N'a025c773-fabf-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[Permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([ID], [Code], [Name], [rowguid]) VALUES (1, N'ADMIN', N'Admin', N'a125c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Roles] ([ID], [Code], [Name], [rowguid]) VALUES (2, N'USER', N'User', N'a225c773-fabf-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[SeenComments] ON 
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (89, 259, 300, 1, N'a325c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (90, 260, 300, 1, N'a425c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (91, 261, 300, 1, N'a525c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (92, 271, 300, 1, N'a625c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (93, 272, 300, 1, N'a725c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (94, 273, 300, 1, N'a825c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (95, 274, 300, 1, N'a925c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (96, 275, 300, 1, N'aa25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (97, 276, 300, 1, N'ab25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (98, 277, 306, 1, N'ac25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (99, 278, 300, 1, N'ad25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (100, 279, 300, 1, N'ae25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (101, 280, 306, 1, N'af25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (102, 281, 300, 1, N'b025c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (103, 282, 300, 1, N'b125c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (104, 283, 300, 1, N'b225c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (105, 284, 300, 1, N'b325c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (106, 285, 300, 1, N'b425c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (107, 286, 300, 1, N'b525c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (108, 287, 300, 1, N'b625c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (109, 288, 300, 1, N'b725c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (110, 289, 306, 1, N'b825c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (111, 290, 300, 1, N'b925c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (112, 291, 300, 1, N'ba25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (113, 292, 300, 1, N'bb25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (114, 293, 300, 1, N'bc25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (115, 294, 300, 1, N'bd25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (116, 295, 300, 1, N'be25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (117, 296, 300, 1, N'bf25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (118, 297, 300, 1, N'c025c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (119, 298, 300, 1, N'c125c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (120, 299, 300, 1, N'c225c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (121, 300, 300, 1, N'c325c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (122, 301, 300, 1, N'c425c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (123, 302, 300, 1, N'c525c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (124, 303, 300, 1, N'c625c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (125, 304, 300, 1, N'c725c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (126, 305, 300, 1, N'c825c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (127, 306, 300, 1, N'c925c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (128, 307, 300, 1, N'ca25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (129, 308, 300, 1, N'cb25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (130, 309, 300, 1, N'cc25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (131, 310, 300, 1, N'cd25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (132, 311, 300, 1, N'ce25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (133, 312, 300, 1, N'cf25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (134, 313, 300, 1, N'd025c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (135, 314, 300, 1, N'd125c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (136, 315, 300, 1, N'd225c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (137, 316, 300, 1, N'd325c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (138, 317, 297, 1, N'd425c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (139, 318, 300, 1, N'd525c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (140, 320, 300, 1, N'd625c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (141, 321, 300, 1, N'd725c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (142, 322, 300, 1, N'd825c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (143, 323, 300, 1, N'd925c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (144, 324, 300, 1, N'da25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (145, 325, 300, 1, N'db25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (146, 326, 300, 1, N'dc25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (147, 327, 300, 1, N'dd25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (148, 328, 300, 1, N'de25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (149, 329, 300, 1, N'df25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (150, 330, 300, 1, N'e025c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (151, 331, 300, 1, N'e125c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (152, 332, 300, 1, N'e225c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (153, 333, 300, 1, N'e325c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (154, 335, 300, 1, N'e425c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (155, 336, 300, 1, N'e525c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (156, 337, 300, 1, N'e625c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (157, 338, 300, 1, N'e725c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (158, 339, 300, 1, N'e825c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (159, 340, 300, 1, N'e925c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (160, 341, 300, 1, N'ea25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (161, 342, 300, 1, N'eb25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (162, 343, 300, 1, N'ec25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (163, 344, 300, 1, N'ed25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (164, 345, 300, 1, N'ee25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (165, 346, 300, 1, N'ef25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (166, 348, 300, 1, N'f025c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (167, 349, 300, 1, N'f125c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (168, 350, 300, 1, N'f225c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (169, 351, 300, 1, N'f325c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (170, 352, 300, 1, N'f425c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (171, 353, 300, 1, N'f525c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (172, 354, 300, 1, N'f625c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (173, 355, 300, 1, N'f725c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (174, 356, 300, 1, N'f825c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (175, 357, 300, 1, N'f925c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (176, 358, 300, 1, N'fa25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (177, 359, 300, 1, N'fb25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (178, 360, 300, 1, N'fc25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (179, 361, 300, 1, N'fd25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (180, 366, 300, 1, N'fe25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (181, 367, 300, 1, N'ff25c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (182, 368, 300, 1, N'0026c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (183, 369, 300, 1, N'0126c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (184, 370, 300, 1, N'0226c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (185, 371, 300, 1, N'0326c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (186, 372, 300, 1, N'0426c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (187, 373, 300, 1, N'a8651ee9-c0c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (188, 374, 300, 1, N'cf893531-c1c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[SeenComments] ([ID], [CommentID], [UserID], [Status], [rowguid]) VALUES (189, 375, 300, 1, N'2e2b535f-c1c0-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[SeenComments] OFF
GO
SET IDENTITY_INSERT [dbo].[Settings] ON 
GO
INSERT [dbo].[Settings] ([ID], [Code], [Name], [State], [CreatedTime], [rowguid]) VALUES (2, N'ADDCOMMENT', N'ADD COMMENT', 1, CAST(N'2019-11-25T00:00:00.000' AS DateTime), N'0526c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Settings] ([ID], [Code], [Name], [State], [CreatedTime], [rowguid]) VALUES (3, N'ADDTASK', N'ADDTASK', 1, CAST(N'2019-11-25T00:00:00.000' AS DateTime), N'0626c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Settings] ([ID], [Code], [Name], [State], [CreatedTime], [rowguid]) VALUES (4, N'APPROVAL', N'APPROVAL', 1, CAST(N'2019-11-25T00:00:00.000' AS DateTime), N'0726c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Settings] ([ID], [Code], [Name], [State], [CreatedTime], [rowguid]) VALUES (5, N'DONE', N'DONE', 1, CAST(N'2019-11-25T00:00:00.000' AS DateTime), N'0826c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Settings] ([ID], [Code], [Name], [State], [CreatedTime], [rowguid]) VALUES (6, N'CHECKDEADLINE', N'CHECKDEADLINE', 1, CAST(N'2019-11-25T00:00:00.000' AS DateTime), N'0926c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Settings] ([ID], [Code], [Name], [State], [CreatedTime], [rowguid]) VALUES (7, N'CHECKLATEONUPDATEDATA', N'CHECKLATEONUPDATEDATA', 1, CAST(N'2019-11-25T00:00:00.000' AS DateTime), N'0a26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Settings] ([ID], [Code], [Name], [State], [CreatedTime], [rowguid]) VALUES (10, N'MAINTAIN', N'12/24/2019 12:12 GMT', 1, CAST(N'2019-12-21T00:00:00.000' AS DateTime), N'0b26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Settings] ([ID], [Code], [Name], [State], [CreatedTime], [rowguid]) VALUES (14, N'UPDATESHEDULEDATE', N'UPDATESHEDULEDATE', 1, CAST(N'2020-06-09T00:00:00.000' AS DateTime), N'0c26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[Settings] OFF
GO
SET IDENTITY_INSERT [dbo].[Sponsors] ON 
GO
INSERT [dbo].[Sponsors] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (33, 1039, 1146, NULL, NULL, CAST(N'2020-07-08T12:21:14.193' AS DateTime), 299, N'139206d7-dac0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Sponsors] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (34, 1037, 1130, NULL, NULL, CAST(N'2020-07-09T10:21:13.070' AS DateTime), 299, N'47fd353d-93c1-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[Sponsors] OFF
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (113, 297, 259, 0, 0, 0, N'0e26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (114, 297, 260, 0, 0, 0, N'0f26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (115, 297, 261, 0, 0, 0, N'1026c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (116, 297, 269, 0, 0, 0, N'1126c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (117, 297, 270, 0, 0, 0, N'1226c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (118, 297, 271, 0, 0, 0, N'1326c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (119, 287, 272, 0, 0, 0, N'1426c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (120, 297, 273, 0, 0, 0, N'1526c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (121, 299, 273, 0, 0, 0, N'1626c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (122, 287, 274, 0, 0, 0, N'1726c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (123, 297, 275, 0, 0, 0, N'1826c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (124, 297, 276, 0, 0, 0, N'1926c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (125, 300, 277, 0, 0, 0, N'1a26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (126, 297, 278, 0, 0, 0, N'1b26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (127, 297, 279, 0, 0, 0, N'1c26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (128, 300, 280, 0, 0, 0, N'1d26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (129, 297, 281, 0, 0, 0, N'1e26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (130, 299, 281, 0, 0, 0, N'1f26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (131, 297, 282, 0, 0, 0, N'2026c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (132, 297, 283, 0, 0, 0, N'2126c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (133, 297, 284, 0, 0, 0, N'2226c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (134, 297, 285, 0, 0, 0, N'2326c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (135, 297, 286, 0, 0, 0, N'2426c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (136, 297, 287, 0, 0, 0, N'2526c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (137, 299, 287, 0, 0, 0, N'2626c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (138, 297, 288, 0, 0, 0, N'2726c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (139, 299, 288, 0, 0, 0, N'2826c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (140, 300, 289, 0, 0, 0, N'2926c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (141, 299, 290, 0, 0, 0, N'2a26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (142, 299, 291, 0, 0, 0, N'2b26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (143, 297, 292, 0, 0, 0, N'2c26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (144, 297, 293, 0, 0, 0, N'2d26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (145, 297, 294, 0, 0, 0, N'2e26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (146, 299, 295, 0, 0, 0, N'2f26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (147, 299, 296, 0, 0, 0, N'3026c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (148, 297, 297, 0, 0, 0, N'3126c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (149, 297, 298, 0, 0, 0, N'3226c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (150, 297, 299, 0, 0, 0, N'3326c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (151, 297, 300, 0, 0, 0, N'3426c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (152, 299, 301, 0, 0, 0, N'3526c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (153, 299, 302, 0, 0, 0, N'3626c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (154, 297, 303, 0, 0, 0, N'3726c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (155, 297, 304, 0, 0, 0, N'3826c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (156, 297, 305, 0, 0, 0, N'3926c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (157, 297, 306, 0, 0, 0, N'3a26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (158, 297, 307, 0, 0, 0, N'3b26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (159, 297, 308, 0, 0, 0, N'3c26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (160, 297, 309, 0, 0, 0, N'3d26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (161, 299, 0, 40, 0, 0, N'3e26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (162, 297, 310, 0, 0, 0, N'3f26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (163, 297, 0, 41, 0, 0, N'4026c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (164, 314, 0, 42, 0, 0, N'4126c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (165, 297, 0, 43, 0, 0, N'4226c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (166, 314, 0, 43, 0, 0, N'4326c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (167, 297, 311, 0, 0, 0, N'4426c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (168, 297, 0, 49, 0, 0, N'4526c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (169, 297, 0, 53, 0, 0, N'4626c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (170, 297, 0, 56, 0, 0, N'4726c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (171, 301, 0, 56, 0, 0, N'4826c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (172, 297, 0, 57, 0, 0, N'4926c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (173, 297, 312, 0, 0, 0, N'4a26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (174, 297, 313, 0, 0, 0, N'4b26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (175, 297, 314, 0, 0, 0, N'4c26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (176, 297, 0, 58, 0, 0, N'4d26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (177, 297, 315, 0, 0, 0, N'4e26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (178, 297, 0, 59, 0, 0, N'4f26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (179, 297, 0, 60, 0, 0, N'5026c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (180, 305, 0, 61, 0, 0, N'5126c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (181, 305, 0, 62, 0, 0, N'5226c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (182, 305, 0, 63, 0, 0, N'5326c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (183, 305, 0, 64, 0, 0, N'5426c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (184, 255, 0, 65, 0, 0, N'5526c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (185, 297, 0, 66, 0, 0, N'5626c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (186, 297, 0, 67, 0, 0, N'5726c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (187, 297, 0, 68, 0, 0, N'5826c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (188, 263, 0, 69, 0, 0, N'5926c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (189, 297, 316, 0, 0, 0, N'5a26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (190, 253, 0, 70, 0, 0, N'5b26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (191, 259, 0, 71, 0, 0, N'5c26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (192, 270, 0, 72, 0, 0, N'5d26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (193, 270, 0, 73, 0, 0, N'5e26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (194, 270, 0, 74, 0, 0, N'5f26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (195, 270, 0, 75, 0, 0, N'6026c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (196, 297, 0, 76, 0, 0, N'6126c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (197, 297, 0, 77, 0, 0, N'6226c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (198, 305, 0, 78, 0, 0, N'6326c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (199, 305, 0, 79, 0, 0, N'6426c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (200, 297, 0, 80, 0, 0, N'6526c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (201, 297, 0, 81, 0, 0, N'6626c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (202, 297, 0, 82, 0, 0, N'6726c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (203, 297, 0, 83, 0, 0, N'6826c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (204, 299, 317, 0, 0, 0, N'6926c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (205, 299, 320, 0, 0, 0, N'6a26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (206, 299, 321, 0, 0, 0, N'6b26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (207, 299, 324, 0, 0, 0, N'6c26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (208, 299, 325, 0, 0, 0, N'6d26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (209, 299, 327, 0, 0, 0, N'6e26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (210, 299, 329, 0, 0, 0, N'6f26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (211, 299, 330, 0, 0, 0, N'7026c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (212, 297, 331, 0, 0, 0, N'7126c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (213, 299, 331, 0, 0, 0, N'7226c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (214, 297, 332, 0, 0, 0, N'7326c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (215, 299, 332, 0, 0, 0, N'7426c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (216, 299, 333, 0, 0, 0, N'7526c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (217, 297, 335, 0, 0, 0, N'7626c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (218, 299, 335, 0, 0, 0, N'7726c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (219, 299, 336, 0, 0, 0, N'7826c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (220, 314, 336, 0, 0, 0, N'7926c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (221, 299, 337, 0, 0, 0, N'7a26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (222, 299, 338, 0, 0, 0, N'7b26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (223, 297, 339, 0, 0, 0, N'7c26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (224, 299, 339, 0, 0, 0, N'7d26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (225, 299, 340, 0, 0, 0, N'7e26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (226, 297, 341, 0, 0, 0, N'7f26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (227, 299, 341, 0, 0, 0, N'8026c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (228, 297, 342, 0, 0, 0, N'8126c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (229, 297, 0, 84, 0, 0, N'8226c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (230, 297, 0, 85, 0, 0, N'8326c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (231, 297, 343, 0, 0, 0, N'8426c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (232, 297, 0, 86, 0, 0, N'8526c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (233, 301, 0, 86, 0, 0, N'8626c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (234, 297, 0, 87, 0, 0, N'8726c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (235, 301, 0, 87, 0, 0, N'8826c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (236, 297, 0, 88, 0, 0, N'8926c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (237, 297, 0, 89, 0, 0, N'8a26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (238, 305, 0, 90, 0, 0, N'8b26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (239, 297, 0, 91, 0, 0, N'8c26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (240, 297, 0, 92, 0, 0, N'8d26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (241, 297, 344, 0, 0, 0, N'8e26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (242, 297, 345, 0, 0, 0, N'8f26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (243, 297, 350, 0, 0, 0, N'9026c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (244, 297, 352, 0, 0, 0, N'9126c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (245, 255, 0, 93, 0, 0, N'9226c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (246, 297, 360, 0, 0, 0, N'9326c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (247, 259, 0, 94, 0, 0, N'9426c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (248, 297, 0, 95, 0, 0, N'9526c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (249, 297, 0, 96, 0, 0, N'9626c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (250, 297, 0, 97, 0, 0, N'9726c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (251, 297, 0, 98, 0, 0, N'9826c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (252, 297, 0, 99, 0, 0, N'9926c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (253, 314, 0, 100, 0, 0, N'9a26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (254, 299, 0, 101, 0, 0, N'9b26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (255, 297, 0, 115, 0, 0, N'1ddeb47f-97c1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (256, 299, 0, 115, 0, 0, N'1edeb47f-97c1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (257, 297, 0, 116, 0, 0, N'53617d97-97c1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Tags] ([ID], [UserID], [CommentID], [ActionPlanID], [NotificationID], [IsUpload], [rowguid]) VALUES (258, 297, 0, 117, 0, 0, N'3b021d8b-9ac1-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
SET IDENTITY_INSERT [dbo].[Units] ON 
GO
INSERT [dbo].[Units] ([ID], [Name], [rowguid]) VALUES (1, N'Percentage', N'9c26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Units] ([ID], [Name], [rowguid]) VALUES (2, N'Numeric', N'9d26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[Units] OFF
GO
SET IDENTITY_INSERT [dbo].[Uploaders] ON 
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5290, 36, 15, NULL, NULL, CAST(N'2020-05-04T14:27:29.667' AS DateTime), 301, N'9e26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5299, 1036, 1073, NULL, NULL, CAST(N'2020-06-22T12:12:15.330' AS DateTime), 301, N'a026c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5301, 1039, 1146, NULL, NULL, CAST(N'2020-07-08T12:21:14.097' AS DateTime), 301, N'119206d7-dac0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5302, 1040, 1165, NULL, NULL, CAST(N'2020-07-08T15:44:31.763' AS DateTime), 297, N'26ba653d-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5303, 1037, 1130, NULL, NULL, CAST(N'2020-07-09T10:21:12.877' AS DateTime), 301, N'45fd353d-93c1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5304, 1035, 1010, NULL, NULL, CAST(N'2020-07-09T13:42:45.583' AS DateTime), 301, N'a5fe0465-afc1-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5305, 1041, 1218, NULL, NULL, CAST(N'2020-07-14T09:01:22.603' AS DateTime), 301, N'f87504ea-75c5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5306, 1041, 1237, NULL, NULL, CAST(N'2020-07-14T10:04:05.680' AS DateTime), 301, N'459bfdac-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5307, 1041, 1256, NULL, NULL, CAST(N'2020-07-14T10:08:30.173' AS DateTime), 301, N'4b60a04a-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5308, 1036, 1130, NULL, NULL, CAST(N'2020-07-17T12:20:02.797' AS DateTime), 301, N'a2ae402a-edc7-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Uploaders] ([ID], [CategoryID], [KPILevelID], [KPILevelCode], [CategoryCode], [CreatedTime], [UserID], [rowguid]) VALUES (5309, 1036, 15, NULL, NULL, CAST(N'2020-07-17T12:20:14.560' AS DateTime), 301, N'70234031-edc7-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[Uploaders] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (247, N'', N'admin', NULL, N'Super Admin', NULL, N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', NULL, 1, 0, 1, 0, 1, 1, 0, 0xF7A4C55DC91DA3970E449A14E94B4B88A4DDB47A7AB97CF4432B411ACFD1B71FB53611447CA927E6B7100F0A7636DDA63F90F5190B95A29ABF62F1744A435D61, 0xD0D50F883A0F0DCC332E7BBF1C1900B45364DD79F07B26C19E7DD747DB5F80B7F7352F58E944FED676DB8BAF977CE0C9CA86FA45C906422725554B71AB275326F95E58789D99518D75FFA2F8397534271186435BE333E5FB79010CA73E12592FFDB5050A146FAC9EA5812CBF577950B53669F0FC80CC3E43ABD0ABA7D4E61508, N'Super Admin', 247, NULL, N'a226c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (253, NULL, N'Tim.Hong', NULL, N'SSB - Tim
', N'Tim@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Tim.Hong', 1, 52, 2, 0, 0, 2, 0, 0x07AE2B0B5476EB1CD33C37CBED5C26DF9FF9927419CEA67ADE54885E9B3C1233F53C633DB128864D875BA043E5446C004E810D95433CFC3AA4C5CFAE2F5EFC2F, 0x7DDC675AA87401BBFE10A09B558011EA137A264F7F84EE1E367D0ED868815010E37AFB1A6DC4EA0ABD0D903A06472C8C73E76A7685347DCCB241A21264772295FC96EE3AEEBB4D1D11F680B08C9C9FC143AA169A5C40A3E3230478526E4D688358430E912D07553B14EF4D18400D6174D2F0549B3A1E9EEC30FD3785E98CBF5D, N'Super Admin', 247, NULL, N'a326c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (254, N'', N'Erick.Chong', NULL, N'SHC - Erick Chong
', N'Erick.chong@shc.ssbshoes.com', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'Erick', 1, 53, 2, 0, 0, 2, 0, 0x5ABD7D6B72A1DA61FFC7D02D5DF2B15285655E0FE355DF4BC60D171C53B2CF08CADFD622BE0254EE80D37D18FFD162FDF65F11FD43FDFCE8EEB509332F36BE23, 0x328F31633722F176EB74DEEF24DA8198B43DB493370E54FF7BB12037807B327865F83608161CDCABF0CE54AA8B0D3818EE6E4DE35DD1E2AF67CABEF5569094B10C0E0139F7044E97E762BB1E5985BF3DC6C65CBE256832E9493A64A91066A51A07A8E9D55AEC01C099444C8D04A40984DFCEF93626A801AA56192A837A7DB28E, N'Super Admin', 247, N'Super Admin', N'a426c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (255, NULL, N'Jenny.wang', NULL, N'SHC - Jenny Wang
', N'Jenny.wang@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Jenny Wang', 1, 54, 2, 0, 0, 2, 0, 0x3CF06769345B3EBDD1D766369537CA0210396EC0A63F67C0BF8F7F7924576AF30E9FB7EBC3D2169FF557227615D20CCF7780F247FE315223EA5FFCAA605B2655, 0xC9C069DDDC06751F39BC020E8F61D01717B3CA13133136C54334061E92977AACFEB209EC115C6A07A736D1A5F4F176C95E42F99515F69E5428295F4D4A5025A71BB3E8B5E1D76E956D6E2A7AEF7265836EFA1FA0E01844856DD142CAB9982D05B3484AD0980253F21EC6413958FA30759F2479829D08FE788281116461B553D4, N'Super Admin', 247, NULL, N'a526c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (256, NULL, N'He.Lai
', NULL, N'SHC - He', N'he.lai@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Leo', 1, 0, 2, 0, 0, 2, 0, 0xC21CAEDFE08CF9A5CFC3B39CD2F2041B5FC114E804C000DF647B78BB448C4D7472600D1C79BA6C17976369E54DFD4A278F54F2DCA518927CF4949B36780C6920, 0x43CED551D6867A5A7402F8FC879D73DB1B2A4CEFEFC73A99A59D286D72B7724922DB7C5C07281FB2297B089DD5B08CE08A4FE6B8F2BE13CD65728B2C0FF16EC892649B3A8BAED2A4872D7C6DEACB98026F3C7708D8D33731761694AF7B4C02DBC9B21E2B1F8187FF49DF4B0256C2CEF3A6E97C3E5F5B711B1225421DF4751BFA, N'Super Admin', 247, NULL, N'a626c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (257, NULL, N'John.chuang', NULL, N'SHC - John Chuang
', N'john.chuang@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'John Chuang', 1, 0, 2, 0, 0, 2, 0, 0x826149F3A097B93692E3D653BD315AAF447473E5FDF23DE0948976369DABFDD6D37C0A3CD5CFF14B9B9C5F2CE98168B96003176535D7CAA649CAE10DF14B70A2, 0x128D510FDA2CA535E248D4F293060EBB1EBAB69A16F7D84BA666C173ACDE67BB0ACAE5BE579D73BFEFD87BDFF8C429B95BDE0AD75BB796B2EF5E150FA46BF97188876AC55866BDB76D2912ABA16576EE36175FC401EF38C6AF520995941B247D19964A34A3482B4241A094808A1946111FC031746556496A371CA20734D3C994, N'Super Admin', 247, NULL, N'a726c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (258, NULL, N'bj.huang', NULL, N'SHC - BJ Huang
', N'bj.huang@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'BJ Huang', 1, 0, 2, 0, 0, 2, 0, 0x169220E6FB6362291CEF52D622C6732F4A457A2A11098E21E742E8E35BE505425D3C1AFA6CF8E27F00D6F5AAE4B02C773540E0A43CC94E57863ABDF2D20981D5, 0x6FB3D83036717569AA3BEB18DF4B13F0F395B69D4ECC0C5C92004A0875767B20F5E53CB1D587EB7323334AC477CCF00DC4FFECCEAC6C5CC55FD4B257CCF7325656B2BC6DBA252C5263A8B97E8B3FF819DF03D145BA22FCF4A1740D60FED7D447B2E4346A02257D46ABADEDB896BD2EA31BCBC749341293A20ED33C9D577980D2, N'Super Admin', 247, NULL, N'a826c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (259, NULL, N'karen.xu', NULL, N'SHC - Karen Xu
', N'karen.xu@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Karen Xu', 1, 0, 2, 0, 0, 2, 0, 0x01F2912F99CC9C2216F82019465E18950767350F2948E0D24800E82BC921C04EDF14FAF2989F4787F2C4929CE115B06511FD8DDC6530F7E3533048B227E50409, 0x622E370BA735D094F10330E1E141D90955BC59008F26DD1145C8B5B86641B2E1151D5E500801BF9CE90D2AAEC221BE2F5BAEED20EE9F6BDA9820E4E35AF66F21854E941B9FD8AE115334396ABB5BBC27AC4CF795D56B08E645E3179006AC7EC00D5F96092F9853CA2EEF9A7174155D4C908C8AE09DED6DBAAB897C0093C7EAB7, N'Super Admin', 247, NULL, N'a926c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (260, NULL, N'Anita.Chien', NULL, N'SHC - Anita Chien
', N'anita.chien@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Anita Chien', 1, 0, 2, 0, 0, 2, 0, 0x01066E6B7B25E7B13C3A49BC0DCBE9D327787EA7B980DC23F86720BC7A08513FFED22F7A5CA2D4DFF66C799F8FD8A8C71BD9325CC78B1E475598EBAFCA30363C, 0x7998CAFB59C31BE112D1E7D5285AEE549C9096EE4469AA1B38C1C1A2650361367B80D2FC1E61412235C5DE3F7E2F9CD96B029658C2F74D07FA68ABDF3F83E4D6A80FAA31130BC7F59A90843AD37AE144255CAE76FA80E3589E2049750A9F283F1A8EFBB4D36BBF564635CC15FD107D3730228EECEBB7DC0118D520E466EAAA78, N'Super Admin', 247, NULL, N'aa26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (261, NULL, N'Mel.Kou', NULL, N'SHC - Mel Kuo
', N'mel.kuo@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Mel Kou', 1, 0, 2, 0, 0, 2, 0, 0x349491AC965CA34A51BCF00A2F052048648628C9117E15C62EFD6EA9115C98E187C2B61F65DA6785F004001BB72661413F72778745D8DC82B9EB94E6BFA7DDF0, 0xCBA9E23D456753B116C4AD8536571FF7E943141284CFB73D400C6820AD28B02263E84F561285435C626022FACB731B96177F6A8C690A67AFDC647EC9E0D6331691B6BA4B72EEAC997EE8E31FB6BBE9BC54DC3A0EA2C5B56B3ED77988118E40FC19882F5B8FBC357ECA66972EF281BA4FC299E1A069AB5F79EFB43BBD81C9B002, N'Super Admin', 247, NULL, N'ab26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (262, NULL, N'Nelson.Cai', NULL, N'SHC - Nelson Cai
', N'nelson.cai@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Nelson Cai', 1, 0, 2, 0, 0, 2, 0, 0x886A621708D4C340C691517AD605ACB1429E27D8AFCEE8BC33250526A4B06F07B9D780173CD70C15F2582C2C0C6E3E72FBA3CCE5BC2F96B9CF370476F5E214CF, 0xC173B9BA0D781CC0733803BF3B38183DB39C96C5958F2225EF411D1196370D128E87D85AA8358451CB2E5F409638043F239802245342D16C3D8518D71BB5D2C27903C6F1685D85431AD3F1DBD8BBF6D2DDFF4AE35F44D7F7FA598752C1D09D0DCB97EDBA4E850DC406AE722D64B5E6C2C68C1703A7979ED1EB49FFDCE49D37F0, N'Super Admin', 247, NULL, N'ac26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (263, NULL, N'Eric.Chen', NULL, N'SHC - Eric Chen
', N'Eric.chen@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Eric Chen', 1, 0, 2, 0, 0, 2, 0, 0x9EF98E5E74D48B68E2D0504C739ED47F322C2018666EC164BBF37B377C9FC2C899EF37637EC26D0AD235E212B6F58E2BB4304635624D6BBD57119529D7C247B1, 0x497A7B3A15E7E2C14B334BCAFDC3325DE1F1175145927E4E89C8D04DE5BDE98DE54809F1E4E8CEE39037CD391FE6A5E64723390695DCC80029DA4E4AD53D8EFBEFA46994DC66D9F9CA6FC798874DFBAF66347919C53F15ABCFA576A0261249A08A47E563EFEFB4461EAF014CC0FE698647276083EE5CF10DB8EB9C3AA6C8250A, N'Super Admin', 247, NULL, N'ad26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (264, NULL, N'johnnie.wang', NULL, N'CB - Johnnie Wang
', N'johnnie.wang@cb.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Johnnie Wang', 1, 0, 2, 0, 0, 2, 0, 0x0D87C341EDC992CB1B423ADE879E8ADC955C27DC89F7E38545A2FB05A282598A8905CC0D82F290EF2B3AEE0B3B0033E5159F657A661946155E5828788DDB60A0, 0xEE9A2023F3D7A5AA667FE36DAE15AA72D61619A5C40C005068209E04AB89C2D554E7C54E26427857F58182B812A2A6D0AC64587DD51582CBB1E26FDED00642E778AA7385617118ACE7B846CB7B67414350735AC2634A530D4A05C5A62E48ED66882F190AD8D05BA8597770752522217E4AE843E989ED92CFCED08C9EB4D9B873, N'Super Admin', 247, NULL, N'ae26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (265, NULL, N'Iris.nguyen', NULL, N'CB - Iris Nguyen
', N'Iris.nguyen@cb.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Iris Nguyen', 1, 0, 2, 0, 0, 2, 0, 0x32868C231C7A3BE1A04E42C0BA1EE1081E9E2C2AB74D2B13470517BB9635BF1E2A55D4CFA7CF61BB4DD8418CF9BB10664A3D63C1D626FA77E7BB90EF323EEFAD, 0x0457BE99E71FE9BBB1F5017DF4533C5074DF0E2F79DFE8C64855301007B1AF3D5C5792DF5764478843DCABB5FC0110ABC355EE46024000E3AF00ECE267F9E96E435CC07A5A981DAAF9F3C4C48DC79883104DB9BD9AE644B48F14CD769ECE14DC815D8714114D5A4A5929B300B71538234CFA73A2D0A04D44ACCCEF6ACA9B2117, N'Super Admin', 247, NULL, N'af26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (266, NULL, N'tiffany.lin', NULL, N'CB - Tiffany Lin
', N'tiffany.lin@cb.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Tiffany Lin', 1, 0, 2, 0, 0, 2, 0, 0x17E13ADD39F3630F9634A0F7CB3072E6ACCD953A667DCED77A4997B6DC92A516D5A29BE9AB14DF2648592CD1FE90D13701981D56C2AD9192C656A8A9633A5658, 0xDC166617ACDD85E72452171E90EB167393E9140A52A5F18D38AA034AC82E70DD0BCAD13B12DDE4CF9218E9FE2552FB53665768D4D85355F6189F48EF9890E055B236883074847CFBB8E831E2F9397AD297EFE1D166E56C446E206CEEB0BC9BB69A9B13CD7352AF841C3533A993FA0D3C73A7567BF5400D933136B98DA45894C1, N'Super Admin', 247, NULL, N'b026c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (267, NULL, N'Lianghui.duan', NULL, N'CB - LiangHui Duan
', N'Lianghui.duan@cb.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Lianghui Duan', 1, 0, 2, 0, 0, 2, 0, 0x667A821BD6521B9D79F135C07966C58DC1B941B09B9CD431996C3A0F83E9CF88C49B58F5ABD8CF5AA4EF6E2288357392B95C6E563EDF0950982AD15AA9A65968, 0x440BFF1233121BF5BE4909DF3CE50D72F2A2117A230D678592AF34512A815FDA1DB2FA7BA461DB59DA7962934205831373929B8A09A4C328033FCF4E63084916E2B26BDF902061AA7E1AF7C0073BCCEFBFD0D542DBDB23A56295AE3676E7CB369FBF196B639D20A35A4CB12B451FDB2D202366612AD4349559777976DEFD4A80, N'Super Admin', 247, NULL, N'b126c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (268, NULL, N'Paul.Kao
', NULL, N'CB - Paul Kao
', N'paul.kao@cb.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Paul Kao', 1, 0, 2, 0, 0, 2, 0, 0x2576E99DEC06407ABBE766A3B84866E687FD97A66CCDC2C2B48AE55D9493BDA38CBD8ED1A82F5744C87191AC907FEDF1BBAF2B5E1F0B6E9C828FC3BF0AA3DD4C, 0xA0993DF475165162E10B86716C24B13C8C539098BB675BEE4CD3D58419348B34048008BBBB9B2656863D3A2AE29A34FEEF19B1342CBC7495B65FE82812E63DAD907E0258F15EBCF80CE50DF0E3C6B77FA1BFC5A007B35CF1C8361FD3B79ED574E7438ED0270821C9CF0DC4BA0458842B33CC5647C4AEBCBD8A9DEBE508A8264D, N'Super Admin', 247, NULL, N'b226c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (269, NULL, N'kamy.tao', NULL, N'CB - Kamy Tao
', N'kamy.tao@cb.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Kamy Tao', 1, 0, 2, 0, 0, 2, 0, 0x4B8D4E64E2BDC5501856E49ABB7C1BB9BFB36559A8DB34E95F039FBEB65F78DEDE654C487628BF3A733A9C7BEAD287A041B66A22EE78277D5820367216946AD7, 0x0F453286870458D8C3D245D9A6241DFB84447460970C0186B626515BDBB283757E5CF0102BEA3B749B879DAC2BE283CB341373744AAD1FD7D979851C055BDA1A3EA5A13EEEB827A30279562C84762561E62EF29D7826DD3EEDDE659D7F22B3013C128884F5F363DBE7D4B74A139013F6440CCEECD3857244C0D42BFDE975808A, N'Super Admin', 247, NULL, N'b326c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (270, NULL, N'lilian.chen', NULL, N'CB - Lilian Chen
', N'lilian.chen@cb.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Lilian Chen', 1, 0, 2, 0, 0, 2, 0, 0x884E74A4D6D4EC814265D2DFB37435B96D8ACDF4AD2DC83AEAE580374A26A501ACD850476AE3842EB47A31F10B1EB8BE92422D52410A6B5788A00DA165607773, 0x5F4789223541BBD05D7F0ACE1F6FEECEC86023A60A31F9D454E3E87D3A6BEC9DF65983EAB52CB4F8ED1C1CC732363625193B5624AC0A3F90E50C8A81F1FFA570DC5FD9F50D6BC380993AA95C6DE6992B446630432D7B1A1F28034D836F37D3D0312BB3BAF3B3D9CE5A7F307F7E64D8482CFA71C9BA43C5BD94097E566646ED42, N'Super Admin', 247, NULL, N'b426c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (271, NULL, N'ted.chen', NULL, N'CB - Ted Chen
', N'ted.chen@cb.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Ted Chen', 1, 0, 2, 0, 0, 2, 0, 0x414EF67EE875CE5C98C4269D3A9BF2A995634D52EFDF17E91E327DA3D4071128F3B3B24A87AB121161FFA13D32D20AC41A1334A2B109F80C1A15ED6F240BFB5B, 0x9F2832D7163A211C81FC84099C76923D88019C2730C01385BA49ACC917F60BF963513F3ABB6B2B6242F15E0D5BB57B6CF21E8F2699F19FA8665230D60406AE50310C4F3CE44AFC4AC1AF74A78437464A6CE34D514C8E0E444E5882443F117A9C0EC34187253886ACBE394CEAC9EECD87F5C8E0A2F10B206C16096B2D2AA177B5, N'Super Admin', 247, NULL, N'b526c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (272, NULL, N'Lili.vong', NULL, N'CB - Lili Vong
', N'Lili.vong@cb.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Lili Vong', 1, 0, 2, 0, 0, 2, 0, 0x32DD955B025D42C4A76C3E43AF083168E7205BD6E99AC633BE2545CE0C97B362443DC98675287B83A49AE2DEECD3DC4FBBB46601B84B42CF908CFC8F6AB89516, 0x06E22BE4EFB7B6F6D3BC2410AB884D729A0120E0AB141070ADF067101C2107D9B41E9B3607175461C3238120B1C3EA30F0EF3FEA8C350F9C4DC644E325D638A0ABBA18829466D40E37EEDC2CD6C505EA0694E01BD5A132EB67DB6192C4DC6A62B3F3EC7DF90FFB28749F229AE7462028DE1F7FD4E27D48B1785755BF7B79B2B5, N'Super Admin', 247, NULL, N'b626c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (273, NULL, N'Reddy.Chandra', NULL, N'CB - Reddy Chandra
', N'Reddy.Chandra@cb.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Reddy Chandra', 1, 0, 2, 0, 0, 2, 0, 0x0753A924532A6E0B1AFA433C31052D102B17F3D9B71D19E2AA37A54952FCDDD3F7FF361287C66356EA70EA3FB6007FD3D9CB3FC9DB80ABDA0807A81BA7CDA635, 0xD8C97D48817BA0ED96F50B972F7688EA5AE16630EF746858FC8949730CBFEC612B0A70CB5D4B66EC0EEA1BD3CFED9ADA6D4FA4831804887D44CE3DDA8513AA4EC8498C43DF772396F72FB3C0D4324D6D762D7FFEB93140CBA842216DE4E96C3EFEB5DB3E0C413A18E4C685B37A008FBED7F5AAFA982931E955FE863B078E81C3, N'Super Admin', 247, NULL, N'b726c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (274, NULL, N'harry.nguyen', NULL, N'CB - Harry Nguyen
', N'harry.nguyen@cb.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Harry Nguyen', 1, 0, 2, 0, 0, 2, 0, 0x3E14C281EE95AB6702CB80927F198B815E80DA7955C528E0302F64DC0EDAA302A8EE950CA742E389B437EEEF3A53B6B34FA75D9241DBA00A35EAAFE24FD4F4ED, 0x270823AC3A7B08B5A66CB935B218D33C1B3CA3BE34F97758C718F72D6F6B631A9AF58660E409059F3635ADFBF861230B643F5F739FD076B6119917E88AF2BA001AFC697D9F8EEDA52E8303F4B9D8C3D09F177F083A45362D7ABD97F79DBD14E9037797AD663032E1C865464C9AC989280F1174F94E8DE56532F1A422BE6A73E4, N'Super Admin', 247, NULL, N'b826c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (275, NULL, N'vivian.yao', NULL, N'CB - Vivian Yao
', N'vivian.yao@cb.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Vivian Yao', 1, 0, 2, 0, 0, 2, 0, 0x562D87C9FF4A1FCB485DB761E339E28288AD49922C2B07E388C8BD359986624925B4AAAC366DCDFCC1C1DF2E0BB20D38D6E425F9F3F973A62E5D92023A1F60E5, 0x64557873712DBDD8569AB25A9CDDDEF4D5C44861A1E851A426DB6ADC26D6739F2E2D700AB58B8BB1CA8FA60BD831B7F801D5F0E7720A9B924A7034DD9B356A0CEB2A641545F2535F4F5E2690C20BE1C986EC540B34B944F745A5AE0F24FB3B27B37884C04B130806696FFD65AC421D95875D05EF33243F45E2A2090178984AC1, N'Super Admin', 247, NULL, N'b926c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (276, NULL, N'Edward.Juan', NULL, N'SYF - Edward Juan', N'Edward.Juan@syf.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Edward Juan', 1, 0, 2, 0, 0, 2, 0, 0x80BE6B5430BD8236FDFF0AE7AEC91780CC3DA5A934CB3EF66277D472DBF83FB044E4D4A75D73EDB9937FE972AB19C79A09F49CA955B979BB0FF1C20C19FD121A, 0x9352A259BE185586E56FF9CDC788C758D9B8E6FC54A5DF321FDC815835CF23346520C69E63536635DA4D63FA8930529BB29A06AEC7A1C6DFAEE5D5CC16C0307F666E42E1E1140F293A45883A7ABD601D1EF9A5024C289F76991E436589274EECB6A5534E795D64B4F03EA9A1AF9C086483CA577D7401EC61566CC0C0E0C94ADB, N'Super Admin', 247, NULL, N'ba26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (277, NULL, N'dinda.ayu', NULL, N'SYF - Dinda Ayu', N'dinda.ayu@syf.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Dinda Ayu', 1, 0, 2, 0, 0, 2, 0, 0x81F059EE1C37C506566672382FB3645C0EC8F9C72FAAAE521EBA7BF8E7AA8CAF91D035B715E9119F578968D2BC1E5ED238E172B6EC0121438849FCD7D816E245, 0x6B1F4750867ADE6041563376E4DA95B86F912818AD61DAF339EB6F3747C7B3DCCAF32BE6645E751F18342A8F9B1724134AC46046CBAE7EB2654EA7E3C8A9E0E5C2FDBEAC4620779E5D5A171B7801E29136C883051273135AEB267C8C20E67C9BCDC70F1107DDA10013380014E1EC358F69298D53DC8C4C33E64C4DC710C4F267, N'Super Admin', 247, NULL, N'bb26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (278, NULL, N'richard.hsu', NULL, N'SYF - Richard Hsu', N'richard.hsu@syf.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Richard Hsu', 1, 0, 2, 0, 0, 2, 0, 0xBE78510C923CF48BDE2ED09D8583D7820259EEA5D70402F98409A649F918DE2A6F7D5D138ADBD2A682903BC7785AE31BE2704F9B6D1A984B2E06ECCD618900C2, 0x29B1C27D63B911E2C998ABA6C942B04F21F45EAB34522AE943E5E6D7FF6233AFFC98E1420607FD7C47466A3617CA5CC758DAE7EE29066855FC1B4A0AA3C2F346AAFC1C525CD793B289D4E8C3E446367EDF19734C81DB5A10DD752F55A5B9D078CB9C113203B5CD86A69CDE8F9E9C1001165DE44BB0494AD19532DCCC24CFC93A, N'Super Admin', 247, NULL, N'bc26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (279, NULL, N'thomas.hung', NULL, N'SYF - Thomas Hung', N'thomas.hung@syf.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Thomas Hung', 1, 0, 2, 0, 0, 2, 0, 0x7EE99BC86A6B252D56A64017E18E21BAFF6D9F51B82CD21D0895543434927930C1346A20952E1BAB2669ABBB629F88BF8F04498A086F998809B4514CE0B7CFA7, 0x6FA1FF7B236B7D3F8111B563A975FD49E6EBE3CDD42E66D7367DEF7BE3369A4B307B8D66E65FF0DCF4D9D0521EE0F4E8E4659412D1954F53543C8CCB1927C96ED5C93151B92601E64B2B24E003AACDA949A05B9E53441A59934D76C3063D2A9A7BD22010F5076ED63CFF0E87BAA45EAC44BC45B24E55FA5EBDCB47A63B94786F, N'Super Admin', 247, NULL, N'bd26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (280, NULL, N'daniel.chang', NULL, N'SYF - Daniel Chang', N'daniel.chang@syf.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Daniel Chang', 1, 0, 2, 0, 0, 2, 0, 0xF72252874A70830819C26AFA78D07218533E56DE5545823CC76CE7AF3D6DE1383DE733CC92481AD3342A96439FDCB80657C74B688BEBF0DE6F687E944955A6F2, 0x5F0F24758776D920E4E907573C18A23208434CB070AF3A96F34F04C213657025E6141561B8D2928380524604AC05E3054CDC71702724C2C3E525551D5D3D8B93CDF2F5F535B5099519041E00E57235A0186F04B859D6A89F88A566D44C7CB530CAAB9EC2531D50830497079A0E9CC3746C658BD57294F5582AB7B8A8D08147C7, N'Super Admin', 247, NULL, N'be26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (281, NULL, N'Hartini', NULL, N'SYF - Hartini', N'hartini@syf.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Hartini', 1, 0, 2, 0, 0, 2, 0, 0x13489658BE5D68B11740673C0025110C1D5DE103FA7888A8B94394611DCD9061FD72DC5A64D082A67C33EB25D496F65CED930FF63A092F31F67DFFC72CFD75D5, 0xA7DA0A6E3D075C383CA1BCB9403022FCA3C37F382445F39AE93486DB5BBE17D174A00A2048D485985CEA339F5D7A20EF4B00A5DCB2DADC1534B55D6EB007125C06E0860E7E72F4989F6FE87F842F21D96B49F88708C6D5888959B2EFE405B1650276E6EA165429349C0B5F781510F284922F57A3E68F12F0259DA970C6750297, N'Super Admin', 247, NULL, N'bf26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (282, NULL, N'jay.chang', NULL, N'SYF - Jay Chang', N'jay.chang@syf.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Jay Chang', 1, 0, 2, 0, 0, 2, 0, 0x78667FBA34068BC0DBA695C6194BFDE1A107771CBB8BFDEE2AE4F2B039C7B470A44EA791F33BEB49572F6656E0F8D3F5E7E3E187440B8EF0798B5140F2551A24, 0x063E0ED46699114F41E0D60983D9D1135A6DE232FB25B5D16421F7DE3D6843E720A2173772FC8814C1BB6C8BD5F48A0B4EEE8647FAF8794933D6893A13082F4554E5A5F4C44C50DFA58DC9BF53A14AB3178FB21C48188975EB8FBDE006A83B52873BF462185EB1DA0E6AAA5533EF56F5830F0F43EA7B2FA4466CDF3D07923DC0, N'Super Admin', 247, NULL, N'c026c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (283, NULL, N'andy.chiu', NULL, N'SYF - Andy Chiu', N'andy.chiu@syf.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Andy Chiu', 1, 54, 2, 0, 0, 2, 0, 0xE9DDDE2C224F0C334425EEE13914D4B3B56A2B4C7F694914E2567D1C7B41A957949DB9F779673BEDF8EA62B6C4A7A4F7F59346A08DF5BE3D69DCF4ACD5D48807, 0x5092BA9146117D1098244A463281184A423577DF8D226AC4621E93F78572D1DD97EB60F10120F3D09EDDAB42B3A847C1D7B59B2AD4954A3C37BB0D4EB99466FD14D1C171D8F6177F7FAC53A931E6C919EF41D96D92961F41093124DB2C48B2392E38E0218C38083B4FF016C4F3FD62FFF73558E1001C9D73A558B7980A7A6D90, N'Super Admin', 247, N'Super Admin', N'c126c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (284, NULL, N'eny.sulistyawati', NULL, N'SYF - Eny Sulistyawati', N'eny.sulistyawati@syf.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Eny Sulistyawati', 1, 0, 2, 0, 0, 2, 0, 0x7A566C8D11B4E6854677B25F67C479E255DF4B033C20CA6172F916C98430E5CDB1EFD0741284C51FAF961D7AC1AB11D24CF54FDB07E10AC8FD34FD4592B731FC, 0x15AF48E553B12C8157A1AAD6CC2E49728DEE987D90C74CBFFE3D8D7987BCBA7EFC7ACD4D4BF850CAD1CCF3C0C1395531432AB33C093780CDDEB621E8975D1FCAED3D62C66293A0A7327C4B3FC8F175FB77757EC0A674EA9726A005B7BEE25FC2DBDCB6989340659671C07EC71EAE5D2564B9EFD7433C1199BFF62F7A3C41B1CA, N'Super Admin', 247, NULL, N'c226c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (285, NULL, N'chris.wang', NULL, N'SYF - Chris Wang', N'chris.wang@syf.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Chris Wang', 1, 0, 2, 0, 0, 2, 0, 0xA1EEE849FB066CC3421929661D7AC1F5CAF8CBA5A5C303213FCBCBD75357999BD1808316A09EC0B24DF92FAFD6BB267EA6391C2CBEC8C524F41A933B1E1CB568, 0x4E4420EF51F9398CCEC6096FFD35B85E0DDBCA83B58B2E0B8F09AE5BB10C1CEE1A237AEE229064077B85C905D89D1FA8E7C7085D55B551E8B9025AAD50638AE0A261AEBFCD6BAA643AF83D27E88EF455B3DC814B49D29F4ABA5DA152375BA6529E2B9E68D2D0D4E568F250D7741B8B255D0D9DD9F5BE131FE0A389AD0414FE25, N'Super Admin', 247, NULL, N'c326c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (286, NULL, N'jacques.she', NULL, N'SPC - Jacques She
', N'jacques.she@spc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Jacques She', 1, 0, 2, 0, 0, 2, 0, 0x06DAC863374B3CC0E2BEE74A76A859A7809CFB28974D2D7614F754D766E7D6733676B581F91868FAC0EB5C537D5443ACF74D65BCDCE7FB6B75D9777AE15181CE, 0x0BDC435F98A3E4AA51BB24409D9DB85B7A2EE6ED0557B67B4E01755DD9847932998401E565F6F94523D91D96693FF5683F34BA3CAB9B4F4D84ED5105E545E594B09A178361693627A6F57CB32168B1BF05E207BCFC0A9FBD8C0B098E4DC1B6DA4E52B53ADBD6388615F263759D36FD052C45C4A9BBAE687F124239074933CC2D, N'Super Admin', 247, NULL, N'c426c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (287, NULL, N'Joanna.Wu', NULL, N'SPC - Joanna Wu
', N'joanna.wu@spc.ssbshoes.com', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'Joanna Wu', 1, 73, 2, 0, 0, 2, 0, 0x37C2FE2FCB43D5CEF40A417EFD1FF2505C57B721856F268CAAD033D040A14897BEE37784E51B6CD61744B21923EB822D96454AF94A458C0EDFFB3AA3E9FB4565, 0x0AA67F9FDAC05A2BB3708A8A563ABDCD3A6DB11363D74304EEAB8F1EFFEBB7C0F25176A5013CB8318B5D31E214BE8C9FB61DA8502050E74D19B40CECF6A153E9D356AAF17567CC497C0317E69B03B969C12E56FE8499249B23BB9A0C0BE8D978D9D5E1969851FE45033DFF244837211277B963F867C0D1F553E568A83E336AB2, N'Super Admin', 247, NULL, N'c526c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (288, NULL, N'cathy.ge', NULL, N'SPC - Cathy Ge
', N'cathy.ge@spc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Cathy Ge', 1, 0, 2, 0, 0, 2, 0, 0x47AFB2C364BCE97DB32BCDDCDF492F88278F47169D67116CCF85DA2B18598B94776199004D1846E45A92B480E575F8223ADC8777F0A504A2335B3B746874D031, 0xAA4B7CE5A85B5B3054B638F5F616AA9BC5EE8240DE45CCB66C68A9362C19D5C022F6E8DAB2C951A940FE26437643A02C28D364BF9510651222263932B4F824368D9D97638DD7169915843B4C92EBE01E5BAB836C4DC8DDDE23281BAAE0EB43CB04B6FDFEFCE8B369592ADA81C31204706D48696207EF56AFE780786DBDCE41DB, N'Super Admin', 247, NULL, N'c626c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (289, NULL, N'rudy.setiawan', NULL, N'SSB - Rudy Setiawan', N'rudy.setiawan@syf.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Rudy Setiawan', 1, 0, 2, 0, 0, 2, 0, 0x2792C877CF8B799CEA2D08DDB95BB93FA29486D47B1A9570B541613EF282A8534CAF8A71EC6EAD3536C0C0C1FF6BD97D3EA843F746C278D41A9B4400C910D368, 0x6A7B8E4255B54E28DA66C1CED2F3AA426DA21C5B4FC21CB36DCE501CDEFB3A7F150D6E735E04135716410FC7BA472CC5978B57E6AEE9616E96DE80167B50279AA3BF6FDB52C45D92EE2C265E251C2CA313826E92D412B307D0791CE82F579FA6203C4E31200581ABC4BFE36F804DCD647592DDB65D7683D3AFC541743FD3934A, N'Super Admin', 247, NULL, N'c726c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (290, NULL, N'brian.lee', NULL, N'SPC - Brian Lee
', N'brian.lee@spc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Brian Lee', 1, 0, 2, 0, 0, 2, 0, 0xE1CF09DD6D0895DEAD137923523FA5D6B0CD4A33A233848234161902F3A02C92FD944CEFFB5B8E4E2EE6AD4F26499C0784E36D03B078B9FF5ED6E9E4437D6E1F, 0xD91CFB560AC35A31CD0B88CC96DDFB90EEC02CA6151196229437BCE39BC6025F0EADD81B40B5FC415DBB13BD132ECD570BED91F5D7C39344D427F7FA7591666EF7AC540EDE4B060F6F0AB675A44E567E46567560A4FF1AFA7659408CC0C7CBBC5FC7D658A097D58C404C27EE2F2B509616AD5B98C44EFB21784006C050F73C03, N'Super Admin', 247, NULL, N'c826c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (291, NULL, N'susan.ren', NULL, N'SPC - Susan Ren
', N'susan.ren@spc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Susan Ren', 1, 0, 2, 0, 0, 2, 0, 0x3C8566871CF922FE0510302D5504C45AEF44E4D79C2E27A3D955C0C24845748715DEA1C99326DCE3D850693E6C0F3D17133F5EE617FB5573F9336D645EE98C58, 0x685F7164638541E2B69AB52BA8672AE3E748BAA9CD5DA389AD37F051BA0E025B823E9AA57B4399B3341B61C2831792BD0CCE4ADA89A6D456B9932AB59B40A74F773B31DB889DD97D5D75CE15F7F4A68C78BA2B46EBF91A2A6C7FC1020FC10743D25FAAF8222DFED7FDA9749A42FA924D0B64ED5AF19A699668810A87E11A94A4, N'Super Admin', 247, NULL, N'c926c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (292, NULL, N'paul.luo', NULL, N'SPC - Paul Luo
', N'paul.luo@spc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Paul Luo', 1, 0, 2, 0, 0, 2, 0, 0x78317208D95F357061F7314FF8C1ED16786600A440E7D1BCAD3E92244995E98D26D90744878D8EDC2DE5CAC98BE5C73EB0F46C2E8CC234004BB90FDBC59BA0F0, 0x8E04A8C839422D96645D8DB62A72425331A868EFA6F73496002B6B220EA45D909F136E080C5C21E3B5CA9B204174956A344C6342E9DA3673FCE3996A4B456A828816FD25EB81A4D95FE083BEAF43433B522B36D6F49E4D72AC7AF39CBC04DE8CBA03CB1CB5626DF0414D4148723CC2341987C8F5FAA31C34EBD7618C11BEA3E8, N'Super Admin', 247, NULL, N'ca26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (293, NULL, N'thet.nyo', NULL, N'SPC - Thet Nyo
', N'thet.nyo@spc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Thet Nyo', 1, 0, 2, 0, 0, 2, 0, 0x3B849C571F7155339BEFCE684E7D4929B904B54B0F99C3AEA02BA8D2695BBBEA75E799D1518A3E605F3579C699F84D5331276144AE91613D223F2670AD0F8B11, 0x37F4D2B1E94F70DA34B655E9961C094D9CA9F727E49DD50904AE9DEBA3B0F8C8C86C991FCDF6458DFAD2A1D14A4BBAFE119080D9BEB09E2E4FABD8A7372D7A103A3FCC11BFD5CAE3ED7E6E1C64931C5B90C635192B838F135691EFA82B279814CCBF23FCB9094A821F4778B88F72E5121FABA9DAB37D776705117A712AE063F5, N'Super Admin', 247, NULL, N'cb26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (294, NULL, N'janette', NULL, N'SPC - Janette Sapin
', N'janette@spc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Janette', 1, 0, 2, 0, 0, 2, 0, 0x7FD1AA69D219F4883E5420028813E59EA8D2D13DF251E888EA1467C4C490322BDCF89D50B00C34406E12C55F6DD15C81372DBB8A01A3B4D07A428473A8489189, 0xECE725C4FCA23D4C9643DD9814F3FF8223D07F9118D66434D5041F6505BDFECA4815A1F6DC0C8DA6FAB79B364B34DFB0ED6FDB6134D351B894427AB361467CF07035AC7A5250B7B9F153E014CB635F57DEF0A031BABDCA06B4A7197D276E1DB3B5D4DE5E41C937AAF49C28BEA2615A8ECF47E617C0364CA687FC03F8ED3E2427, N'Super Admin', 247, NULL, N'cc26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (295, NULL, N'Shwe.Yee
', NULL, N'SPC - Shwe Yee
', N'shwe.yee.myint@spc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Shwe Yee ', 1, 0, 2, 0, 0, 2, 0, 0xAD2C4644B7E0809104B2FE3A51F6EDAC764CBFE13A3F56534867AD65CF7C95B5002E7B8B172F4B4AA0A1C4D64BFC26D19EB37F3CFD6AB150C681A7B5F6B306D8, 0xBB3D8D43AF0204E0E107602B469CDB5D07131248EC06C8762E112A68BBBD53362B1B5760108F208621E5F8B014D04CDAD8644C3A83BA3B53207A7073915A3BB9B8EA46941C53C420123CA605D51B23333987FAB7CD9105CB00B2C4D9FC223182873D83092E8D5CC10DB3C0FE99E9B9EA7016C0456B52B7216F73BEFA0848019C, N'Super Admin', 247, NULL, N'cd26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (296, NULL, N'Jen.Ko
', NULL, N'SPC - Jen Ko
', N'jen.ko@spc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Jen Ko', 1, 0, 2, 0, 0, 2, 0, 0x8B99F3B6DC695898B477669D2CEB0E9F37F1EC26F0827054BD39CEC4569ED32C37AF98C69CF7233ECAD0A9B14C96F995EE9B8BCE6D1518D920FF950295ED1310, 0x94146405DD44DD4CEFDCA3A79055E70DDBB35C00F162F381D4541CBF9094368B61509E231408B81602DD7FE9D5B91BAAA09925FE97DBD77F1EFA3FB293EAECCBB95B7D4C46AA0976E432C5921A899ECF43B89ED8DE33CF721E0138E894A3725897AB051B7C2B3E2AB633E782CE85B06C049D3AB35E62FBEA16BA62355A74B765, N'Super Admin', 247, NULL, N'ce26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (297, NULL, N'henry', NULL, N'SHC - Sy Pham', N'Leo.Doan@shc.ssbshoes.com', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'Sy Pham', 1, 54, 2, 0, 0, 2, 0, 0xDE37C49A1ACDDA20DE1149BFE024FC5F75CD0B9DEFBFFE67DB8C2D4D478E5DF1ABC0BA4A63E1CF68067FEA11FD2F0563D056E5ADE1424946066FBBB3CFBE5E6B, 0xCFB7D77CAC277ED3F13BCD15F1E4377543E3A221A0C86286F27775D45B1B3EEA0D2820A5AA4033B38565904079A189F6440F1DF84452398A63115CB60193DA5278C10441024B4859684ABC4AF06226052B094C9A7B4433768DCFADE61FA0336A3A6B5B5B70C2BCC76845B6E9BD3D435422D6BAD62CDF19E3490CBFC5E2476D8A, N'Super Admin', 247, N'Super Admin', N'cf26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (298, NULL, N'ryan', NULL, NULL, N'Leo.Doan@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', NULL, 1, 0, 2, 0, 0, 2, 0, 0x24DE70DF75390449DB8F5D5BD02AAF1ACE7242B983526C69A09D5CF178312D78F969CD41EF446085FDFD705C5F971956D9FDEE01D76175E13B1173FB52029EB1, 0x0AACA2F070528B2C91BA63CD4B9633E8DD44E0E07B1C276F7B54A9DB6B8F0B9401CC2A863C1CF4ABD552344B5D6E7A7DEFC07A03D400EACB1275C8449794D81283EA56388F5C083D0F164C1F62461E49C8A0334C7B891E80E0319BCDB3B3328120A366DED90103AE75DC3A7C19DC4067F8470F72497F9AB99F8EBB9C628FA511, N'Super Admin', 247, NULL, N'd026c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (299, NULL, N'peter', NULL, N'SHC - Peter Tran', N'Leo.Doan@shc.ssbshoes.com', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'Peter Tran', 1, 54, 2, 0, 0, 2, 0, 0x8DBC20157EAD67225B0B53EEA1648116E9B5912FDB3105E03644BCCF1E5B37349350EE6AED35873DA14568F8E9C4050C3DD60F7294FCABE8F30F5344AAF937D5, 0x58CDC72BF864C07489B3ECF46DD267A03F4B2A23CE0EA2256E614A82EB54A95BE75E859ADF8B1F850597063577BFC00DED963949D5A4509655D7618F7E7753A745ABAA581D41406E8FBD10987C81964A5A1C60C161C74D04A5969581B51338477FE11A8538AC19639DC4E25755F31A53545B6CF7C62FFABBEC2518AFFDFF02A3, N'Super Admin', 247, N'SHC - Swook Lu', N'd126c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (300, N'', N'Swook', NULL, N'SHC - Swook Lu', N'Leo.Doan@shc.ssbshoes.com', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'Swook Lu', 1, 54, 2, 0, 0, 2, 0, 0x6CA225847E82FA06001987F89ADD29D58ADC85BA041B8200FB0E30154DC2317AE48555528405DECDB124215F5D61243220E0A888F70A585AFF829D74EE40AAA1, 0x624CE6782E0DCC2710CA723566A826BD47FE00B89057823DD4276247D8C7D41A23212904DF63DEC7B2302CF002C910CDEA33377BB9725CCDF1CAC48A33F03E9E180F2E0C092BA45E29AD13BF532D224A6CB30CE5CCA13A603EDAEB4B8E802A8B340CD791DFA10CC4BFCD287890F7FE282E93ABD46188BF59E141C5B1434A59C7, N'Super Admin', 247, N'Super Admin', N'd226c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (301, NULL, N'Irene', NULL, N'SHC - Irene', N'Leo.Doan@shc.ssbshoes.com', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'Irene ', 1, 54, 2, 0, 0, 2, 0, 0xE5ACB14B50422CEF5F6D0242D5C440B9694CA8811F5F72E7D6D40D9E246C7EF6E3BE543871421EB4222305B37A1B429779F3A74FFE3714AFB6B1F9F4E68A4F9B, 0x9BDE42980591B39470618C8DCAB9900505D715C32AF1573B564B356AEA190A2F6AAA0CD0242F959CB42E29AA0AD98BF0783197E726B873454AA0C1E1C5AC3D928475DFB5B4B137D2DD3CCADB3CA14D6383FB4E887DD0316623241405845940A5F33BC18B9FE10472089F7E55D0B29D2F2F9073378D8483ED553C6A197FD30BF0, N'Super Admin', 247, N'SHC - Swook Lu', N'd326c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (305, N'', N'Sy.Pham', NULL, N'SY PHAM', N'Leo.Doan@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'SY PHAM', 1, 0, 2, 0, 0, 2, 0, 0xA8FAA904B9968EB79EF6701261FC4E87A1B0B651214A4C20206B37A6219529A1125E94483DB6530EE31786E26258513DF38A04B36D7D037FAAB2815C0118FD41, 0x4AF2D0B4F31E8C7E6852D74531E42A68A9482FCEE596388F3DE79A07AB7528DA7968002F93F6570876A5BC4C8CF4F1899F4E21527E44280C3830B6248C5EF86FD9C2507A5DBA3A44B41B2398FA94B4C4C9F764B505E4A434D6A8FC80403BEC598B7D5B73D714B89B540221810C6C10EA55477B98185F60695E2976B27931C327, N'Super Admin', 247, NULL, N'd426c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (306, NULL, N'mei.chang', NULL, N'SHC - Mei Chang', N'Leo.Doan@shc.ssbshoes.com', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'Mei Chang', 1, 54, 2, 0, 0, 2, 0, 0xF3E9CBF648E50B1284F4509373EDABABF57183EB8FB6BADB5710B716C3DEDA0EA8F70DC2D25DCC0D2E82A416FFFD1EE5E0BA41151F96CF240946297594FCB699, 0x225CE5A740BE97CFDFA561603AED051903191EF04A3BD8B1EE1AE779D55E0A68068F918793AE1BB71A41040034633506F875ED72FB68D5C7CDFB471167DA001240D9D49F6B8490A90E8E85E91D625726BC2A5B50ED3F90050D3696A4C12DB6A723351DEB2EB3991FD350C808DE1BADA7BE39E16A20839394A12079832736956E, N'Super Admin', 247, NULL, N'd526c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (307, N'', N'cheris.chen', NULL, N'SHC - Cheris Chen', N'cheris.chen@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'Cheris Chen', 1, 0, 2, 0, 0, 2, 0, 0xB5E306141D8A9523702066ACB8EB8A11E02E5BC0E599538A12FAECB0F07D0BAB37F74551784F076C19B10498165620EDDFAFE97F6565EB51E23A9C5478AE286B, 0xE8EB033C99FA83464A869A4EB3ABAD42B77260EC915D9F3BA142EA5A576C875D5EA03BBBBE6412FD8F90F721443EB8F3558F2C85EFB02868E44088E98C90F23A7A95A7399912CCFA3CB1A56858300E2295CFC30368B33C0C32F6AB99F030D3C387171302E8D7572C851705A6E34D075AC7123EAE9806A74F7DB3BCAA48A7DD5D, N'Super Admin', 247, NULL, N'd626c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (308, N'', N'yiting.zeng', NULL, N'SHC - YiTing Zeng', N'YiTing.Zeng@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'YiTing Zeng', 1, 83, 2, 0, 1, 2, 0, 0x0007852ADDA6AC97BD7546671E16A0BDBE7C4DD9AD1B99710F937D269CA93B2C333E3C9A165613CF8836869EB4A528FD2CECC43B82D6F37DA4A16A4283D924F0, 0x5ACA813350FEC9B2D44ED854EA12A5642733A639B7089E76398761E27C054E83C1191B5D3367EE142D461C23DD160E0A6DB8C82B4F5664DD4BA8EE215E9ACCF9DE9B58B1CDB42894936F571AC3795F41FF0C20CEFCF5C840B49ED2BBB27FFD31574FF96DDEDC452C3DD26A65DA06F5C24C8F6C91D8F08A794450FA911C9B060C, N'Super Admin', 247, N'Super Admin', N'd726c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (311, N'', N'asdasdasd', N'', N'asdasd', N'asdasd@gmail.com', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'asd', 1, 0, 2, 0, 1, 2, 0, NULL, NULL, N'SHC - Swook Lu', 300, NULL, N'd826c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (312, N'', N'user by joanna', N'', N'user by joanna', N'user@shc.ssbshoes.com', N'b8deb077d9d1ff91bf774c695848f483084a554a30b605b0eb45fd0d8af0d039', N'uer', 1, 0, 2, 0, 1, 2, 0, NULL, NULL, N'SPC - Joanna Wu
', 287, NULL, N'd926c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[Users] ([ID], [Code], [Username], [Skype], [Alias], [Email], [Password], [FullName], [State], [LevelID], [Role], [TeamID], [IsActive], [Permission], [Owner], [PasswordHash], [PasswordSalt], [CreatedBy], [UserID], [ModifyBy], [rowguid]) VALUES (314, N'', N'90097', N'', N'user by Leo', N'Leo.Doan@shc.ssbshoes.com', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'90097', 1, 53, 2, 0, 1, 2, 0, 0x81F38CCE62E3B51A394ED2AF1041DE421254C75B1DE6C502CF6F6FAEFDFC95B30DE77AE1CB78D4090E505D8D2955945FDF5E440C1467F422C50F1FE96BD5B902, 0x5942339129D48B98FF654AD6CE2667B48624B45E24A88B43F24A1139377373DB08E95EFFA05A7C45A269F665B0517607775754AAA8591727144562ECB4F284B48EFA09DFD7B822E6312668168EA4A729AA41D73CD981B2BB24C69F441D4B8633BA14F8759610640543920733948095B7AE7A107174D13F156F25C6183AFFCF47, N'SHC - Swook Lu', 300, N'Super Admin', N'da26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkingPlans] ON 
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime], [rowguid]) VALUES (91, N'30001W', N'demo upload', CAST(N'2020-04-29T14:06:54.8227684' AS DateTime2), N'db26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime], [rowguid]) VALUES (92, N'30001H', N'demo half', CAST(N'2020-04-29T15:01:31.2571535' AS DateTime2), N'dc26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime], [rowguid]) VALUES (1091, N'40002H', N'demo by swook', CAST(N'2020-05-04T10:24:15.3345202' AS DateTime2), N'dd26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime], [rowguid]) VALUES (1092, N'30003H', N'25/5/2020', CAST(N'2020-05-25T10:04:48.8762602' AS DateTime2), N'de26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime], [rowguid]) VALUES (1093, N'30005W', N'demo data week', CAST(N'2020-07-06T09:42:08.0455483' AS DateTime2), N'df26c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime], [rowguid]) VALUES (1094, N'30005Q', N'demo data quater', CAST(N'2020-07-06T11:04:14.7067009' AS DateTime2), N'e026c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime], [rowguid]) VALUES (1095, N'30005Y', N'demo data yearly', CAST(N'2020-07-06T11:04:55.3566343' AS DateTime2), N'e126c773-fabf-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime], [rowguid]) VALUES (1096, N'3F030004M', N'Not avaiable! demo ', CAST(N'2020-07-08T12:19:41.9533422' AS DateTime2), N'6f321ba0-dac0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime], [rowguid]) VALUES (1097, N'30003M', N'Not avaiable!', CAST(N'2020-07-08T15:34:21.3387110' AS DateTime2), N'70fe93d1-f5c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime], [rowguid]) VALUES (1098, N'30002M', N'Not avaiable!', CAST(N'2020-07-08T15:34:37.1618250' AS DateTime2), N'9f50fdda-f5c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime], [rowguid]) VALUES (1099, N'30001M', N'Not avaiable!', CAST(N'2020-07-08T15:34:48.2430693' AS DateTime2), N'f0b599e1-f5c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime], [rowguid]) VALUES (1100, N'30005M', N'Not avaiable!', CAST(N'2020-07-08T15:34:56.5028183' AS DateTime2), N'f1b599e1-f5c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime], [rowguid]) VALUES (1101, N'3F030006Q', N'Not avaiable!', CAST(N'2020-07-08T15:43:43.4451480' AS DateTime2), N'2fc99720-f7c0-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime], [rowguid]) VALUES (1102, N'4C140007M', N'Not avaiable!', CAST(N'2020-07-14T09:01:01.3372852' AS DateTime2), N'7d985cdd-75c5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime], [rowguid]) VALUES (1103, N'4C140007Q', N'Not avaiable!', CAST(N'2020-07-14T09:48:57.3991829' AS DateTime2), N'2c67a58f-7cc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime], [rowguid]) VALUES (1104, N'4C140007H', N'Not avaiable!', CAST(N'2020-07-14T09:58:31.2587756' AS DateTime2), N'd449ace5-7dc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime], [rowguid]) VALUES (1105, N'4C140008Q', N'Not avaiable!', CAST(N'2020-07-14T10:03:40.9329999' AS DateTime2), N'acc43b9e-7ec5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime], [rowguid]) VALUES (1106, N'4C140009Q', N'Not avaiable!', CAST(N'2020-07-14T10:08:12.0599789' AS DateTime2), N'4085d43f-7fc5-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime], [rowguid]) VALUES (1107, N'40003M', N'Not avaiable!', CAST(N'2020-07-17T12:22:24.6165348' AS DateTime2), N'06e6c77e-edc7-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime], [rowguid]) VALUES (1108, N'3F020003M', N'Not avaiable!', CAST(N'2020-07-17T13:57:07.6051252' AS DateTime2), N'03a01fba-fac7-ea11-8313-1c1b0dc54b21')
GO
INSERT [dbo].[WorkingPlans] ([ID], [Code], [Content], [CreatedTime], [rowguid]) VALUES (1109, N'3F030003M', N'Not avaiable!', CAST(N'2020-07-17T13:57:26.0345442' AS DateTime2), N'd82d15c5-fac7-ea11-8313-1c1b0dc54b21')
GO
SET IDENTITY_INSERT [dbo].[WorkingPlans] OFF
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [MSmerge_df_rowguid_3B7B4A17D1014280B43CA5FAED223349]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[ActionPlanDetails] ADD  CONSTRAINT [MSmerge_df_rowguid_9D5D7DC2D5784EB6A6E4322A4D2AA168]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[ActionPlans] ADD  CONSTRAINT [MSmerge_df_rowguid_FB2559774C374D449F6813213FCCC2F3]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [MSmerge_df_rowguid_09EDC76E47D4432D89D70409ABA1A9D6]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[CategoryKPILevels] ADD  CONSTRAINT [MSmerge_df_rowguid_F56A8415C09C4EEDBBDFF626DEF696F6]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[CategoryLangs] ADD  CONSTRAINT [MSmerge_df_rowguid_23FB51EE575340EAB3812EE7F6EAB527]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Comments] ADD  CONSTRAINT [MSmerge_df_rowguid_4DF354D5FBF840D187AB1BDE3C58540D]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Data] ADD  CONSTRAINT [MSmerge_df_rowguid_A24BDD319A9748B9B1E81CAF78617CBD]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Datas] ADD  CONSTRAINT [MSmerge_df_rowguid_26BEBEF6432A499B84AFE0C295F8FAB6]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[ErrorMessages] ADD  CONSTRAINT [MSmerge_df_rowguid_76247101C6F9477DA49AFDD5DD982679]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Favourites] ADD  CONSTRAINT [MSmerge_df_rowguid_FB8386716366489F802CCD4B6A1BA2F1]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[HistoryActionPlans] ADD  CONSTRAINT [MSmerge_df_rowguid_7D209B7856FB476FBB960E31BD27D066]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[JobType] ADD  CONSTRAINT [MSmerge_df_rowguid_E0CF3825D5D34B118E2E26AC9D4E6CD2]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[KPILangs] ADD  CONSTRAINT [MSmerge_df_rowguid_E23BB829670843E5B8F1CBB993499AF0]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[KPILevels] ADD  CONSTRAINT [MSmerge_df_rowguid_FC1896921C644EFF8C129C6A50BA967B]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[KPIs] ADD  CONSTRAINT [MSmerge_df_rowguid_5E8615B432C8469AB256D21F14D13659]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[LateOnUpLoads] ADD  CONSTRAINT [MSmerge_df_rowguid_F190F378354349179ED58A73B9477BD7]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Levels] ADD  CONSTRAINT [MSmerge_df_rowguid_1C2B96D365B147EF902D59B0C02F4284]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Manager] ADD  CONSTRAINT [MSmerge_df_rowguid_F593C1071C774C34A3E4DB18630DAB9F]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Managers] ADD  CONSTRAINT [MSmerge_df_rowguid_6ED3CF4F7FF9427E9AF118081FEBF749]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[MenuLangs] ADD  CONSTRAINT [MSmerge_df_rowguid_401F3B9D4DC047E79D7F0CB28F81EEB0]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[MenuRoles] ADD  CONSTRAINT [MSmerge_df_rowguid_B00DCF6413AC4F08AA4FE9BCF13495DD]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Menus] ADD  CONSTRAINT [MSmerge_df_rowguid_B6FEC7A57C614C14B54BF6791451B602]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[NotificationDetails] ADD  CONSTRAINT [MSmerge_df_rowguid_C0C7025BCBEF484AA7F2F59437ABF830]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Notifications] ADD  CONSTRAINT [MSmerge_df_rowguid_FB2A174F8E88423CBD64195114046225]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[OCCategories] ADD  CONSTRAINT [MSmerge_df_rowguid_B268778B512241448D2256F1973942F3]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[OCs] ADD  CONSTRAINT [MSmerge_df_rowguid_F418F53579DF4A0DA1804FBFB0AD9F78]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Owners] ADD  CONSTRAINT [MSmerge_df_rowguid_7B9CC192A56A4B9C9D6C8E87904E0112]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Participants] ADD  CONSTRAINT [MSmerge_df_rowguid_88F6B44E0FCC4C8BA94AECDC203E9F8B]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Permissions] ADD  CONSTRAINT [MSmerge_df_rowguid_09EDF562DE0D4DAC8BD8CC3511894DA0]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [MSmerge_df_rowguid_2ACBD467EC7442B7A107670FE82933FA]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[SeenComments] ADD  CONSTRAINT [MSmerge_df_rowguid_DDB651F71E6947CAA585DBB35683C665]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Settings] ADD  CONSTRAINT [MSmerge_df_rowguid_7182C150CD11436482436ED1074A22FC]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Sponsors] ADD  CONSTRAINT [MSmerge_df_rowguid_127D5E7863934139B8F3A9980F013C12]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[StateSendMails] ADD  CONSTRAINT [MSmerge_df_rowguid_CC6C35AA231E468AACFA735DED0CCCCD]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Tags] ADD  CONSTRAINT [MSmerge_df_rowguid_AD17C21429604375AD798D46FBF44987]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Task] ADD  CONSTRAINT [MSmerge_df_rowguid_701B6A36BCC3400985B32A965AE28942]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[TeamMember] ADD  CONSTRAINT [MSmerge_df_rowguid_BC959CC676FE4A6AAB8993D664BA9B0F]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Units] ADD  CONSTRAINT [MSmerge_df_rowguid_5F8AD93833DA425DACA34738FACDE7EE]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Uploaders] ADD  CONSTRAINT [MSmerge_df_rowguid_8E935844E8144B4EBAC21B20C97A6CAE]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [MSmerge_df_rowguid_F5CCF140EA41447CAF7253E1F2CDABBA]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[WorkingPlans] ADD  CONSTRAINT [MSmerge_df_rowguid_9D5DFDE78E69475882780A5F366333DC]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Accounts]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_21CC4100_D67C_4F06_ACFF_427A0DB5FE92] CHECK NOT FOR REPLICATION (([ID]>=(1) AND [ID]<=(1001) OR [ID]>(1001) AND [ID]<=(2001)))
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [repl_identity_range_21CC4100_D67C_4F06_ACFF_427A0DB5FE92]
GO
ALTER TABLE [dbo].[ActionPlanDetails]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_90DDA067_0AB3_467F_8F3A_975AE2D616E5] CHECK NOT FOR REPLICATION (([ID]>(89) AND [ID]<=(1089) OR [ID]>(1089) AND [ID]<=(2089)))
GO
ALTER TABLE [dbo].[ActionPlanDetails] CHECK CONSTRAINT [repl_identity_range_90DDA067_0AB3_467F_8F3A_975AE2D616E5]
GO
ALTER TABLE [dbo].[ActionPlans]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_18D7F0C4_6BC4_4CE7_B7F0_6791B2DFAFC5] CHECK NOT FOR REPLICATION (([ID]>(114) AND [ID]<=(1114) OR [ID]>(1114) AND [ID]<=(2114)))
GO
ALTER TABLE [dbo].[ActionPlans] CHECK CONSTRAINT [repl_identity_range_18D7F0C4_6BC4_4CE7_B7F0_6791B2DFAFC5]
GO
ALTER TABLE [dbo].[Categories]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_622CCE34_733D_4EB0_8960_772DCDBDA680] CHECK NOT FOR REPLICATION (([ID]>(1037) AND [ID]<=(2037) OR [ID]>(2037) AND [ID]<=(3037)))
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [repl_identity_range_622CCE34_733D_4EB0_8960_772DCDBDA680]
GO
ALTER TABLE [dbo].[CategoryKPILevels]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_0C93B0CC_9FF9_4957_964D_62A064C5EF3C] CHECK NOT FOR REPLICATION (([ID]>(5152) AND [ID]<=(6152) OR [ID]>(6152) AND [ID]<=(7152)))
GO
ALTER TABLE [dbo].[CategoryKPILevels] CHECK CONSTRAINT [repl_identity_range_0C93B0CC_9FF9_4957_964D_62A064C5EF3C]
GO
ALTER TABLE [dbo].[CategoryLangs]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_4BEB0486_5ED1_4BD6_A6E9_982FEBA8603F] CHECK NOT FOR REPLICATION (([ID]>(1102) AND [ID]<=(2102) OR [ID]>(2102) AND [ID]<=(3102)))
GO
ALTER TABLE [dbo].[CategoryLangs] CHECK CONSTRAINT [repl_identity_range_4BEB0486_5ED1_4BD6_A6E9_982FEBA8603F]
GO
ALTER TABLE [dbo].[Comments]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_E4B127DF_3DC8_4947_925F_6020F20059E1] CHECK NOT FOR REPLICATION (([ID]>(372) AND [ID]<=(1372) OR [ID]>(1372) AND [ID]<=(2372)))
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [repl_identity_range_E4B127DF_3DC8_4947_925F_6020F20059E1]
GO
ALTER TABLE [dbo].[Data]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_3089D8F5_6E25_4697_B18C_6C503D8FFBAB] CHECK NOT FOR REPLICATION (([ID]>=(1) AND [ID]<=(1001) OR [ID]>(1001) AND [ID]<=(2001)))
GO
ALTER TABLE [dbo].[Data] CHECK CONSTRAINT [repl_identity_range_3089D8F5_6E25_4697_B18C_6C503D8FFBAB]
GO
ALTER TABLE [dbo].[Datas]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_B831B1DC_C4B6_40E3_AE4E_5263FAC007C9] CHECK NOT FOR REPLICATION (([ID]>(1050) AND [ID]<=(2050) OR [ID]>(2050) AND [ID]<=(3050)))
GO
ALTER TABLE [dbo].[Datas] CHECK CONSTRAINT [repl_identity_range_B831B1DC_C4B6_40E3_AE4E_5263FAC007C9]
GO
ALTER TABLE [dbo].[ErrorMessages]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_B03F82C2_7FA1_461A_BACB_3FAFE36197B7] CHECK NOT FOR REPLICATION (([ID]>(121) AND [ID]<=(1121) OR [ID]>(1121) AND [ID]<=(2121)))
GO
ALTER TABLE [dbo].[ErrorMessages] CHECK CONSTRAINT [repl_identity_range_B03F82C2_7FA1_461A_BACB_3FAFE36197B7]
GO
ALTER TABLE [dbo].[Favourites]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_BC1353F8_B34E_4CD1_8022_C55408D487FC] CHECK NOT FOR REPLICATION (([ID]>(19) AND [ID]<=(1019) OR [ID]>(1019) AND [ID]<=(2019)))
GO
ALTER TABLE [dbo].[Favourites] CHECK CONSTRAINT [repl_identity_range_BC1353F8_B34E_4CD1_8022_C55408D487FC]
GO
ALTER TABLE [dbo].[HistoryActionPlans]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_FAED44EF_22C3_46C9_828B_B8E22F349DB9] CHECK NOT FOR REPLICATION (([ID]>(37) AND [ID]<=(1037) OR [ID]>(1037) AND [ID]<=(2037)))
GO
ALTER TABLE [dbo].[HistoryActionPlans] CHECK CONSTRAINT [repl_identity_range_FAED44EF_22C3_46C9_828B_B8E22F349DB9]
GO
ALTER TABLE [dbo].[KPILangs]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_7DD17A85_544B_403F_A404_6C848E87D719] CHECK NOT FOR REPLICATION (([ID]>(1182) AND [ID]<=(2182) OR [ID]>(2182) AND [ID]<=(3182)))
GO
ALTER TABLE [dbo].[KPILangs] CHECK CONSTRAINT [repl_identity_range_7DD17A85_544B_403F_A404_6C848E87D719]
GO
ALTER TABLE [dbo].[KPILevels]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_DF884DAC_E277_4383_B37A_FB3B8E3F588F] CHECK NOT FOR REPLICATION (([ID]>(1134) AND [ID]<=(2134) OR [ID]>(2134) AND [ID]<=(3134)))
GO
ALTER TABLE [dbo].[KPILevels] CHECK CONSTRAINT [repl_identity_range_DF884DAC_E277_4383_B37A_FB3B8E3F588F]
GO
ALTER TABLE [dbo].[KPIs]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_42C02D06_07AC_4DAF_86E7_32B27E585FDC] CHECK NOT FOR REPLICATION (([ID]>(2104) AND [ID]<=(3104) OR [ID]>(3104) AND [ID]<=(4104)))
GO
ALTER TABLE [dbo].[KPIs] CHECK CONSTRAINT [repl_identity_range_42C02D06_07AC_4DAF_86E7_32B27E585FDC]
GO
ALTER TABLE [dbo].[LateOnUpLoads]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_87073AB7_6FCA_47BE_83ED_C86FAFFA2BB6] CHECK NOT FOR REPLICATION (([ID]>(113) AND [ID]<=(1113) OR [ID]>(1113) AND [ID]<=(2113)))
GO
ALTER TABLE [dbo].[LateOnUpLoads] CHECK CONSTRAINT [repl_identity_range_87073AB7_6FCA_47BE_83ED_C86FAFFA2BB6]
GO
ALTER TABLE [dbo].[Levels]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_348CE363_2A86_41A7_A7FA_71B5D073591C] CHECK NOT FOR REPLICATION (([ID]>(98) AND [ID]<=(1098) OR [ID]>(1098) AND [ID]<=(2098)))
GO
ALTER TABLE [dbo].[Levels] CHECK CONSTRAINT [repl_identity_range_348CE363_2A86_41A7_A7FA_71B5D073591C]
GO
ALTER TABLE [dbo].[Manager]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_0034940B_F087_492B_A52E_AF8F1E7C2CBD] CHECK NOT FOR REPLICATION (([ID]>=(1) AND [ID]<=(1001) OR [ID]>(1001) AND [ID]<=(2001)))
GO
ALTER TABLE [dbo].[Manager] CHECK CONSTRAINT [repl_identity_range_0034940B_F087_492B_A52E_AF8F1E7C2CBD]
GO
ALTER TABLE [dbo].[Managers]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_64B8980C_C240_44AB_9A0E_95994CAEC975] CHECK NOT FOR REPLICATION (([ID]>(5293) AND [ID]<=(6293) OR [ID]>(6293) AND [ID]<=(7293)))
GO
ALTER TABLE [dbo].[Managers] CHECK CONSTRAINT [repl_identity_range_64B8980C_C240_44AB_9A0E_95994CAEC975]
GO
ALTER TABLE [dbo].[MenuLangs]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_0308FF80_79E6_4448_8757_ED4816DA07D6] CHECK NOT FOR REPLICATION (([ID]>(46) AND [ID]<=(1046) OR [ID]>(1046) AND [ID]<=(2046)))
GO
ALTER TABLE [dbo].[MenuLangs] CHECK CONSTRAINT [repl_identity_range_0308FF80_79E6_4448_8757_ED4816DA07D6]
GO
ALTER TABLE [dbo].[Menus]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_0150C664_1752_4540_9E07_C81CCCA9148D] CHECK NOT FOR REPLICATION (([ID]>(22) AND [ID]<=(1022) OR [ID]>(1022) AND [ID]<=(2022)))
GO
ALTER TABLE [dbo].[Menus] CHECK CONSTRAINT [repl_identity_range_0150C664_1752_4540_9E07_C81CCCA9148D]
GO
ALTER TABLE [dbo].[NotificationDetails]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_F8C68EDA_C8F2_47A1_9776_014EC59D5074] CHECK NOT FOR REPLICATION (([ID]>(810) AND [ID]<=(1810) OR [ID]>(1810) AND [ID]<=(2810)))
GO
ALTER TABLE [dbo].[NotificationDetails] CHECK CONSTRAINT [repl_identity_range_F8C68EDA_C8F2_47A1_9776_014EC59D5074]
GO
ALTER TABLE [dbo].[Notifications]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_057143EB_8DDB_41EF_84BA_0CF986295DDA] CHECK NOT FOR REPLICATION (([ID]>(1617) AND [ID]<=(2617) OR [ID]>(2617) AND [ID]<=(3617)))
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [repl_identity_range_057143EB_8DDB_41EF_84BA_0CF986295DDA]
GO
ALTER TABLE [dbo].[OCCategories]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_898A83DA_086F_457E_885E_0168566D8445] CHECK NOT FOR REPLICATION (([ID]>(2086) AND [ID]<=(3086) OR [ID]>(3086) AND [ID]<=(4086)))
GO
ALTER TABLE [dbo].[OCCategories] CHECK CONSTRAINT [repl_identity_range_898A83DA_086F_457E_885E_0168566D8445]
GO
ALTER TABLE [dbo].[OCs]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_1A196E52_8D0E_4F31_891C_AF1E824A15DD] CHECK NOT FOR REPLICATION (([ID]>=(1) AND [ID]<=(1001) OR [ID]>(1001) AND [ID]<=(2001)))
GO
ALTER TABLE [dbo].[OCs] CHECK CONSTRAINT [repl_identity_range_1A196E52_8D0E_4F31_891C_AF1E824A15DD]
GO
ALTER TABLE [dbo].[Owners]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_A78D592D_FD4A_48B9_B4C4_D8070251455F] CHECK NOT FOR REPLICATION (([ID]>(5283) AND [ID]<=(6283) OR [ID]>(6283) AND [ID]<=(7283)))
GO
ALTER TABLE [dbo].[Owners] CHECK CONSTRAINT [repl_identity_range_A78D592D_FD4A_48B9_B4C4_D8070251455F]
GO
ALTER TABLE [dbo].[Participants]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_76C04398_C0D1_4CB0_9833_5139A97694C3] CHECK NOT FOR REPLICATION (([ID]>(110) AND [ID]<=(1110) OR [ID]>(1110) AND [ID]<=(2110)))
GO
ALTER TABLE [dbo].[Participants] CHECK CONSTRAINT [repl_identity_range_76C04398_C0D1_4CB0_9833_5139A97694C3]
GO
ALTER TABLE [dbo].[Permissions]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_55F1CD63_9DAE_4D92_BF01_F063A93F8B87] CHECK NOT FOR REPLICATION (([ID]>(45) AND [ID]<=(1045) OR [ID]>(1045) AND [ID]<=(2045)))
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [repl_identity_range_55F1CD63_9DAE_4D92_BF01_F063A93F8B87]
GO
ALTER TABLE [dbo].[Roles]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_8A4AEB60_18AC_46AB_AB79_40665CEE7671] CHECK NOT FOR REPLICATION (([ID]>(2) AND [ID]<=(1002) OR [ID]>(1002) AND [ID]<=(2002)))
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [repl_identity_range_8A4AEB60_18AC_46AB_AB79_40665CEE7671]
GO
ALTER TABLE [dbo].[SeenComments]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_45610CE9_5D36_4032_A45A_D42F7B436520] CHECK NOT FOR REPLICATION (([ID]>(186) AND [ID]<=(1186) OR [ID]>(1186) AND [ID]<=(2186)))
GO
ALTER TABLE [dbo].[SeenComments] CHECK CONSTRAINT [repl_identity_range_45610CE9_5D36_4032_A45A_D42F7B436520]
GO
ALTER TABLE [dbo].[Settings]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_1D6130AC_B30E_4DCD_87A8_0AF80B8BF1A0] CHECK NOT FOR REPLICATION (([ID]>(14) AND [ID]<=(1014) OR [ID]>(1014) AND [ID]<=(2014)))
GO
ALTER TABLE [dbo].[Settings] CHECK CONSTRAINT [repl_identity_range_1D6130AC_B30E_4DCD_87A8_0AF80B8BF1A0]
GO
ALTER TABLE [dbo].[Sponsors]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_A6BEFEDF_2DB9_4DCD_AEBB_BF02F33E3E9F] CHECK NOT FOR REPLICATION (([ID]>(32) AND [ID]<=(1032) OR [ID]>(1032) AND [ID]<=(2032)))
GO
ALTER TABLE [dbo].[Sponsors] CHECK CONSTRAINT [repl_identity_range_A6BEFEDF_2DB9_4DCD_AEBB_BF02F33E3E9F]
GO
ALTER TABLE [dbo].[StateSendMails]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_48F5E913_EFD8_4D82_B221_F9396B89079B] CHECK NOT FOR REPLICATION (([ID]>(3014) AND [ID]<=(4014) OR [ID]>(4014) AND [ID]<=(5014)))
GO
ALTER TABLE [dbo].[StateSendMails] CHECK CONSTRAINT [repl_identity_range_48F5E913_EFD8_4D82_B221_F9396B89079B]
GO
ALTER TABLE [dbo].[Tags]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_BF286C72_F5D2_466E_8A0A_74B475B72980] CHECK NOT FOR REPLICATION (([ID]>(254) AND [ID]<=(1254) OR [ID]>(1254) AND [ID]<=(2254)))
GO
ALTER TABLE [dbo].[Tags] CHECK CONSTRAINT [repl_identity_range_BF286C72_F5D2_466E_8A0A_74B475B72980]
GO
ALTER TABLE [dbo].[Task]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_1D09D286_7308_43D0_98DB_0FD82E15444A] CHECK NOT FOR REPLICATION (([ID]>=(1) AND [ID]<=(1001) OR [ID]>(1001) AND [ID]<=(2001)))
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [repl_identity_range_1D09D286_7308_43D0_98DB_0FD82E15444A]
GO
ALTER TABLE [dbo].[TeamMember]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_CEBDB227_E5E9_4B27_A6D0_DF5B225AB979] CHECK NOT FOR REPLICATION (([ID]>=(1) AND [ID]<=(1001) OR [ID]>(1001) AND [ID]<=(2001)))
GO
ALTER TABLE [dbo].[TeamMember] CHECK CONSTRAINT [repl_identity_range_CEBDB227_E5E9_4B27_A6D0_DF5B225AB979]
GO
ALTER TABLE [dbo].[Units]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_F9C99AC6_99B5_4D52_8060_A71EF05F893B] CHECK NOT FOR REPLICATION (([ID]>(2) AND [ID]<=(1002) OR [ID]>(1002) AND [ID]<=(2002)))
GO
ALTER TABLE [dbo].[Units] CHECK CONSTRAINT [repl_identity_range_F9C99AC6_99B5_4D52_8060_A71EF05F893B]
GO
ALTER TABLE [dbo].[Uploaders]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_F6A99E6C_1ACB_4CA4_9F5F_0992EC41A393] CHECK NOT FOR REPLICATION (([ID]>(5300) AND [ID]<=(6300) OR [ID]>(6300) AND [ID]<=(7300)))
GO
ALTER TABLE [dbo].[Uploaders] CHECK CONSTRAINT [repl_identity_range_F6A99E6C_1ACB_4CA4_9F5F_0992EC41A393]
GO
ALTER TABLE [dbo].[Users]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_9C73E9B4_1CB4_4F86_9758_CECB1FBC3B5E] CHECK NOT FOR REPLICATION (([ID]>(314) AND [ID]<=(1314) OR [ID]>(1314) AND [ID]<=(2314)))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [repl_identity_range_9C73E9B4_1CB4_4F86_9758_CECB1FBC3B5E]
GO
ALTER TABLE [dbo].[WorkingPlans]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_556E3CD5_77B9_44B1_830D_8031176B8DA6] CHECK NOT FOR REPLICATION (([ID]>(1095) AND [ID]<=(2095) OR [ID]>(2095) AND [ID]<=(3095)))
GO
ALTER TABLE [dbo].[WorkingPlans] CHECK CONSTRAINT [repl_identity_range_556E3CD5_77B9_44B1_830D_8031176B8DA6]
GO
