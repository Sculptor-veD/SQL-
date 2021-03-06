USE [master]
GO
/****** Object:  Database [QLTV]    Script Date: 12/5/2017 9:04:25 PM ******/
CREATE DATABASE [QLTV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLTV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLTV.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLTV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLTV_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLTV] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLTV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLTV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLTV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLTV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLTV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLTV] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLTV] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLTV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLTV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLTV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLTV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLTV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLTV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLTV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLTV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLTV] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLTV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLTV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLTV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLTV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLTV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLTV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLTV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLTV] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLTV] SET  MULTI_USER 
GO
ALTER DATABASE [QLTV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLTV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLTV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLTV] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLTV] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QLTV]
GO
/****** Object:  Table [dbo].[CuonSach]    Script Date: 12/5/2017 9:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuonSach](
	[isbn] [int] NOT NULL,
	[Ma_CuonSach] [smallint] NOT NULL,
	[TinhTrang] [nvarchar](1) NOT NULL,
 CONSTRAINT [CuonSach_isbn_macuonsach] PRIMARY KEY CLUSTERED 
(
	[isbn] ASC,
	[Ma_CuonSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DangKy]    Script Date: 12/5/2017 9:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangKy](
	[isbn] [int] NOT NULL,
	[ma_docgia] [smallint] NOT NULL,
	[ngaygio_dk] [smalldatetime] NULL,
	[ghichu] [nvarchar](255) NULL,
 CONSTRAINT [DangKy_isbn_madocgia] PRIMARY KEY CLUSTERED 
(
	[isbn] ASC,
	[ma_docgia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DauSach]    Script Date: 12/5/2017 9:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DauSach](
	[isbn] [int] NOT NULL,
	[ma_tuasach] [int] NOT NULL,
	[ngonngu] [nvarchar](15) NULL,
	[bia] [nvarchar](15) NULL,
	[trangthai] [nvarchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[isbn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DocGia]    Script Date: 12/5/2017 9:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocGia](
	[ma_docgia] [smallint] NOT NULL,
	[ho] [nvarchar](15) NOT NULL,
	[tenlot] [nvarchar](1) NULL,
	[ten] [nvarchar](15) NOT NULL,
	[NgaySinh] [smalldatetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_docgia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Muon]    Script Date: 12/5/2017 9:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Muon](
	[isbn] [int] NOT NULL,
	[ma_cuonsach] [smallint] NOT NULL,
	[ma_docgia] [smallint] NOT NULL,
	[ngayGio_muon] [smalldatetime] NOT NULL,
	[ngay_hethan] [smalldatetime] NOT NULL,
 CONSTRAINT [Muon_isbn_macuonsach] PRIMARY KEY CLUSTERED 
(
	[isbn] ASC,
	[ma_cuonsach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguoiLon]    Script Date: 12/5/2017 9:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiLon](
	[ma_docgia] [smallint] NOT NULL,
	[sonhan] [nvarchar](15) NOT NULL,
	[duong] [nvarchar](63) NOT NULL,
	[quan] [nvarchar](2) NOT NULL,
	[dienthoai] [nvarchar](13) NULL,
	[han_sd] [smalldatetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_docgia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuaTrinhMuon]    Script Date: 12/5/2017 9:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuaTrinhMuon](
	[isbn] [int] NOT NULL,
	[ma_cuonsach] [smallint] NOT NULL,
	[ngayGio_muon] [smalldatetime] NOT NULL,
	[ma_docgia] [smallint] NOT NULL,
	[ngay_hethan] [smalldatetime] NULL,
	[ngayGio_tra] [smalldatetime] NULL,
	[tien_muon] [money] NULL,
	[tien_datra] [money] NULL,
	[tien_datcoc] [money] NULL,
	[ghichu] [nvarchar](225) NULL,
 CONSTRAINT [QTM_isbn_macuonsach_ngaymuon] PRIMARY KEY CLUSTERED 
(
	[isbn] ASC,
	[ma_cuonsach] ASC,
	[ngayGio_muon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TreEm]    Script Date: 12/5/2017 9:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TreEm](
	[ma_docgia] [smallint] NOT NULL,
	[ma_docgia_nguoilon] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_docgia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TuaSach]    Script Date: 12/5/2017 9:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TuaSach](
	[ma_tuasach] [int] NOT NULL,
	[TuaSach] [nvarchar](63) NOT NULL,
	[tacgia] [nvarchar](31) NOT NULL,
	[tomtat] [varchar](222) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_tuasach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[CuonSach]  WITH CHECK ADD FOREIGN KEY([isbn])
REFERENCES [dbo].[DauSach] ([isbn])
GO
ALTER TABLE [dbo].[DangKy]  WITH CHECK ADD FOREIGN KEY([isbn])
REFERENCES [dbo].[DauSach] ([isbn])
GO
ALTER TABLE [dbo].[DangKy]  WITH CHECK ADD FOREIGN KEY([ma_docgia])
REFERENCES [dbo].[DocGia] ([ma_docgia])
GO
ALTER TABLE [dbo].[DauSach]  WITH CHECK ADD FOREIGN KEY([ma_tuasach])
REFERENCES [dbo].[TuaSach] ([ma_tuasach])
GO
ALTER TABLE [dbo].[Muon]  WITH CHECK ADD FOREIGN KEY([ma_docgia])
REFERENCES [dbo].[DocGia] ([ma_docgia])
GO
ALTER TABLE [dbo].[Muon]  WITH CHECK ADD  CONSTRAINT [Muon_CuonSach] FOREIGN KEY([isbn], [ma_cuonsach])
REFERENCES [dbo].[CuonSach] ([isbn], [Ma_CuonSach])
GO
ALTER TABLE [dbo].[Muon] CHECK CONSTRAINT [Muon_CuonSach]
GO
ALTER TABLE [dbo].[NguoiLon]  WITH CHECK ADD  CONSTRAINT [NguoiLon_DocGia] FOREIGN KEY([ma_docgia])
REFERENCES [dbo].[DocGia] ([ma_docgia])
GO
ALTER TABLE [dbo].[NguoiLon] CHECK CONSTRAINT [NguoiLon_DocGia]
GO
ALTER TABLE [dbo].[QuaTrinhMuon]  WITH CHECK ADD FOREIGN KEY([ma_docgia])
REFERENCES [dbo].[DocGia] ([ma_docgia])
GO
ALTER TABLE [dbo].[QuaTrinhMuon]  WITH CHECK ADD FOREIGN KEY([isbn], [ma_cuonsach])
REFERENCES [dbo].[CuonSach] ([isbn], [Ma_CuonSach])
GO
ALTER TABLE [dbo].[TreEm]  WITH CHECK ADD FOREIGN KEY([ma_docgia_nguoilon])
REFERENCES [dbo].[NguoiLon] ([ma_docgia])
GO
ALTER TABLE [dbo].[TreEm]  WITH CHECK ADD  CONSTRAINT [TreEm_DocGia] FOREIGN KEY([ma_docgia])
REFERENCES [dbo].[DocGia] ([ma_docgia])
GO
ALTER TABLE [dbo].[TreEm] CHECK CONSTRAINT [TreEm_DocGia]
GO
USE [master]
GO
ALTER DATABASE [QLTV] SET  READ_WRITE 
GO
