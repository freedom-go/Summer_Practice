USE [master]
GO
/****** Object:  Database [Blogs]    Script Date: 16.07.2018 5:03:09 PM ******/
CREATE DATABASE [Blogs]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Blogs', FILENAME = N'C:\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Blogs.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Blogs_log', FILENAME = N'C:\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Blogs_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Blogs] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Blogs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Blogs] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Blogs] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Blogs] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Blogs] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Blogs] SET ARITHABORT OFF 
GO
ALTER DATABASE [Blogs] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Blogs] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Blogs] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Blogs] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Blogs] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Blogs] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Blogs] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Blogs] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Blogs] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Blogs] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Blogs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Blogs] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Blogs] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Blogs] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Blogs] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Blogs] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Blogs] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Blogs] SET RECOVERY FULL 
GO
ALTER DATABASE [Blogs] SET  MULTI_USER 
GO
ALTER DATABASE [Blogs] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Blogs] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Blogs] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Blogs] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Blogs] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Blogs', N'ON'
GO
ALTER DATABASE [Blogs] SET QUERY_STORE = OFF
GO
USE [Blogs]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Blogs]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 16.07.2018 5:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[BlogId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 16.07.2018 5:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[BlogID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 16.07.2018 5:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([BlogId], [Name], [CreationDate], [Description]) VALUES (1, N'Test blog', CAST(N'2018-07-13T12:38:00.000' AS DateTime), N'First blog')
INSERT [dbo].[Blog] ([BlogId], [Name], [CreationDate], [Description]) VALUES (2, N'Alphabetic', CAST(N'2018-07-13T13:11:00.000' AS DateTime), N'Second blog')
INSERT [dbo].[Blog] ([BlogId], [Name], [CreationDate], [Description]) VALUES (3, N'III', CAST(N'2018-07-13T13:22:32.400' AS DateTime), N'third blog')
SET IDENTITY_INSERT [dbo].[Blog] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([CommentID], [Text], [CreationDate], [BlogID], [UserID]) VALUES (1, N'Hi guys', CAST(N'2018-07-13T12:39:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Comment] ([CommentID], [Text], [CreationDate], [BlogID], [UserID]) VALUES (2, N'Whats up?', CAST(N'2018-07-13T15:39:04.277' AS DateTime), 1, 3)
INSERT [dbo].[Comment] ([CommentID], [Text], [CreationDate], [BlogID], [UserID]) VALUES (3, N'Nice!', CAST(N'2018-07-15T13:27:01.987' AS DateTime), 1, 5)
INSERT [dbo].[Comment] ([CommentID], [Text], [CreationDate], [BlogID], [UserID]) VALUES (4, N'Nice!', CAST(N'2018-07-15T13:27:18.477' AS DateTime), 1, 5)
INSERT [dbo].[Comment] ([CommentID], [Text], [CreationDate], [BlogID], [UserID]) VALUES (5, N'Nice!', CAST(N'2018-07-15T13:29:07.757' AS DateTime), 1, 5)
INSERT [dbo].[Comment] ([CommentID], [Text], [CreationDate], [BlogID], [UserID]) VALUES (6, N'Good', CAST(N'2018-07-15T13:45:06.683' AS DateTime), 1, 5)
INSERT [dbo].[Comment] ([CommentID], [Text], [CreationDate], [BlogID], [UserID]) VALUES (7, N'Good', CAST(N'2018-07-15T14:17:56.387' AS DateTime), 1, 5)
INSERT [dbo].[Comment] ([CommentID], [Text], [CreationDate], [BlogID], [UserID]) VALUES (8, N'Good', CAST(N'2018-07-15T14:32:55.433' AS DateTime), 1, 5)
INSERT [dbo].[Comment] ([CommentID], [Text], [CreationDate], [BlogID], [UserID]) VALUES (9, N'Good', CAST(N'2018-07-15T14:33:33.250' AS DateTime), 1, 5)
INSERT [dbo].[Comment] ([CommentID], [Text], [CreationDate], [BlogID], [UserID]) VALUES (10, N'Good', CAST(N'2018-07-15T14:36:22.170' AS DateTime), 1, 5)
INSERT [dbo].[Comment] ([CommentID], [Text], [CreationDate], [BlogID], [UserID]) VALUES (11, N'Good', CAST(N'2018-07-15T15:19:46.940' AS DateTime), 1, 5)
INSERT [dbo].[Comment] ([CommentID], [Text], [CreationDate], [BlogID], [UserID]) VALUES (12, N'Good', CAST(N'2018-07-15T15:21:51.097' AS DateTime), 1, 5)
INSERT [dbo].[Comment] ([CommentID], [Text], [CreationDate], [BlogID], [UserID]) VALUES (13, N'Good', CAST(N'2018-07-15T15:35:58.260' AS DateTime), 1, 5)
INSERT [dbo].[Comment] ([CommentID], [Text], [CreationDate], [BlogID], [UserID]) VALUES (14, N'Good', CAST(N'2018-07-15T15:36:28.877' AS DateTime), 1, 5)
INSERT [dbo].[Comment] ([CommentID], [Text], [CreationDate], [BlogID], [UserID]) VALUES (15, N'Good', CAST(N'2018-07-15T15:36:54.913' AS DateTime), 1, 5)
INSERT [dbo].[Comment] ([CommentID], [Text], [CreationDate], [BlogID], [UserID]) VALUES (16, N'Good', CAST(N'2018-07-15T15:37:19.070' AS DateTime), 1, 5)
INSERT [dbo].[Comment] ([CommentID], [Text], [CreationDate], [BlogID], [UserID]) VALUES (17, N'Good', CAST(N'2018-07-15T15:37:59.060' AS DateTime), 1, 5)
INSERT [dbo].[Comment] ([CommentID], [Text], [CreationDate], [BlogID], [UserID]) VALUES (18, N'Good', CAST(N'2018-07-15T15:53:56.430' AS DateTime), 1, 5)
INSERT [dbo].[Comment] ([CommentID], [Text], [CreationDate], [BlogID], [UserID]) VALUES (19, N'Good', CAST(N'2018-07-16T16:54:10.640' AS DateTime), 1, 5)
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Name]) VALUES (1, N'User')
INSERT [dbo].[User] ([UserID], [Name]) VALUES (2, N'Alex')
INSERT [dbo].[User] ([UserID], [Name]) VALUES (3, N'Max')
INSERT [dbo].[User] ([UserID], [Name]) VALUES (4, N'Anna')
INSERT [dbo].[User] ([UserID], [Name]) VALUES (5, N'Den')
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Blog] FOREIGN KEY([BlogID])
REFERENCES [dbo].[Blog] ([BlogId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Blog]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
/****** Object:  StoredProcedure [dbo].[AddBlog]    Script Date: 16.07.2018 5:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddBlog]
@Name nvarchar(50),
@Description nvarchar(500)
AS
BEGIN
	INSERT INTO Blog("Name", CreationDate, "Description")
	VALUES (@Name, GETDATE(), @Description)
	SELECT SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[AddComment]    Script Date: 16.07.2018 5:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddComment]
@Text nvarchar(50),
@BlogId int,
@UserName nvarchar(50)
AS
--В коммент передаём имя юзера, но в базе хранится в комменте id юзера
BEGIN
	DECLARE @Id int
	EXEC [dbo].[GetUserByName] @Name = @UserName, @UserId = @Id OUTPUT

	IF ((SELECT @Id) = 0)
		BEGIN
			EXEC [dbo].[AddUser] @Name = @UserName, @IdOutput = @Id OUTPUT
		END

	INSERT INTO Comment("Text", CreationDate, BlogID, UserID)
	VALUES (@Text, GETDATE(), @BlogId, @Id)
	SELECT SCOPE_IDENTITY()

	--DECLARE @Id int
	--EXEC [dbo].[GetUserByName] @Name = @UserName, @UserId = @Id OUTPUT

	--IF ((SELECT @Id) = 0)
	--	BEGIN
	--		EXEC [dbo].[AddUser] @Name = @UserName
	--	END

	--INSERT INTO Comment("Text", CreationDate, BlogID, UserID)
	--VALUES (@Text, GETDATE(), @BlogId, @Id)
	--SELECT SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 16.07.2018 5:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddUser]
@Name nvarchar(50),
@IdOutput int OUTPUT
AS

IF
((SELECT count(UserId)
FROM "User"
WHERE "Name" = @Name
) =0)
	BEGIN 
		INSERT INTO "User" ("Name")
		VALUES (@Name)
		SELECT @IdOutput = SCOPE_IDENTITY()
		RETURN
	END
ELSE
	BEGIN
		SELECT @IdOutput = 0
		RETURN 
	END
GO
/****** Object:  StoredProcedure [dbo].[DeleteBlogById]    Script Date: 16.07.2018 5:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteBlogById]
@BlogId int
AS
BEGIN tran
DELETE 
FROM Comment 
WHERE BlogID = @BlogId 
	Delete 
	FROM Blog
	WHERE BlogId = @BlogId	
COMMIT 
RETURN
GO
/****** Object:  StoredProcedure [dbo].[DeleteBlogByName]    Script Date: 16.07.2018 5:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteBlogByName]
@Name nvarchar (50)
AS
BEGIN tran
DELETE 
FROM Comment 
WHERE BlogID = 
( 
SELECT BlogID 
FROM Blog 
WHERE "Name" = @Name 
) 
	DELETE 
	FROM Blog
	WHERE "Name" = @Name	
COMMIT 
RETURN
GO
/****** Object:  StoredProcedure [dbo].[GetAllBlogs]    Script Date: 16.07.2018 5:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllBlogs]
AS
BEGIN
	SELECT BlogId, "Name", CreationDate, "Description"
	FROM Blog
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllCommentsByBlogId]    Script Date: 16.07.2018 5:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllCommentsByBlogId]
@BlogId int
AS
BEGIN
	SELECT CommentID, "Text", CreationDate, BlogID, "User"."Name" as "Name"
	FROM Comment JOIN "User" ON "User".UserID = Comment.UserID
	WHERE @BlogId = BlogID
END
GO
/****** Object:  StoredProcedure [dbo].[GetBlogById]    Script Date: 16.07.2018 5:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetBlogById]
	@BlogId int
AS
BEGIN
	SELECT BlogId, "Name", CreationDate, "Description"
	FROM Blog
	WHERE BlogId = @BlogId
END
GO
/****** Object:  StoredProcedure [dbo].[GetBlogByName]    Script Date: 16.07.2018 5:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetBlogByName]
	@Name nvarchar(50)
AS
BEGIN
	SELECT BlogId, "Name", CreationDate, "Description"
	FROM Blog
	WHERE "Name" = @Name
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserByName]    Script Date: 16.07.2018 5:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetUserByName]
@UserId int OUTPUT,
@Name nvarchar(50)
AS

BEGIN
	IF((SELECT count(UserId)
	FROM "User"
	WHERE "Name" = @Name
	) =1)
	BEGIN
		SELECT @UserId = UserID
		FROM "User"
		WHERE "Name" = @Name
		RETURN
	END
	ELSE 
	BEGIN
		SELECT @UserId = 0
		RETURN 

	END
END
GO
/****** Object:  StoredProcedure [dbo].[SortBlogs]    Script Date: 16.07.2018 5:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SortBlogs]
AS
BEGIN
	SELECT BlogId, "Name", CreationDate, "Description"
	FROM Blog
	ORDER BY "Name" ASC
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateBlogById]    Script Date: 16.07.2018 5:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateBlogById]
@BlogId int,
@Name nvarchar (50),
@Description nvarchar (500)
AS
BEGIN
	UPDATE Blog
	SET "Name" = @Name, "Description" = @Description
	WHERE BlogId = @BlogId
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateBlogByName]    Script Date: 16.07.2018 5:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateBlogByName]
@OldName nvarchar (50),
@Name nvarchar (50),
@Description nvarchar (500)
AS
BEGIN
	UPDATE Blog
	SET "Name" = @Name, "Description" = @Description
	WHERE "Name" = @OldName
END
GO
USE [master]
GO
ALTER DATABASE [Blogs] SET  READ_WRITE 
GO
