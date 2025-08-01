USE [master]
GO
/****** Object:  Database [wang_inmuebles]    Script Date: 19/06/2025 04:42:33 p. m. ******/
CREATE DATABASE [wang_inmuebles]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'wang_inmuebles_Data', FILENAME = N'c:\dzsqls\wang_inmuebles.mdf' , SIZE = 8192KB , MAXSIZE = 30720KB , FILEGROWTH = 22528KB )
 LOG ON 
( NAME = N'wang_inmuebles_Logs', FILENAME = N'c:\dzsqls\wang_inmuebles.ldf' , SIZE = 8192KB , MAXSIZE = 30720KB , FILEGROWTH = 22528KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [wang_inmuebles] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [wang_inmuebles].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [wang_inmuebles] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [wang_inmuebles] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [wang_inmuebles] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [wang_inmuebles] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [wang_inmuebles] SET ARITHABORT OFF 
GO
ALTER DATABASE [wang_inmuebles] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [wang_inmuebles] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [wang_inmuebles] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [wang_inmuebles] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [wang_inmuebles] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [wang_inmuebles] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [wang_inmuebles] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [wang_inmuebles] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [wang_inmuebles] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [wang_inmuebles] SET  ENABLE_BROKER 
GO
ALTER DATABASE [wang_inmuebles] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [wang_inmuebles] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [wang_inmuebles] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [wang_inmuebles] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [wang_inmuebles] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [wang_inmuebles] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [wang_inmuebles] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [wang_inmuebles] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [wang_inmuebles] SET  MULTI_USER 
GO
ALTER DATABASE [wang_inmuebles] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [wang_inmuebles] SET DB_CHAINING OFF 
GO
ALTER DATABASE [wang_inmuebles] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [wang_inmuebles] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [wang_inmuebles] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [wang_inmuebles] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [wang_inmuebles] SET QUERY_STORE = ON
GO
ALTER DATABASE [wang_inmuebles] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [wang_inmuebles]
GO
/****** Object:  User [aresJudda_SQLLogin_1]    Script Date: 19/06/2025 04:42:35 p. m. ******/
CREATE USER [aresJudda_SQLLogin_1] FOR LOGIN [aresJudda_SQLLogin_1] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [aresJudda_SQLLogin_1]
GO
/****** Object:  Schema [aresJudda_SQLLogin_1]    Script Date: 19/06/2025 04:42:35 p. m. ******/
CREATE SCHEMA [aresJudda_SQLLogin_1]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 19/06/2025 04:42:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountID] [uniqueidentifier] NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Role] [nvarchar](20) NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 19/06/2025 04:42:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[AppointmentID] [uniqueidentifier] NOT NULL,
	[TenantID] [uniqueidentifier] NULL,
	[PropertyID] [uniqueidentifier] NULL,
	[VisitDateTime] [datetime] NULL,
	[Status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 19/06/2025 04:42:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactForms]    Script Date: 19/06/2025 04:42:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactForms](
	[ContactID] [uniqueidentifier] NOT NULL,
	[TenantID] [uniqueidentifier] NULL,
	[PropertyID] [uniqueidentifier] NULL,
	[Message] [nvarchar](max) NULL,
	[ContactDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 19/06/2025 04:42:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contracts](
	[ContractID] [uniqueidentifier] NOT NULL,
	[AppointmentID] [uniqueidentifier] NULL,
	[ContractFile] [nvarchar](500) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAQs]    Script Date: 19/06/2025 04:42:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQs](
	[FAQID] [uniqueidentifier] NOT NULL,
	[TenantID] [uniqueidentifier] NULL,
	[PropertyID] [uniqueidentifier] NULL,
	[Question] [nvarchar](max) NULL,
	[Answer] [nvarchar](max) NULL,
	[DateAsked] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[FAQID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 19/06/2025 04:42:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [uniqueidentifier] NOT NULL,
	[ContractID] [uniqueidentifier] NULL,
	[PaymentMethod] [nvarchar](50) NULL,
	[Amount] [decimal](12, 2) NULL,
	[PaymentDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Properties]    Script Date: 19/06/2025 04:42:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Properties](
	[PropertyID] [uniqueidentifier] NOT NULL,
	[OwnerID] [uniqueidentifier] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Title] [nvarchar](150) NULL,
	[Description] [nvarchar](max) NULL,
	[Address] [nvarchar](255) NULL,
	[Price] [decimal](12, 2) NULL,
	[Latitude] [decimal](9, 6) NULL,
	[Longitude] [decimal](9, 6) NULL,
	[CurrentStatus] [nvarchar](20) NULL,
	[PublishDate] [datetime] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyImages]    Script Date: 19/06/2025 04:42:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyImages](
	[ImageID] [uniqueidentifier] NOT NULL,
	[PropertyID] [uniqueidentifier] NULL,
	[ImageURL] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyStatusHistory]    Script Date: 19/06/2025 04:42:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyStatusHistory](
	[HistoryID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyID] [uniqueidentifier] NULL,
	[Status] [nvarchar](20) NULL,
	[ChangeDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[HistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 19/06/2025 04:42:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewID] [uniqueidentifier] NOT NULL,
	[TenantID] [uniqueidentifier] NULL,
	[PropertyID] [uniqueidentifier] NULL,
	[Rating] [int] NULL,
	[Comment] [nvarchar](max) NULL,
	[ReviewDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 19/06/2025 04:42:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [uniqueidentifier] NOT NULL,
	[AccountID] [uniqueidentifier] NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NULL,
	[Address] [nvarchar](255) NULL,
	[ProfileImageUrl] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT (newid()) FOR [AccountID]
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Appointments] ADD  DEFAULT (newid()) FOR [AppointmentID]
GO
ALTER TABLE [dbo].[ContactForms] ADD  DEFAULT (newid()) FOR [ContactID]
GO
ALTER TABLE [dbo].[ContactForms] ADD  DEFAULT (getdate()) FOR [ContactDate]
GO
ALTER TABLE [dbo].[Contracts] ADD  DEFAULT (newid()) FOR [ContractID]
GO
ALTER TABLE [dbo].[FAQs] ADD  DEFAULT (newid()) FOR [FAQID]
GO
ALTER TABLE [dbo].[FAQs] ADD  DEFAULT (getdate()) FOR [DateAsked]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT (newid()) FOR [PaymentID]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT (getdate()) FOR [PaymentDate]
GO
ALTER TABLE [dbo].[Properties] ADD  DEFAULT (newid()) FOR [PropertyID]
GO
ALTER TABLE [dbo].[Properties] ADD  DEFAULT (getdate()) FOR [PublishDate]
GO
ALTER TABLE [dbo].[Properties] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[PropertyImages] ADD  DEFAULT (newid()) FOR [ImageID]
GO
ALTER TABLE [dbo].[PropertyStatusHistory] ADD  DEFAULT (getdate()) FOR [ChangeDate]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT (newid()) FOR [ReviewID]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT (getdate()) FOR [ReviewDate]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (newid()) FOR [UserID]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Properties] ([PropertyID])
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([TenantID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ContactForms]  WITH CHECK ADD FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Properties] ([PropertyID])
GO
ALTER TABLE [dbo].[ContactForms]  WITH CHECK ADD FOREIGN KEY([TenantID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD FOREIGN KEY([AppointmentID])
REFERENCES [dbo].[Appointments] ([AppointmentID])
GO
ALTER TABLE [dbo].[FAQs]  WITH CHECK ADD FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Properties] ([PropertyID])
GO
ALTER TABLE [dbo].[FAQs]  WITH CHECK ADD FOREIGN KEY([TenantID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([ContractID])
REFERENCES [dbo].[Contracts] ([ContractID])
GO
ALTER TABLE [dbo].[Properties]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Properties]  WITH CHECK ADD FOREIGN KEY([OwnerID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[PropertyImages]  WITH CHECK ADD FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Properties] ([PropertyID])
GO
ALTER TABLE [dbo].[PropertyStatusHistory]  WITH CHECK ADD FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Properties] ([PropertyID])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Properties] ([PropertyID])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([TenantID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD CHECK  (([Role]='ADMIN' OR [Role]='TENANT' OR [Role]='LANDLORD'))
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD CHECK  (([Status]='Rejected' OR [Status]='Accepted' OR [Status]='Pending'))
GO
ALTER TABLE [dbo].[Properties]  WITH CHECK ADD CHECK  (([CurrentStatus]='Rented' OR [CurrentStatus]='Sold' OR [CurrentStatus]='Reserved' OR [CurrentStatus]='Available'))
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD CHECK  (([Rating]>=(1) AND [Rating]<=(5)))
GO
USE [master]
GO
ALTER DATABASE [wang_inmuebles] SET  READ_WRITE 
GO
