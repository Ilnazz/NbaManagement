USE [master]
GO
/****** Object:  Database [NbaDatabase]    Script Date: 11.02.2024 19:04:55 ******/
CREATE DATABASE [NbaDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NbaDatabase', FILENAME = N'C:\Users\Ильназ\NbaDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NbaDatabase_log', FILENAME = N'C:\Users\Ильназ\NbaDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [NbaDatabase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NbaDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NbaDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NbaDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NbaDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NbaDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NbaDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [NbaDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NbaDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NbaDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NbaDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NbaDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NbaDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NbaDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NbaDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NbaDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NbaDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NbaDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NbaDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NbaDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NbaDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NbaDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NbaDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NbaDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NbaDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NbaDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [NbaDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NbaDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NbaDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NbaDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NbaDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NbaDatabase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [NbaDatabase] SET QUERY_STORE = OFF
GO
USE [NbaDatabase]
GO
/****** Object:  Table [dbo].[Conference]    Script Date: 11.02.2024 19:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conference](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Conference] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 11.02.2024 19:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Code] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Division]    Script Date: 11.02.2024 19:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Division](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ConferenceId] [int] NOT NULL,
 CONSTRAINT [PK_Division] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 11.02.2024 19:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matchup]    Script Date: 11.02.2024 19:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matchup](
	[Id] [int] NOT NULL,
	[SeasonId] [int] NOT NULL,
	[MatchupTypeId] [int] NOT NULL,
	[TeamAwayId] [int] NOT NULL,
	[TeamHomeId] [int] NOT NULL,
	[StartTime] [smalldatetime] NOT NULL,
	[TeamAwayScore] [int] NOT NULL,
	[TeamHomeScore] [int] NOT NULL,
	[Location] [nvarchar](150) NULL,
	[StatusId] [int] NOT NULL,
	[CurrentQuarter] [nvarchar](50) NULL,
 CONSTRAINT [PK_Matchup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchupStatus]    Script Date: 11.02.2024 19:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchupStatus](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MatchupStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchupType]    Script Date: 11.02.2024 19:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchupType](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MatchupType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Player]    Script Date: 11.02.2024 19:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Player](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PositionId] [int] NOT NULL,
	[JoinYear] [date] NOT NULL,
	[Height] [decimal](3, 2) NOT NULL,
	[Weight] [decimal](5, 2) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[College] [nvarchar](150) NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_Player] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerPosition]    Script Date: 11.02.2024 19:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerPosition](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Abbr] [nvarchar](3) NULL,
 CONSTRAINT [PK_PlayerPosition] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Season]    Script Date: 11.02.2024 19:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Season](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Season] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 11.02.2024 19:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DivisionId] [int] NOT NULL,
	[Abbr] [nvarchar](3) NOT NULL,
	[Coach] [nvarchar](50) NOT NULL,
	[Stadium] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team_Player]    Script Date: 11.02.2024 19:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team_Player](
	[PlayerId] [int] NOT NULL,
	[TeamId] [int] NOT NULL,
	[SeasonId] [int] NOT NULL,
	[ShirtNumber] [int] NOT NULL,
	[Salary] [money] NOT NULL,
	[StarterIndex] [int] NOT NULL,
 CONSTRAINT [PK_Team_Player] PRIMARY KEY CLUSTERED 
(
	[TeamId] ASC,
	[PlayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Conference] ([Id], [Name]) VALUES (1, N'Eastern')
INSERT [dbo].[Conference] ([Id], [Name]) VALUES (2, N'Western')
GO
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (1, N'Argentina', N'ARG')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (2, N'Austria', N'AT')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (3, N'Australia', N'AUS')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (4, N'Bosnia', N'BI')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (5, N'Bosnia Herzegovina', N'BIH')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (6, N'Brazil', N'BR')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (7, N'Bahamas', N'BS')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (8, N'Canada', N'CA')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (9, N'Congo', N'CG')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (10, N'Switzerland', N'CH')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (11, N'Cameroon', N'CM')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (12, N'Democratic Republic of Congo', N'COD')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (13, N'Germany', N'DE')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (14, N'The Dominican Republic', N'DO')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (15, N'Spain', N'ES')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (16, N'France', N'FR')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (17, N'Georgia', N'GE')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (18, N'Greece', N'GR')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (19, N'Croatia', N'HRV')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (20, N'Haiti', N'HT')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (21, N'Israel', N'IL')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (22, N'Italy', N'IT')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (23, N'Lithuania', N'LT')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (24, N'Latvia', N'LV')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (25, N'Mali', N'MLI')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (26, N'Montenegro', N'MNE')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (27, N'Nigeria', N'NGA')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (28, N'New Zealand', N'NZ')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (29, N'Puerto Rico', N'PUR')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (30, N'Russia', N'RU')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (31, N'Senegal', N'SEN')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (32, N'Slovenia', N'SI')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (33, N'Serbia', N'SRB')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (34, N'South Sudan', N'SSD')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (35, N'Tunisia', N'TN')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (36, N'Turkey', N'TR')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (37, N'Ukraine', N'UA')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (38, N'America', N'US')
GO
INSERT [dbo].[Division] ([Id], [Name], [ConferenceId]) VALUES (1, N'Southeastern', 1)
INSERT [dbo].[Division] ([Id], [Name], [ConferenceId]) VALUES (2, N'Centra', 1)
INSERT [dbo].[Division] ([Id], [Name], [ConferenceId]) VALUES (3, N'Atlantic', 1)
INSERT [dbo].[Division] ([Id], [Name], [ConferenceId]) VALUES (4, N'Southwestern', 2)
INSERT [dbo].[Division] ([Id], [Name], [ConferenceId]) VALUES (5, N'Northwestern', 2)
INSERT [dbo].[Division] ([Id], [Name], [ConferenceId]) VALUES (6, N'Pacific', 2)
GO
INSERT [dbo].[Gender] ([Id], [Name]) VALUES (1, N'Male')
INSERT [dbo].[Gender] ([Id], [Name]) VALUES (2, N'Female')
GO
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (1, 1, 201, 30, 20, CAST(N'2015-02-03T08:00:00' AS SmallDateTime), 141, 133, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (2, 1, 201, 24, 17, CAST(N'2015-02-11T10:00:00' AS SmallDateTime), 153, 168, N'Olympic Sports Center', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (3, 1, 201, 29, 16, CAST(N'2015-02-27T08:00:00' AS SmallDateTime), 156, 138, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (4, 1, 201, 19, 18, CAST(N'2015-03-01T09:00:00' AS SmallDateTime), 139, 124, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (5, 1, 201, 3, 14, CAST(N'2015-03-10T08:00:00' AS SmallDateTime), 156, 135, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (6, 1, 201, 15, 4, CAST(N'2015-03-19T08:00:00' AS SmallDateTime), 137, 143, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (7, 1, 201, 9, 10, CAST(N'2015-03-23T08:00:00' AS SmallDateTime), 141, 138, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (8, 1, 201, 8, 11, CAST(N'2015-04-01T10:00:00' AS SmallDateTime), 155, 141, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (9, 1, 202, 30, 17, CAST(N'2015-04-15T08:00:00' AS SmallDateTime), 156, 149, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (10, 1, 202, 29, 19, CAST(N'2015-04-23T08:00:00' AS SmallDateTime), 113, 117, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (11, 1, 202, 3, 4, CAST(N'2015-05-06T08:00:00' AS SmallDateTime), 138, 123, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (12, 1, 202, 9, 8, CAST(N'2015-05-10T08:00:00' AS SmallDateTime), 123, 124, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (13, 1, 203, 30, 19, CAST(N'2015-05-17T09:00:00' AS SmallDateTime), 146, 124, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (14, 1, 203, 3, 8, CAST(N'2015-05-23T08:00:00' AS SmallDateTime), 99, 120, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (15, 1, 204, 30, 8, CAST(N'2015-05-27T10:00:00' AS SmallDateTime), 124, 140, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (16, 2, 201, 7, 15, CAST(N'2016-02-01T10:00:00' AS SmallDateTime), 116, 137, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (17, 2, 201, 5, 1, CAST(N'2016-02-08T09:00:00' AS SmallDateTime), 140, 143, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (18, 2, 201, 18, 25, CAST(N'2016-02-16T08:00:00' AS SmallDateTime), 129, 109, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (19, 2, 201, 11, 3, CAST(N'2016-02-29T08:00:00' AS SmallDateTime), 126, 134, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (20, 2, 201, 24, 29, CAST(N'2016-03-05T09:00:00' AS SmallDateTime), 146, 140, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (21, 2, 201, 30, 19, CAST(N'2016-03-12T08:00:00' AS SmallDateTime), 124, 113, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (22, 2, 201, 8, 6, CAST(N'2016-03-17T09:00:00' AS SmallDateTime), 129, 112, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (23, 2, 201, 16, 17, CAST(N'2016-03-20T10:00:00' AS SmallDateTime), 128, 113, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (24, 2, 202, 25, 16, CAST(N'2016-03-22T08:00:00' AS SmallDateTime), 119, 110, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (25, 2, 202, 24, 30, CAST(N'2016-03-28T09:00:00' AS SmallDateTime), 110, 114, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (26, 2, 202, 3, 8, CAST(N'2016-04-03T09:00:00' AS SmallDateTime), 122, 149, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (27, 2, 202, 1, 15, CAST(N'2016-04-16T08:00:00' AS SmallDateTime), 131, 137, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (28, 2, 203, 25, 30, CAST(N'2016-04-29T08:00:00' AS SmallDateTime), 129, 143, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (29, 2, 203, 15, 8, CAST(N'2016-05-17T09:00:00' AS SmallDateTime), 127, 151, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (30, 2, 204, 8, 30, CAST(N'2016-05-22T10:00:00' AS SmallDateTime), 152, 115, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (70, 1, 0, 1, 2, CAST(N'2014-03-01T09:00:00' AS SmallDateTime), 126, 151, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (71, 1, 0, 3, 4, CAST(N'2014-03-02T10:00:00' AS SmallDateTime), 132, 150, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (72, 1, 0, 5, 6, CAST(N'2014-03-03T08:00:00' AS SmallDateTime), 129, 127, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (73, 1, 0, 7, 8, CAST(N'2014-03-04T09:00:00' AS SmallDateTime), 95, 132, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (74, 1, 0, 9, 10, CAST(N'2014-03-05T10:00:00' AS SmallDateTime), 156, 139, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (75, 1, 1, 11, 12, CAST(N'2014-03-06T08:00:00' AS SmallDateTime), 120, 100, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (76, 1, 1, 13, 14, CAST(N'2014-03-07T09:00:00' AS SmallDateTime), 134, 116, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (77, 1, 1, 15, 16, CAST(N'2014-03-08T10:00:00' AS SmallDateTime), 125, 116, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (78, 1, 1, 17, 18, CAST(N'2014-03-09T08:00:00' AS SmallDateTime), 122, 105, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (79, 1, 1, 19, 20, CAST(N'2014-03-10T09:00:00' AS SmallDateTime), 131, 130, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (80, 1, 1, 21, 22, CAST(N'2014-03-11T10:00:00' AS SmallDateTime), 114, 151, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (81, 1, 1, 23, 24, CAST(N'2014-03-12T08:00:00' AS SmallDateTime), 125, 114, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (82, 1, 1, 25, 26, CAST(N'2014-03-13T09:00:00' AS SmallDateTime), 142, 129, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (83, 1, 1, 27, 28, CAST(N'2014-03-14T10:00:00' AS SmallDateTime), 118, 124, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (84, 1, 1, 29, 30, CAST(N'2014-03-15T08:00:00' AS SmallDateTime), 127, 110, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (85, 1, 1, 1, 2, CAST(N'2014-03-16T09:00:00' AS SmallDateTime), 127, 119, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (86, 1, 1, 3, 4, CAST(N'2014-03-17T10:00:00' AS SmallDateTime), 134, 124, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (87, 1, 1, 5, 6, CAST(N'2014-03-18T08:00:00' AS SmallDateTime), 140, 157, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (88, 1, 1, 7, 8, CAST(N'2014-03-19T09:00:00' AS SmallDateTime), 145, 126, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (89, 1, 1, 9, 10, CAST(N'2014-03-20T10:00:00' AS SmallDateTime), 118, 108, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (90, 1, 1, 11, 12, CAST(N'2014-03-21T08:00:00' AS SmallDateTime), 158, 122, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (91, 1, 1, 13, 14, CAST(N'2014-03-22T09:00:00' AS SmallDateTime), 131, 144, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (92, 1, 1, 15, 16, CAST(N'2014-03-23T10:00:00' AS SmallDateTime), 165, 134, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (93, 1, 1, 17, 18, CAST(N'2014-03-24T08:00:00' AS SmallDateTime), 107, 142, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (94, 1, 1, 19, 20, CAST(N'2014-03-25T09:00:00' AS SmallDateTime), 125, 139, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (95, 2, 0, 1, 2, CAST(N'2015-03-01T10:00:00' AS SmallDateTime), 145, 122, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (96, 2, 0, 3, 4, CAST(N'2015-03-02T08:00:00' AS SmallDateTime), 142, 123, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (97, 2, 0, 5, 6, CAST(N'2015-03-03T09:00:00' AS SmallDateTime), 120, 142, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (98, 2, 0, 7, 8, CAST(N'2015-03-04T10:00:00' AS SmallDateTime), 154, 135, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (99, 2, 0, 9, 10, CAST(N'2015-03-05T08:00:00' AS SmallDateTime), 112, 120, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (100, 2, 1, 11, 12, CAST(N'2015-03-06T09:00:00' AS SmallDateTime), 150, 112, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (101, 2, 1, 13, 14, CAST(N'2015-03-07T10:00:00' AS SmallDateTime), 120, 153, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (102, 2, 1, 15, 16, CAST(N'2015-03-08T08:00:00' AS SmallDateTime), 157, 158, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (103, 2, 1, 17, 18, CAST(N'2015-03-09T09:00:00' AS SmallDateTime), 142, 155, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (104, 2, 1, 19, 20, CAST(N'2015-03-10T10:00:00' AS SmallDateTime), 155, 121, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (105, 2, 1, 21, 22, CAST(N'2015-03-11T08:00:00' AS SmallDateTime), 125, 142, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (106, 2, 1, 23, 24, CAST(N'2015-03-12T09:00:00' AS SmallDateTime), 130, 145, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (107, 2, 1, 25, 26, CAST(N'2015-03-13T10:00:00' AS SmallDateTime), 163, 154, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (108, 2, 1, 27, 28, CAST(N'2015-03-14T08:00:00' AS SmallDateTime), 159, 128, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (109, 2, 1, 29, 30, CAST(N'2015-03-15T09:00:00' AS SmallDateTime), 156, 130, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (110, 2, 1, 1, 2, CAST(N'2015-03-16T10:00:00' AS SmallDateTime), 150, 115, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (111, 2, 1, 3, 4, CAST(N'2015-03-17T08:00:00' AS SmallDateTime), 129, 144, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (112, 2, 1, 5, 6, CAST(N'2015-03-18T09:00:00' AS SmallDateTime), 123, 152, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (113, 2, 1, 7, 8, CAST(N'2015-03-19T10:00:00' AS SmallDateTime), 148, 108, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (114, 2, 1, 9, 10, CAST(N'2015-03-20T08:00:00' AS SmallDateTime), 102, 123, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (115, 2, 1, 11, 12, CAST(N'2015-03-21T09:00:00' AS SmallDateTime), 143, 130, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (116, 2, 1, 13, 14, CAST(N'2015-03-22T10:00:00' AS SmallDateTime), 136, 151, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (117, 2, 1, 15, 16, CAST(N'2015-03-23T08:00:00' AS SmallDateTime), 128, 131, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (118, 2, 1, 17, 18, CAST(N'2015-03-24T09:00:00' AS SmallDateTime), 126, 132, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (119, 2, 1, 19, 20, CAST(N'2015-03-25T10:00:00' AS SmallDateTime), 100, 129, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (120, 2, 1, 21, 22, CAST(N'2015-03-26T08:00:00' AS SmallDateTime), 149, 121, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (121, 2, 1, 23, 24, CAST(N'2015-03-27T09:00:00' AS SmallDateTime), 110, 114, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (122, 2, 1, 25, 26, CAST(N'2015-03-28T10:00:00' AS SmallDateTime), 111, 116, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (123, 2, 1, 27, 28, CAST(N'2015-03-29T08:00:00' AS SmallDateTime), 120, 147, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (124, 2, 1, 29, 30, CAST(N'2015-03-30T09:00:00' AS SmallDateTime), 141, 113, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (125, 3, 0, 1, 2, CAST(N'2016-03-01T10:00:00' AS SmallDateTime), 125, 152, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (126, 3, 0, 3, 4, CAST(N'2016-03-02T08:00:00' AS SmallDateTime), 126, 124, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (127, 3, 0, 5, 6, CAST(N'2016-03-03T09:00:00' AS SmallDateTime), 123, 156, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (128, 3, 0, 7, 8, CAST(N'2016-03-04T10:00:00' AS SmallDateTime), 133, 139, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (129, 3, 0, 9, 10, CAST(N'2016-03-05T08:00:00' AS SmallDateTime), 146, 107, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (130, 3, 1, 11, 12, CAST(N'2016-03-06T09:00:00' AS SmallDateTime), 125, 144, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (131, 3, 1, 13, 14, CAST(N'2016-03-07T10:00:00' AS SmallDateTime), 145, 150, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (132, 3, 1, 15, 16, CAST(N'2016-03-08T08:00:00' AS SmallDateTime), 130, 138, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (133, 3, 1, 17, 18, CAST(N'2016-03-09T09:00:00' AS SmallDateTime), 138, 122, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (134, 3, 1, 19, 20, CAST(N'2016-03-10T10:00:00' AS SmallDateTime), 145, 133, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (135, 3, 1, 21, 22, CAST(N'2016-03-11T08:00:00' AS SmallDateTime), 137, 118, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (136, 3, 1, 23, 24, CAST(N'2016-03-12T09:00:00' AS SmallDateTime), 145, 132, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (137, 3, 1, 25, 26, CAST(N'2016-03-13T10:00:00' AS SmallDateTime), 109, 125, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (138, 3, 1, 27, 28, CAST(N'2016-03-14T08:00:00' AS SmallDateTime), 147, 133, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (139, 3, 1, 29, 30, CAST(N'2016-03-15T09:00:00' AS SmallDateTime), 129, 115, N'Olympic Sports Center', 3, N'00:00-4th')
GO
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (140, 3, 1, 1, 2, CAST(N'2016-03-16T10:00:00' AS SmallDateTime), 140, 110, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (141, 3, 1, 3, 4, CAST(N'2016-03-17T08:00:00' AS SmallDateTime), 135, 116, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (142, 3, 1, 5, 6, CAST(N'2016-03-18T09:00:00' AS SmallDateTime), 152, 121, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (143, 3, 1, 7, 8, CAST(N'2016-03-19T10:00:00' AS SmallDateTime), 117, 146, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (144, 3, 1, 9, 10, CAST(N'2016-03-20T08:00:00' AS SmallDateTime), 133, 153, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (145, 3, 1, 11, 12, CAST(N'2016-03-21T09:00:00' AS SmallDateTime), 163, 141, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (146, 3, 1, 13, 14, CAST(N'2016-03-22T10:00:00' AS SmallDateTime), 124, 149, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (147, 3, 1, 15, 16, CAST(N'2016-03-23T08:00:00' AS SmallDateTime), 144, 145, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (148, 3, 1, 17, 18, CAST(N'2016-03-24T09:00:00' AS SmallDateTime), 117, 139, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (149, 3, 1, 19, 20, CAST(N'2017-01-28T08:30:00' AS SmallDateTime), 133, 135, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (150, 3, 1, 21, 22, CAST(N'2017-01-28T08:00:00' AS SmallDateTime), 133, 147, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (151, 3, 1, 23, 24, CAST(N'2017-01-28T09:00:00' AS SmallDateTime), 103, 116, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (152, 3, 1, 24, 25, CAST(N'2017-01-28T10:00:00' AS SmallDateTime), 113, 111, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (153, 3, 1, 27, 28, CAST(N'2017-01-28T10:30:00' AS SmallDateTime), 134, 142, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (154, 3, 1, 29, 30, CAST(N'2017-01-28T11:00:00' AS SmallDateTime), 112, 143, N'', 3, N'00:00-4th')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (168, 3, 1, 3, 12, CAST(N'2017-03-30T09:00:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (169, 3, 1, 25, 2, CAST(N'2017-03-30T09:30:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (170, 3, 1, 10, 11, CAST(N'2017-03-30T08:30:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (171, 3, 1, 1, 13, CAST(N'2017-03-30T08:30:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (172, 3, 1, 7, 17, CAST(N'2017-03-30T08:30:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (173, 3, 1, 18, 20, CAST(N'2017-03-30T09:00:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (174, 3, 1, 30, 16, CAST(N'2017-03-30T08:30:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (175, 3, 1, 4, 29, CAST(N'2017-03-30T08:30:00' AS SmallDateTime), 0, 0, N'Olympic Sports Center', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (176, 3, 1, 23, 26, CAST(N'2017-03-30T08:30:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (177, 3, 1, 3, 8, CAST(N'2017-04-08T08:30:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (178, 3, 1, 1, 15, CAST(N'2017-04-08T08:30:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (179, 3, 1, 13, 17, CAST(N'2017-04-08T08:30:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (180, 3, 1, 6, 19, CAST(N'2017-04-08T09:00:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (181, 3, 1, 16, 18, CAST(N'2017-04-08T09:00:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (182, 3, 1, 20, 22, CAST(N'2017-04-08T09:00:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (183, 3, 1, 21, 23, CAST(N'2017-04-08T09:00:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (184, 3, 1, 25, 27, CAST(N'2017-04-08T09:00:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (185, 3, 1, 26, 28, CAST(N'2017-04-08T08:30:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (186, 3, 1, 6, 2, CAST(N'2017-04-13T09:00:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (187, 3, 1, 15, 8, CAST(N'2017-04-13T09:00:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (188, 3, 1, 10, 11, CAST(N'2017-04-13T09:00:00' AS SmallDateTime), 0, 0, N'Olympic Sports Center', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (189, 3, 1, 12, 13, CAST(N'2017-04-13T09:00:00' AS SmallDateTime), 0, 0, N'Olympic Sports Center', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (190, 3, 1, 4, 1, CAST(N'2017-04-13T08:30:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (191, 3, 1, 14, 9, CAST(N'2017-04-13T08:30:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (192, 3, 1, 18, 17, CAST(N'2017-04-13T08:30:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (193, 3, 1, 21, 19, CAST(N'2017-04-13T08:30:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (194, 3, 1, 22, 25, CAST(N'2017-04-13T08:30:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (195, 3, 1, 3, 7, CAST(N'2017-04-13T08:30:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (196, 3, 1, 16, 23, CAST(N'2017-04-13T08:30:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (197, 3, 1, 26, 29, CAST(N'2017-04-13T10:00:00' AS SmallDateTime), 0, 0, N'Olympic Sports Center', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (198, 3, 1, 28, 30, CAST(N'2017-04-13T08:30:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (199, 3, 1, 20, 7, CAST(N'2017-04-13T08:30:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (200, 2, 0, 9, 10, CAST(N'2015-09-01T08:00:00' AS SmallDateTime), 160, 170, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (201, 2, 0, 9, 10, CAST(N'2015-09-02T08:00:00' AS SmallDateTime), 172, 192, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (202, 2, 0, 6, 2, CAST(N'2015-09-03T08:00:00' AS SmallDateTime), 157, 186, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (203, 2, 0, 23, 9, CAST(N'2015-09-04T08:00:00' AS SmallDateTime), 179, 186, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (204, 2, 0, 6, 16, CAST(N'2015-09-05T08:00:00' AS SmallDateTime), 171, 168, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (205, 2, 0, 25, 23, CAST(N'2015-09-06T08:00:00' AS SmallDateTime), 177, 179, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (206, 2, 0, 10, 14, CAST(N'2015-09-07T08:00:00' AS SmallDateTime), 171, 170, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (207, 2, 0, 3, 2, CAST(N'2015-09-08T08:00:00' AS SmallDateTime), 172, 158, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (208, 2, 0, 7, 18, CAST(N'2015-09-09T08:00:00' AS SmallDateTime), 187, 176, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (209, 2, 0, 15, 3, CAST(N'2015-09-10T08:00:00' AS SmallDateTime), 210, 160, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (210, 2, 0, 2, 22, CAST(N'2015-09-11T08:00:00' AS SmallDateTime), 191, 175, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (211, 2, 0, 11, 17, CAST(N'2015-09-12T08:00:00' AS SmallDateTime), 167, 157, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (212, 2, 0, 9, 21, CAST(N'2015-09-13T08:00:00' AS SmallDateTime), 177, 166, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (213, 2, 0, 4, 2, CAST(N'2015-09-14T08:00:00' AS SmallDateTime), 175, 154, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (214, 2, 0, 29, 18, CAST(N'2015-09-15T08:00:00' AS SmallDateTime), 185, 172, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (215, 2, 1, 12, 23, CAST(N'2015-11-18T08:00:00' AS SmallDateTime), 157, 175, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (216, 2, 1, 3, 24, CAST(N'2015-11-21T08:00:00' AS SmallDateTime), 180, 164, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (217, 2, 1, 13, 15, CAST(N'2015-11-25T08:00:00' AS SmallDateTime), 166, 174, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (218, 2, 1, 21, 18, CAST(N'2015-11-05T08:00:00' AS SmallDateTime), 167, 160, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (219, 2, 1, 2, 23, CAST(N'2015-11-18T08:00:00' AS SmallDateTime), 153, 179, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (220, 2, 1, 11, 29, CAST(N'2015-11-03T08:00:00' AS SmallDateTime), 179, 177, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (221, 2, 1, 20, 5, CAST(N'2015-11-23T08:00:00' AS SmallDateTime), 176, 164, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (222, 2, 1, 11, 18, CAST(N'2015-11-06T08:00:00' AS SmallDateTime), 150, 181, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (223, 2, 1, 14, 5, CAST(N'2015-11-12T08:00:00' AS SmallDateTime), 178, 163, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (224, 2, 1, 15, 3, CAST(N'2015-11-05T08:00:00' AS SmallDateTime), 169, 176, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (225, 2, 1, 17, 16, CAST(N'2015-11-09T08:00:00' AS SmallDateTime), 183, 187, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (226, 2, 1, 16, 28, CAST(N'2015-11-19T08:00:00' AS SmallDateTime), 168, 154, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (227, 2, 1, 6, 13, CAST(N'2015-11-14T08:00:00' AS SmallDateTime), 165, 178, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (228, 2, 1, 23, 17, CAST(N'2015-11-14T08:00:00' AS SmallDateTime), 187, 161, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (229, 2, 1, 6, 8, CAST(N'2015-11-27T08:00:00' AS SmallDateTime), 153, 176, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (230, 2, 1, 8, 3, CAST(N'2015-11-11T08:00:00' AS SmallDateTime), 152, 173, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (231, 2, 1, 18, 23, CAST(N'2015-11-09T08:00:00' AS SmallDateTime), 132, 157, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (232, 2, 1, 21, 11, CAST(N'2015-11-23T08:00:00' AS SmallDateTime), 180, 165, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (233, 2, 1, 10, 6, CAST(N'2015-11-28T08:00:00' AS SmallDateTime), 166, 180, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (234, 2, 1, 4, 16, CAST(N'2015-11-09T08:00:00' AS SmallDateTime), 171, 162, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (235, 2, 1, 21, 19, CAST(N'2015-11-05T08:00:00' AS SmallDateTime), 181, 157, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (236, 2, 1, 4, 18, CAST(N'2015-11-06T08:00:00' AS SmallDateTime), 152, 148, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (237, 2, 1, 10, 5, CAST(N'2015-11-28T08:00:00' AS SmallDateTime), 170, 165, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (238, 2, 1, 27, 17, CAST(N'2015-11-11T08:00:00' AS SmallDateTime), 175, 182, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (239, 2, 1, 9, 5, CAST(N'2015-11-15T08:00:00' AS SmallDateTime), 163, 154, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (240, 2, 1, 21, 25, CAST(N'2015-11-28T08:00:00' AS SmallDateTime), 153, 174, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (241, 2, 1, 13, 23, CAST(N'2015-11-13T08:00:00' AS SmallDateTime), 164, 155, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (242, 2, 1, 28, 1, CAST(N'2015-11-02T08:00:00' AS SmallDateTime), 165, 187, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (243, 2, 1, 11, 2, CAST(N'2015-11-17T08:00:00' AS SmallDateTime), 170, 169, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (244, 2, 1, 20, 21, CAST(N'2015-11-13T08:00:00' AS SmallDateTime), 183, 182, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (245, 3, 0, 20, 2, CAST(N'2016-09-01T08:00:00' AS SmallDateTime), 181, 158, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (246, 3, 0, 10, 28, CAST(N'2016-09-02T08:00:00' AS SmallDateTime), 144, 142, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (247, 3, 0, 7, 4, CAST(N'2016-09-03T08:00:00' AS SmallDateTime), 187, 164, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (248, 3, 0, 24, 27, CAST(N'2016-09-04T08:00:00' AS SmallDateTime), 173, 188, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (249, 3, 0, 22, 14, CAST(N'2016-09-05T08:00:00' AS SmallDateTime), 170, 175, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (250, 3, 0, 5, 24, CAST(N'2016-09-06T08:00:00' AS SmallDateTime), 181, 174, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (251, 3, 0, 9, 10, CAST(N'2016-09-07T08:00:00' AS SmallDateTime), 176, 180, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (252, 3, 0, 4, 8, CAST(N'2016-09-08T08:00:00' AS SmallDateTime), 173, 180, N'', 3, N'')
GO
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (253, 3, 0, 4, 12, CAST(N'2016-09-09T08:00:00' AS SmallDateTime), 180, 152, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (254, 3, 0, 17, 25, CAST(N'2016-09-10T08:00:00' AS SmallDateTime), 158, 181, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (255, 3, 0, 18, 20, CAST(N'2016-09-11T08:00:00' AS SmallDateTime), 196, 175, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (256, 3, 0, 25, 1, CAST(N'2016-09-12T08:00:00' AS SmallDateTime), 173, 183, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (257, 3, 0, 13, 25, CAST(N'2016-09-13T08:00:00' AS SmallDateTime), 160, 153, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (258, 3, 0, 9, 5, CAST(N'2016-09-14T08:00:00' AS SmallDateTime), 165, 171, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (259, 3, 0, 19, 11, CAST(N'2016-09-15T08:00:00' AS SmallDateTime), 153, 144, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (260, 3, 1, 19, 11, CAST(N'2016-11-01T08:00:00' AS SmallDateTime), 161, 204, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (261, 3, 1, 15, 9, CAST(N'2016-11-02T08:00:00' AS SmallDateTime), 172, 149, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (262, 3, 1, 15, 28, CAST(N'2016-11-03T08:00:00' AS SmallDateTime), 169, 182, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (263, 3, 1, 25, 29, CAST(N'2016-11-04T08:00:00' AS SmallDateTime), 191, 156, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (264, 3, 1, 30, 9, CAST(N'2016-11-05T08:00:00' AS SmallDateTime), 160, 168, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (265, 3, 1, 5, 2, CAST(N'2016-11-06T08:00:00' AS SmallDateTime), 167, 164, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (266, 3, 1, 16, 26, CAST(N'2016-11-07T08:00:00' AS SmallDateTime), 172, 166, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (267, 3, 1, 25, 11, CAST(N'2016-11-08T08:00:00' AS SmallDateTime), 194, 179, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (268, 3, 1, 6, 3, CAST(N'2016-11-09T08:00:00' AS SmallDateTime), 195, 171, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (269, 3, 1, 26, 27, CAST(N'2016-11-10T08:00:00' AS SmallDateTime), 173, 169, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (270, 3, 1, 7, 21, CAST(N'2016-11-11T08:00:00' AS SmallDateTime), 165, 150, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (271, 3, 1, 15, 21, CAST(N'2016-11-12T08:00:00' AS SmallDateTime), 171, 182, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (272, 3, 1, 13, 15, CAST(N'2016-11-13T08:00:00' AS SmallDateTime), 171, 177, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (273, 3, 1, 29, 2, CAST(N'2016-11-14T08:00:00' AS SmallDateTime), 172, 159, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (274, 3, 1, 19, 20, CAST(N'2016-11-15T08:00:00' AS SmallDateTime), 184, 177, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (275, 3, 1, 11, 6, CAST(N'2016-11-16T08:00:00' AS SmallDateTime), 179, 171, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (276, 3, 1, 17, 24, CAST(N'2016-11-17T08:00:00' AS SmallDateTime), 159, 171, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (277, 3, 1, 25, 6, CAST(N'2016-11-18T08:00:00' AS SmallDateTime), 166, 158, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (278, 3, 1, 24, 1, CAST(N'2016-11-19T08:00:00' AS SmallDateTime), 149, 160, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (279, 3, 1, 10, 28, CAST(N'2016-11-20T08:00:00' AS SmallDateTime), 177, 155, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (280, 3, 1, 8, 19, CAST(N'2016-11-21T08:00:00' AS SmallDateTime), 172, 168, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (281, 3, 1, 17, 3, CAST(N'2016-11-22T08:00:00' AS SmallDateTime), 173, 170, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (282, 3, 1, 24, 6, CAST(N'2016-11-23T08:00:00' AS SmallDateTime), 181, 159, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (283, 3, 1, 29, 27, CAST(N'2016-11-24T08:00:00' AS SmallDateTime), 156, 161, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (284, 3, 1, 26, 15, CAST(N'2016-11-25T08:00:00' AS SmallDateTime), 187, 176, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (285, 3, 1, 23, 5, CAST(N'2016-11-26T08:00:00' AS SmallDateTime), 178, 173, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (286, 3, 1, 27, 14, CAST(N'2016-11-27T08:00:00' AS SmallDateTime), 180, 174, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (287, 3, 1, 28, 1, CAST(N'2016-11-28T08:00:00' AS SmallDateTime), 184, 149, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (288, 3, 1, 14, 21, CAST(N'2016-11-29T08:00:00' AS SmallDateTime), 157, 153, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (289, 3, 1, 4, 26, CAST(N'2016-11-30T08:00:00' AS SmallDateTime), 152, 154, N'', 3, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (290, 3, 1, 1, 30, CAST(N'2017-03-30T09:00:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (291, 3, 1, 5, 9, CAST(N'2017-04-15T10:00:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (292, 3, 1, 7, 4, CAST(N'2017-04-16T09:00:00' AS SmallDateTime), 0, 0, N'Olympic Sports Center', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (293, 3, 1, 2, 5, CAST(N'2017-04-17T09:00:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (294, 3, 1, 1, 3, CAST(N'2017-04-18T09:00:00' AS SmallDateTime), 0, 0, N'', 1, N'')
INSERT [dbo].[Matchup] ([Id], [SeasonId], [MatchupTypeId], [TeamAwayId], [TeamHomeId], [StartTime], [TeamAwayScore], [TeamHomeScore], [Location], [StatusId], [CurrentQuarter]) VALUES (295, 3, 1, 9, 22, CAST(N'2017-04-19T09:00:00' AS SmallDateTime), 0, 0, N'', 1, N'')
GO
INSERT [dbo].[MatchupStatus] ([Id], [Name]) VALUES (1, N'Not started')
INSERT [dbo].[MatchupStatus] ([Id], [Name]) VALUES (2, N'Running')
INSERT [dbo].[MatchupStatus] ([Id], [Name]) VALUES (3, N'Finished')
GO
INSERT [dbo].[MatchupType] ([Id], [Name]) VALUES (0, N'Preseason')
INSERT [dbo].[MatchupType] ([Id], [Name]) VALUES (1, N'Regular Season')
INSERT [dbo].[MatchupType] ([Id], [Name]) VALUES (201, N'The first round in post season')
INSERT [dbo].[MatchupType] ([Id], [Name]) VALUES (202, N'The semi-finals of conference in post season')
INSERT [dbo].[MatchupType] ([Id], [Name]) VALUES (203, N'The final of conference in post season')
INSERT [dbo].[MatchupType] ([Id], [Name]) VALUES (204, N'The NBA finals in post season')
GO
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (1, N'Mo Williams', 1, CAST(N'2000-05-23' AS Date), CAST(1.85 AS Decimal(3, 2)), CAST(89.80 AS Decimal(5, 2)), CAST(N'1982-12-19' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (2, N'Alonzo Edward Gee', 4, CAST(N'2005-03-12' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(99.00 AS Decimal(5, 2)), CAST(N'1987-05-29' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (3, N'Johnny O''Bryant', 3, CAST(N'2014-03-18' AS Date), CAST(2.05 AS Decimal(3, 2)), CAST(116.50 AS Decimal(5, 2)), CAST(N'1993-06-01' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (4, N'Danilo Gallinari', 4, CAST(N'2003-07-21' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(102.00 AS Decimal(5, 2)), CAST(N'1988-08-08' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (5, N'Darrell Arthur', 5, CAST(N'2003-07-22' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(107.00 AS Decimal(5, 2)), CAST(N'1988-03-25' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (6, N'Emmanuel Mudiay', 4, CAST(N'2012-05-06' AS Date), CAST(1.96 AS Decimal(3, 2)), CAST(91.00 AS Decimal(5, 2)), CAST(N'1996-05-05' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (7, N'Gary Harris', 3, CAST(N'2012-05-07' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(95.00 AS Decimal(5, 2)), CAST(N'1994-09-14' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (8, N'Jamal Murray', 1, CAST(N'2015-05-08' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(94.00 AS Decimal(5, 2)), CAST(N'1997-02-23' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (9, N'Jameer Nelson', 3, CAST(N'2001-05-23' AS Date), CAST(1.83 AS Decimal(3, 2)), CAST(91.00 AS Decimal(5, 2)), CAST(N'1982-02-09' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (10, N'Jarnell Stokes', 1, CAST(N'2013-05-07' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(119.00 AS Decimal(5, 2)), CAST(N'1994-01-07' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (11, N'Juan Hernangomez', 5, CAST(N'2013-05-08' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(104.00 AS Decimal(5, 2)), CAST(N'1995-09-28' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (12, N'Jusuf Nurkic', 2, CAST(N'2013-05-09' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(127.00 AS Decimal(5, 2)), CAST(N'1994-08-23' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (13, N'Kenneth Bernard Faried', 5, CAST(N'2004-07-22' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(103.00 AS Decimal(5, 2)), CAST(N'1989-11-19' AS Date), N'', 32)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (14, N'Malik Beasley', 1, CAST(N'2014-05-08' AS Date), CAST(1.96 AS Decimal(3, 2)), CAST(89.00 AS Decimal(5, 2)), CAST(N'1996-11-26' AS Date), N'', 8)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (15, N'Michael Lloyd Miller', 5, CAST(N'2000-01-03' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(99.00 AS Decimal(5, 2)), CAST(N'1980-02-19' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (16, N'Nikola Jokic', 3, CAST(N'2014-05-08' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(113.00 AS Decimal(5, 2)), CAST(N'1995-02-19' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (17, N'Will Barton', 1, CAST(N'2013-03-18' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(79.00 AS Decimal(5, 2)), CAST(N'1991-01-06' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (18, N'Karl-Anthony Towns', 3, CAST(N'2014-05-08' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(111.00 AS Decimal(5, 2)), CAST(N'1995-11-15' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (19, N'Andrew Wiggins', 2, CAST(N'2014-05-09' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(91.00 AS Decimal(5, 2)), CAST(N'1995-02-23' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (20, N'Nikola Pekovic', 4, CAST(N'2005-03-12' AS Date), CAST(2.10 AS Decimal(3, 2)), CAST(139.20 AS Decimal(5, 2)), CAST(N'1986-01-05' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (21, N'Zach LaVine', 2, CAST(N'2014-05-08' AS Date), CAST(1.96 AS Decimal(3, 2)), CAST(83.00 AS Decimal(5, 2)), CAST(N'1995-03-10' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (22, N'Gorgui Dieng', 1, CAST(N'2013-03-18' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(106.00 AS Decimal(5, 2)), CAST(N'1990-01-18' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (23, N'Shabazz Muhammad', 3, CAST(N'2013-03-19' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(103.00 AS Decimal(5, 2)), CAST(N'1992-11-13' AS Date), N'', 14)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (24, N'Ricard Rubio', 3, CAST(N'2013-03-20' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(87.00 AS Decimal(5, 2)), CAST(N'1990-10-21' AS Date), N'', 4)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (25, N'Nemanja Bjelica', 1, CAST(N'2013-03-21' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(106.00 AS Decimal(5, 2)), CAST(N'1988-03-09' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (26, N'Adreian Payne', 1, CAST(N'2013-03-22' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1991-02-19' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (27, N'Kris Dunn', 2, CAST(N'2013-03-23' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(93.00 AS Decimal(5, 2)), CAST(N'1994-05-18' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (28, N'Tyus Jones', 4, CAST(N'2014-03-24' AS Date), CAST(1.85 AS Decimal(3, 2)), CAST(86.00 AS Decimal(5, 2)), CAST(N'1996-04-10' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (29, N'Brandon Leray Rush', 4, CAST(N'2006-03-12' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(95.00 AS Decimal(5, 2)), CAST(N'1985-07-07' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (30, N'Cole David Aldrich', 2, CAST(N'2013-05-21' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(111.00 AS Decimal(5, 2)), CAST(N'1988-10-31' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (31, N'Jordan Craig Hill', 1, CAST(N'2013-05-22' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(107.00 AS Decimal(5, 2)), CAST(N'1987-07-27' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (32, N'John Harding Lucas III', 1, CAST(N'2012-06-23' AS Date), CAST(1.80 AS Decimal(3, 2)), CAST(75.00 AS Decimal(5, 2)), CAST(N'1982-11-21' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (33, N'Russell Westbrook', 5, CAST(N'2013-05-22' AS Date), CAST(1.91 AS Decimal(3, 2)), CAST(91.00 AS Decimal(5, 2)), CAST(N'1988-11-12' AS Date), N'', 14)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (34, N'Victor Oladipo', 4, CAST(N'2013-04-20' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(95.00 AS Decimal(5, 2)), CAST(N'1992-05-04' AS Date), N'', 4)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (35, N'Enes Kanter', 1, CAST(N'2013-04-21' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(111.00 AS Decimal(5, 2)), CAST(N'1992-05-20' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (36, N'Steven Adams', 3, CAST(N'2013-04-22' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(116.00 AS Decimal(5, 2)), CAST(N'1993-07-28' AS Date), N'Horace Mann School', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (37, N'Andre Roberson', 1, CAST(N'2013-04-23' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(95.00 AS Decimal(5, 2)), CAST(N'1991-12-04' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (38, N'Jerami Grant', 4, CAST(N'2013-04-24' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(95.00 AS Decimal(5, 2)), CAST(N'1994-03-12' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (39, N'Domantas Sabonis', 4, CAST(N'2013-04-25' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(108.00 AS Decimal(5, 2)), CAST(N'1996-03-03' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (40, N'Alex Abrines', 2, CAST(N'2013-04-26' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(86.00 AS Decimal(5, 2)), CAST(N'1993-08-01' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (41, N'Anthony Jarrad Morrow', 3, CAST(N'2006-03-12' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(95.00 AS Decimal(5, 2)), CAST(N'1985-09-27' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (42, N'Joffrey Lauvergne', 2, CAST(N'2013-04-26' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(N'1991-09-30' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (43, N'Ersan Ilyasova', 3, CAST(N'2013-04-27' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(107.00 AS Decimal(5, 2)), CAST(N'1987-05-15' AS Date), N'', 1)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (44, N'Cameron Payne', 2, CAST(N'2013-04-28' AS Date), CAST(1.88 AS Decimal(3, 2)), CAST(82.00 AS Decimal(5, 2)), CAST(N'1994-08-08' AS Date), N'', 1)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (45, N'Semaj Christon', 2, CAST(N'2013-04-29' AS Date), CAST(1.91 AS Decimal(3, 2)), CAST(86.00 AS Decimal(5, 2)), CAST(N'1992-11-01' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (46, N'Kyle Singler', 3, CAST(N'2013-04-30' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(103.00 AS Decimal(5, 2)), CAST(N'1988-05-04' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (47, N'Nicholas John Collison', 5, CAST(N'2003-12-06' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(116.00 AS Decimal(5, 2)), CAST(N'1980-10-26' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (48, N'Josh Huestis', 5, CAST(N'2014-07-02' AS Date), CAST(2.00 AS Decimal(3, 2)), CAST(104.30 AS Decimal(5, 2)), CAST(N'1991-12-19' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (49, N'Damian Lillard', 2, CAST(N'2015-07-03' AS Date), CAST(1.91 AS Decimal(3, 2)), CAST(88.00 AS Decimal(5, 2)), CAST(N'1990-07-15' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (50, N'C.J. McCollum', 4, CAST(N'2016-01-01' AS Date), CAST(1.91 AS Decimal(3, 2)), CAST(86.00 AS Decimal(5, 2)), CAST(N'1991-09-19' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (51, N'Maurice Harkless', 5, CAST(N'2016-01-02' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(95.00 AS Decimal(5, 2)), CAST(N'1993-05-11' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (52, N'Mason Plumlee', 4, CAST(N'2016-01-03' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(111.00 AS Decimal(5, 2)), CAST(N'1990-03-05' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (53, N'Allen Crabbe', 2, CAST(N'2016-01-04' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(98.00 AS Decimal(5, 2)), CAST(N'1992-04-04' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (54, N'Evan Marcel Turner', 3, CAST(N'2014-03-04' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(98.00 AS Decimal(5, 2)), CAST(N'1988-10-27' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (55, N'Al-Farouq Aminu', 2, CAST(N'2014-03-05' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(98.00 AS Decimal(5, 2)), CAST(N'1990-09-21' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (56, N'Meyers Leonard', 5, CAST(N'2014-03-06' AS Date), CAST(2.16 AS Decimal(3, 2)), CAST(116.00 AS Decimal(5, 2)), CAST(N'1992-02-27' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (57, N'Edward Adam Davis', 2, CAST(N'2012-03-07' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(102.00 AS Decimal(5, 2)), CAST(N'1989-06-05' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (58, N'Shabazz Napier', 1, CAST(N'2014-03-08' AS Date), CAST(1.85 AS Decimal(3, 2)), CAST(79.00 AS Decimal(5, 2)), CAST(N'1991-07-14' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (59, N'Noah Vonleh', 3, CAST(N'2014-03-09' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(111.00 AS Decimal(5, 2)), CAST(N'1995-08-24' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (60, N'Jake Layman', 1, CAST(N'2014-03-10' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(N'1994-03-07' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (61, N'Pat Connaughton', 5, CAST(N'2014-03-11' AS Date), CAST(1.96 AS Decimal(3, 2)), CAST(95.00 AS Decimal(5, 2)), CAST(N'1993-01-06' AS Date), N'', 15)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (62, N'Tim Quarterman', 5, CAST(N'2014-03-12' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(85.00 AS Decimal(5, 2)), CAST(N'1994-10-27' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (63, N'Festus Ezeli', 4, CAST(N'2012-03-13' AS Date), CAST(2.10 AS Decimal(3, 2)), CAST(120.20 AS Decimal(5, 2)), CAST(N'1989-10-21' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (64, N'Gordon Daniel Hayward', 3, CAST(N'2004-03-14' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(102.00 AS Decimal(5, 2)), CAST(N'1990-03-23' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (65, N'George Jesse Hill Jr.', 5, CAST(N'2014-03-15' AS Date), CAST(1.91 AS Decimal(3, 2)), CAST(87.00 AS Decimal(5, 2)), CAST(N'1986-05-04' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (66, N'Rodney Hood', 4, CAST(N'2015-01-01' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(98.00 AS Decimal(5, 2)), CAST(N'1992-10-20' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (67, N'Rudy Gobert', 2, CAST(N'2015-01-02' AS Date), CAST(2.16 AS Decimal(3, 2)), CAST(111.00 AS Decimal(5, 2)), CAST(N'1992-06-26' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (68, N'Derrick Bernard Favors', 1, CAST(N'2015-01-03' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(119.00 AS Decimal(5, 2)), CAST(N'1991-07-15' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (69, N'Joe Marcus Johnson', 1, CAST(N'2008-06-05' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1981-06-29' AS Date), N'', 23)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (70, N'Shelvin Bernard Mack', 4, CAST(N'2015-01-03' AS Date), CAST(1.91 AS Decimal(3, 2)), CAST(92.00 AS Decimal(5, 2)), CAST(N'1989-04-22' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (71, N'Trey Lyles', 3, CAST(N'2015-01-04' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1995-11-05' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (72, N'Joe Ingles', 4, CAST(N'2015-01-05' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(98.00 AS Decimal(5, 2)), CAST(N'1987-10-02' AS Date), N'', 15)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (73, N'Dante Exum', 4, CAST(N'2015-01-06' AS Date), CAST(1.96 AS Decimal(3, 2)), CAST(86.00 AS Decimal(5, 2)), CAST(N'1995-07-13' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (74, N'Boris Diaw', 2, CAST(N'2015-01-07' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(113.00 AS Decimal(5, 2)), CAST(N'1982-04-16' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (75, N'Alec Burks', 3, CAST(N'2015-01-08' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(96.00 AS Decimal(5, 2)), CAST(N'1991-07-20' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (76, N'Jeff Withey', 5, CAST(N'2015-01-09' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(101.00 AS Decimal(5, 2)), CAST(N'1990-03-07' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (77, N'Raul Neto', 1, CAST(N'2013-01-10' AS Date), CAST(1.83 AS Decimal(3, 2)), CAST(78.00 AS Decimal(5, 2)), CAST(N'1992-04-19' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (78, N'Joel Bolomboy', 3, CAST(N'2013-01-11' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(107.00 AS Decimal(5, 2)), CAST(N'1994-01-28' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (79, N'Jimmy Butler', 2, CAST(N'2013-01-12' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(104.00 AS Decimal(5, 2)), CAST(N'1989-09-14' AS Date), N'', 23)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (80, N'Dwyane Tyrone Wade', 4, CAST(N'2013-01-13' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(N'1982-01-17' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (81, N'Taj Jami Gibson', 5, CAST(N'2013-01-14' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(107.00 AS Decimal(5, 2)), CAST(N'1985-06-24' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (82, N'Doug McDermott', 3, CAST(N'2013-01-15' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(101.00 AS Decimal(5, 2)), CAST(N'1992-01-03' AS Date), N'', 15)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (83, N'Robin Byron Lopez', 4, CAST(N'2013-01-16' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(120.00 AS Decimal(5, 2)), CAST(N'1988-04-01' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (84, N'Nikola Mirotic', 5, CAST(N'2013-01-17' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(N'1991-02-11' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (85, N'Michael Carter-Williams', 3, CAST(N'2013-01-18' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(86.00 AS Decimal(5, 2)), CAST(N'1991-10-10' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (86, N'Rajon Pierre Rondo', 1, CAST(N'2015-01-19' AS Date), CAST(1.85 AS Decimal(3, 2)), CAST(84.00 AS Decimal(5, 2)), CAST(N'1986-02-22' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (87, N'Isaiah Canaan', 5, CAST(N'2015-01-20' AS Date), CAST(1.83 AS Decimal(3, 2)), CAST(91.00 AS Decimal(5, 2)), CAST(N'1991-05-21' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (88, N'Jerian Grant', 4, CAST(N'2015-01-21' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(90.00 AS Decimal(5, 2)), CAST(N'1992-10-09' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (89, N'Cristiano Felicio', 2, CAST(N'2015-01-22' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(122.00 AS Decimal(5, 2)), CAST(N'1992-07-07' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (90, N'Bobby Portis', 3, CAST(N'2015-01-23' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(113.00 AS Decimal(5, 2)), CAST(N'1995-02-10' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (91, N'Denzel Valentine', 4, CAST(N'2015-01-24' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(96.00 AS Decimal(5, 2)), CAST(N'1993-11-16' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (92, N'Paul Zipser', 2, CAST(N'2015-01-25' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(95.00 AS Decimal(5, 2)), CAST(N'1994-02-18' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (93, N'R.J. Hunter', 2, CAST(N'2015-01-26' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(86.00 AS Decimal(5, 2)), CAST(N'1993-10-24' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (94, N'LeBron James', 1, CAST(N'2008-01-27' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(113.00 AS Decimal(5, 2)), CAST(N'1984-12-30' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (95, N'Kyrie Andrew Irving', 1, CAST(N'2008-01-28' AS Date), CAST(1.91 AS Decimal(3, 2)), CAST(88.00 AS Decimal(5, 2)), CAST(N'1992-03-23' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (96, N'Kevin Wesley Love', 5, CAST(N'2008-01-29' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(114.00 AS Decimal(5, 2)), CAST(N'1988-09-07' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (97, N'Channing Thomas Frye', 2, CAST(N'2008-01-30' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(116.00 AS Decimal(5, 2)), CAST(N'1983-05-17' AS Date), N'', 31)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (98, N'JR Smith', 5, CAST(N'2008-01-31' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(102.00 AS Decimal(5, 2)), CAST(N'1985-09-09' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (99, N'Kyle Elliot Korver', 4, CAST(N'2008-02-01' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(96.00 AS Decimal(5, 2)), CAST(N'1981-03-17' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (100, N'Iman Asante Shumpert', 2, CAST(N'2008-02-02' AS Date), CAST(1.96 AS Decimal(3, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(N'1990-06-26' AS Date), N'', 38)
GO
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (101, N'Tristan Trevor', 5, CAST(N'2008-02-03' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(108.00 AS Decimal(5, 2)), CAST(N'1991-03-13' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (102, N'Richard Allen Jefferson', 3, CAST(N'2008-02-04' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(106.00 AS Decimal(5, 2)), CAST(N'1980-06-21' AS Date), N'The Brearley School', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (103, N'Kay Felder', 4, CAST(N'2008-02-05' AS Date), CAST(1.75 AS Decimal(3, 2)), CAST(80.00 AS Decimal(5, 2)), CAST(N'1995-03-29' AS Date), N'The Brearley School', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (104, N'Jordan McRae', 3, CAST(N'2008-02-06' AS Date), CAST(1.96 AS Decimal(3, 2)), CAST(81.00 AS Decimal(5, 2)), CAST(N'1991-03-28' AS Date), N'The Brearley School', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (105, N'Michael Joseph', 4, CAST(N'2015-02-07' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(N'1980-09-15' AS Date), N'The Brearley School', 24)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (106, N'DeAndre Desmond Liggins', 1, CAST(N'2015-02-08' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(95.00 AS Decimal(5, 2)), CAST(N'1988-03-31' AS Date), N'The Brearley School', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (107, N'James Andrew Jones', 2, CAST(N'2015-02-09' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(99.00 AS Decimal(5, 2)), CAST(N'1980-10-04' AS Date), N'The Brearley School', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (108, N'Chris Andersen', 3, CAST(N'2015-02-10' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(111.00 AS Decimal(5, 2)), CAST(N'1978-07-07' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (109, N'Reggie Jackson', 4, CAST(N'2015-02-11' AS Date), CAST(1.91 AS Decimal(3, 2)), CAST(94.00 AS Decimal(5, 2)), CAST(N'1990-04-16' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (110, N'Tobias John Harris', 4, CAST(N'2015-02-12' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(107.00 AS Decimal(5, 2)), CAST(N'1992-07-15' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (111, N'Kentavious Caldwell-Pope', 5, CAST(N'2015-02-13' AS Date), CAST(1.96 AS Decimal(3, 2)), CAST(93.00 AS Decimal(5, 2)), CAST(N'1993-02-18' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (112, N'Andre Drummond', 5, CAST(N'2015-02-14' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(127.00 AS Decimal(5, 2)), CAST(N'1993-08-10' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (113, N'Marcus Morris', 1, CAST(N'2015-02-15' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(107.00 AS Decimal(5, 2)), CAST(N'1989-09-02' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (114, N'Jon Leuer', 5, CAST(N'2015-02-16' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(103.00 AS Decimal(5, 2)), CAST(N'1989-05-14' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (115, N'Ishmael Larry Smith', 2, CAST(N'2015-02-17' AS Date), CAST(1.83 AS Decimal(3, 2)), CAST(79.00 AS Decimal(5, 2)), CAST(N'1988-07-05' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (116, N'Reggie Bullock', 1, CAST(N'2015-02-18' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(93.00 AS Decimal(5, 2)), CAST(N'1991-03-16' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (117, N'Beno Udrih', 5, CAST(N'2015-02-19' AS Date), CAST(1.91 AS Decimal(3, 2)), CAST(93.00 AS Decimal(5, 2)), CAST(N'1982-07-05' AS Date), N'', 9)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (118, N'Aron Baynes', 3, CAST(N'2015-02-20' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(118.00 AS Decimal(5, 2)), CAST(N'1986-12-09' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (119, N'Stanley Johnson', 3, CAST(N'2015-02-21' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(111.00 AS Decimal(5, 2)), CAST(N'1996-03-29' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (120, N'Boban Marjanovic', 2, CAST(N'2015-02-22' AS Date), CAST(2.21 AS Decimal(3, 2)), CAST(132.00 AS Decimal(5, 2)), CAST(N'1988-08-15' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (121, N'Darrun Hilliard', 4, CAST(N'2015-02-23' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(93.00 AS Decimal(5, 2)), CAST(N'1993-04-13' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (122, N'Henry Ellenson', 2, CAST(N'2015-02-24' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(111.00 AS Decimal(5, 2)), CAST(N'1997-01-13' AS Date), N'', 36)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (123, N'Michael Gbinije', 4, CAST(N'2015-02-25' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(91.00 AS Decimal(5, 2)), CAST(N'1992-06-05' AS Date), N'', 11)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (124, N'Paul George', 1, CAST(N'2015-02-26' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(102.00 AS Decimal(5, 2)), CAST(N'1990-05-02' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (125, N'Jeffrey Demarco Teague', 4, CAST(N'2015-02-27' AS Date), CAST(1.88 AS Decimal(3, 2)), CAST(84.00 AS Decimal(5, 2)), CAST(N'1988-06-10' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (126, N'Myles Turner', 4, CAST(N'2015-02-28' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1996-05-24' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (127, N'Thaddeus Charles Young', 2, CAST(N'2015-03-01' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(N'1988-06-21' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (128, N'Calvin Andre Miles Jr.', 4, CAST(N'2015-03-02' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(102.00 AS Decimal(5, 2)), CAST(N'1987-04-18' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (129, N'Rodney Norvell Stuckey', 5, CAST(N'2010-03-03' AS Date), CAST(1.96 AS Decimal(3, 2)), CAST(95.00 AS Decimal(5, 2)), CAST(N'1986-04-21' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (130, N'Monta Ellis', 1, CAST(N'2010-03-04' AS Date), CAST(1.91 AS Decimal(3, 2)), CAST(84.00 AS Decimal(5, 2)), CAST(N'1985-10-26' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (131, N'Al Jefferson', 2, CAST(N'2010-03-05' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(131.00 AS Decimal(5, 2)), CAST(N'1985-01-04' AS Date), N'Phillips Academy Andover', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (132, N'Glenn Robinson III', 5, CAST(N'2010-03-06' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(101.00 AS Decimal(5, 2)), CAST(N'1994-01-08' AS Date), N'Phillips Academy Andover', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (133, N'Aaron Jamal Brooks', 3, CAST(N'2010-03-07' AS Date), CAST(1.83 AS Decimal(3, 2)), CAST(84.00 AS Decimal(5, 2)), CAST(N'1985-01-14' AS Date), N'Phillips Academy Andover', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (134, N'Kevin Seraphin', 1, CAST(N'2010-03-08' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(125.00 AS Decimal(5, 2)), CAST(N'1989-12-07' AS Date), N'Phillips Academy Andover', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (135, N'Joe Young', 5, CAST(N'2010-03-09' AS Date), CAST(1.88 AS Decimal(3, 2)), CAST(82.00 AS Decimal(5, 2)), CAST(N'1992-06-27' AS Date), N'Phillips Academy Andover', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (136, N'Lavoy Allen', 5, CAST(N'2010-03-10' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(118.00 AS Decimal(5, 2)), CAST(N'1989-02-04' AS Date), N'Phillips Academy Andover', 31)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (137, N'Rakeem Christmas', 2, CAST(N'2010-03-11' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(113.00 AS Decimal(5, 2)), CAST(N'1991-12-01' AS Date), N'Phillips Academy Andover', 11)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (138, N'Georges Niang', 4, CAST(N'2015-03-12' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(104.00 AS Decimal(5, 2)), CAST(N'1993-06-17' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (139, N'Giannis Antetokounmpo', 2, CAST(N'2015-03-13' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(98.00 AS Decimal(5, 2)), CAST(N'1994-12-16' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (140, N'Jabari Parker', 2, CAST(N'2015-03-14' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1995-03-15' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (141, N'Malcolm Brogdon', 1, CAST(N'2015-03-15' AS Date), CAST(1.96 AS Decimal(3, 2)), CAST(98.00 AS Decimal(5, 2)), CAST(N'1992-12-11' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (142, N'Michael Paul Beasley', 3, CAST(N'2015-03-16' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(107.00 AS Decimal(5, 2)), CAST(N'1989-01-09' AS Date), N'', 31)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (143, N'Tony Snell', 3, CAST(N'2015-03-17' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(91.00 AS Decimal(5, 2)), CAST(N'1991-11-10' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (144, N'Matthew Dellavedova', 3, CAST(N'2015-03-18' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(91.00 AS Decimal(5, 2)), CAST(N'1990-09-08' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (145, N'Mirza Teletovic', 5, CAST(N'2015-03-19' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(110.00 AS Decimal(5, 2)), CAST(N'1985-09-17' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (146, N'John Henson', 3, CAST(N'2015-03-20' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(104.00 AS Decimal(5, 2)), CAST(N'1990-12-28' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (147, N'Rashad Vaughn', 1, CAST(N'2015-03-21' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(95.00 AS Decimal(5, 2)), CAST(N'1996-08-16' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (148, N'Jason Eugene Terry', 2, CAST(N'2015-03-22' AS Date), CAST(1.88 AS Decimal(3, 2)), CAST(84.00 AS Decimal(5, 2)), CAST(N'1977-09-15' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (149, N'Thon Maker', 5, CAST(N'2015-03-23' AS Date), CAST(2.16 AS Decimal(3, 2)), CAST(101.00 AS Decimal(5, 2)), CAST(N'1997-02-25' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (150, N'Steven Michael Novak', 5, CAST(N'2015-03-24' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(102.00 AS Decimal(5, 2)), CAST(N'1983-06-13' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (151, N'Khris Middleton', 2, CAST(N'2015-03-25' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(106.00 AS Decimal(5, 2)), CAST(N'1991-08-12' AS Date), N'Horace Mann School', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (152, N'Greg Monroe', 4, CAST(N'2007-03-26' AS Date), CAST(2.10 AS Decimal(3, 2)), CAST(120.20 AS Decimal(5, 2)), CAST(N'1990-06-04' AS Date), N'Horace Mann School', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (153, N'Brook Robert Lopez', 1, CAST(N'2007-03-27' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(125.00 AS Decimal(5, 2)), CAST(N'1988-04-01' AS Date), N'Horace Mann School', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (154, N'Bojan Bogdanovic', 3, CAST(N'2007-03-28' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(98.00 AS Decimal(5, 2)), CAST(N'1989-04-18' AS Date), N'Horace Mann School', 9)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (155, N'Sean Kilpatrick', 3, CAST(N'2007-03-29' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(95.00 AS Decimal(5, 2)), CAST(N'1990-01-06' AS Date), N'Horace Mann School', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (156, N'Jeremy Shu-How Lin', 1, CAST(N'2007-03-30' AS Date), CAST(1.91 AS Decimal(3, 2)), CAST(91.00 AS Decimal(5, 2)), CAST(N'1988-08-23' AS Date), N'Horace Mann School', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (157, N'Trevor Fitzgerald Booker', 1, CAST(N'2007-03-31' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(104.00 AS Decimal(5, 2)), CAST(N'1987-11-25' AS Date), N'Horace Mann School', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (158, N'Joe Harris', 2, CAST(N'2007-04-01' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(99.00 AS Decimal(5, 2)), CAST(N'1991-09-07' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (159, N'Quincy Acy', 2, CAST(N'2015-04-02' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1990-10-06' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (160, N'Rondae Hollis-Jefferson', 3, CAST(N'2015-04-03' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(95.00 AS Decimal(5, 2)), CAST(N'1995-01-03' AS Date), N'', 24)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (161, N'Justin Hamilton', 4, CAST(N'2015-04-04' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(118.00 AS Decimal(5, 2)), CAST(N'1990-04-01' AS Date), N'', 19)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (162, N'Caris LeVert', 4, CAST(N'2015-04-05' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(84.00 AS Decimal(5, 2)), CAST(N'1994-08-25' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (163, N'Isaiah Whitehead', 2, CAST(N'2015-04-06' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(97.00 AS Decimal(5, 2)), CAST(N'1995-05-08' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (164, N'Luis Alberto Scola', 1, CAST(N'2015-04-07' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1980-04-30' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (165, N'Yogi Ferrell', 5, CAST(N'2015-04-08' AS Date), CAST(1.83 AS Decimal(3, 2)), CAST(82.00 AS Decimal(5, 2)), CAST(N'1993-05-09' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (166, N'Randy Foye', 2, CAST(N'1996-04-09' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(97.00 AS Decimal(5, 2)), CAST(N'1983-09-24' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (167, N'Spencer Dinwiddie', 4, CAST(N'2015-04-10' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(91.00 AS Decimal(5, 2)), CAST(N'1993-04-06' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (168, N'Anthony Bennett', 3, CAST(N'2015-04-11' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(111.00 AS Decimal(5, 2)), CAST(N'1993-03-14' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (169, N'Chris McCullough', 5, CAST(N'2015-04-12' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(91.00 AS Decimal(5, 2)), CAST(N'1995-02-05' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (170, N'Greivis Josue Vasquez', 4, CAST(N'2010-04-13' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(91.00 AS Decimal(5, 2)), CAST(N'1987-01-16' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (171, N'Isaiah Jamar Thomas', 5, CAST(N'2010-04-14' AS Date), CAST(1.75 AS Decimal(3, 2)), CAST(84.00 AS Decimal(5, 2)), CAST(N'1989-02-07' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (172, N'Avery Antonio Bradley Jr.', 3, CAST(N'2010-04-15' AS Date), CAST(1.88 AS Decimal(3, 2)), CAST(82.00 AS Decimal(5, 2)), CAST(N'1990-11-26' AS Date), N'', 3)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (173, N'Alfred Joel Horford', 1, CAST(N'2010-04-16' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(111.00 AS Decimal(5, 2)), CAST(N'1986-06-03' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (174, N'Jae Crowder', 5, CAST(N'2010-04-17' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(107.00 AS Decimal(5, 2)), CAST(N'1990-07-06' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (175, N'Marcus Smart', 1, CAST(N'2015-04-18' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(N'1994-03-06' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (176, N'Kelly Olynyk', 3, CAST(N'2015-04-19' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(108.00 AS Decimal(5, 2)), CAST(N'1991-04-19' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (177, N'Amir Johnson', 1, CAST(N'2008-04-20' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(113.00 AS Decimal(5, 2)), CAST(N'1987-05-01' AS Date), N'Horace Mann School', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (178, N'Terry Rozier', 1, CAST(N'2015-04-21' AS Date), CAST(1.85 AS Decimal(3, 2)), CAST(86.00 AS Decimal(5, 2)), CAST(N'1994-04-17' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (179, N'Gerald Green Jr.', 2, CAST(N'2008-04-22' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(93.00 AS Decimal(5, 2)), CAST(N'1986-01-26' AS Date), N'', 36)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (180, N'Jaylen Brown', 3, CAST(N'2015-04-23' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(102.00 AS Decimal(5, 2)), CAST(N'1996-10-24' AS Date), N'Horace Mann School', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (181, N'Jonas Jerebko', 2, CAST(N'2007-04-24' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(105.00 AS Decimal(5, 2)), CAST(N'1987-03-03' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (182, N'Tyler Zeller', 3, CAST(N'2009-04-25' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(113.00 AS Decimal(5, 2)), CAST(N'1990-01-17' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (183, N'Jordan Mickey', 4, CAST(N'2015-04-26' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(107.00 AS Decimal(5, 2)), CAST(N'1994-07-09' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (184, N'Demetrius Jackson', 4, CAST(N'2015-04-27' AS Date), CAST(1.85 AS Decimal(3, 2)), CAST(91.00 AS Decimal(5, 2)), CAST(N'1994-09-07' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (185, N'James Young', 5, CAST(N'2015-04-28' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(98.00 AS Decimal(5, 2)), CAST(N'1995-08-16' AS Date), N'', 3)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (186, N'Carmelo K. Anthony', 4, CAST(N'2007-04-29' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1984-05-29' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (187, N'Kristaps Porzingis', 3, CAST(N'2015-04-30' AS Date), CAST(2.21 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1995-08-02' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (188, N'Derrick Martell Rose', 3, CAST(N'2007-05-01' AS Date), CAST(1.91 AS Decimal(3, 2)), CAST(86.00 AS Decimal(5, 2)), CAST(N'1988-10-04' AS Date), N'Horace Mann School', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (189, N'Courtney Lee', 1, CAST(N'2007-05-02' AS Date), CAST(1.96 AS Decimal(3, 2)), CAST(91.00 AS Decimal(5, 2)), CAST(N'1985-10-03' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (190, N'Brandon Jennings', 5, CAST(N'2007-05-03' AS Date), CAST(1.85 AS Decimal(3, 2)), CAST(77.00 AS Decimal(5, 2)), CAST(N'1989-09-23' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (191, N'Justin Holiday', 1, CAST(N'2007-05-04' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(84.00 AS Decimal(5, 2)), CAST(N'1989-04-05' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (192, N'Kyle O''Quinn', 5, CAST(N'2007-05-05' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(113.00 AS Decimal(5, 2)), CAST(N'1990-03-26' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (193, N'Mindaugas Kuzminskas', 2, CAST(N'2007-05-06' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(98.00 AS Decimal(5, 2)), CAST(N'1989-10-19' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (194, N'Willy Hernangomez', 2, CAST(N'2015-05-07' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1994-05-27' AS Date), N'Horace Mann School', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (195, N'Joakim Simon Noah', 1, CAST(N'2015-05-08' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(105.00 AS Decimal(5, 2)), CAST(N'1985-02-25' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (196, N'Lance Thomas', 3, CAST(N'2015-05-09' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(102.00 AS Decimal(5, 2)), CAST(N'1988-04-24' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (197, N'Ron Baker', 3, CAST(N'2015-05-10' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(N'1993-03-30' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (198, N'Maurice Ndour', 1, CAST(N'2015-05-11' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(93.00 AS Decimal(5, 2)), CAST(N'1992-06-18' AS Date), N'', 16)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (199, N'Sasha Vujacic', 4, CAST(N'2007-05-12' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(88.00 AS Decimal(5, 2)), CAST(N'1984-03-08' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (200, N'Marshall Plumlee', 4, CAST(N'2015-05-13' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(113.00 AS Decimal(5, 2)), CAST(N'1992-07-14' AS Date), N'', 38)
GO
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (201, N'Joel Embiid', 4, CAST(N'2015-05-14' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(113.00 AS Decimal(5, 2)), CAST(N'1994-03-16' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (202, N'Ben Simmons', 4, CAST(N'2015-05-15' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(107.00 AS Decimal(5, 2)), CAST(N'1987-05-15' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (203, N'Jahlil Okafor', 2, CAST(N'2015-05-16' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(125.00 AS Decimal(5, 2)), CAST(N'1995-12-15' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (204, N'Jerryd Bayless', 3, CAST(N'2008-05-17' AS Date), CAST(1.91 AS Decimal(3, 2)), CAST(91.00 AS Decimal(5, 2)), CAST(N'1988-08-20' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (205, N'Robert Covington', 4, CAST(N'2015-05-18' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(98.00 AS Decimal(5, 2)), CAST(N'1990-12-14' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (206, N'Dario Saric', 2, CAST(N'2015-05-19' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(110.00 AS Decimal(5, 2)), CAST(N'1993-03-08' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (207, N'Gerald McKinley', 3, CAST(N'2009-05-20' AS Date), CAST(1.96 AS Decimal(3, 2)), CAST(98.00 AS Decimal(5, 2)), CAST(N'1987-12-09' AS Date), N'', 19)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (208, N'Sergio Rodriguez', 2, CAST(N'2009-05-21' AS Date), CAST(1.91 AS Decimal(3, 2)), CAST(76.00 AS Decimal(5, 2)), CAST(N'1986-06-12' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (209, N'Nik Stauskas', 5, CAST(N'2009-05-22' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(93.00 AS Decimal(5, 2)), CAST(N'1993-10-07' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (210, N'Nerlens Noel', 1, CAST(N'2009-05-23' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(103.00 AS Decimal(5, 2)), CAST(N'1994-04-10' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (211, N'Richaun Holmes', 4, CAST(N'2009-05-24' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(111.00 AS Decimal(5, 2)), CAST(N'1993-10-15' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (212, N'Hollis Thompson', 3, CAST(N'2009-05-25' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(93.00 AS Decimal(5, 2)), CAST(N'1991-04-03' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (213, N'Chasson Randle', 3, CAST(N'2009-05-26' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(110.20 AS Decimal(5, 2)), CAST(N'1991-04-03' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (214, N'T.J. McConnell', 5, CAST(N'2015-05-27' AS Date), CAST(1.85 AS Decimal(3, 2)), CAST(91.00 AS Decimal(5, 2)), CAST(N'1992-04-25' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (215, N'Timothe Luwawu-Cabarrot', 2, CAST(N'2015-05-28' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(93.00 AS Decimal(5, 2)), CAST(N'1995-05-09' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (216, N'DeMar Darnell DeRozan', 1, CAST(N'2015-05-29' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(N'1989-08-07' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (217, N'Kyle Lowry', 5, CAST(N'2015-05-30' AS Date), CAST(1.85 AS Decimal(3, 2)), CAST(89.00 AS Decimal(5, 2)), CAST(N'1986-03-25' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (218, N'Jonas Valanciunas', 2, CAST(N'2013-05-31' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(120.00 AS Decimal(5, 2)), CAST(N'1992-05-06' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (219, N'Terrence Ross', 4, CAST(N'2013-06-01' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(88.00 AS Decimal(5, 2)), CAST(N'1991-02-05' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (220, N'DeMarre LaEdrick Carroll', 4, CAST(N'2013-06-02' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(98.00 AS Decimal(5, 2)), CAST(N'1986-07-27' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (221, N'Cory Ephram Joseph', 5, CAST(N'2013-06-03' AS Date), CAST(1.91 AS Decimal(3, 2)), CAST(88.00 AS Decimal(5, 2)), CAST(N'1991-08-20' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (222, N'Patrick Davell Patterson', 5, CAST(N'2013-06-04' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(104.00 AS Decimal(5, 2)), CAST(N'1989-03-14' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (223, N'Jared Sullinger', 1, CAST(N'2013-06-05' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(127.00 AS Decimal(5, 2)), CAST(N'1992-04-04' AS Date), N'', 25)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (224, N'Norman Powell', 2, CAST(N'2015-06-06' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(98.00 AS Decimal(5, 2)), CAST(N'1993-03-25' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (225, N'Lucas Nogueira', 2, CAST(N'2015-06-07' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(N'1992-07-26' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (226, N'Pascal Siakam', 1, CAST(N'2015-06-08' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(104.00 AS Decimal(5, 2)), CAST(N'1994-04-02' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (227, N'Fred VanVleet', 3, CAST(N'2015-06-09' AS Date), CAST(1.83 AS Decimal(3, 2)), CAST(88.00 AS Decimal(5, 2)), CAST(N'1994-02-25' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (228, N'Jakob Poeltl', 5, CAST(N'2015-06-10' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(104.00 AS Decimal(5, 2)), CAST(N'1995-10-15' AS Date), N'', 19)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (229, N'Bruno Caboclo', 2, CAST(N'2015-06-11' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(99.00 AS Decimal(5, 2)), CAST(N'1995-09-21' AS Date), N'', 6)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (230, N'Delon Wright', 1, CAST(N'2012-06-12' AS Date), CAST(1.95 AS Decimal(3, 2)), CAST(86.20 AS Decimal(5, 2)), CAST(N'1992-04-26' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (231, N'Paul Millsap', 1, CAST(N'2015-06-13' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(112.00 AS Decimal(5, 2)), CAST(N'1985-02-10' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (232, N'Dennis Schroder', 4, CAST(N'2015-06-14' AS Date), CAST(1.85 AS Decimal(3, 2)), CAST(78.00 AS Decimal(5, 2)), CAST(N'1993-09-15' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (233, N'Dwight David Howard', 2, CAST(N'2015-06-15' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(120.00 AS Decimal(5, 2)), CAST(N'1985-12-08' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (234, N'Tim Hardaway Jr.', 1, CAST(N'2015-06-16' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(93.00 AS Decimal(5, 2)), CAST(N'1992-03-16' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (235, N'Kent Bazemore', 3, CAST(N'2007-06-17' AS Date), CAST(1.96 AS Decimal(3, 2)), CAST(91.00 AS Decimal(5, 2)), CAST(N'1989-07-01' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (236, N'Mike Muscala', 1, CAST(N'2007-06-18' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1991-07-01' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (237, N'Thabo Patrick Sefolosha', 4, CAST(N'2007-06-19' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(N'1984-05-02' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (238, N'Lamar Patterson', 5, CAST(N'2007-06-20' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(N'1980-09-15' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (239, N'Malcolm Delaney', 3, CAST(N'2007-06-21' AS Date), CAST(1.91 AS Decimal(3, 2)), CAST(86.00 AS Decimal(5, 2)), CAST(N'1989-03-11' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (240, N'Kris Nathan Humphries', 1, CAST(N'2007-06-22' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(107.00 AS Decimal(5, 2)), CAST(N'1985-02-06' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (241, N'Taurean Prince', 3, CAST(N'2015-06-23' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(N'1994-03-22' AS Date), N'', 16)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (242, N'DeAndre Bembry', 5, CAST(N'2015-06-24' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(95.00 AS Decimal(5, 2)), CAST(N'1994-07-04' AS Date), N'', 2)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (243, N'Mike Scott', 4, CAST(N'2015-06-25' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(108.00 AS Decimal(5, 2)), CAST(N'1988-07-16' AS Date), N'', 13)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (244, N'Walter Tavares', 2, CAST(N'2015-06-26' AS Date), CAST(2.21 AS Decimal(3, 2)), CAST(120.00 AS Decimal(5, 2)), CAST(N'1992-05-22' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (245, N'Gary Neal', 2, CAST(N'2000-06-27' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(95.00 AS Decimal(5, 2)), CAST(N'1984-10-03' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (246, N'Ryan Kelly', 4, CAST(N'2015-06-28' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(104.00 AS Decimal(5, 2)), CAST(N'1991-04-09' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (247, N'Tiago Splitter', 2, CAST(N'2008-06-29' AS Date), CAST(2.10 AS Decimal(3, 2)), CAST(111.10 AS Decimal(5, 2)), CAST(N'1985-01-01' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (248, N'Kemba Hudley Walker', 3, CAST(N'2008-06-30' AS Date), CAST(1.85 AS Decimal(3, 2)), CAST(83.00 AS Decimal(5, 2)), CAST(N'1990-05-08' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (249, N'Nicolas Batum', 1, CAST(N'2008-07-01' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(91.00 AS Decimal(5, 2)), CAST(N'1988-12-14' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (250, N'Cody Zeller', 5, CAST(N'2008-07-02' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1992-10-05' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (251, N'Marvin Gaye Williams', 3, CAST(N'2008-07-03' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(108.00 AS Decimal(5, 2)), CAST(N'1986-06-19' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (252, N'Marco Belinelli', 2, CAST(N'2008-07-04' AS Date), CAST(1.96 AS Decimal(3, 2)), CAST(98.00 AS Decimal(5, 2)), CAST(N'1986-03-25' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (253, N'Frank Kaminsky III', 4, CAST(N'2008-07-05' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(110.00 AS Decimal(5, 2)), CAST(N'1993-04-04' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (254, N'Jeremy Lamb', 5, CAST(N'2008-07-06' AS Date), CAST(1.96 AS Decimal(3, 2)), CAST(84.00 AS Decimal(5, 2)), CAST(N'1992-05-30' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (255, N'Michael Kidd-Gilchrist', 2, CAST(N'2008-07-07' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(105.00 AS Decimal(5, 2)), CAST(N'1993-09-26' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (256, N'Spencer Mason Hawes', 2, CAST(N'2008-07-08' AS Date), CAST(2.16 AS Decimal(3, 2)), CAST(111.00 AS Decimal(5, 2)), CAST(N'1988-04-28' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (257, N'Ramon Sessions', 1, CAST(N'2008-07-09' AS Date), CAST(1.91 AS Decimal(3, 2)), CAST(86.00 AS Decimal(5, 2)), CAST(N'1986-04-11' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (258, N'Roy Denzil Hibbert', 4, CAST(N'2008-07-10' AS Date), CAST(2.18 AS Decimal(3, 2)), CAST(122.00 AS Decimal(5, 2)), CAST(N'1986-12-11' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (259, N'Treveon Graham', 4, CAST(N'2015-07-11' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(99.00 AS Decimal(5, 2)), CAST(N'1993-10-28' AS Date), N'', 33)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (260, N'Brian Roberts', 3, CAST(N'2015-07-12' AS Date), CAST(1.85 AS Decimal(3, 2)), CAST(78.00 AS Decimal(5, 2)), CAST(N'1994-10-28' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (261, N'Aaron Harrison', 5, CAST(N'2015-07-13' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(96.00 AS Decimal(5, 2)), CAST(N'1994-10-28' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (262, N'Christian Wood', 3, CAST(N'2015-07-14' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(N'1995-09-27' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (263, N'Miles Plumlee', 1, CAST(N'2012-07-15' AS Date), CAST(2.10 AS Decimal(3, 2)), CAST(112.90 AS Decimal(5, 2)), CAST(N'1988-09-01' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (264, N'Mike Tobey', 4, CAST(N'2012-07-16' AS Date), CAST(2.20 AS Decimal(3, 2)), CAST(116.90 AS Decimal(5, 2)), CAST(N'1988-09-02' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (265, N'Ray McCallum', 5, CAST(N'2012-07-17' AS Date), CAST(2.10 AS Decimal(3, 2)), CAST(122.90 AS Decimal(5, 2)), CAST(N'1988-09-03' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (266, N'Goran Dragic', 3, CAST(N'2012-07-18' AS Date), CAST(1.91 AS Decimal(3, 2)), CAST(86.00 AS Decimal(5, 2)), CAST(N'1986-05-06' AS Date), N'', 2)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (267, N'Hassan Niam Whiteside', 3, CAST(N'2012-07-19' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(107.00 AS Decimal(5, 2)), CAST(N'1989-06-13' AS Date), N'', 18)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (268, N'Tyler Johnson', 5, CAST(N'2015-07-20' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(86.00 AS Decimal(5, 2)), CAST(N'1992-04-07' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (269, N'Dion Waiters', 3, CAST(N'2015-07-21' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(102.00 AS Decimal(5, 2)), CAST(N'1991-12-10' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (270, N'James Patrick Johnson', 5, CAST(N'2015-07-22' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(108.00 AS Decimal(5, 2)), CAST(N'1987-02-20' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (271, N'Josh Richardson', 5, CAST(N'2015-07-23' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(91.00 AS Decimal(5, 2)), CAST(N'1993-09-15' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (272, N'Justise Winslow', 4, CAST(N'2015-07-24' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(102.00 AS Decimal(5, 2)), CAST(N'1996-04-26' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (273, N'Wayne Robert Ellington', 1, CAST(N'2007-07-25' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(91.00 AS Decimal(5, 2)), CAST(N'1987-10-29' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (274, N'Derrick LeRon Williams', 2, CAST(N'2007-07-26' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1991-05-25' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (275, N'Rodney McGruder', 1, CAST(N'2007-07-27' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(93.00 AS Decimal(5, 2)), CAST(N'1991-07-29' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (276, N'Willie Reed', 4, CAST(N'2007-07-28' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(107.00 AS Decimal(5, 2)), CAST(N'1990-03-16' AS Date), N'', 25)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (277, N'Joshua Scott McRoberts', 1, CAST(N'2007-07-29' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1987-02-28' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (278, N'Luke Robert Babbitt', 4, CAST(N'2007-07-30' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(98.00 AS Decimal(5, 2)), CAST(N'1989-06-20' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (279, N'Udonis Johneal Haslem', 2, CAST(N'2007-07-31' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(107.00 AS Decimal(5, 2)), CAST(N'1980-06-09' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (280, N'Chris Bosh', 5, CAST(N'2007-08-01' AS Date), CAST(2.22 AS Decimal(3, 2)), CAST(123.30 AS Decimal(5, 2)), CAST(N'1992-10-28' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (281, N'Okaro White', 2, CAST(N'2007-08-02' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(96.00 AS Decimal(5, 2)), CAST(N'1992-10-28' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (282, N'Evan Fournier', 3, CAST(N'2007-08-03' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(93.00 AS Decimal(5, 2)), CAST(N'1992-10-29' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (283, N'Serge Ibaka', 5, CAST(N'2007-08-04' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(111.00 AS Decimal(5, 2)), CAST(N'1989-09-18' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (284, N'Nikola Vucevic', 2, CAST(N'2007-08-05' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(118.00 AS Decimal(5, 2)), CAST(N'1990-10-24' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (285, N'Elfrid Payton', 3, CAST(N'2015-08-06' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(84.00 AS Decimal(5, 2)), CAST(N'1994-02-22' AS Date), N'', 5)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (286, N'Aaron Gordon', 4, CAST(N'2015-08-07' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(N'1995-09-16' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (287, N'Jeffrey Lynn Green', 5, CAST(N'2015-08-08' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(107.00 AS Decimal(5, 2)), CAST(N'1986-08-28' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (288, N'Jodie Meeks', 2, CAST(N'2015-08-09' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(95.00 AS Decimal(5, 2)), CAST(N'1987-08-21' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (289, N'Darryl Gerard', 5, CAST(N'2015-08-10' AS Date), CAST(1.83 AS Decimal(3, 2)), CAST(83.00 AS Decimal(5, 2)), CAST(N'1987-11-10' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (290, N'Bismack Biyombo', 3, CAST(N'2015-08-11' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(116.00 AS Decimal(5, 2)), CAST(N'1992-08-28' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (291, N'Mario Hezonja', 1, CAST(N'2015-08-12' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(99.00 AS Decimal(5, 2)), CAST(N'1995-02-25' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (292, N'Charles Akeem Watson Jr.', 2, CAST(N'2015-08-13' AS Date), CAST(1.88 AS Decimal(3, 2)), CAST(79.00 AS Decimal(5, 2)), CAST(N'1984-04-17' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (293, N'Anthony Brown', 1, CAST(N'2015-08-14' AS Date), CAST(1.96 AS Decimal(3, 2)), CAST(95.00 AS Decimal(5, 2)), CAST(N'1992-10-10' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (294, N'Damjan Rudez', 4, CAST(N'2015-08-15' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(104.00 AS Decimal(5, 2)), CAST(N'1986-06-17' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (295, N'Stephen Zimmerman', 4, CAST(N'2015-08-16' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1996-09-09' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (296, N'C.J. Wilcox', 4, CAST(N'2015-08-17' AS Date), CAST(1.96 AS Decimal(3, 2)), CAST(88.00 AS Decimal(5, 2)), CAST(N'1990-12-30' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (297, N'Arinze Onuaku', 1, CAST(N'2015-08-18' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(125.00 AS Decimal(5, 2)), CAST(N'1987-07-13' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (298, N'Johnathan Hildred Wall', 2, CAST(N'2015-08-19' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(88.00 AS Decimal(5, 2)), CAST(N'1990-09-06' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (299, N'Bradley Beal', 2, CAST(N'2015-08-20' AS Date), CAST(1.96 AS Decimal(3, 2)), CAST(94.00 AS Decimal(5, 2)), CAST(N'1993-06-28' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (300, N'Otto Porter Jr.', 3, CAST(N'2015-08-21' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(90.00 AS Decimal(5, 2)), CAST(N'1993-06-03' AS Date), N'', 13)
GO
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (301, N'Markieff Morris', 1, CAST(N'2015-08-22' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(111.00 AS Decimal(5, 2)), CAST(N'1989-09-02' AS Date), N'', 34)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (302, N'Marcin Gortat', 2, CAST(N'2015-08-23' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1984-02-17' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (303, N'Marcus Terrell Thornton', 4, CAST(N'2015-08-24' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(93.00 AS Decimal(5, 2)), CAST(N'1987-06-05' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (304, N'Kelly Oubre Jr.', 4, CAST(N'2015-08-25' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(93.00 AS Decimal(5, 2)), CAST(N'1995-12-09' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (305, N'Jason Victor Smith', 5, CAST(N'2015-08-26' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1986-03-02' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (306, N'Trey Burke', 1, CAST(N'2015-08-27' AS Date), CAST(1.85 AS Decimal(3, 2)), CAST(84.00 AS Decimal(5, 2)), CAST(N'1992-11-12' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (307, N'Sheldon McClellan', 3, CAST(N'2015-08-28' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(91.00 AS Decimal(5, 2)), CAST(N'1992-12-21' AS Date), N'', 5)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (308, N'Tomas Satoransky', 3, CAST(N'2015-08-29' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(95.00 AS Decimal(5, 2)), CAST(N'1991-10-30' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (309, N'Andrew Nicholson', 2, CAST(N'2009-08-30' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(113.00 AS Decimal(5, 2)), CAST(N'1989-12-08' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (310, N'Daniel Ochefu', 1, CAST(N'2015-08-31' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(111.00 AS Decimal(5, 2)), CAST(N'1993-12-15' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (311, N'Ian Mahinmi', 4, CAST(N'1998-09-01' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(116.00 AS Decimal(5, 2)), CAST(N'1986-11-05' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (312, N'Danuel House', 1, CAST(N'2015-09-02' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(94.00 AS Decimal(5, 2)), CAST(N'1993-06-07' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (313, N'Kevin Wayne Durant', 1, CAST(N'2015-09-03' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1988-09-29' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (314, N'Wardell Stephen Curry II', 3, CAST(N'2015-09-04' AS Date), CAST(1.91 AS Decimal(3, 2)), CAST(86.00 AS Decimal(5, 2)), CAST(N'1988-03-14' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (315, N'Klay Alexander Thompson', 1, CAST(N'2010-09-05' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(98.00 AS Decimal(5, 2)), CAST(N'1990-02-08' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (316, N'Draymond Green', 5, CAST(N'2015-09-06' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(104.00 AS Decimal(5, 2)), CAST(N'1990-03-04' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (317, N'Ian Clark', 2, CAST(N'2014-09-07' AS Date), CAST(1.91 AS Decimal(3, 2)), CAST(79.00 AS Decimal(5, 2)), CAST(N'1991-03-07' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (318, N'Andre Tyler Iguodala', 4, CAST(N'2004-09-08' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(94.00 AS Decimal(5, 2)), CAST(N'1984-01-28' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (319, N'Zaur Pachulia', 4, CAST(N'2004-09-09' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(125.00 AS Decimal(5, 2)), CAST(N'1984-02-10' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (320, N'JaVale Lindy McGee', 1, CAST(N'2008-09-10' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(122.00 AS Decimal(5, 2)), CAST(N'1988-01-19' AS Date), N'', 22)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (321, N'Shaun Patrick Livingston', 5, CAST(N'2008-09-11' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(83.00 AS Decimal(5, 2)), CAST(N'1985-09-11' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (322, N'David Moorer West', 3, CAST(N'2008-09-12' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1980-08-29' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (323, N'Patrick McCaw', 3, CAST(N'2015-09-13' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(84.00 AS Decimal(5, 2)), CAST(N'1995-10-25' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (324, N'Kevon Looney', 5, CAST(N'2015-09-14' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(N'1996-02-06' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (325, N'James Michael McAdoo', 3, CAST(N'2015-09-15' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(104.00 AS Decimal(5, 2)), CAST(N'1993-01-04' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (326, N'Anderson Franca Varejao', 1, CAST(N'2015-09-16' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(124.00 AS Decimal(5, 2)), CAST(N'1982-09-28' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (327, N'Damian Jones', 2, CAST(N'2015-09-17' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(111.00 AS Decimal(5, 2)), CAST(N'1995-06-30' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (328, N'Blake Austin Griffin', 1, CAST(N'2015-09-18' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(114.00 AS Decimal(5, 2)), CAST(N'1989-03-16' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (329, N'Christopher Emmanuel Paul', 4, CAST(N'2015-09-19' AS Date), CAST(1.83 AS Decimal(3, 2)), CAST(79.00 AS Decimal(5, 2)), CAST(N'1985-05-06' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (330, N'Jonathan Clay Redick', 2, CAST(N'2015-09-20' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(86.00 AS Decimal(5, 2)), CAST(N'1984-06-24' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (331, N'Hyland DeAndre Jordan Jr.', 2, CAST(N'2015-09-21' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(120.00 AS Decimal(5, 2)), CAST(N'1988-07-21' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (332, N'Aaron Jamal Crawford', 3, CAST(N'2015-09-22' AS Date), CAST(1.96 AS Decimal(3, 2)), CAST(91.00 AS Decimal(5, 2)), CAST(N'1980-03-20' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (333, N'Austin Rivers', 5, CAST(N'2015-09-23' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(91.00 AS Decimal(5, 2)), CAST(N'1992-08-01' AS Date), N'', 13)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (334, N'Marreese Speights', 5, CAST(N'2003-09-24' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(116.00 AS Decimal(5, 2)), CAST(N'1987-08-04' AS Date), N'', 12)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (335, N'Raymond Bernard', 2, CAST(N'2003-09-25' AS Date), CAST(1.85 AS Decimal(3, 2)), CAST(93.00 AS Decimal(5, 2)), CAST(N'1984-06-26' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (336, N'Luc Richard Mbah a Moute', 2, CAST(N'2003-09-26' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(104.00 AS Decimal(5, 2)), CAST(N'1986-09-09' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (337, N'Brandon Sam Bass', 3, CAST(N'2003-09-27' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(113.00 AS Decimal(5, 2)), CAST(N'1985-04-30' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (338, N'Paul Anthony Pierce', 5, CAST(N'2003-09-28' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(107.00 AS Decimal(5, 2)), CAST(N'1977-10-13' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (339, N'Alan Jeffrey Anderson', 5, CAST(N'2003-09-29' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(N'1982-10-16' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (340, N'Wesley JaMarr Johnson', 4, CAST(N'2003-09-30' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(98.00 AS Decimal(5, 2)), CAST(N'1987-07-11' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (341, N'Diamond Stone', 4, CAST(N'2015-10-01' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(116.00 AS Decimal(5, 2)), CAST(N'1997-02-10' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (342, N'Brice Johnson', 4, CAST(N'2015-10-02' AS Date), CAST(2.10 AS Decimal(3, 2)), CAST(116.00 AS Decimal(5, 2)), CAST(N'1986-10-26' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (343, N'Louis Williams', 3, CAST(N'2015-10-03' AS Date), CAST(1.88 AS Decimal(3, 2)), CAST(79.00 AS Decimal(5, 2)), CAST(N'1986-10-27' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (344, N'D''Angelo Russell', 1, CAST(N'2015-10-04' AS Date), CAST(1.96 AS Decimal(3, 2)), CAST(88.00 AS Decimal(5, 2)), CAST(N'1996-02-23' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (345, N'Jordan Clarkson', 5, CAST(N'2015-10-05' AS Date), CAST(1.96 AS Decimal(3, 2)), CAST(84.00 AS Decimal(5, 2)), CAST(N'1992-06-07' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (346, N'Nicholas Young', 3, CAST(N'2015-10-06' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(95.00 AS Decimal(5, 2)), CAST(N'1985-06-01' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (347, N'Julius Randle', 4, CAST(N'2015-10-07' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(113.00 AS Decimal(5, 2)), CAST(N'1994-11-29' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (348, N'Brandon Ingram', 2, CAST(N'2015-10-08' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(86.00 AS Decimal(5, 2)), CAST(N'1997-09-02' AS Date), N'', 26)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (349, N'Luol Deng', 3, CAST(N'2000-10-09' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(N'1985-04-16' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (350, N'Timofey Pavlovich Mozgov', 1, CAST(N'2000-10-10' AS Date), CAST(2.16 AS Decimal(3, 2)), CAST(125.00 AS Decimal(5, 2)), CAST(N'1986-07-16' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (351, N'Larry Nance Jr.', 4, CAST(N'2015-10-11' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(104.00 AS Decimal(5, 2)), CAST(N'1993-01-01' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (352, N'Tarik Black', 5, CAST(N'2015-10-12' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(113.00 AS Decimal(5, 2)), CAST(N'1991-11-22' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (353, N'Thomas Robinson', 4, CAST(N'2015-10-13' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(113.00 AS Decimal(5, 2)), CAST(N'1991-03-17' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (354, N'Jose Calderon', 4, CAST(N'2010-10-14' AS Date), CAST(1.91 AS Decimal(3, 2)), CAST(95.00 AS Decimal(5, 2)), CAST(N'1981-09-28' AS Date), N'', 22)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (355, N'Ivica Zubac', 1, CAST(N'2010-10-15' AS Date), CAST(2.16 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1997-03-18' AS Date), N'', 7)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (356, N'Marcelo Huertas', 2, CAST(N'2010-10-16' AS Date), CAST(1.91 AS Decimal(3, 2)), CAST(91.00 AS Decimal(5, 2)), CAST(N'1983-03-25' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (357, N'Metta World Peace', 3, CAST(N'2010-10-17' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(113.00 AS Decimal(5, 2)), CAST(N'1979-11-13' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (358, N'Eric Bledsoe', 2, CAST(N'2010-10-18' AS Date), CAST(1.85 AS Decimal(3, 2)), CAST(86.00 AS Decimal(5, 2)), CAST(N'1989-12-09' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (359, N'Devin Booker', 2, CAST(N'2010-10-19' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(93.00 AS Decimal(5, 2)), CAST(N'1996-10-30' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (360, N'T.J. Warren', 2, CAST(N'2010-10-20' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(104.00 AS Decimal(5, 2)), CAST(N'1993-09-05' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (361, N'Brandon Emmanuel Knight', 4, CAST(N'2010-10-21' AS Date), CAST(1.91 AS Decimal(3, 2)), CAST(86.00 AS Decimal(5, 2)), CAST(N'1991-12-02' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (362, N'Tyson Cleotis Chandler', 4, CAST(N'2010-10-22' AS Date), CAST(2.16 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1982-10-02' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (363, N'Jared Anthony Dudley', 5, CAST(N'2010-10-23' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(102.00 AS Decimal(5, 2)), CAST(N'1985-07-10' AS Date), N'', 7)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (364, N'Alex Len', 3, CAST(N'2015-10-24' AS Date), CAST(2.16 AS Decimal(3, 2)), CAST(118.00 AS Decimal(5, 2)), CAST(N'1993-06-16' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (365, N'Marquese Chriss', 2, CAST(N'2015-10-25' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(106.00 AS Decimal(5, 2)), CAST(N'1997-07-02' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (366, N'Anthony Leon Tucker Jr.', 3, CAST(N'2015-10-26' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(118.00 AS Decimal(5, 2)), CAST(N'1985-05-05' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (367, N'Leandro Mateus Barbosa', 1, CAST(N'2015-10-27' AS Date), CAST(1.91 AS Decimal(3, 2)), CAST(88.00 AS Decimal(5, 2)), CAST(N'1982-11-28' AS Date), N'', 28)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (368, N'Dragan Bender', 3, CAST(N'2003-10-28' AS Date), CAST(2.16 AS Decimal(3, 2)), CAST(102.00 AS Decimal(5, 2)), CAST(N'1997-11-17' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (369, N'Tyler Ulis', 3, CAST(N'2003-10-29' AS Date), CAST(1.78 AS Decimal(3, 2)), CAST(68.00 AS Decimal(5, 2)), CAST(N'1996-01-05' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (370, N'Alan Williams', 1, CAST(N'2003-10-30' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(118.00 AS Decimal(5, 2)), CAST(N'1993-01-28' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (371, N'John Jenkins', 5, CAST(N'2003-10-31' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(98.00 AS Decimal(5, 2)), CAST(N'1991-03-06' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (372, N'Derrick Jones, Jr.', 5, CAST(N'2003-11-01' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(86.00 AS Decimal(5, 2)), CAST(N'1997-02-15' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (373, N'Ronnie Price', 5, CAST(N'2003-11-02' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(110.20 AS Decimal(5, 2)), CAST(N'1990-08-12' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (374, N'DeMarcus Amir Cousins', 3, CAST(N'2003-11-03' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(122.00 AS Decimal(5, 2)), CAST(N'1990-08-13' AS Date), N'', 26)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (375, N'Rudy Carlton Gay Jr.', 1, CAST(N'2003-11-04' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(104.00 AS Decimal(5, 2)), CAST(N'1986-08-17' AS Date), N'', 27)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (376, N'Darren Michael Collison', 2, CAST(N'2003-11-05' AS Date), CAST(1.83 AS Decimal(3, 2)), CAST(79.00 AS Decimal(5, 2)), CAST(N'1987-08-23' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (377, N'Tywon Ronnell Lawson', 4, CAST(N'2003-11-06' AS Date), CAST(1.80 AS Decimal(3, 2)), CAST(88.00 AS Decimal(5, 2)), CAST(N'1987-11-03' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (378, N'Garrett Temple', 1, CAST(N'2015-11-07' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(88.00 AS Decimal(5, 2)), CAST(N'1986-05-08' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (379, N'Arron Augustin Afflalo', 5, CAST(N'2015-11-08' AS Date), CAST(1.96 AS Decimal(3, 2)), CAST(98.00 AS Decimal(5, 2)), CAST(N'1985-10-15' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (380, N'Matt Kelly Barnes', 2, CAST(N'2015-11-09' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(103.00 AS Decimal(5, 2)), CAST(N'1980-03-09' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (381, N'Anthony Lamar Tolliver', 1, CAST(N'2015-11-10' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1985-06-01' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (382, N'Konstantine', 2, CAST(N'2015-11-11' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(120.00 AS Decimal(5, 2)), CAST(N'1989-02-24' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (383, N'Jordan Robert Farmar', 2, CAST(N'2015-11-12' AS Date), CAST(1.88 AS Decimal(3, 2)), CAST(82.00 AS Decimal(5, 2)), CAST(N'1986-11-30' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (384, N'Omri Casspi', 3, CAST(N'2015-11-13' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(102.00 AS Decimal(5, 2)), CAST(N'1988-06-22' AS Date), N'', 10)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (385, N'Ben McLemore', 1, CAST(N'2015-11-14' AS Date), CAST(1.96 AS Decimal(3, 2)), CAST(88.00 AS Decimal(5, 2)), CAST(N'1993-02-11' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (386, N'Willie Cauley-Stein', 4, CAST(N'2005-11-15' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1993-08-18' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (387, N'Skal Labissiere', 5, CAST(N'2005-11-16' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(102.00 AS Decimal(5, 2)), CAST(N'1996-03-18' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (388, N'Malachi Richardson', 5, CAST(N'2005-11-17' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(93.00 AS Decimal(5, 2)), CAST(N'1996-01-05' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (389, N'Georgios Papagiannis', 5, CAST(N'2005-11-18' AS Date), CAST(2.16 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1997-07-03' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (390, N'Harrison Barnes', 1, CAST(N'2005-11-19' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(102.00 AS Decimal(5, 2)), CAST(N'1992-05-30' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (391, N'Wesley Matthews', 3, CAST(N'2005-11-20' AS Date), CAST(1.96 AS Decimal(3, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(N'1986-10-14' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (392, N'Deron Michael Williams', 5, CAST(N'2005-11-21' AS Date), CAST(1.91 AS Decimal(3, 2)), CAST(91.00 AS Decimal(5, 2)), CAST(N'1984-06-26' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (393, N'Dirk Nowitzki', 5, CAST(N'2005-11-22' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(111.00 AS Decimal(5, 2)), CAST(N'1978-06-19' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (394, N'Jose Juan Barea', 1, CAST(N'2005-11-23' AS Date), CAST(1.83 AS Decimal(3, 2)), CAST(79.00 AS Decimal(5, 2)), CAST(N'1984-06-26' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (395, N'Seth Curry', 2, CAST(N'2005-11-24' AS Date), CAST(1.88 AS Decimal(3, 2)), CAST(84.00 AS Decimal(5, 2)), CAST(N'1990-08-23' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (396, N'Dwight Powell', 3, CAST(N'2005-11-25' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1991-07-20' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (397, N'Justin Anderson', 3, CAST(N'2005-11-26' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(103.00 AS Decimal(5, 2)), CAST(N'1993-11-19' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (398, N'Jonathan Gibson', 4, CAST(N'2005-11-27' AS Date), CAST(1.88 AS Decimal(3, 2)), CAST(84.00 AS Decimal(5, 2)), CAST(N'1987-12-08' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (399, N'Devin Lamar Harris', 1, CAST(N'2015-11-28' AS Date), CAST(1.91 AS Decimal(3, 2)), CAST(84.00 AS Decimal(5, 2)), CAST(N'1983-02-27' AS Date), N'', 27)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (400, N'Dorian Finney-Smith', 2, CAST(N'2015-11-29' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(N'1993-05-04' AS Date), N'', 37)
GO
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (401, N'Pierre Jackson', 1, CAST(N'2015-11-30' AS Date), CAST(1.80 AS Decimal(3, 2)), CAST(80.00 AS Decimal(5, 2)), CAST(N'1991-08-29' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (402, N'Andrew Michael Bogut', 5, CAST(N'2015-12-01' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(118.00 AS Decimal(5, 2)), CAST(N'1984-11-28' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (403, N'Salah Mejri', 1, CAST(N'2000-12-02' AS Date), CAST(2.18 AS Decimal(3, 2)), CAST(107.00 AS Decimal(5, 2)), CAST(N'1986-06-15' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (404, N'AJ Hammons', 2, CAST(N'2005-12-03' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1990-10-06' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (405, N'Nicolas Brussino', 5, CAST(N'2015-12-04' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(98.00 AS Decimal(5, 2)), CAST(N'1993-03-02' AS Date), N'', 17)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (406, N'James Edward Harden Jr.', 3, CAST(N'2009-12-05' AS Date), CAST(1.96 AS Decimal(3, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(N'1989-08-26' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (407, N'Eric Gordon Jr.', 2, CAST(N'2006-12-06' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(98.00 AS Decimal(5, 2)), CAST(N'1988-12-25' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (408, N'Ryan Anderson', 5, CAST(N'2008-12-07' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1988-05-06' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (409, N'Trevor Anthony Ariza', 4, CAST(N'2005-12-08' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(98.00 AS Decimal(5, 2)), CAST(N'1985-06-30' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (410, N'Clint Capela', 3, CAST(N'2015-12-09' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1994-05-18' AS Date), N'', 17)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (411, N'Montrezl Harrell', 4, CAST(N'2015-12-10' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1994-01-26' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (412, N'Patrick Beverley', 4, CAST(N'2006-12-11' AS Date), CAST(1.85 AS Decimal(3, 2)), CAST(84.00 AS Decimal(5, 2)), CAST(N'1988-07-12' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (413, N'Nene Hilario', 4, CAST(N'2004-12-12' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(113.00 AS Decimal(5, 2)), CAST(N'1982-09-13' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (414, N'Sam Dekker', 1, CAST(N'2015-12-13' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(104.00 AS Decimal(5, 2)), CAST(N'1994-04-06' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (415, N'Corey Wayne Brewer', 2, CAST(N'2002-12-14' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(84.00 AS Decimal(5, 2)), CAST(N'1986-03-05' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (416, N'Chinanu Onuaku', 3, CAST(N'2015-12-15' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(111.00 AS Decimal(5, 2)), CAST(N'1996-11-01' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (417, N'K.J. McDaniels', 5, CAST(N'2015-12-16' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(93.00 AS Decimal(5, 2)), CAST(N'1993-02-09' AS Date), N'', 10)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (418, N'Tyler Ennis', 3, CAST(N'2015-12-17' AS Date), CAST(1.83 AS Decimal(3, 2)), CAST(79.00 AS Decimal(5, 2)), CAST(N'1994-08-24' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (419, N'Kyle Wiltjer', 5, CAST(N'2015-12-18' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(110.00 AS Decimal(5, 2)), CAST(N'1992-10-20' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (420, N'Robert Douglas Brown', 2, CAST(N'2015-12-19' AS Date), CAST(1.88 AS Decimal(3, 2)), CAST(79.00 AS Decimal(5, 2)), CAST(N'1984-09-24' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (421, N'Donatas Motiejunas', 2, CAST(N'2004-12-20' AS Date), CAST(2.10 AS Decimal(3, 2)), CAST(110.00 AS Decimal(5, 2)), CAST(N'1985-01-28' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (422, N'Marc Gasol', 5, CAST(N'2004-12-21' AS Date), CAST(2.16 AS Decimal(3, 2)), CAST(120.00 AS Decimal(5, 2)), CAST(N'1985-01-29' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (423, N'Michael Alex Conley Jr.', 2, CAST(N'2015-12-22' AS Date), CAST(1.85 AS Decimal(3, 2)), CAST(79.00 AS Decimal(5, 2)), CAST(N'1987-10-11' AS Date), N'', 37)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (424, N'Zachary Randolph', 4, CAST(N'2005-12-23' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(118.00 AS Decimal(5, 2)), CAST(N'1981-07-16' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (425, N'Anthony Allen Allen', 4, CAST(N'2007-12-24' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(97.00 AS Decimal(5, 2)), CAST(N'1982-01-11' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (426, N'Troy Daniels', 2, CAST(N'2009-12-25' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(93.00 AS Decimal(5, 2)), CAST(N'1991-04-15' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (427, N'JaMychal Green', 3, CAST(N'2015-12-26' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(107.00 AS Decimal(5, 2)), CAST(N'1990-06-21' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (428, N'Vincent Lamar Carter', 1, CAST(N'2015-12-27' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(N'1977-01-26' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (429, N'James Ennis', 3, CAST(N'2015-12-28' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(95.00 AS Decimal(5, 2)), CAST(N'1990-07-01' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (430, N'Andrew Harrison', 2, CAST(N'2015-12-29' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(97.00 AS Decimal(5, 2)), CAST(N'1994-10-28' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (431, N'Chandler Parsons', 4, CAST(N'2015-12-30' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(104.00 AS Decimal(5, 2)), CAST(N'1988-10-25' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (432, N'Toney Bernard Douglas', 3, CAST(N'2005-12-31' AS Date), CAST(1.88 AS Decimal(3, 2)), CAST(86.00 AS Decimal(5, 2)), CAST(N'1986-03-16' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (433, N'Troy Williams', 3, CAST(N'2016-01-01' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(95.00 AS Decimal(5, 2)), CAST(N'1994-12-30' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (434, N'Jarell Martin', 2, CAST(N'2016-01-02' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(107.00 AS Decimal(5, 2)), CAST(N'1994-03-24' AS Date), N'', 30)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (435, N'Wade Baldwin', 5, CAST(N'2016-01-03' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(92.00 AS Decimal(5, 2)), CAST(N'1996-05-29' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (436, N'Deyonta Davis', 5, CAST(N'2016-01-04' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(109.00 AS Decimal(5, 2)), CAST(N'1996-12-02' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (437, N'Brandan Wright', 5, CAST(N'2013-01-05' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(96.60 AS Decimal(5, 2)), CAST(N'1993-03-10' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (438, N'Anthony Davis', 2, CAST(N'2013-01-06' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(N'1993-03-11' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (439, N'Jrue Holiday', 3, CAST(N'2010-01-07' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(93.00 AS Decimal(5, 2)), CAST(N'1990-06-12' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (440, N'Terrence Jones', 5, CAST(N'2012-01-08' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(114.00 AS Decimal(5, 2)), CAST(N'1992-01-09' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (441, N'Tyreke Jamir Evans', 4, CAST(N'2008-01-09' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(N'1989-09-19' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (442, N'E''Twaun Donte Moore', 5, CAST(N'2008-01-10' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(93.00 AS Decimal(5, 2)), CAST(N'1989-02-28' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (443, N'Lance Stephenson Jr.', 4, CAST(N'2009-01-11' AS Date), CAST(1.96 AS Decimal(3, 2)), CAST(104.00 AS Decimal(5, 2)), CAST(N'1990-09-05' AS Date), N'', 30)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (444, N'Langston Galloway', 2, CAST(N'2016-01-12' AS Date), CAST(1.88 AS Decimal(3, 2)), CAST(92.00 AS Decimal(5, 2)), CAST(N'1991-12-09' AS Date), N'', 21)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (445, N'Tim Frazier', 2, CAST(N'2016-01-13' AS Date), CAST(1.85 AS Decimal(3, 2)), CAST(82.00 AS Decimal(5, 2)), CAST(N'1990-11-01' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (446, N'Buddy Hield', 3, CAST(N'2016-01-14' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(97.00 AS Decimal(5, 2)), CAST(N'1993-12-17' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (447, N'Dante Cunningham', 5, CAST(N'2009-01-15' AS Date), CAST(2.03 AS Decimal(3, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(N'1987-04-22' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (448, N'Solomon Hill', 4, CAST(N'2016-01-16' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(102.00 AS Decimal(5, 2)), CAST(N'1991-03-18' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (449, N'Cheick Diallo', 1, CAST(N'2016-01-17' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(N'1996-09-13' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (450, N'Archie Goodwin', 1, CAST(N'2016-01-18' AS Date), CAST(1.96 AS Decimal(3, 2)), CAST(91.00 AS Decimal(5, 2)), CAST(N'1994-08-17' AS Date), N'', 20)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (451, N'Reggie Williams', 1, CAST(N'2007-01-19' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(95.00 AS Decimal(5, 2)), CAST(N'1986-09-14' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (452, N'Alexis Ajinca', 4, CAST(N'2005-01-20' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(112.00 AS Decimal(5, 2)), CAST(N'1988-05-06' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (453, N'Omer Faruk Asik', 2, CAST(N'2005-01-21' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(116.00 AS Decimal(5, 2)), CAST(N'1986-07-04' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (454, N'Quincy Pondexter', 1, CAST(N'2012-01-22' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(104.00 AS Decimal(5, 2)), CAST(N'1991-06-28' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (455, N'Kawhi Leonard', 5, CAST(N'2012-01-23' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(104.00 AS Decimal(5, 2)), CAST(N'1991-06-29' AS Date), N'', 21)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (456, N'LaMarcus Nurae Aldridge', 2, CAST(N'2000-01-24' AS Date), CAST(2.11 AS Decimal(3, 2)), CAST(118.00 AS Decimal(5, 2)), CAST(N'1985-07-19' AS Date), N'', 29)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (457, N'Pau Gasol', 4, CAST(N'1998-01-25' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(113.00 AS Decimal(5, 2)), CAST(N'1980-07-06' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (458, N'William Anthony Parker', 5, CAST(N'1997-01-26' AS Date), CAST(1.88 AS Decimal(3, 2)), CAST(84.00 AS Decimal(5, 2)), CAST(N'1982-05-17' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (459, N'Patrick Sammie Mills', 5, CAST(N'2006-01-27' AS Date), CAST(1.83 AS Decimal(3, 2)), CAST(84.00 AS Decimal(5, 2)), CAST(N'1988-08-11' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (460, N'Emanuel David Ginobili', 5, CAST(N'1999-01-28' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(93.00 AS Decimal(5, 2)), CAST(N'1977-07-28' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (461, N'Daniel Richard Green', 4, CAST(N'2016-01-29' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(98.00 AS Decimal(5, 2)), CAST(N'1987-06-22' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (462, N'David Lee', 2, CAST(N'2003-01-30' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(111.00 AS Decimal(5, 2)), CAST(N'1983-04-29' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (463, N'Jonathon Simmons', 2, CAST(N'2016-01-31' AS Date), CAST(1.98 AS Decimal(3, 2)), CAST(88.00 AS Decimal(5, 2)), CAST(N'1989-09-14' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (464, N'Dewayne Dedmon', 4, CAST(N'2016-02-01' AS Date), CAST(2.13 AS Decimal(3, 2)), CAST(111.00 AS Decimal(5, 2)), CAST(N'1989-08-12' AS Date), N'', 20)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (465, N'Dejounte Murray', 1, CAST(N'2016-02-02' AS Date), CAST(1.96 AS Decimal(3, 2)), CAST(77.00 AS Decimal(5, 2)), CAST(N'1996-09-19' AS Date), N'', 35)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (466, N'Davis Bertans', 2, CAST(N'2016-02-03' AS Date), CAST(2.08 AS Decimal(3, 2)), CAST(95.00 AS Decimal(5, 2)), CAST(N'1992-11-12' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (467, N'Nicolas Laprovittola', 3, CAST(N'2016-02-04' AS Date), CAST(1.93 AS Decimal(3, 2)), CAST(82.00 AS Decimal(5, 2)), CAST(N'1990-07-31' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (468, N'Kyle Anderson', 1, CAST(N'2016-02-05' AS Date), CAST(2.06 AS Decimal(3, 2)), CAST(104.00 AS Decimal(5, 2)), CAST(N'1993-09-20' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (469, N'Bryn Forbes', 4, CAST(N'2016-02-06' AS Date), CAST(1.91 AS Decimal(3, 2)), CAST(86.00 AS Decimal(5, 2)), CAST(N'1993-07-23' AS Date), N'', 38)
INSERT [dbo].[Player] ([Id], [Name], [PositionId], [JoinYear], [Height], [Weight], [DateOfBirth], [College], [CountryId]) VALUES (470, N'Joel Anthony', 3, CAST(N'2016-02-07' AS Date), CAST(2.01 AS Decimal(3, 2)), CAST(111.10 AS Decimal(5, 2)), CAST(N'1993-07-24' AS Date), N'', 38)
GO
INSERT [dbo].[PlayerPosition] ([Id], [Name], [Abbr]) VALUES (1, N'SmallForward', N'SF')
INSERT [dbo].[PlayerPosition] ([Id], [Name], [Abbr]) VALUES (2, N'PowerForward', N'PF')
INSERT [dbo].[PlayerPosition] ([Id], [Name], [Abbr]) VALUES (3, N'Center', N'C')
INSERT [dbo].[PlayerPosition] ([Id], [Name], [Abbr]) VALUES (4, N'ShootingGuard', N'SG')
INSERT [dbo].[PlayerPosition] ([Id], [Name], [Abbr]) VALUES (5, N'PointGuard', N'PG')
GO
INSERT [dbo].[Season] ([Id], [Name]) VALUES (1, N'2014-2015')
INSERT [dbo].[Season] ([Id], [Name]) VALUES (2, N'2015-2016')
INSERT [dbo].[Season] ([Id], [Name]) VALUES (3, N'2016-2017')
GO
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (1, N'Miami Heat', 1, N'MIA', N'Erik Spoelstra', N'AmericanAirlines Arena')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (2, N'Orlando Magic', 1, N'ORL', N'Frank Vogel', N'Amway Center')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (3, N'Atlanta Hawks', 1, N'ATL', N'Mike Budenholzer', N'Philips Arena')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (4, N'Washington Wizards', 1, N'WSH', N'Scott Brooks', N'Verizon Center')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (5, N'Charlotte Hornets', 1, N'CHA', N'Steve Clifford', N'Time Warner Cable Arena')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (6, N'Detroit Pistons', 2, N'DET', N'Stan Van Gundy', N'The Palace of Auburn Hills')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (7, N'Indiana Pacers', 2, N'IND', N'Nate McMillan', N'Bankers Life Fieldhouse')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (8, N'Cleveland Cavaliers', 2, N'CLE', N'Tyronn Lue', N'Quicken Loans Arena')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (9, N'Chicago Bulls', 2, N'CHI', N'Davis', N'United Center')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (10, N'Milwaukee Bucks', 2, N'MIL', N'Miller', N'BMO Harris Bradley Center')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (11, N'Boston Celtics', 3, N'BOS', N'Brad Stevens', N'TD Garden')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (12, N'Philadelphia 76ers', 3, N'PHI', N'Rodriguez', N'Wells Fargo Center')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (13, N'New York Knicks', 3, N'NY ', N'Johnson', N'Madison Square Garden')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (14, N'Brooklyn Nets', 3, N'BKN', N'Martinez', N'Barclays Center')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (15, N'Toronto Raptors', 3, N'TOR', N'Williams', N'Air Canada Centre')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (16, N'San Antonio Spurs', 4, N'SA ', N'Lewis', N'AT&T Center')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (17, N'Memphis Grizzlies', 4, N'MEM', N'Perez', N'FedExForum')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (18, N'Dallas Mavericks', 4, N'DAL', N'Hall', N'American Airlines Center')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (19, N'Houston Rockets', 4, N'HOU', N'Wright', N'Toyota Center')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (20, N'New Orleans Pelicans', 4, N'NO ', N'Scott', N'Smoothie King Center')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (21, N'Minnesota Timberwolves', 5, N'MIN', N'Allen', N'Target Center')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (22, N'Denver Nuggets', 5, N'DEN', N'Scott', N'Pepsi Center')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (23, N'Utah Jazz', 5, N'UTA', N'Quin Snyder', N'Vivint Smart Home Arena')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (24, N'Portland Trail Blazers', 5, N'POR', N'Phillips', N'Moda Center')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (25, N'Oklahoma City Thunder', 5, N'OKC', N'Evans', N'Chesapeake Energy Arena')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (26, N'Sacramento Kings', 6, N'SAC', N'Adams', N'Sleep Train Arena')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (27, N'Phoenix Suns', 6, N'PHX', N'Baker', N'Talking Stick Resort Arena')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (28, N'L.A. Lakers', 6, N'LAL', N'Gary', N'Staples Center')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (29, N'Los Angeles Clippers', 6, N'LAC', N'Henry', N'Staples Center')
INSERT [dbo].[Team] ([Id], [Name], [DivisionId], [Abbr], [Coach], [Stadium]) VALUES (30, N'Golden State Warriors', 6, N'GS ', N'Richard', N'Oracle Arena')
GO
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (266, 1, 1, 7, 227.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (267, 1, 1, 21, 155.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (268, 1, 1, 8, 49.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (269, 1, 1, 11, 46.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (270, 1, 1, 16, 343.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (271, 1, 1, 0, 92.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (272, 1, 1, 20, 419.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (273, 1, 1, 2, 439.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (274, 1, 1, 22, 73.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (275, 1, 1, 17, 345.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (276, 1, 1, 35, 218.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (277, 1, 1, 4, 486.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (278, 1, 1, 5, 401.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (279, 1, 1, 40, 409.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (280, 1, 1, 1, 57.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (281, 1, 1, 15, 181.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (282, 2, 1, 10, 129.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (283, 2, 1, 7, 132.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (284, 2, 1, 9, 265.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (285, 2, 1, 4, 407.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (286, 2, 1, 0, 495.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (287, 2, 1, 34, 14.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (288, 2, 1, 20, 115.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (289, 2, 1, 14, 168.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (290, 2, 1, 11, 304.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (291, 2, 1, 8, 91.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (292, 2, 1, 32, 127.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (293, 2, 1, 21, 207.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (294, 2, 1, 3, 389.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (295, 2, 1, 33, 449.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (296, 2, 1, 23, 280.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (297, 2, 1, 40, 296.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (231, 3, 1, 4, 176.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (232, 3, 1, 17, 378.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (233, 3, 1, 8, 370.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (234, 3, 1, 10, 71.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (235, 3, 1, 24, 12.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (236, 3, 1, 31, 158.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (237, 3, 1, 25, 302.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (238, 3, 1, 13, 314.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (239, 3, 1, 5, 355.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (240, 3, 1, 43, 390.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (241, 3, 1, 12, 412.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (242, 3, 1, 95, 21.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (243, 3, 1, 32, 222.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (244, 3, 1, 22, 284.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (245, 3, 1, 14, 230.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (246, 3, 1, 30, 426.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (247, 3, 1, 11, 411.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (298, 4, 1, 2, 397.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (299, 4, 1, 3, 291.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (300, 4, 1, 22, 357.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (301, 4, 1, 5, 93.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (302, 4, 1, 13, 42.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (303, 4, 1, 15, 241.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (304, 4, 1, 12, 120.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (305, 4, 1, 14, 186.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (306, 4, 1, 33, 351.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (307, 4, 1, 9, 229.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (308, 4, 1, 31, 360.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (309, 4, 1, 44, 461.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (310, 4, 1, 32, 479.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (311, 4, 1, 28, 463.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (312, 4, 1, 4, 373.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (248, 5, 1, 15, 418.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (249, 5, 1, 5, 150.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (250, 5, 1, 40, 64.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (251, 5, 1, 2, 285.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (252, 5, 1, 21, 341.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (253, 5, 1, 44, 464.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (254, 5, 1, 3, 413.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (255, 5, 1, 14, 450.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (256, 5, 1, 0, 172.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (257, 5, 1, 7, 38.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (258, 5, 1, 55, 53.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (259, 5, 1, 12, 219.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (260, 5, 1, 22, 200.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (261, 5, 1, 9, 404.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (262, 5, 1, 35, 410.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (263, 5, 1, 18, 455.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (264, 5, 1, 10, 250.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (265, 5, 1, 30, 361.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (109, 6, 1, 1, 252.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (110, 6, 1, 34, 266.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (111, 6, 1, 5, 227.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (112, 6, 1, 0, 396.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (113, 6, 1, 13, 396.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (114, 6, 1, 30, 136.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (115, 6, 1, 14, 165.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (116, 6, 1, 25, 341.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (117, 6, 1, 19, 385.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (118, 6, 1, 12, 315.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (119, 6, 1, 7, 104.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (120, 6, 1, 51, 294.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (121, 6, 1, 6, 353.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (122, 6, 1, 8, 348.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (123, 6, 1, 9, 200.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (124, 7, 1, 13, 224.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (125, 7, 1, 44, 116.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (126, 7, 1, 33, 400.0000, 1)
GO
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (127, 7, 1, 21, 37.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (128, 7, 1, 0, 72.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (129, 7, 1, 2, 14.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (130, 7, 1, 11, 424.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (131, 7, 1, 7, 395.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (132, 7, 1, 40, 369.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (133, 7, 1, 99, 381.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (134, 7, 1, 1, 98.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (135, 7, 1, 3, 45.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (136, 7, 1, 5, 471.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (137, 7, 1, 25, 57.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (138, 7, 1, 32, 477.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (94, 8, 1, 23, 415.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (95, 8, 1, 2, 403.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (96, 8, 1, 0, 124.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (97, 8, 1, 8, 115.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (98, 8, 1, 5, 439.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (99, 8, 1, 26, 44.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (100, 8, 1, 4, 418.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (101, 8, 1, 13, 387.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (102, 8, 1, 24, 454.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (103, 8, 1, 20, 490.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (104, 8, 1, 12, 224.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (105, 8, 1, 34, 298.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (106, 8, 1, 14, 454.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (107, 8, 1, 1, 241.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (108, 8, 1, 66, 360.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (79, 9, 1, 21, 81.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (80, 9, 1, 3, 25.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (81, 9, 1, 22, 395.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (82, 9, 1, 11, 347.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (83, 9, 1, 8, 160.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (84, 9, 1, 44, 413.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (85, 9, 1, 7, 442.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (86, 9, 1, 9, 226.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (87, 9, 1, 0, 340.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (88, 9, 1, 2, 24.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (89, 9, 1, 6, 57.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (90, 9, 1, 5, 349.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (91, 9, 1, 45, 390.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (92, 9, 1, 16, 53.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (93, 9, 1, 31, 385.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (6, 10, 1, 0, 567.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (139, 10, 1, 34, 188.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (140, 10, 1, 12, 111.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (141, 10, 1, 13, 117.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (142, 10, 1, 9, 240.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (143, 10, 1, 21, 200.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (144, 10, 1, 8, 193.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (145, 10, 1, 35, 377.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (146, 10, 1, 31, 257.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (147, 10, 1, 20, 414.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (148, 10, 1, 3, 322.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (149, 10, 1, 7, 471.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (150, 10, 1, 6, 345.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (151, 10, 1, 22, 365.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (152, 10, 1, 15, 424.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (374, 10, 2, 96, 71.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (171, 11, 1, 4, 111.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (172, 11, 1, 0, 279.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (173, 11, 1, 42, 454.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (174, 11, 1, 99, 218.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (175, 11, 1, 36, 34.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (176, 11, 1, 41, 67.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (177, 11, 1, 90, 149.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (178, 11, 1, 12, 162.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (179, 11, 1, 30, 68.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (180, 11, 1, 7, 356.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (181, 11, 1, 8, 216.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (182, 11, 1, 44, 434.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (183, 11, 1, 55, 305.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (184, 11, 1, 9, 420.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (185, 11, 1, 13, 150.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (201, 12, 1, 21, 443.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (202, 12, 1, 25, 111.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (203, 12, 1, 8, 403.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (204, 12, 1, 0, 36.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (205, 12, 1, 33, 111.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (206, 12, 1, 9, 216.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (207, 12, 1, 12, 339.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (208, 12, 1, 14, 246.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (209, 12, 1, 11, 116.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (210, 12, 1, 4, 418.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (211, 12, 1, 22, 196.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (212, 12, 1, 31, 355.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (213, 12, 1, 5, 259.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (214, 12, 1, 1, 388.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (215, 12, 1, 20, 59.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (334, 12, 3, 95, 292.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (186, 13, 1, 7, 378.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (187, 13, 1, 6, 93.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (188, 13, 1, 25, 250.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (189, 13, 1, 5, 154.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (190, 13, 1, 3, 409.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (191, 13, 1, 8, 439.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (192, 13, 1, 9, 463.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (193, 13, 1, 91, 408.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (194, 13, 1, 14, 365.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (195, 13, 1, 13, 34.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (196, 13, 1, 42, 39.0000, 1)
GO
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (197, 13, 1, 31, 207.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (198, 13, 1, 2, 433.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (199, 13, 1, 18, 19.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (200, 13, 1, 40, 451.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (153, 14, 1, 11, 244.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (154, 14, 1, 44, 222.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (155, 14, 1, 6, 285.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (156, 14, 1, 7, 337.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (157, 14, 1, 35, 475.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (158, 14, 1, 12, 377.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (159, 14, 1, 13, 80.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (160, 14, 1, 24, 349.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (161, 14, 1, 41, 10.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (162, 14, 1, 22, 37.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (163, 14, 1, 15, 138.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (164, 14, 1, 4, 62.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (165, 14, 1, 95, 458.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (166, 14, 1, 2, 34.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (167, 14, 1, 8, 193.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (168, 14, 1, 76, 412.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (169, 14, 1, 1, 330.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (170, 14, 1, 21, 410.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (216, 15, 1, 10, 198.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (217, 15, 1, 7, 78.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (218, 15, 1, 17, 291.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (219, 15, 1, 31, 370.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (220, 15, 1, 5, 176.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (221, 15, 1, 6, 325.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (222, 15, 1, 54, 194.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (223, 15, 1, 0, 62.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (224, 15, 1, 24, 70.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (225, 15, 1, 92, 63.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (226, 15, 1, 43, 468.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (227, 15, 1, 23, 254.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (228, 15, 1, 42, 388.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (229, 15, 1, 20, 202.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (230, 15, 1, 55, 137.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (455, 16, 1, 2, 341.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (456, 16, 1, 12, 280.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (457, 16, 1, 16, 479.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (458, 16, 1, 9, 16.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (459, 16, 1, 8, 478.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (460, 16, 1, 20, 369.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (461, 16, 1, 14, 145.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (462, 16, 1, 10, 38.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (463, 16, 1, 17, 474.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (464, 16, 1, 3, 283.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (465, 16, 1, 5, 473.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (466, 16, 1, 42, 87.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (467, 16, 1, 27, 121.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (468, 16, 1, 1, 77.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (469, 16, 1, 11, 491.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (470, 16, 1, 30, 277.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (422, 17, 1, 33, 366.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (423, 17, 1, 11, 269.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (424, 17, 1, 50, 382.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (425, 17, 1, 9, 256.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (426, 17, 1, 30, 197.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (427, 17, 1, 0, 119.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (428, 17, 1, 15, 493.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (429, 17, 1, 8, 74.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (430, 17, 1, 5, 298.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (431, 17, 1, 25, 132.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (432, 17, 1, 16, 143.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (433, 17, 1, 10, 162.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (434, 17, 1, 1, 150.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (435, 17, 1, 4, 369.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (436, 17, 1, 23, 135.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (437, 17, 1, 34, 477.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (390, 18, 1, 40, 305.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (391, 18, 1, 23, 166.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (392, 18, 1, 8, 409.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (393, 18, 1, 41, 182.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (394, 18, 1, 5, 86.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (395, 18, 1, 30, 204.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (396, 18, 1, 7, 340.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (397, 18, 1, 1, 141.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (398, 18, 1, 3, 46.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (399, 18, 1, 34, 112.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (400, 18, 1, 10, 455.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (401, 18, 1, 55, 124.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (402, 18, 1, 6, 444.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (403, 18, 1, 50, 153.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (404, 18, 1, 20, 256.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (405, 18, 1, 9, 128.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (415, 18, 3, 33, 392.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (406, 19, 1, 13, 448.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (407, 19, 1, 10, 175.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (408, 19, 1, 3, 244.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (409, 19, 1, 1, 97.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (410, 19, 1, 15, 29.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (411, 19, 1, 5, 484.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (412, 19, 1, 2, 421.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (413, 19, 1, 42, 343.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (414, 19, 1, 7, 442.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (415, 19, 1, 33, 487.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (416, 19, 1, 21, 459.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (417, 19, 1, 32, 382.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (418, 19, 1, 6, 418.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (419, 19, 1, 30, 455.0000, 4)
GO
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (420, 19, 1, 8, 217.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (421, 19, 1, 12, 474.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (438, 20, 1, 23, 328.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (439, 20, 1, 11, 465.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (440, 20, 1, 9, 194.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (441, 20, 1, 1, 479.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (442, 20, 1, 55, 160.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (443, 20, 1, 5, 98.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (444, 20, 1, 10, 180.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (445, 20, 1, 2, 437.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (446, 20, 1, 24, 92.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (447, 20, 1, 33, 450.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (448, 20, 1, 44, 190.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (449, 20, 1, 13, 294.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (450, 20, 1, 8, 296.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (451, 20, 1, 88, 455.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (452, 20, 1, 42, 414.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (453, 20, 1, 3, 86.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (454, 20, 1, 20, 336.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (18, 21, 1, 32, 223.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (19, 21, 1, 22, 890.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (20, 21, 1, 14, 443.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (21, 21, 1, 8, 456.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (22, 21, 1, 5, 45.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (23, 21, 1, 15, 245.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (24, 21, 1, 9, 456.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (25, 21, 1, 88, 344.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (26, 21, 1, 33, 245.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (27, 21, 1, 3, 678.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (28, 21, 1, 1, 908.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (29, 21, 1, 4, 678.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (30, 21, 1, 45, 56.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (31, 21, 1, 27, 544.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (32, 21, 1, 11, 67.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (345, 21, 3, 6, 240.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (1, 22, 1, 0, 1200.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (2, 22, 1, 7, 1100.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (3, 22, 1, 9, 1000.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (4, 22, 1, 8, 900.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (5, 22, 1, 21, 456.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (6, 22, 2, 91, 567.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (7, 22, 1, 14, 456.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (8, 22, 1, 27, 235.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (9, 22, 1, 1, 678.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (10, 22, 1, 12, 890.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (11, 22, 1, 41, 543.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (12, 22, 1, 23, 234.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (13, 22, 1, 35, 34.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (14, 22, 1, 25, 24.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (15, 22, 1, 3, 56.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (16, 22, 1, 15, 34.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (17, 22, 1, 5, 56.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (64, 23, 1, 20, 542.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (65, 23, 1, 3, 234.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (66, 23, 1, 5, 67.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (67, 23, 1, 27, 66.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (68, 23, 1, 15, 332.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (69, 23, 1, 6, 45.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (70, 23, 1, 8, 32.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (71, 23, 1, 41, 22.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (72, 23, 1, 2, 460.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (73, 23, 1, 11, 193.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (74, 23, 1, 33, 98.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (75, 23, 1, 10, 266.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (76, 23, 1, 24, 13.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (77, 23, 1, 25, 452.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (78, 23, 1, 21, 320.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (49, 24, 1, 0, 765.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (50, 24, 1, 3, 443.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (51, 24, 1, 4, 46.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (52, 24, 1, 24, 246.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (53, 24, 1, 23, 78.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (54, 24, 1, 1, 534.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (55, 24, 1, 8, 25.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (56, 24, 1, 11, 356.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (57, 24, 1, 17, 333.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (58, 24, 1, 6, 677.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (59, 24, 1, 21, 567.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (60, 24, 1, 10, 454.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (61, 24, 1, 5, 54.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (62, 24, 1, 55, 545.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (63, 24, 1, 31, 788.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (33, 25, 1, 0, 45.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (34, 25, 1, 5, 34.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (35, 25, 1, 11, 34.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (36, 25, 1, 12, 334.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (37, 25, 1, 21, 567.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (38, 25, 1, 9, 789.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (39, 25, 1, 3, 789.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (40, 25, 1, 8, 655.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (41, 25, 1, 2, 543.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (42, 25, 1, 77, 567.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (43, 25, 1, 7, 357.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (44, 25, 1, 22, 578.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (45, 25, 1, 6, 432.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (46, 25, 1, 15, 45.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (47, 25, 1, 4, 45.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (48, 25, 1, 34, 35.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (374, 26, 1, 15, 338.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (375, 26, 1, 8, 212.0000, 4)
GO
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (376, 26, 1, 7, 309.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (377, 26, 1, 10, 236.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (378, 26, 1, 17, 196.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (379, 26, 1, 40, 28.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (380, 26, 1, 22, 451.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (381, 26, 1, 43, 176.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (382, 26, 1, 41, 153.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (383, 26, 1, 20, 138.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (384, 26, 1, 18, 10.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (385, 26, 1, 23, 269.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (386, 26, 1, 0, 344.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (387, 26, 1, 3, 278.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (388, 26, 1, 5, 266.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (389, 26, 1, 13, 373.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (358, 27, 1, 2, 43.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (359, 27, 1, 1, 386.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (360, 27, 1, 12, 476.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (361, 27, 1, 11, 233.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (362, 27, 1, 4, 29.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (363, 27, 1, 3, 239.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (364, 27, 1, 21, 392.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (365, 27, 1, 0, 466.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (366, 27, 1, 17, 416.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (367, 27, 1, 19, 433.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (368, 27, 1, 35, 152.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (369, 27, 1, 8, 204.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (370, 27, 1, 15, 144.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (371, 27, 1, 23, 406.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (372, 27, 1, 10, 135.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (373, 27, 1, 14, 376.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (343, 28, 1, 23, 303.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (344, 28, 1, 1, 455.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (345, 28, 1, 6, 225.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (346, 28, 1, 0, 232.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (347, 28, 1, 30, 106.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (348, 28, 1, 14, 159.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (349, 28, 1, 9, 39.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (350, 28, 1, 20, 294.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (351, 28, 1, 7, 367.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (352, 28, 1, 28, 42.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (353, 28, 1, 15, 274.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (354, 28, 1, 5, 314.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (355, 28, 1, 40, 301.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (356, 28, 1, 4, 168.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (357, 28, 1, 37, 285.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (328, 29, 1, 32, 18.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (329, 29, 1, 3, 338.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (330, 29, 1, 4, 332.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (331, 29, 1, 6, 113.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (332, 29, 1, 11, 264.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (333, 29, 1, 25, 448.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (334, 29, 1, 5, 417.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (335, 29, 1, 2, 386.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (336, 29, 1, 12, 264.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (337, 29, 1, 30, 351.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (338, 29, 1, 34, 68.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (339, 29, 1, 9, 190.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (340, 29, 1, 33, 114.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (341, 29, 1, 0, 97.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (342, 29, 1, 10, 443.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (313, 30, 1, 35, 334.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (314, 30, 1, 30, 101.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (315, 30, 1, 11, 195.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (316, 30, 1, 23, 89.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (317, 30, 1, 21, 313.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (318, 30, 1, 9, 350.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (319, 30, 1, 27, 103.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (320, 30, 1, 1, 179.0000, 3)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (321, 30, 1, 34, 16.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (322, 30, 1, 3, 29.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (323, 30, 1, 0, 170.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (324, 30, 1, 5, 140.0000, 4)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (325, 30, 1, 20, 39.0000, 1)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (326, 30, 1, 18, 57.0000, 2)
INSERT [dbo].[Team_Player] ([PlayerId], [TeamId], [SeasonId], [ShirtNumber], [Salary], [StarterIndex]) VALUES (327, 30, 1, 15, 407.0000, 2)
GO
ALTER TABLE [dbo].[Division]  WITH CHECK ADD  CONSTRAINT [FK_Division_Conference] FOREIGN KEY([ConferenceId])
REFERENCES [dbo].[Conference] ([Id])
GO
ALTER TABLE [dbo].[Division] CHECK CONSTRAINT [FK_Division_Conference]
GO
ALTER TABLE [dbo].[Matchup]  WITH CHECK ADD  CONSTRAINT [FK_Matchup_MatchupStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[MatchupStatus] ([Id])
GO
ALTER TABLE [dbo].[Matchup] CHECK CONSTRAINT [FK_Matchup_MatchupStatus]
GO
ALTER TABLE [dbo].[Matchup]  WITH CHECK ADD  CONSTRAINT [FK_Matchup_MatchupType] FOREIGN KEY([MatchupTypeId])
REFERENCES [dbo].[MatchupType] ([Id])
GO
ALTER TABLE [dbo].[Matchup] CHECK CONSTRAINT [FK_Matchup_MatchupType]
GO
ALTER TABLE [dbo].[Matchup]  WITH CHECK ADD  CONSTRAINT [FK_Matchup_Season] FOREIGN KEY([SeasonId])
REFERENCES [dbo].[Season] ([Id])
GO
ALTER TABLE [dbo].[Matchup] CHECK CONSTRAINT [FK_Matchup_Season]
GO
ALTER TABLE [dbo].[Matchup]  WITH CHECK ADD  CONSTRAINT [FK_Matchup_Team] FOREIGN KEY([TeamAwayId])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[Matchup] CHECK CONSTRAINT [FK_Matchup_Team]
GO
ALTER TABLE [dbo].[Matchup]  WITH CHECK ADD  CONSTRAINT [FK_Matchup_Team1] FOREIGN KEY([TeamHomeId])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[Matchup] CHECK CONSTRAINT [FK_Matchup_Team1]
GO
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK_Player_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[Player] CHECK CONSTRAINT [FK_Player_Country]
GO
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK_Player_PlayerPosition] FOREIGN KEY([PositionId])
REFERENCES [dbo].[PlayerPosition] ([Id])
GO
ALTER TABLE [dbo].[Player] CHECK CONSTRAINT [FK_Player_PlayerPosition]
GO
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_Division] FOREIGN KEY([DivisionId])
REFERENCES [dbo].[Division] ([Id])
GO
ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Team_Division]
GO
ALTER TABLE [dbo].[Team_Player]  WITH CHECK ADD  CONSTRAINT [FK_Team_Player_Player] FOREIGN KEY([PlayerId])
REFERENCES [dbo].[Player] ([Id])
GO
ALTER TABLE [dbo].[Team_Player] CHECK CONSTRAINT [FK_Team_Player_Player]
GO
ALTER TABLE [dbo].[Team_Player]  WITH CHECK ADD  CONSTRAINT [FK_Team_Player_Season] FOREIGN KEY([SeasonId])
REFERENCES [dbo].[Season] ([Id])
GO
ALTER TABLE [dbo].[Team_Player] CHECK CONSTRAINT [FK_Team_Player_Season]
GO
ALTER TABLE [dbo].[Team_Player]  WITH CHECK ADD  CONSTRAINT [FK_Team_Player_Team] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[Team_Player] CHECK CONSTRAINT [FK_Team_Player_Team]
GO
USE [master]
GO
ALTER DATABASE [NbaDatabase] SET  READ_WRITE 
GO
