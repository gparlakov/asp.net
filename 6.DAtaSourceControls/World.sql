USE [master]
GO
/****** Object:  Database [World]    Script Date: 11.9.2013 г. 00:18:32 ч. ******/
CREATE DATABASE [World]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'World', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\World.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'World_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\World_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [World] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [World].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [World] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [World] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [World] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [World] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [World] SET ARITHABORT OFF 
GO
ALTER DATABASE [World] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [World] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [World] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [World] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [World] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [World] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [World] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [World] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [World] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [World] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [World] SET  DISABLE_BROKER 
GO
ALTER DATABASE [World] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [World] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [World] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [World] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [World] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [World] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [World] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [World] SET RECOVERY FULL 
GO
ALTER DATABASE [World] SET  MULTI_USER 
GO
ALTER DATABASE [World] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [World] SET DB_CHAINING OFF 
GO
ALTER DATABASE [World] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [World] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'World', N'ON'
GO
USE [World]
GO
/****** Object:  Table [dbo].[Continents]    Script Date: 11.9.2013 г. 00:18:33 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Continents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Contitnents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Countries]    Script Date: 11.9.2013 г. 00:18:33 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Language] [nvarchar](50) NOT NULL,
	[Population] [int] NOT NULL,
	[ContinentId] [int] NOT NULL,
	[Flag] [image] NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Towns]    Script Date: 11.9.2013 г. 00:18:33 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Towns](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_Towns] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Continents] ON 

INSERT [dbo].[Continents] ([Id], [Name]) VALUES (1, N'Europe')
INSERT [dbo].[Continents] ([Id], [Name]) VALUES (2, N'North America')
INSERT [dbo].[Continents] ([Id], [Name]) VALUES (3, N'South America')
INSERT [dbo].[Continents] ([Id], [Name]) VALUES (4, N'Africa')
INSERT [dbo].[Continents] ([Id], [Name]) VALUES (5, N'Asia')
INSERT [dbo].[Continents] ([Id], [Name]) VALUES (6, N'Australia')
INSERT [dbo].[Continents] ([Id], [Name]) VALUES (7, N'Antarctida')
SET IDENTITY_INSERT [dbo].[Continents] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([Id], [Name], [Language], [Population], [ContinentId], [Flag]) VALUES (1, N'Bulgaria', N'Bulgarian', 9000000, 1, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Language], [Population], [ContinentId], [Flag]) VALUES (2, N'Romania', N'Romanian', 15000000, 1, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Language], [Population], [ContinentId], [Flag]) VALUES (3, N'Croatia', N'Croatian', 8000000, 1, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Language], [Population], [ContinentId], [Flag]) VALUES (4, N'France', N'French', 25000000, 1, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Language], [Population], [ContinentId], [Flag]) VALUES (5, N'Germany', N'German', 95000000, 1, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Language], [Population], [ContinentId], [Flag]) VALUES (6, N'England', N'English', 86000000, 1, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Language], [Population], [ContinentId], [Flag]) VALUES (8, N'USA', N'English', 200000000, 2, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Language], [Population], [ContinentId], [Flag]) VALUES (9, N'Canada', N'English French', 59000000, 2, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Language], [Population], [ContinentId], [Flag]) VALUES (10, N'Mexico', N'Spanish', 159000000, 2, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Language], [Population], [ContinentId], [Flag]) VALUES (11, N'Australia', N'English', 111111111, 6, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Language], [Population], [ContinentId], [Flag]) VALUES (12, N'New Zealand', N'English', 5700000, 6, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Language], [Population], [ContinentId], [Flag]) VALUES (13, N'China', N'Chineese', 2000000000, 5, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Language], [Population], [ContinentId], [Flag]) VALUES (15, N'India', N'Indian', 1000000000, 5, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Language], [Population], [ContinentId], [Flag]) VALUES (16, N'Russia', N'Russian', 159000000, 5, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Language], [Population], [ContinentId], [Flag]) VALUES (17, N'Japan', N'Japaneese', 109000000, 5, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Language], [Population], [ContinentId], [Flag]) VALUES (18, N'Zimbabwe', N'Zimbabwian', 25940000, 4, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Language], [Population], [ContinentId], [Flag]) VALUES (19, N'South African Republic', N'English', 98000000, 4, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Language], [Population], [ContinentId], [Flag]) VALUES (20, N'Congo', N'Congoian', 9800000, 4, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Language], [Population], [ContinentId], [Flag]) VALUES (21, N'Egypt', N'Egiptian', 45000000, 4, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Language], [Population], [ContinentId], [Flag]) VALUES (22, N'Maroco', N'French', 25000000, 4, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Language], [Population], [ContinentId], [Flag]) VALUES (23, N'Brasil', N'Portuguese', 95000000, 3, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Language], [Population], [ContinentId], [Flag]) VALUES (24, N'Equador', N'Spanish', 2500000, 3, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Language], [Population], [ContinentId], [Flag]) VALUES (25, N'Chile', N'Spanish/Chile', 9540000, 3, NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Language], [Population], [ContinentId], [Flag]) VALUES (26, N'<br />', N'<html></html>', 0, 1, NULL)
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[Towns] ON 

INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (1, N'Sofia', 1)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (2, N'Burgas', 1)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (3, N'Varna', 1)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (4, N'Blagoevgrad', 1)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (5, N'Bukuresht', 2)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (6, N'Paris', 4)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (7, N'Lion', 4)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (8, N'Berlin', 5)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (9, N'Munich', 5)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (10, N'Frankfurt', 5)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (11, N'London', 6)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (12, N'Birmingham', 6)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (13, N'Eevsham', 6)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (14, N'Boston', 8)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (15, N'New York', 8)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (16, N'Texas', 8)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (17, N'Otava', 9)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (18, N'Mexico City', 10)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (19, N'Dijon', 4)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (20, N'Rennes', 4)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (21, N'Le Mann', 4)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (22, N'Saarbruchen', 5)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (23, N'Koln', 5)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (24, N'Dusseldorf', 5)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (25, N'Montreal', 9)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (26, N'Toronto', 9)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (27, N'Suskatoon', 9)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (28, N'Edmonton', 9)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (29, N'Vancouver', 9)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (30, N'Guadalahara', 10)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (31, N'Juarez', 10)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (32, N'Magdalena', 10)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (33, N'Brisbane', 11)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (34, N'Melbourne', 11)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (35, N'Sydney', 11)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (36, N'Adelaide', 11)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (37, N'Welington', 12)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (38, N'Christchurch', 12)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (39, N'Shanghai', 13)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (40, N'Beijing', 13)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (42, N'Bangalore', 15)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (43, N'Nagpur', 15)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (44, N'Mumbai', 15)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (45, N'Moscow', 16)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (46, N'Peterburg', 16)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (47, N'Ekaterinburg', 16)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (48, N'Wolgograd', 16)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (49, N'Tokio', 17)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (50, N'Osaka', 17)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (51, N'City <br />', 17)
SET IDENTITY_INSERT [dbo].[Towns] OFF
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_Continents] FOREIGN KEY([ContinentId])
REFERENCES [dbo].[Continents] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_Continents]
GO
ALTER TABLE [dbo].[Towns]  WITH CHECK ADD  CONSTRAINT [FK_Towns_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Towns] CHECK CONSTRAINT [FK_Towns_Countries]
GO
USE [master]
GO
ALTER DATABASE [World] SET  READ_WRITE 
GO
