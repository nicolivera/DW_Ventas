USE [master]
GO
/****** Object:  Database [Ventas]    Script Date: 07/09/2019 0:43:02 ******/
CREATE DATABASE [Ventas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ventas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Ventas.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Ventas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Ventas_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Ventas] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ventas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ventas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ventas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ventas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ventas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ventas] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ventas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ventas] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Ventas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ventas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ventas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ventas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ventas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ventas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ventas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ventas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ventas] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Ventas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ventas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ventas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ventas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ventas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ventas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ventas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ventas] SET RECOVERY FULL 
GO
ALTER DATABASE [Ventas] SET  MULTI_USER 
GO
ALTER DATABASE [Ventas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ventas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ventas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ventas] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Ventas', N'ON'
GO
USE [Ventas]
GO
/****** Object:  StoredProcedure [dbo].[spCliente]    Script Date: 07/09/2019 0:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spCliente](
@id int,
@nombre varchar(30),
@correo varchar(30),
@telefono int 
)
as
begin
  insert into cliente (id, nombre, correo, telefono)values(@id, @nombre, @correo, @telefono)
end;
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 07/09/2019 0:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cliente](
	[id] [int] NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[correo] [varchar](30) NOT NULL,
	[telefono] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[detalles_ventas]    Script Date: 07/09/2019 0:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalles_ventas](
	[folio] [int] IDENTITY(1,1) NOT NULL,
	[cod] [int] NOT NULL,
	[cantida] [int] NOT NULL,
	[precio] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[folio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tel_vendedor]    Script Date: 07/09/2019 0:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tel_vendedor](
	[telefono] [int] NOT NULL,
	[num] [int] NOT NULL,
	[tipo_tel] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[vendedores]    Script Date: 07/09/2019 0:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[vendedores](
	[numero] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[domicilio] [varchar](20) NULL,
	[nro_domicilio] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ventas]    Script Date: 07/09/2019 0:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ventas](
	[identificador] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[folio] [int] NOT NULL,
	[fecha] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zapatillas]    Script Date: 07/09/2019 0:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[zapatillas](
	[codigo] [int] NOT NULL,
	[modelo] [varchar](20) NOT NULL,
	[color] [varchar](20) NOT NULL,
	[tipo] [varchar](20) NOT NULL,
	[numero] [int] NOT NULL,
	[precio] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[cliente] ADD  DEFAULT (NULL) FOR [telefono]
GO
ALTER TABLE [dbo].[vendedores] ADD  DEFAULT (NULL) FOR [domicilio]
GO
ALTER TABLE [dbo].[vendedores] ADD  DEFAULT (NULL) FOR [nro_domicilio]
GO
ALTER TABLE [dbo].[detalles_ventas]  WITH CHECK ADD FOREIGN KEY([cod])
REFERENCES [dbo].[zapatillas] ([codigo])
GO
ALTER TABLE [dbo].[tel_vendedor]  WITH CHECK ADD FOREIGN KEY([num])
REFERENCES [dbo].[vendedores] ([numero])
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD FOREIGN KEY([folio])
REFERENCES [dbo].[detalles_ventas] ([folio])
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD FOREIGN KEY([identificador])
REFERENCES [dbo].[cliente] ([id])
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD FOREIGN KEY([numero])
REFERENCES [dbo].[vendedores] ([numero])
GO
USE [master]
GO
ALTER DATABASE [Ventas] SET  READ_WRITE 
GO
