drop database data_Sua_nha
go
USE [master]
GO
/****** Object:  Database [data_Sua_nha]    Script Date: 12/05/2022 21:12:50 PM ******/
CREATE DATABASE [data_Sua_nha]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'data_Sua_nha', FILENAME = N'D:\SQL\data_Sua_nha.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'data_Sua_nha_log', FILENAME = N'D:\SQL\data_Sua_nha_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [data_Sua_nha] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [data_Sua_nha].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [data_Sua_nha] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [data_Sua_nha] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [data_Sua_nha] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [data_Sua_nha] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [data_Sua_nha] SET ARITHABORT OFF 
GO
ALTER DATABASE [data_Sua_nha] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [data_Sua_nha] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [data_Sua_nha] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [data_Sua_nha] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [data_Sua_nha] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [data_Sua_nha] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [data_Sua_nha] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [data_Sua_nha] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [data_Sua_nha] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [data_Sua_nha] SET  DISABLE_BROKER 
GO
ALTER DATABASE [data_Sua_nha] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [data_Sua_nha] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [data_Sua_nha] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [data_Sua_nha] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [data_Sua_nha] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [data_Sua_nha] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [data_Sua_nha] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [data_Sua_nha] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [data_Sua_nha] SET  MULTI_USER 
GO
ALTER DATABASE [data_Sua_nha] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [data_Sua_nha] SET DB_CHAINING OFF 
GO
ALTER DATABASE [data_Sua_nha] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [data_Sua_nha] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [data_Sua_nha] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [data_Sua_nha] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'data_Sua_nha', N'ON'
GO
ALTER DATABASE [data_Sua_nha] SET QUERY_STORE = OFF
GO
USE [data_Sua_nha]
GO
/****** Object:  Table [dbo].[authorities]    Script Date: 12/05/2022 21:12:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authorities](
	[username] [varchar](50) NOT NULL,
	[authority] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 12/05/2022 21:12:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ngay_lap] [date] NOT NULL,
	[thanh_tien] [nvarchar](50) NOT NULL,
	[id_kh] [int] NOT NULL,
	[thanh_toan] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart_detail]    Script Date: 12/05/2022 21:12:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_detail](
	[id_order] [int] NOT NULL,
	[id_product] [int] NOT NULL,
	[so_luong] [int] NOT NULL,
	[gia] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_order_detail] PRIMARY KEY CLUSTERED 
(
	[id_order] ASC,
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 12/05/2022 21:12:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](50) NOT NULL,
	[sdt] [char](11) NOT NULL,
	[gioi_tinh] [nvarchar](5) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[username] [varchar](50) NOT NULL,
 CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 12/05/2022 21:12:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](300) NOT NULL,
	[price] [nvarchar](30) NOT NULL,
	[link] [nvarchar](50) NOT NULL,
	[description] [nvarchar](3278) NOT NULL,
	[status] [varchar](4) NOT NULL,
 CONSTRAINT [PK__products__3213E83F0730BC07] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12/05/2022 21:12:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](68) NOT NULL,
	[enabled] [tinyint] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[authorities] ([username], [authority]) VALUES (N'susan', N'ROLE_EMPLOYEE')
GO
SET IDENTITY_INSERT [dbo].[customers] ON 

INSERT [dbo].[customers] ([id], [ten], [sdt], [gioi_tinh], [email], [username]) VALUES (1, N'dfdfd', N'0986754321 ', N'Nam', N'hoan44pro@gmail.com', N'susan')
SET IDENTITY_INSERT [dbo].[customers] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (1, N'Bộ tua vít đa năng sửa chữa điện thoại 25 in 1 vít từ tính chất liệu cao cấp S2', N'64.900 ₫', N'image/5581a2e95de7b05ed340316f2a4cf9a8.PNG', N'Chất liệu: thép nhậu khẩu HRC 60, hộp kim nhôm
Nặng: 300g
Kích thước: 168 x 67 x 17 mm.
Đầu vít: 24 đầu, gồm có 4 lớp.
Màu sắc: xám.

Hôm nay mình xin giới thiệu đến các bạn một bộ phụ kiện sửa chữa điện thoại, kính mắt đa năng bỏ túi.Nếu sỡ hữu cho mình bộ vít chắc chắn sẽ giúp ích cho công việc của bạn rất nhiều vì tính đa năng của nó, bạn có thể sử dụng nó đẻ tháo lắp đồng hồ, máy ảnh, laptop, điện thoại, mắt kính, đồ gia dụng…
Đối với dân kỹ thuật hay sữa chửa mà nói thị bộ vít chính là một phụ kiện vô cùng quan trọng, nó sẽ giúp họ rất nhiều trong công việc hàng ngày, thế nhưng chắc chắn sẽ có nhiều bạn đang sở hữu nhiều bộ vít có kích thước quá lớn hay các đầu vít không đạt tiêu chuẩn rất dễ bị mài mòn sau một quá trình sử dụng. Nhưng đối với sản phẩm này thì bạn hoàn toàn yên tâm.
 

Nhìn sơ qua về mặt thiết kế, có thể nói đến hộp đựng vít, được làm từ hợp kim nhôm aluminum,, 2 cạnh được bo tròn tạo cảm giác cho sản phẩm mềm mại hơn rất nhiều không thô cứng như các sản phẩm khác, với kích thước chỉ khoảng 168 x 67 x 17mm, nặng chỉ 300g,vừa nhỏ gọn vừa sang trọng, bề mặt chống thấm mồ hôi và chịu va đập tốt nên bạn có thể dễ dàng mang theo bên người.
Có tất cả là 24 đầu vít, được chia thành 4 tầng sắp gọn gàng trên hộp, ứng mỗi vị trí trên đầu vít thì trên thân hộp đều được in một hình vẽ tương ứng để bạn có thể dễ dàng lựa chọn, không những thế trên thân từng đầu vít đều được in những thông số như: U2.6, H2.0, PH2… con số ứng với từng đầu vít nhất định, cầu đầu vít đều được tích hợp nam chấm để dễ dàng hơn khi bạn bắt những con ốc.

 
Chất liệu để làm nên những đầu vít này là thép HRC 60 rất chắc chắn và cứng cáp chịu được lực khá tốt, nên sẽ ít có hiện tượng bị mài mòn hay bị chai sau một thời gian dài sử dụng. Phần thân cây viết cũng được làm từ chất liệu giống như đầu vít, dài khoảng 13cm, khá vừa tay người cầm rất cho cảm giác rất chắc chắn và thoải mái.
Sỡ hữu cho mình bộ vít này chắc chắn sẽ giúp ích cho công việc của bạn rất nhiều vì tính đa năng của nó, bạn có thể sử dụng nó đẻ tháo lắp đồng hồ, máy ảnh, laptop, điện thoại, mắt kính, đồ gia dụng…
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (2, N'Găng tay bảo hộ lao động Jogger Superpro - Bao tay lao động chống dầu nhớt, trơn trượt, độ linh hoạt cao - Chính hãng', N'11.000 ₫', N'image/dedfc8e84f2572dd64897faae8eb442e.jpeg', N'GĂNG TAY CHỐNG DẦU JOGGER SUPERPRO 2121 - GĂNG TAY BẢO HỘ LAO ĐỘNG ĐA NĂNG
Được nhập khẩu và phân phối chính thức bởi Xsafe
------
 CẤU TẠO SẢN PHẨM:
- Đảm bảo sự linh hoạt khi thao tác cả với các chi tiết, vật dụng nhỏ. Và khả năng kháng dầu.
 ỨNG DỤNG GĂNG TAY BẢO HỘ JOGGER SUPERPRO 2121
- Superpro là găng tay bảo hộ chống dầu hoàn hảo để tăng hiệu suất làm việc khi thao tác với các chi tiết có dầu,
dính nhớt.
- EN 388:2003
- Chống hao mòn: 4/4
- Chống cắt: 1/5
- Chống rách: 2/4
- Chống đâm xuyên: 1/4
 CHI TIẾT GĂNG TAY BẢO HỘ JOGGER SUPERPRO 2121
- Model: Superpro
- Có thể giặt rửa bình thường (không sử dụng chất tẩy rửa mạnh).
- Bảo quản tránh sương, môi trường băng giá và ánh nắng mặt trời.
 THÔNG TIN CHUNG
THƯƠNG HIỆU Safety Jogger
NHÀ PHÂN PHỐI: Bảo Hộ Xsafe
 TẠI SAO NÊN MUA GĂNG TAY CHỐNG DẦU JOGGER CONSTRUCTO TẠI BẢO HỘ XSAFE ?
- Giá luôn tốt nhất
- Bảo hành chính hãng
-------
[Giải Pháp Bảo Hộ Toàn Diện Cho Doanh Nghiệp Cá Nhân]
* Add: 40/64 Lê Đức Thọ, P7, Q.Gò Vấp, HCM
* 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (3, N'Dụng Cụ Lấy Dấu, Định Vị Điểm Khoan - Chống Trượt', N'28.999 ₫', N'image/0f2ef6a088a1d037f7232f5c4233725e.jpg', N'Dụng cụ đục lỗ, định vị điểm khoan là dụng cụ cầm tay giúp bạn dễ dàng đánh dấu trên các vật liệu sắt, gỗ, nhựa  với lực đẩy của lò xo cùng đầu mũi nhọn.
Thiết bị định vị được làm bằng ĐỒNG NGUYÊN CHẤT cùng lớp mạ màu vàng đẹp mắt, tránh việc gỉ cũng như đảm bảo độ bền của dụng cụ đục lỗ.
Việc sử dụng thiết bị đánh dấu điểm khoan là vô cùng đơn giản. Bạn chỉ cần xác định điểm cần đánh dấu. Sau đó, để đầu nhọn của thiết bị vào vị trí cần đánh dấu. 
Dùng tay ấn thiết bị định vị xuống và nhấc lên.
Kết quả: chúng ta có điểm đánh dấu mà không tốn nhiều sức.

Kích thước của dụng cụ đục lỗ
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (4, N'Bút thử nước TDS, dụng cụ đo TDS, máy đo độ cứng của nước - Hàng chính hãng', N'150.000 ₫', N'image/65dabeca667b93081d3b439dde36206d.png', N'Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (5, N'Găng tay lao động chống cắt 3M Cấp độ 1 - Găng tay bảo hộ chống đâm xuyên tiêu chuẩn EN388:4131 - Sản phẩm chính hãng', N'32.000 ₫', N'image/be7de3c53a72447a6e50a8df90d2c6eb.jpeg', N'Sản phẩm được phân phối chính hãng bới Bảo Hộ Xsafe
--------
- Vân chuyển hàng hóa trong kho
- Làm vườn
Những tính năng ưu việt giúp bảo vệ tốt bàn tay của người sử dụng:
- Mật độ vải cao kết hợp với sợi chỉ nhỏ nên độ ôm tay rất tốt giúp người sử dụng có cảm xác tiếp xúc chính xác.
- Lòng bàn tay phủ PU tạo độ bám khi cầm nắm.
- Sợi găng tay cấu tạo chính từ sợi Nylon giúp thoát khí.
- Độ bền cao, có thể giặt và tái sử dụng.
- Găng tay 3M chống cắt chủ yếu được sử dụng trong các thao tác máy móc có chi tiết sắt bén.
Thương hiệu:3M
Sản xuất:Việt Nam
Chất liệu: Nylon, PU
Một số lưu ý cho người dùng:
- Chống mài mòn: 4/5
- Chống cắt: 1/5
- Chống xé rách: 3/5
- Chống đ-â-m xuyên: 1/5
Xin cảm ơn!
TẠI SAO NÊN MUA GĂNG TAY CHỐNG CẮT 3M LEVEL 1 TẠI BẢO HỘ XSAFE ?
- Nhà Phân phối chính thứ của các thương hiệu bảo hộ hàng đầu: 3M, Ansell, J
- Bảo hành chính hãng và đổi trả sản phẩm với bất kỳ lỗi nào từ NSX
-------------------
[Giải Pháp Bảo Hộ Toàn Diện Cho Doanh Nghiệp Cá Nhân]
* Add: 20 đường số 1, KDC CityLand ParkHills, Phường 10, Quận Gò Vấp, 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (6, N'Máy Khoan Vặn Vít Dùng Pin Bosch GSR 120-LI (1 Pin, 1 Sạc)', N'1.665.000 ₫', N'image/aa6c01dcd81d705c3a56b442afd1a19b.png', N'Máy Khoan Vặn Vít Dùng Pin Bosch GSR 120 GEN II là dòng sản phẩm khoan pin mới nhất của Bosch ra mắt trong năm 2019. Dòng sản phẩm cải tiến từ dòng khoan pin GSR 120Li. Vẫn sử dụng pin lion 12V xong Máy khoan pin Bosch GSR 120-LI GEN II cải tiến về tốc độ không tải, lực xoắn giúp bạn tối ưu hóa công việc khoan, bắt vít.



Ưu điểm của sản phẩm
Thân máy làm từ nhựa chất liệu cao cấp, cứng chắn, sản xuất theo tiêu chuẩn châu Âu đảm bảo độ bền. Máy có hai chế độ: khoan và bắt vít với 20 cấp trượt.
Máy khoan vặn vít GSR 120 GEN II có thể điều chỉnh tốc độ không tải ở 2 mức:
Máy có chế độ dừng thông minh: Tự động dừng máy trong trường hợp vít đã vặn hết vào vật liệu, ngay cả khi vẫn giữ nút khởi động giúp bảo vệ vật liệu không bị vặn vít quá đà.
Thông số kỹ thuật
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (7, N'Bộ Dụng Cụ Tua Vít Đa Năng Nhiều Món Có Từ Tính 111 in 1 Dùng Tháo Lắp, Tháo Mở Và Sửa Chữa Điện Thoại Di Động, Máy Tính, PC/ Laptop, Máy Tính Bảng', N'175.999 ₫', N'image/d3a2ae5f3b6ad38c8072385398071a15.jpg', N'Bộ Dụng Cụ Tua Vít Đa Năng Nhiều Món Có Từ Tính 111 in 1 Dùng Tháo Lắp, Tháo Mở Và Sửa Chữa Điện Thoại Di Động, Máy Tính, PC/ Laptop, Máy Tính Bảng
 

Trọn 111 trong 1 món với 98 đầu tua-vít các loại và 13 món khác
Chất liệu cao cấp, gia công độ chính xác cao
Giúp tháo lắp, tháo mở các thiết bị điện tử (máy tính, điện thoại, laptop,) một cách dễ dàng
Tất cả đầu tua-vít có từ tính
Thiết kế hộp nhựa ABS chất lượng chia từng ngăn sắp xếp gọn gàng
Hộp thiết kế nhỏ gọn, dễ dàng mang theo khi cần
Thích hợp sửa chữa cho hầu hết điện thoại di động, máy tính, máy chơi game, máy tính bảng, đồng hồ, kính,  trên thị trường
Kích thước hộp: 16x8x4cm





Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (8, N'Keo chà ron gạch cao cấp, keo dán mạch gạch siêu bám dính chống thấm nước dung tích 280ml - màu trắng', N'36.499 ₫', N'image/cd91cfe0f33f58974ed7348ca3ef4627.png', N'Keo chà ron gạch cao cấp, keo dán mạch gạch siêu bám dính chống thấm nước dung tích 280ml - màu trắngHiện tượng các đường ron nhỏ trên sàn bị tróc ra sau một thời gian ngắn đi vào sử dụng là một hiện tượng khá phổ biến và thường thấy ở bất cứ công trình nào. Bên cạnh đó, hiện nay xu hướng sử dụng gạch lớn như đá hoa cương, đá cẩm thạch,… là khá phổ biến. Với những loại gạch/đá này, phải ốp lát rất sát với nhau sao cho không thấy các mối nối, do đó các đường ron sẽ trở nên rất nhỏ.Kết hợp hai vấn đề trên, nếu không sử dụng đúng loại keo chà ron/ dán mạch có những tính năng chuyên dụng thông thường thì công trình thi công sẽ dễ xảy ra những sự cố ảnh hưởng đến chất lượng và tính thẩm mỹ của công trình. Keo chà ron gạch, keo dán mạch gạch siêu bám dính chống thấm nước của chúng tôi tự tin là sản phẩm có thể giải quyết hết tất cả các vấn đề trên.Là sản phẩm chà ron thế hệ mới, keo chà ron gạch, keo dán mạch gạch sẽ giải quyết tận gốc các vấn đề nhiễm bẩn, nấm mốc hay bong tróc trên ron sàn gạch


Ưu điểm :Siêu bám dínhChống thấm tuyệt đốiKhông rêu mốc, không ố đen, sạch sẽ, giữ nguyên màu sắc sau nhiều năm.Không rạn nứt, co ngót, bong táchKhông làm ố gạch, loang màu gạchThi công dễ dàng, dễ sử dụngBề mặt bóng mịn rất dễ dàng vệ sinhSản phẩm thân thiện với môi trường

Thông tin sản phẩm :Tên sản phẩm : Keo chà ron gạch cao cấp, keo dán mạch gạch siêu bám dính chống thấm nước dung tích 280ml - màu trắngDung tích : 280mlMàu sắc : trắngCông dụng : Sản phẩm được dùng để chà ron gạch, dán mạch gạch, sơn lại những khe nứt ở bồn rửa bát, bếp ga âm bàn.,Thích hợp sử dụng nhà tắm (bồn tắm, phòng vệ sinh, bồn rửa tay, gạch ốp lát, gạch hành lang), nhà bếp, 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (9, N'Máy Khoan Vặn Vít Dùng Pin Bosch GSR 120-LI (1 Pin, 1 Sạc)', N'1.665.000 ₫', N'image/aa6c01dcd81d705c3a56b442afd1a19b.png', N'Máy Khoan Vặn Vít Dùng Pin Bosch GSR 120 GEN II là dòng sản phẩm khoan pin mới nhất của Bosch ra mắt trong năm 2019. Dòng sản phẩm cải tiến từ dòng khoan pin GSR 120Li. Vẫn sử dụng pin lion 12V xong Máy khoan pin Bosch GSR 120-LI GEN II cải tiến về tốc độ không tải, lực xoắn giúp bạn tối ưu hóa công việc khoan, bắt vít.



Ưu điểm của sản phẩm
Thân máy làm từ nhựa chất liệu cao cấp, cứng chắn, sản xuất theo tiêu chuẩn châu Âu đảm bảo độ bền. Máy có hai chế độ: khoan và bắt vít với 20 cấp trượt.
Máy khoan vặn vít GSR 120 GEN II có thể điều chỉnh tốc độ không tải ở 2 mức:
Máy có chế độ dừng thông minh: Tự động dừng máy trong trường hợp vít đã vặn hết vào vật liệu, ngay cả khi vẫn giữ nút khởi động giúp bảo vệ vật liệu không bị vặn vít quá đà.
Thông số kỹ thuật
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (10, N'Khoan pin 21v Máy khoan bắt vít 21v', N'395.000 ₫', N'image/a90c117e7186a732539699e903bfc93b.jpg', N'UY TÍN- CHẤT LƯỢNG
CAM KẾT HỖ TRỢ ĐỔI TRẢ BẢO HÀNH TỐT NHẤT

KHOAN PIN HITACHI 21V ( Bộ sản phẩm gồm thân máy + 1 pin sạc và tặng 4 mũi khoan )

                                                           THÔNG SỐ KỸ THUẬT
- Điện thế pin: 21V - Loại Pin: Max Lithiium-ion 
- Lực siết/mở vít : Cứng (30Nm); Mềm (20Nm) 
- Dung lượng pin: 3 Ah 
- Kích thước sản phẩm: 25x 15x 8 cm 
- Trọng lượng cả hộp: 1.4 kg ( hộp carton ) 
- Tốc độ không tải: Cao (0 - 1.550 vòng/phút); Thấp (0 - 550 vòng/phút) 
- Sản xuất : Theo Dây chuyền JANPAN

PIN SIÊU TRÂU DÙNG ĐƯỢC 4 - 5 TIẾNG

BỘ SẢN PHẨM ĐẦY ĐỦ BAO GỒM THÂN MÁY, SẠC, PIN
VÀ TĂNG 2 MŨI BẮT VÍT

CÁC CHỨC NĂNG NỔI BẬT CỦA MÁY: CÓ ĐÈN LED  SIÊU SÁNG
25 CẤP ĐỘ SIẾT, CHỨC NĂNG ĐẢO CHIỀU, 2 TỐC ĐỘ

MÁY CÓ THỂ DỄ DÀNG XUYÊN QUA TƯỜNG, GỖ, SẮT
VÀ BẮT VÍT MỘT CÁCH NHANH GỌN

BẢO HÀNH 1 NĂM KHI MUA MÁY TẠI CỬA HÀNG
CÒN CHẦN CHỪ GÌ MÀ KHÔNG MUA NGAY CHIẾC
Khoan pin 21V VỀ SỬ DỤNG
SHOP CAM KẾT
Cam kết tất cả sản phẩm bên ngoài giống như trong ảnh 
Cam kết về chất lượng và dịch vụ bán hàng
Cung cấp các sản phẩm theo đúng tiêu chuẩn với chất lượng tốt nhất
Đáp ứng mọi yêu cầu của khách hàng trong thời gian ngắn nhất
Đảm bảo về số lượng và đúng chủng loại khách đặt
Tư vấn miễn phí 24/24 cho quý khách hàng về các sản phẩm của chúng tôi, bất cứ thắc mắc gì trước và sau khi mua sản phẩm
CHÚC QUÝ KHÁCH THAM QUAN VÀ MUA SẮM VUI VẺ!!
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (11, N'Đồng Hồ Đo Điện Vạn Năng Ampe Kìm + Bút Thử Điện Cảm Ứng Đa Chức Năng CTFAST An Toàn Tiện Dụng', N'155.000 ₫', N'image/161434b2764fc67dd748af07d107574d.jpg', N'Nhựa ABS cách điện
Bảo quản nơi thoáng mát
Đọc kỹ hướng dẫn sử dụng .
Do dòng tải AC, đo Diode và thông mạch, đo điện áp DC, đo điện áp AC, đo điện trở
Đồng Hồ Đo Điện Vạn Năng Ampe Kìm + Bút Thử Điện Cảm Ứng Đa Chức Năng CTFAST An Toàn Tiện Dụng :  Là Bộ Sản Phẩm Đo Điện Dân Dụng hoàn hảo trong tủ sửa dụng cụ điện của gia đình bạn .Cặp đôi sản phẩm là cánh tay đắc lực cho các bạn khi sửa chữa , thăm dò, đo lường các thiết bị điện trong nhà một cạch an toàn hiệu quả , nhanh chóng.

THÔNG TIN SẢN PHẨM :
1.Đồng Hồ Đo Điện Vạn Năng Ampe Kìm:

- Chức năng:



Hướng dẫn sử dụng:

2.Bút Thử Điện Cảm Ứng Đa Chức Năng CTFAST




 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (12, N'Bộ Dụng Cụ Sửa Chữa Đa Năng KIOTOOL 46 chi tiết - Bộ dụng cụ vặn bu long ốc vít sửa chữa xe máy', N'185.000 ₫', N'image/2b46fc92b97f4c77351aa26962474203.jpg', N'Bộ dụng cụ  KIOTOOL 46 chi tiết phù hợp với công việc sửa chữa trong gia đình
Chất liệu: thép không gỉ cao cấp, chắc chắn.
Mở ốc từ 4-14mm
Mở vít 2 cạnh, 4 cạnh, 6 cạnh các loại
Cờ lê đảo chiều, tay cầm tô vít, tay nối dài, dây nối dài giúp làm việc ở những góc hẹp
Hộp đựng sản phẩm bằng nhựa cứng gọn gàng, tiện dụng, tránh thất lạc phụ kiện
Kích thước hộp: 24*13*4cm.
Khối lượng: khoảng 1.5kg.
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (13, N'Máy hàn điện tử, máy hàn mini GGG420, máy hàn que 2,5 -Bộ phụ kiện đầy đủ dây hàn + dây mát+ kèm kẹp, mo hàn', N'758.000 ₫', N'image/2a6cff7d65bd9b9c8cd32c42c3677a57.jpg', N'Cách lắp dây: dây màu nào lắp với chân máy máy màu đó
Hàn que 2.5: Chỉnh dòng 360-370
Được thiết kế ứng dụng công nghệ tiết kiệm tiên tiến Inverter, Máy hàn que điện tử GGG có khả năng tiết kiệm điện lên đến 50% – 60% so với máy hàn que truyền thống, có thể hàn được tốt cửa sắt, Inox, vật dụng gia đình, công nghiệp, xây dự
Máy hàn que điện tử có thiết kế thông minh, nhỏ gọn giúp việc sử dụng và di chuyển một cách linh hoạt và an toàn. 
 Máy được thiết kế với dòng điện lưu 120A, có thể làm việc được với các que hàn kích thước 1,6-2,5mm.
Máy Có chế độ bảo vệ quá nhiệt, quá tải với nguồn điện không ổn định. 
Đồng hồ hiển thị dòng hàn bằng kỹ thuật số tăng hiệu suất làm việc và thời gian hàn không giới hạn. Cọc cắm được thiết kế lớn hơn so với những loại máy hàn cũ giúp nguồn điện đầu ra được mạnh và ổn định hơn khi làm việc.
Vỏ máy được sơn bằng tĩnh điện, giúp cho máy có độ bền cao hơn, chịu được ở môi trường khắc nghiệt, tăng khả năng chống chọi với oxi hóa trong thời gian dài. 
Bộ phụ kiện đi kèm máy VÔ CÙNG HẤP DẪN:
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (14, N'Keo dán giày, gỗ, nhựa đa năng siêu dính 3M Scotch 3M-3M-AD113', N'24.000 ₫', N'image/4442b3f581cb226ee1ec4c4a182846a5.jpg', N'Tránh ánh nắng trực tiếp, đậy nắp sau khi sử dụng để bảo quản sản phẩm được lâu.
Sử dụng đơn giản như keo dán sắt thông thường, bề mặt cần dán cần sạch và khô.
18cm x 12xm x 4cm
Nhờ những đặc tính siêu dính, siêu chắc, khô nhanh nên Keo dán giày, gỗ, nhựa đa năng siêu dính 3M Scotch AD113 thường dùng dán đồ thể thao (giày, dép), dụng cụ thể thao và vật dụng gia đình, Với đặc tính trên Keo dán giày, gỗ, nhựa đa năng siêu dính 3M Scotch AD113 có thể sử dụng được cho các bề mặt khó dính như gỗ, kim loại, gốm sứ, cao su,…Thông tin sản phẩm


Tránh ánh nắng trực tiếp, đậy nắp sau khi sử dụng để bảo quản sản phẩm được lâu.
Sử dụng đơn giản như keo dán sắt thông thường, bề mặt cần dán cần sạch và khô.
Lưu ý: tùy theo đợt nhập hàng mà bao bì sản phẩm sẽ có sự thay đổi
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (15, N'Bộ dụng cụ di chuyển đồ vật nặng trong nhà thông minh KIOTOOL tải trọng 600kg chuyên dụng di chuyển don nhà - Màu ngầu nhiên', N'285.000 ₫', N'image/04882ddcfbdd34fcd2fbb0a4e9c321a3.jpg', N'Dụng cụ di chuyển đồ vật nặng trong nhà thông minh KIOTOOL tải trọng 600kg chuyên dụng di chuyển don nhà - Màu ngầu nhiên
Tải trọng 600kg di chuyển tủ giường ngay cả két sắt một cách dễ dành dù chỉ cần 1 ngườiVới thiết kế 3 bánh xoay linh động mỗi chânDễ dàng di chuyển đồ vật cồng kềnh, nặng mà không khó khăn hay mất nhiều sứcThiết kế thông minh, đơn giản và dễ sử dụngChế tạo từ hợp kim thép và nhựa ABS cao cấp, chịu lực tốtGiảm thời gian và tăng năng suất lao động hiệu quảChỉ cần 1 người cũng có thể chuyển đồ nặng
 









 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (16, N'Bút đo độ PH của nước', N'95.300 ₫', N'image/d85d42d8faf84ac7ac6683640b94693e.jpg', N'PH là một chỉ số xác định tính chất hoá học của nước. Thang pH chỉ từ 0-14; Về lý thuyết, nước có pH = 7 là trung tính. Khi pH > 7, nước lại mang tính kiềm. Thang tính pH là một hàm số Logarrit. Ví dụ pH = 5 có tính a xit cao gấp 10 lần pH = 6, gấp 100 lần so với pH = 7. Theo tiêu chuẩn, pH của nước sử dụng cho sinh hoạt là 6,0 – 8,5 và của nước ăn uống uống là 6,5 – 8,5.
Bút đo pH dụng cụ hỗ trợ xác định (độ chua hoặc độ kiềm) trong nước - dung dịch. Các phép đo này rất quan trọng đối với nhiều ứng dụng trong nuôi trồng thủy sản,sinh vật cảnh, hồ bơi, nông nghiệp, y học, sinh học, hóa học, khoa học thực phẩm, khoa học môi trường, hải dương học, dinh dưỡng, xử lý nước và lọc nước các lĩnh vực khác. Bút đo độ PH-04 này được sử dụng rộng rãi trong sản xuất đo lường ph trong nuôi trồng thủy sản, quản lý bể bơi hồ chứa, canh tác nông nghiệp, sản xuất công nghiệp, phòng thí nghiệm, cơ sở kiểm soát chất lượng và giáo dục.
1 x máy Đo độ ph
2 x Bột dung dịch hiệu chuẩn  (pH 4.00 và 6.86 pH)
1 x Hướng dẫn sử dụng
1 x Vít hiệu chuẩn


 
Thực hiện theo các hướng dẫn trên các gói hiệu chuẩn 4.01 hoặc 6.86 đi kèm, nhúng bút đo pH vào dung dịch hiệu chuẩn và dùng tua vít để vặn về đúng chỉ sốt ghi trên gói dung dịch.

Nếu điện cực sử dụng trong thời gian dài và điện cực tiếp xúc với không khí, sau đó hiển thị các giá trị chậm và không ổn định là do điện cực khô. Chỉ cần nhúng điện cực vào nước trong vài giờ.
Khi giá trị hiển thị mờ hoặc không hiển thị, hãy nhanh chóng thay thế pin. Vặn nắp pin và thay pin. Chú ý đến tính phân cực của pin
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (17, N'Bộ Bặn Vít Đa Năng Bosch 46 món - Giao màu ngẫu nhiên', N'448.000 ₫', N'image/5cd7bdacd92295496f87caba6c4b9900.jpg', N'Thông tin sản phẩm
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (18, N'Dụng Cụ Lấy Dấu, Định Vị Điểm Khoan - Chống Trượt', N'28.999 ₫', N'image/0f2ef6a088a1d037f7232f5c4233725e.jpg', N'Dụng cụ đục lỗ, định vị điểm khoan là dụng cụ cầm tay giúp bạn dễ dàng đánh dấu trên các vật liệu sắt, gỗ, nhựa  với lực đẩy của lò xo cùng đầu mũi nhọn.
Thiết bị định vị được làm bằng ĐỒNG NGUYÊN CHẤT cùng lớp mạ màu vàng đẹp mắt, tránh việc gỉ cũng như đảm bảo độ bền của dụng cụ đục lỗ.
Việc sử dụng thiết bị đánh dấu điểm khoan là vô cùng đơn giản. Bạn chỉ cần xác định điểm cần đánh dấu. Sau đó, để đầu nhọn của thiết bị vào vị trí cần đánh dấu. 
Dùng tay ấn thiết bị định vị xuống và nhấc lên.
Kết quả: chúng ta có điểm đánh dấu mà không tốn nhiều sức.

Kích thước của dụng cụ đục lỗ
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (19, N'Túi vệ sinh máy lạnh TD01, Áo vệ sinh máy lạnh tại nhà', N'120.000 ₫', N'image/2842fb5deedb2b945dba0fa8974580a5.jpg', N'Vải dù tổ ong chống thấm
CÁCH SỬ DỤNG:
 
      Áo vệ sinh máy lạnh TD01 là mẫu thiết kế cải tiến nhất của nhà sản xuất Thuận Dung được thiết kế và sản xuất kể từ năm 2013, chuyên dùng cho thợ điện lạnh với độ bền cao, tiện lợi nhất với miệng áo có thun co dãn, và thiết kế luồn dây treo xung quanh máy lạnh.
     Trên thị trường hiện có rất nhiều Shop bán áo vệ sinh có nguồn gốc khác nhau, cần phân biệt sản phẩm bán bởi Thuận Dung và các sản phẩm khác như sau:

- Có tem sản phẩm từ nhà sản xuất Thuận Dung với mã sản phẩm là TD01, những sản phẩm không có tem này đều là hàng nhái không được sản xuất bởi Thuận Dung.
- Chất liệu: Vải dù tổ ong chống thấm, độ bền cao.
- Màu: Xanh đen (có màu xanh rêu nhưng chưa bán trên TIKI)
- Chiều rộng miệng túi: 1.8 mét, sử dụng đa năng cho tất cả các dòng máy lạnh dân dụng từ 1HP đến 3HP
- Ống xả : 2.5m tính từ phần đuôi áo, rất dài để tiện cho việc xả nước ở mọi độ cao gắn máy lạnh thông dụng.
- Trọng lượng: 600gr nhẹ hơn các loại vải khác giúp thao tác thuận tiện, không chì nặng vào máy khi xịt nước, không thấm vào vải, và cực kỳ mau khô sau khi sử dụng và giặt rữa giúp đảm bảo độ bền sử dụng lâu dài. 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (20, N'Súng bắn keo nến silicon + Tặng 10 cây keo silicon nến', N'60.000 ₫', N'image/205ef2f03033f133def83403d2fb7354.png', N'Súng bắn keo nến silicon + Tặng 10 cây keo silicon nếnKích thước nhỏ gọnThen súng làm bằng nhựa cứng chắc chắnCông suất 20W giúp làm nóng keo nhanhCó công tắc bật tắtTặng 10 cây keoSúng bắn keo sử dụng để cố định những chi tiết trên các sản phẩm handmade.Sản phẩm có kích thước nhỏ gọn, dễ dàng mang theo và sử dụng trong nhiều không gian, vật dụng.
  
 

Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (21, N'Bộ tua vít đa năng sửa chữa điện thoại 25 in 1 vít từ tính chất liệu cao cấp S2', N'64.900 ₫', N'image/5581a2e95de7b05ed340316f2a4cf9a8.PNG', N'Chất liệu: thép nhậu khẩu HRC 60, hộp kim nhôm
Nặng: 300g
Kích thước: 168 x 67 x 17 mm.
Đầu vít: 24 đầu, gồm có 4 lớp.
Màu sắc: xám.

Hôm nay mình xin giới thiệu đến các bạn một bộ phụ kiện sửa chữa điện thoại, kính mắt đa năng bỏ túi.Nếu sỡ hữu cho mình bộ vít chắc chắn sẽ giúp ích cho công việc của bạn rất nhiều vì tính đa năng của nó, bạn có thể sử dụng nó đẻ tháo lắp đồng hồ, máy ảnh, laptop, điện thoại, mắt kính, đồ gia dụng…
Đối với dân kỹ thuật hay sữa chửa mà nói thị bộ vít chính là một phụ kiện vô cùng quan trọng, nó sẽ giúp họ rất nhiều trong công việc hàng ngày, thế nhưng chắc chắn sẽ có nhiều bạn đang sở hữu nhiều bộ vít có kích thước quá lớn hay các đầu vít không đạt tiêu chuẩn rất dễ bị mài mòn sau một quá trình sử dụng. Nhưng đối với sản phẩm này thì bạn hoàn toàn yên tâm.
 

Nhìn sơ qua về mặt thiết kế, có thể nói đến hộp đựng vít, được làm từ hợp kim nhôm aluminum,, 2 cạnh được bo tròn tạo cảm giác cho sản phẩm mềm mại hơn rất nhiều không thô cứng như các sản phẩm khác, với kích thước chỉ khoảng 168 x 67 x 17mm, nặng chỉ 300g,vừa nhỏ gọn vừa sang trọng, bề mặt chống thấm mồ hôi và chịu va đập tốt nên bạn có thể dễ dàng mang theo bên người.
Có tất cả là 24 đầu vít, được chia thành 4 tầng sắp gọn gàng trên hộp, ứng mỗi vị trí trên đầu vít thì trên thân hộp đều được in một hình vẽ tương ứng để bạn có thể dễ dàng lựa chọn, không những thế trên thân từng đầu vít đều được in những thông số như: U2.6, H2.0, PH2… con số ứng với từng đầu vít nhất định, cầu đầu vít đều được tích hợp nam chấm để dễ dàng hơn khi bạn bắt những con ốc.

 
Chất liệu để làm nên những đầu vít này là thép HRC 60 rất chắc chắn và cứng cáp chịu được lực khá tốt, nên sẽ ít có hiện tượng bị mài mòn hay bị chai sau một thời gian dài sử dụng. Phần thân cây viết cũng được làm từ chất liệu giống như đầu vít, dài khoảng 13cm, khá vừa tay người cầm rất cho cảm giác rất chắc chắn và thoải mái.
Sỡ hữu cho mình bộ vít này chắc chắn sẽ giúp ích cho công việc của bạn rất nhiều vì tính đa năng của nó, bạn có thể sử dụng nó đẻ tháo lắp đồng hồ, máy ảnh, laptop, điện thoại, mắt kính, đồ gia dụng…
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (22, N'Xe đẩy hàng 4 bánh SUMIKA T300 - Khung thép, tay cầm gấp mở tiện lợi, tải trọng 300kg', N'1.390.000 ₫', N'image/1a3c44c041edcc906cee23b5906af115.jpg', N'Xe đẩy hàng SUMIKA T300 di chuyển linh hoạt, dễ dàng.
- T300 là dòng xe đẩy hàng đa năng 1 tầng với kích thước tiêu chuẩn khi mở rộng là 69x90x89.5cm (Dài x Rộng x Cao), giúp bạn thao tác dễ dàng và nhanh hơn. Thiết kế nhỏ gọn, dễ dàng gập tay cầm xuống và cất dưới gầm bàn, gầm ghế hay cho dựa vào tường mà không sợ tốn diện tích. 
 

 
- Xe đẩy hàng SUMIKA T300 với khung xe được làm bằng thép siêu bền có độ bền cao, không bị biến dạng khi va đập mạnh và có thể chịu được tải trọng lên đến 300kg. 
 

 - Tay cầm của xe có độ cao phù hợp với người Việt Nam nên người dùng không phải cúi khom người khi đẩy (người cao 1m4 - 1m8 đều có thể dùng được), không gây đau lưng khi sử dụng lâu dài.
 


Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (23, N'Bộ tua vít đa năng sửa chữa điện thoại 25 in 1 vít từ tính chất liệu cao cấp S2', N'64.900 ₫', N'image/5581a2e95de7b05ed340316f2a4cf9a8.PNG', N'Chất liệu: thép nhậu khẩu HRC 60, hộp kim nhôm
Nặng: 300g
Kích thước: 168 x 67 x 17 mm.
Đầu vít: 24 đầu, gồm có 4 lớp.
Màu sắc: xám.

Hôm nay mình xin giới thiệu đến các bạn một bộ phụ kiện sửa chữa điện thoại, kính mắt đa năng bỏ túi.Nếu sỡ hữu cho mình bộ vít chắc chắn sẽ giúp ích cho công việc của bạn rất nhiều vì tính đa năng của nó, bạn có thể sử dụng nó đẻ tháo lắp đồng hồ, máy ảnh, laptop, điện thoại, mắt kính, đồ gia dụng…
Đối với dân kỹ thuật hay sữa chửa mà nói thị bộ vít chính là một phụ kiện vô cùng quan trọng, nó sẽ giúp họ rất nhiều trong công việc hàng ngày, thế nhưng chắc chắn sẽ có nhiều bạn đang sở hữu nhiều bộ vít có kích thước quá lớn hay các đầu vít không đạt tiêu chuẩn rất dễ bị mài mòn sau một quá trình sử dụng. Nhưng đối với sản phẩm này thì bạn hoàn toàn yên tâm.
 

Nhìn sơ qua về mặt thiết kế, có thể nói đến hộp đựng vít, được làm từ hợp kim nhôm aluminum,, 2 cạnh được bo tròn tạo cảm giác cho sản phẩm mềm mại hơn rất nhiều không thô cứng như các sản phẩm khác, với kích thước chỉ khoảng 168 x 67 x 17mm, nặng chỉ 300g,vừa nhỏ gọn vừa sang trọng, bề mặt chống thấm mồ hôi và chịu va đập tốt nên bạn có thể dễ dàng mang theo bên người.
Có tất cả là 24 đầu vít, được chia thành 4 tầng sắp gọn gàng trên hộp, ứng mỗi vị trí trên đầu vít thì trên thân hộp đều được in một hình vẽ tương ứng để bạn có thể dễ dàng lựa chọn, không những thế trên thân từng đầu vít đều được in những thông số như: U2.6, H2.0, PH2… con số ứng với từng đầu vít nhất định, cầu đầu vít đều được tích hợp nam chấm để dễ dàng hơn khi bạn bắt những con ốc.

 
Chất liệu để làm nên những đầu vít này là thép HRC 60 rất chắc chắn và cứng cáp chịu được lực khá tốt, nên sẽ ít có hiện tượng bị mài mòn hay bị chai sau một thời gian dài sử dụng. Phần thân cây viết cũng được làm từ chất liệu giống như đầu vít, dài khoảng 13cm, khá vừa tay người cầm rất cho cảm giác rất chắc chắn và thoải mái.
Sỡ hữu cho mình bộ vít này chắc chắn sẽ giúp ích cho công việc của bạn rất nhiều vì tính đa năng của nó, bạn có thể sử dụng nó đẻ tháo lắp đồng hồ, máy ảnh, laptop, điện thoại, mắt kính, đồ gia dụng…
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (24, N'Keo Dán Giày, Dây Nịt Đa Năng Selleys Kwik Grip (50ml)', N'33.000 ₫', N'image/d1bde64b3a4ac8a23805c26ed6cac4c4.jpg', N'Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (25, N'Xe đẩy hàng 4 bánh SUMIKA T300 - Khung thép, tay cầm gấp mở tiện lợi, tải trọng 300kg', N'1.390.000 ₫', N'image/1a3c44c041edcc906cee23b5906af115.jpg', N'Xe đẩy hàng SUMIKA T300 di chuyển linh hoạt, dễ dàng.
- T300 là dòng xe đẩy hàng đa năng 1 tầng với kích thước tiêu chuẩn khi mở rộng là 69x90x89.5cm (Dài x Rộng x Cao), giúp bạn thao tác dễ dàng và nhanh hơn. Thiết kế nhỏ gọn, dễ dàng gập tay cầm xuống và cất dưới gầm bàn, gầm ghế hay cho dựa vào tường mà không sợ tốn diện tích. 
 

 
- Xe đẩy hàng SUMIKA T300 với khung xe được làm bằng thép siêu bền có độ bền cao, không bị biến dạng khi va đập mạnh và có thể chịu được tải trọng lên đến 300kg. 
 

 - Tay cầm của xe có độ cao phù hợp với người Việt Nam nên người dùng không phải cúi khom người khi đẩy (người cao 1m4 - 1m8 đều có thể dùng được), không gây đau lưng khi sử dụng lâu dài.
 


Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (26, N'Thước kẹp điện tử 150mm thép hợp kim không rỉ màn hình LCD', N'319.999 ₫', N'image/82c99f5c210d8cd89c4bf7e403361a14.jpg', N'- Màn hình LCD lớn sắc nét (42mmx17mm) cho khả năng dễ đọc, có khả năng tự tắt khi không dùng tới, tiết kiệm pin.
- Hiển thị cỡ 0.01mm rất chính xác, dễ đọc kết quả.
THÔNG SỐ KỸ THUẬT CỦA SẢN PHẨM
- Vật liệu: Thép không gỉ.
- Dải đo: 0 - 150mm.
- Độ chia nhỏ nhất: ± 0,01mm
- Dung sai chính xác: ± 0.02mm
- Hệ thống đo lường: Hệ thống đo điện dung tuyến tính.
- Pin: một 1.5 V LR44 (Tặng kèm 2 pin dự phòng).
- Hộp đựng bằng nhựa cứng, đi kèm 2 pin LR44, 1 tô vít nhỏ 4 cạnh để tháo lắp pin
Dụng cụ cầm tay Trường Thành chuyên cung cấp sỉ, lẻ các mặt hàng đồ cơ khí cầm tay, bộ dụng cụ đo lường, cờ lê, tua vít, thước kẹp điện tử, máy khoan cầm tay, máy mài cầm 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (28, N'Bộ Dụng Cụ Tua Vít Đa Năng Nhiều Món Có Từ Tính 111 in 1 Dùng Tháo Lắp, Tháo Mở Và Sửa Chữa Điện Thoại Di Động, Máy Tính, PC/ Laptop, Máy Tính Bảng', N'175.999 ₫', N'image/d3a2ae5f3b6ad38c8072385398071a15.jpg', N'Bộ Dụng Cụ Tua Vít Đa Năng Nhiều Món Có Từ Tính 111 in 1 Dùng Tháo Lắp, Tháo Mở Và Sửa Chữa Điện Thoại Di Động, Máy Tính, PC/ Laptop, Máy Tính Bảng
 

Trọn 111 trong 1 món với 98 đầu tua-vít các loại và 13 món khác
Chất liệu cao cấp, gia công độ chính xác cao
Giúp tháo lắp, tháo mở các thiết bị điện tử (máy tính, điện thoại, laptop,) một cách dễ dàng
Tất cả đầu tua-vít có từ tính
Thiết kế hộp nhựa ABS chất lượng chia từng ngăn sắp xếp gọn gàng
Hộp thiết kế nhỏ gọn, dễ dàng mang theo khi cần
Thích hợp sửa chữa cho hầu hết điện thoại di động, máy tính, máy chơi game, máy tính bảng, đồng hồ, kính,  trên thị trường
Kích thước hộp: 16x8x4cm





Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (29, N'Bộ dụng cụ nâng và di chuyển đồ thông minh, Dụng cụ di chuyển đồ đạc, Dụng cụ hỗ trợ di chuyển vật nặng', N'145.000 ₫', N'image/45f61952cef51f1f2b4c5c04e6c10b96.png', N'BỘ DỤNG CỤ NÂNG VÀ DI CHUYỂN ĐỒ THÔNG MINH
Hỗ trợ di chuyển vật dụng nặng: tủ lạnh, két sắt, tủ, giường,ết kiệm thời gian, nhân lực, tăng năng suất lao động. Giảm các nguy cơ chấn thương, tai nạn nghề nghiệp không đáng có.
CÁC TIỆN ÍCH MANG LẠI:
- Dễ dàng sử dụng xung quanh nhà, sắp xếp lại toàn bộ ngôi nhà hay chỉ đơn giản là điều chỉnh vị trí của một vài đồ vật.
- Là dụng cụ hỗ trợ không thể thiếu giúp giảm các nguy cơ chấn thương, tai nạn nghề nghiệp không đáng có khi khiêng nặng quá sức trong quá trình di chuyển, bê đồ vật
- Bộ sản phẩm bao gồm một tay nâng và hệ 4 con lăn. Tay nâng được làm từ chất liệu thép siêu cứng và siêu bền. Con lăn với các bánh xe được làm từ nhựa ABS chịu lực cao, có khả năng xoay 360 độ giúp bạn dễ dàng di chuyển vật dụng đến đúng vị trí mình mong muố
- Dùng để di chuyển vật dụng nặng: tủ lạnh, két sắt, tủ, giường,
- Tiết kiệm thời gian, nhân lực, tăng năng suất lao động.
- Chất liệu chế tạo tay nâng bằng hợp kim thép cao cấp, con lăn bánh xe làm từ nhựa ABS chịu lực tốt.
- Con lăn bánh xe xoay 360°, giúp dễ dàng di chuyển đồ.
- Tải trọng di chuyển tối đa mỗi còn lăn lên đến 150kg, Tổng tải trọng di chuyển là 600kg.
Thông tin sản phẩm:
Một bộ sản phẩm gồm: 1 tay nâng và 4 bánh xe chât liệu nhựa ABS và thép chất lượng cao.


Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (30, N'Bút đo độ PH của nước', N'95.300 ₫', N'image/d85d42d8faf84ac7ac6683640b94693e.jpg', N'PH là một chỉ số xác định tính chất hoá học của nước. Thang pH chỉ từ 0-14; Về lý thuyết, nước có pH = 7 là trung tính. Khi pH > 7, nước lại mang tính kiềm. Thang tính pH là một hàm số Logarrit. Ví dụ pH = 5 có tính a xit cao gấp 10 lần pH = 6, gấp 100 lần so với pH = 7. Theo tiêu chuẩn, pH của nước sử dụng cho sinh hoạt là 6,0 – 8,5 và của nước ăn uống uống là 6,5 – 8,5.
Bút đo pH dụng cụ hỗ trợ xác định (độ chua hoặc độ kiềm) trong nước - dung dịch. Các phép đo này rất quan trọng đối với nhiều ứng dụng trong nuôi trồng thủy sản,sinh vật cảnh, hồ bơi, nông nghiệp, y học, sinh học, hóa học, khoa học thực phẩm, khoa học môi trường, hải dương học, dinh dưỡng, xử lý nước và lọc nước các lĩnh vực khác. Bút đo độ PH-04 này được sử dụng rộng rãi trong sản xuất đo lường ph trong nuôi trồng thủy sản, quản lý bể bơi hồ chứa, canh tác nông nghiệp, sản xuất công nghiệp, phòng thí nghiệm, cơ sở kiểm soát chất lượng và giáo dục.
1 x máy Đo độ ph
2 x Bột dung dịch hiệu chuẩn  (pH 4.00 và 6.86 pH)
1 x Hướng dẫn sử dụng
1 x Vít hiệu chuẩn


 
Thực hiện theo các hướng dẫn trên các gói hiệu chuẩn 4.01 hoặc 6.86 đi kèm, nhúng bút đo pH vào dung dịch hiệu chuẩn và dùng tua vít để vặn về đúng chỉ sốt ghi trên gói dung dịch.

Nếu điện cực sử dụng trong thời gian dài và điện cực tiếp xúc với không khí, sau đó hiển thị các giá trị chậm và không ổn định là do điện cực khô. Chỉ cần nhúng điện cực vào nước trong vài giờ.
Khi giá trị hiển thị mờ hoặc không hiển thị, hãy nhanh chóng thay thế pin. Vặn nắp pin và thay pin. Chú ý đến tính phân cực của pin
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (31, N'Máy mài góc cầm tay INGCO AG750282 đường kính 100mm công suất 750W công tắc ở đuôi.', N'495.900 ₫', N'image/304e83a348de498d709bfc4fd11b0220.jpg', N'INGCO là một thương hiệu chuyên sản xuất các công cụ , dụng cụ, máy cầm tay theo tiêu chuẩn Châu Âu, Mục tiêu phát triển của thương hiệu là mang tới cho người tiêu dùng những máy móc và đồ nghề giá cạnh tranh, chất lượng vượt trội.
INGCO VIỆT NAM là nhà phân phối và bảo hành chính hãng tại Việt Nam.
Thông số kỹ thuật:- Điện thế: 220-240V~50-60Hz- Công suất: 750W- Tốc độ không tải: 12000rpm, - Đường kính đĩa mài: 100mm, cốt mài: M10.- Kèm theo 1 tay cầm phụ, đóng gói trong hộp màu.. TL: 2.6 kg- Sản phẩm bảo hành: 6 tháng.
Cám ơn quý khách hàng đã sử dụng sản phẩm chính hãng được phân phối bởi INGCO Việt Nam. Mọi hổ trợ, vui lòng liên hệ hotline: 0777.424.777
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (32, N'Thang nhôm rút gọn SUMIKA SK440 - Chiều cao tối đa 4.4m, chiều dài rút gọn 0.92m', N'1.685.000 ₫', N'image/0abc74a5542f0b0a22d78dbff4eb2a90.jpg', N'Thang Nhôm Rút Gọn Sumika SK440 được thiết kế thông minh với kiểu rút gọn, bạn có thể sử dụng ở nhiều độ cao khác nhau bằng cách kéo lên, rút xuống linh hoạt. Sản phẩm được sử dụng rộng rãi trong gia đình, trang trí nội thất, dùng trong nhà và ngoài trời. Đặc biệt còn được ứng dụng nhiều trong ngành bưu điện, điện lực, truyền hình cáp, Có thể phục vụ cho nhiều mục đích sử dụng khác nhau với chiều cao hợp lý của mình.
 

 
Sản phẩm được làm bằng chất liệu nhôm dày với độ dày 1.2 - 1.5 mm, chống móp méo, tránh tác động, chịu được lực cao. Chống lại sự oxy hoá khi tiếp xúc với môi trường bên ngoài và chịu được nhiệt khi dùng ở ngoài trời.
Đặc biệt, mỗi bậc thang được trang bị chốt khoá nhựa, cố định, chắc chắn, bậc thang đủ chắc giúp người dùng leo lên xuống thoải mái. Hơn nữa, chân than có đế cao su chống trơn trượt, đảm bảo an toàn cho người sử dụng và chống trầy sàn nhà bạn, giúp người sử dụng an tâm hơn.
 

 
Thang Nhôm Rút Gọn Sumika đươc thiết kế với số bậc thang là 15, trọng lượng nhẹ có thể xách tay dễ dàng cùng với thao tác sử dụng đơn giản: Mở rộng, rút ra theo từng bậc, dễ vận hành và sử dụng. Kích thước nhỏ gọn, thuận tiện để cất giữ trong không gian nhỏ. Ngoài ra sản phẩm có khóa gấp tự động với mức tải trọng lên đến 300kg đã đạt được tiêu chuẩn châu Âu EN131, đảm bảo an toàn cho bạn.
 

 
Thang nhôm rút gọn SUMIKA Model: SK440- Kích thước: 50x10x94cm- Chiều cao tối đa: 4.4m- Chiều dài rút gọn: 0.92m- Trọng lượng 12,3 kg- Số bậc: 15 bậc- Khoảng cách bậc: 30cm- Độ dày nhôm: 1,2-1,5 mm- Tải trọng 300kg, tiêu chuẩn EN131
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (33, N'Keo Dán Siêu Dính Đa Năng Mọi Chất Liệu Cực Mạnh - Dán Gỗ Thuỷ Tinh Kim Loại Sắt Gốm Sứ Nhựa Vải TBM1', N'35.000 ₫', N'image/d0808ee755689be431552171524487fd.jpg', N'------------  HƯỚNG DẪN SỬ DỤNG -------------  Làm sạch bề mặt muốn kết dính  Mở nắp và bôi keo lên bề mặt  Gắn kết bề mặt muốn dính và chờ trong tối thiểu 30s để phát huy tác dụng
️️LƯU Ý: - Bề mặt muốn kết dính cần được làm sạch hoàn toàn, không chứa bụi bẩn hay dung dịch khác - Có thể đeo găng tay cao su khi sử dụng keo dán. - Vì thành phần hoá học đặc biệt, dung dịch keo cần có khoảng không khí để thở nên chỉ có thể đổ đầy 75% lọ. - Tránh xa tầm tay trẻ em - Không để dung dịch dính vào mắt, da.
KEO DÁN ĐA NĂNG THẾ HỆ MỚI - BÁM DÍNH MẠNH MẼ HƠN 80 LẦN KEO 502 -
LOẠI TỐT NHẤT THỊ TRƯỜNG KHÔ NHANH CẤP TỐC SAU 30 GIÂY CHỐNG THẤM NƯỚC VÀ VA ĐẬP 
> ------------ TÍNH NĂNG NỔI BẬT -------------
Khác biệt với các loại keo truyền thống, KEO DÁN ĐA NĂNG THẾ HỆ MỚI được nâng cấp các tính năng để đáp ứng mọi nhu cầu sử dụng của bạn:
Bám dính mạnh mẽ hơn 80 lần so với keo 502 truyền thống. T ối ưu thời gian dính chỉ sau 30 giây, tiết kiệm thời gian sửa chữa. Gắn kết đa dạng chất liệu: gốm sứ, kim loại, nhựa, dép xốp, đồ ghỗ, gương, trang sức, đồ thủ công,linh kiện điện tử Không gây ố bẩn vết dính. Tạo nên sự gắn kết trong suốt hoàn hảo. Mùi nhẹ dịu, không gây khó chịu khi sử dụng, an toàn và thân thiện môi trường.
------------ THÔNG TIN SẢN PHẨM -------------Kích thước: 122 x 38 mmDung tích: 30 mlPhân loại: dung dịchMùi hương: ít mùi Hạn sử dụng: 18 thángThời gian phát huy công hiệu: sau 30 giây Bảo quản: tránh ánh nắng trực tiếp, đậy nắp sau khi sử dụng






Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (34, N'Máy mài góc cầm tay INGCO AG750282 đường kính 100mm công suất 750W công tắc ở đuôi.', N'495.900 ₫', N'image/304e83a348de498d709bfc4fd11b0220.jpg', N'INGCO là một thương hiệu chuyên sản xuất các công cụ , dụng cụ, máy cầm tay theo tiêu chuẩn Châu Âu, Mục tiêu phát triển của thương hiệu là mang tới cho người tiêu dùng những máy móc và đồ nghề giá cạnh tranh, chất lượng vượt trội.
INGCO VIỆT NAM là nhà phân phối và bảo hành chính hãng tại Việt Nam.
Thông số kỹ thuật:- Điện thế: 220-240V~50-60Hz- Công suất: 750W- Tốc độ không tải: 12000rpm, - Đường kính đĩa mài: 100mm, cốt mài: M10.- Kèm theo 1 tay cầm phụ, đóng gói trong hộp màu.. TL: 2.6 kg- Sản phẩm bảo hành: 6 tháng.
Cám ơn quý khách hàng đã sử dụng sản phẩm chính hãng được phân phối bởi INGCO Việt Nam. Mọi hổ trợ, vui lòng liên hệ hotline: 0777.424.777
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (35, N'Bộ dụng cụ đa năng 108 món của Bosch 2607002788', N'1.523.000 ₫', N'image/62aad7d39da288e5580b1677f27959b341.jpg', N'Bộ dụng cụ đa năng 108 món của Bosch 2607002788 với nhiều món khác nhau giúp cho công việc sửa chữa lắp đặt máy móc trong gia đình của bạn trở nên dễ dàng hơn rất nhiều, đảm bảo mở được tất cả các linh kiện. 108 món phụ kiện được xếp trong hộp rất tiện dụng và khoa học, chỉ cần một thao tác đơn giản, bạn sẽ chọn được ngay món phụ kiện cần sử dụng. Bộ dụng cụ chắc chắn sẽ là dụng cụ hỗ trợ đắc lực phục vụ các công việc của bạn được nhanh chóng và hiệu quả hơn rất nhiều.
THÔNG SỐ KỸ THUẬT
Bộ được đựng trong hộp nhựa bao gồm:
- Kìm điện Bosch = 1 cái- Kìm nhọn Bosch = 1 cái- Mỏ lết Bosch = 1 cái- Đèn pin chiếu sáng = 1 cái- Bút thử điện = 1 cái- Búa nhổ đinh Bosch = 1 cái- Cưa sắt cầm tay có lưỡi cưa Bosch = 1 cái- Băng keo điện màu đen = 1 cuộn- Thước kéo thép Bosch 3m = 1 cái- Cần lục giác chữ L: 1.5, 2, 2.5, 3, 4, 5, 5.5, 6mm = 8 cái- Tuốc nơ vít cầm tay có từ = 1 cái- Bộ đầu tuốc nơ vít: PH1, PH2, PH2, PH3, S6, S7, H5, H6, T15, T20 = 10 cái- Đầu chuyển từ lục giác ngoài 1/4" ra lục giác trong 4mm = 1 cái- Bộ đầu tuốc nơ vít lụgia1c ngoài 4mm: Dẹp 1.5, 2. Sao 0.8, 0.8, 6mm. Bake 00, 000 = 8 cái- Đầu chuyển từ lục giác ngoài 1/4" ra đầu vuông 1/4": 5, 6, 7, 8, 9, 10 = 7 cái- Mũi khoan bê tông đầu trụ: 5, 6, 8mm = 3 mũi- Tắc kê nhựa 5, 6, 8mm = 30 cái- Vít sắt bắt tắc kê nhựa 3, 4, 5mm = 30 cái
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (36, N'Máy Khoan Vặn Vít Dùng Pin Bosch GSR 120-LI (1 Pin, 1 Sạc)', N'1.665.000 ₫', N'image/aa6c01dcd81d705c3a56b442afd1a19b.png', N'Máy Khoan Vặn Vít Dùng Pin Bosch GSR 120 GEN II là dòng sản phẩm khoan pin mới nhất của Bosch ra mắt trong năm 2019. Dòng sản phẩm cải tiến từ dòng khoan pin GSR 120Li. Vẫn sử dụng pin lion 12V xong Máy khoan pin Bosch GSR 120-LI GEN II cải tiến về tốc độ không tải, lực xoắn giúp bạn tối ưu hóa công việc khoan, bắt vít.



Ưu điểm của sản phẩm
Thân máy làm từ nhựa chất liệu cao cấp, cứng chắn, sản xuất theo tiêu chuẩn châu Âu đảm bảo độ bền. Máy có hai chế độ: khoan và bắt vít với 20 cấp trượt.
Máy khoan vặn vít GSR 120 GEN II có thể điều chỉnh tốc độ không tải ở 2 mức:
Máy có chế độ dừng thông minh: Tự động dừng máy trong trường hợp vít đã vặn hết vào vật liệu, ngay cả khi vẫn giữ nút khởi động giúp bảo vệ vật liệu không bị vặn vít quá đà.
Thông số kỹ thuật
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (37, N'Bộ dụng cụ sửa chữa đa năng 45 chi tiết Kachi MK166', N'464.000 ₫', N'image/2f2e22809bf79ec6d3a2324ca17a6b5d.jpg', N'thép không gỉ, nhựa
Có hộp nhựa đi kèm

Bộ dụng đa năng 45 chi tiết Kachi MK-166 dùng sửa chữa vật dụng trong nhà

Bộ dụng cụ đa năng Kachi 45 chi tiết được thiết kế hộp đựng bằng nhựa cứng chắc chắn, có phần quai cầm tiện lợi cho việc di chuyển trong lúc sử dụng. Với từng vị trí vừa khít với từng dụng cụ, người dùng có thể sắp xếp gọn gàng vật dụng khi không sử dụng, đảm bảo độ bền nâng cao cũng như giúp cho không gian nhà ở, nơi làm việc thêm gọn gàng.



Bộ dụng đa năng 45 chi tiết Kachi MK-166 bao gồm:
- 1 Tua vít đầu dẹp 5.8*100
- 1 Tua vít lớn đầu nhọn 5.8*100
- 1 Tua vít nhỏ đầu nhọn
- 1 Dao rọc
- 1 Bút thử điện
- 1 Băng keo điện
- 1 Tay cầm
- 9 Đầu vít 25mm
- 1 Đầu vít ADA
- 9 Đầu khẩu vặn ốc 1/4" 5/6/7/8/9/10/11/12/13
- 8 Lục giác 1.5/2/2.5/3/4/5/5.5/6
- 1 Cưa
- 1 Thước dây 3m
- 1 Kìm mỏ bằng 6”
- 1 Kìm mỏ nhọn 6”
- 1 Cờ lê
- 1 Búa
- 1 Hộp ốc vít 60 cái
- 1 Hộp đựng bằng nhựa




THÔNG SỐ KỸ THUẬT
Model: MK-166
Chất liệu: thép không gỉ, nhựa
Khối lượng: 2.7kg
Kích thước hộp: 35.7 x 27 x 7 cm
Xuất xứ thương hiệu: Việt Nam
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (38, N'Keo chà ron gạch cao cấp, keo dán mạch gạch siêu bám dính chống thấm nước dung tích 280ml - màu trắng', N'36.499 ₫', N'image/cd91cfe0f33f58974ed7348ca3ef4627.png', N'Keo chà ron gạch cao cấp, keo dán mạch gạch siêu bám dính chống thấm nước dung tích 280ml - màu trắngHiện tượng các đường ron nhỏ trên sàn bị tróc ra sau một thời gian ngắn đi vào sử dụng là một hiện tượng khá phổ biến và thường thấy ở bất cứ công trình nào. Bên cạnh đó, hiện nay xu hướng sử dụng gạch lớn như đá hoa cương, đá cẩm thạch,… là khá phổ biến. Với những loại gạch/đá này, phải ốp lát rất sát với nhau sao cho không thấy các mối nối, do đó các đường ron sẽ trở nên rất nhỏ.Kết hợp hai vấn đề trên, nếu không sử dụng đúng loại keo chà ron/ dán mạch có những tính năng chuyên dụng thông thường thì công trình thi công sẽ dễ xảy ra những sự cố ảnh hưởng đến chất lượng và tính thẩm mỹ của công trình. Keo chà ron gạch, keo dán mạch gạch siêu bám dính chống thấm nước của chúng tôi tự tin là sản phẩm có thể giải quyết hết tất cả các vấn đề trên.Là sản phẩm chà ron thế hệ mới, keo chà ron gạch, keo dán mạch gạch sẽ giải quyết tận gốc các vấn đề nhiễm bẩn, nấm mốc hay bong tróc trên ron sàn gạch


Ưu điểm :Siêu bám dínhChống thấm tuyệt đốiKhông rêu mốc, không ố đen, sạch sẽ, giữ nguyên màu sắc sau nhiều năm.Không rạn nứt, co ngót, bong táchKhông làm ố gạch, loang màu gạchThi công dễ dàng, dễ sử dụngBề mặt bóng mịn rất dễ dàng vệ sinhSản phẩm thân thiện với môi trường

Thông tin sản phẩm :Tên sản phẩm : Keo chà ron gạch cao cấp, keo dán mạch gạch siêu bám dính chống thấm nước dung tích 280ml - màu trắngDung tích : 280mlMàu sắc : trắngCông dụng : Sản phẩm được dùng để chà ron gạch, dán mạch gạch, sơn lại những khe nứt ở bồn rửa bát, bếp ga âm bàn.,Thích hợp sử dụng nhà tắm (bồn tắm, phòng vệ sinh, bồn rửa tay, gạch ốp lát, gạch hành lang), nhà bếp, 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (39, N'Bộ Máy Khoan Bắt Vít Không Dây Dùng Pin 24V Kachi MK247 – Đi Kèm 1 Pin - hàng chính hãng', N'768.000 ₫', N'image/5ebcb709dbd46d2dda5c14622f35293b.png', N'dùng pin
Nơi khô ráo
Lắp pin khi sử dụng
Máy khỏe với 2 nấc điều chỉnh tốc độ làm việc. Có chức năng khoan, bắt vít, bắt ốc chống trượt nhiều cấp độ. Hỗ trợ công việc một cách hiệu quả. Máy khoan Kachi MK247 khoan mạnh mẽ với tốc độ thấp 0-400 vòng/phút, và mức cao là 0-1450 vòng/phút.
Pin: 24V Lithium-ION
Mô men xoắn cực đại: 40 N.m
Tốc độ không tải thấp/cao: 0-400/0-1450 vòng/phút
1 hộp
Tốc độ không tải thấp/cao: 0-400/0-1450 vòng/phút
Bộ máy khoan bắt vít không dây dùng Pin 24V Kachi MK247 là một model khoan mới nhất năm nay đến từ thương hiệu Kachi. Bộ máy khoan không dây, dùng pin 24V – đi kèm một pin phụ, giúp khách hàng có thể sử dụng liên tục mà không mất thời gian chờ sạc. Máy có thiết kế nhỏ gọn, với bộ phụ kiện chuyển đổi khoan giúp khoan tường, khoan sắt, gỗ nhanh chóng. Sản phẩm đi kèm vali đựng tiện lợi.
Bộ khoan dùng pin Kachi MK247 được thiết kế nhỏ gọn và vận dụng bằng pin sẽ cho phép bạn sử dụng linh hoạt và tiện lợi hơn. Trọng lượng máy khoan nhẹ chỉ với 1,1kg (bao gồm cả pin) và các phụ kiện đi kèm hơn 2kg giúp thao tác dễ dàng ở mọi ngóc ngách, đặc biệt với những mũi khoan ở chiều cao quá đầu.

- Đảo chiều trái phải.
 - Điều chỉnh tốc độ
 - Khoan tường
 - Khoan sắt
- Bắn vít và rất nhiều ứng dụng
Máy khoan này sử dụng rất phù hợp cho gia đình hoặc thi công công trình nhỏ. Tiện lợi khi các bạn làm việc ở các vị trí khó khăn: bắn vít tường, khoan trần, thi công mành rèm, bóng điện, các vị trí không thể kéo dây điện tới.

Máy khoan Kachi MK247 đi kèm 2 viên pin 24V Lithium/ION cùng sạc. Pin đi kèm có độ bền cao, có thể sử dụng trong một khoản thời gian dài mà không cần sạc liên tục. Ngoài ra Máy được trang bị công nghệ sạc nhanh giúp cho bạn tiết kiệm thời gian chờ,không bị gián đoạn trong công việc.

 
Hơn nữa,  bắt vít không dây dùng Pin 24V Kachi MK247 được trang bị hệ thống đèn báo và đèn LED để bạn có thể nhìn rõ vị trí cần bắn vít hoặc khoan. Đây là một điểm khá nổi bật mà máy được trang bị.

 
Máy khỏe với 2 nấc điều chỉnh tốc độ làm việc. Có chức năng khoan, bắt vít, bắt ốc chống trượt nhiều cấp độ. Hỗ trợ công việc một cách hiệu quả. Máy khoan Kachi MK247 khoan mạnh mẽ với tốc độ thấp 0-400 vòng/phút, và mức cao là 0-1450 vòng/phút.
 
Thương hiệu: Kachi
Model: MK247
Chức năng: khoan tường, khoan gỗ, khoan kim loại…
Pin: 24V Lithium-ION
Mô men xoắn cực đại: 40 N
Tốc độ không tải thấp/cao: 0-400/0-1450 vòng/phút
Kích thước hộp nhựa: 28.7 x 8.4 x 25.1cm
Khối lượng: 2.3kg
Xuất xứ thương hiệu: Việt Nam
Sản xuất tại: Trung Quốc
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (40, N'Máy Khoan Vặn Vít Dùng Pin Bosch GSR 120-LI (1 Pin, 1 Sạc)', N'1.665.000 ₫', N'image/aa6c01dcd81d705c3a56b442afd1a19b.png', N'Máy Khoan Vặn Vít Dùng Pin Bosch GSR 120 GEN II là dòng sản phẩm khoan pin mới nhất của Bosch ra mắt trong năm 2019. Dòng sản phẩm cải tiến từ dòng khoan pin GSR 120Li. Vẫn sử dụng pin lion 12V xong Máy khoan pin Bosch GSR 120-LI GEN II cải tiến về tốc độ không tải, lực xoắn giúp bạn tối ưu hóa công việc khoan, bắt vít.



Ưu điểm của sản phẩm
Thân máy làm từ nhựa chất liệu cao cấp, cứng chắn, sản xuất theo tiêu chuẩn châu Âu đảm bảo độ bền. Máy có hai chế độ: khoan và bắt vít với 20 cấp trượt.
Máy khoan vặn vít GSR 120 GEN II có thể điều chỉnh tốc độ không tải ở 2 mức:
Máy có chế độ dừng thông minh: Tự động dừng máy trong trường hợp vít đã vặn hết vào vật liệu, ngay cả khi vẫn giữ nút khởi động giúp bảo vệ vật liệu không bị vặn vít quá đà.
Thông số kỹ thuật
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (41, N'Bút đo độ PH của nước', N'95.300 ₫', N'image/d85d42d8faf84ac7ac6683640b94693e.jpg', N'PH là một chỉ số xác định tính chất hoá học của nước. Thang pH chỉ từ 0-14; Về lý thuyết, nước có pH = 7 là trung tính. Khi pH > 7, nước lại mang tính kiềm. Thang tính pH là một hàm số Logarrit. Ví dụ pH = 5 có tính a xit cao gấp 10 lần pH = 6, gấp 100 lần so với pH = 7. Theo tiêu chuẩn, pH của nước sử dụng cho sinh hoạt là 6,0 – 8,5 và của nước ăn uống uống là 6,5 – 8,5.
Bút đo pH dụng cụ hỗ trợ xác định (độ chua hoặc độ kiềm) trong nước - dung dịch. Các phép đo này rất quan trọng đối với nhiều ứng dụng trong nuôi trồng thủy sản,sinh vật cảnh, hồ bơi, nông nghiệp, y học, sinh học, hóa học, khoa học thực phẩm, khoa học môi trường, hải dương học, dinh dưỡng, xử lý nước và lọc nước các lĩnh vực khác. Bút đo độ PH-04 này được sử dụng rộng rãi trong sản xuất đo lường ph trong nuôi trồng thủy sản, quản lý bể bơi hồ chứa, canh tác nông nghiệp, sản xuất công nghiệp, phòng thí nghiệm, cơ sở kiểm soát chất lượng và giáo dục.
1 x máy Đo độ ph
2 x Bột dung dịch hiệu chuẩn  (pH 4.00 và 6.86 pH)
1 x Hướng dẫn sử dụng
1 x Vít hiệu chuẩn


 
Thực hiện theo các hướng dẫn trên các gói hiệu chuẩn 4.01 hoặc 6.86 đi kèm, nhúng bút đo pH vào dung dịch hiệu chuẩn và dùng tua vít để vặn về đúng chỉ sốt ghi trên gói dung dịch.

Nếu điện cực sử dụng trong thời gian dài và điện cực tiếp xúc với không khí, sau đó hiển thị các giá trị chậm và không ổn định là do điện cực khô. Chỉ cần nhúng điện cực vào nước trong vài giờ.
Khi giá trị hiển thị mờ hoặc không hiển thị, hãy nhanh chóng thay thế pin. Vặn nắp pin và thay pin. Chú ý đến tính phân cực của pin
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (42, N'Máy Phun Khử Khuẩn Nano K5 Pro Tia UV, Máy Xịt Khử Khuẩn Cầm Tay, Máy Diệt Khuẩn Nano Siêu Tiện Lợi', N'59.000 ₫', N'image/84fc9b40c17847ef850660ad05535cd1.png', N'Nhựa cao cấp

Để nơi khô mát

HƯỚNG DẨN SỬ DỤNG
- Rót dung dịch cồn y tế vào bình chứa
- Xoay bình chứa để treo bình vào thân súng
- Bật công tắc khởi động
- Điều chỉnh tốc độ phun


Máy Phun Khử Khuẩn Nano K5 Pro Tia UV, Máy Xịt Khử Khuẩn Cầm Tay, Máy Diệt Khuẩn Nano Siêu Tiện Lợi

 
️1. THÔNG TIN CHUNG
- Hàng có sẳn
- Hàng được bao bọc kỹ, đảm bảo khi vận chuyển
- Chất liệu cao cấp
- Sản phẩm rất nhẹ, bền, tiện lợi.
----------------------------------------------------
️2. THÔNG TIN SẢN PHẨM
Tên sản phẩm: Máy tiệt trùng phun tia UV khử khuẩn
Model sản phẩm: K5 Pro
Phạm vi: 200-300cm
Công suất định mức: 10W
Dung lượng pin  : 2000mah
Thời gian sạc: 2-4 giờ
Cổng sạc; USB
Thời gian sử dụng: 3-8giờ
Dung tích bình nước: 360ml
----------------------------------------------------
️3. SẢN PHẨM ĐƯỢC DÙNG KHI
- Khử khuẩn khi nhận hàng, vật liệu thông dụng
- Khử khuẩn tay cầm cửa
- Khử khuẩn thang máy
- Khử khuẩn nội thất xe hơi
- Khử khuẩn tay, chân khi hoạt động nơi công cộng
- Khử khuẩn vật dụng trong gia đình, công ty
----------------------------------------------------
️4. CAM KẾT CỦA SHOP
- Sản phẩm y ảnh 100.
- Đóng gói cẩn thận, bảo vệ sản phẩm nguyên vẹn trong quá trình vận chuyển
- Giao hàng nhanh chóng.
- Đươc đổi trả 1 đổi 1 hoàn toàn miễn phí nếu sản phẩm khi nhận hàng bị vỡ - hỏng – không giống hình ảnh.
- Hỗ trợ giải quyết đơn hàng trong thời gian sớm nhất với phương án tốt nhất để khách hàng luôn cảm thấy hài lòng và yên tâm khi mua sắm
️_️_️ XIN CHÂN THÀNH CẢM ƠN VÌ BẠN ĐÃ LỰA CHỌN CHÚNG TÔI ️_️_️
 


THÔNG TIN SẢN PHẨM
Tên sản phẩm: Máy tiệt trùng phun tia UV khử khuẩn
Model sản phẩm: K5 Pro
Phạm vi: 200-300cm
Công suất định mức: 10W
Dung lượng pin  : 2000mah
Thời gian sạc: 2-4 giờ
Cổng sạc; USB
Thời gian sử dụng: 3-8giờ
Dung tích bình nước: 360ml

Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (43, N'Keo dán siêu dính X2000 (50g) dán gỗ, sắt, sứ, kim loại đa năng', N'23.999 ₫', N'image/b98d2798a6ed7a4b6dfca64bc458e640.jpg', N'1.Tính năng ưu việtKeo X2000 là loại keo dán sắt – keo dán kim loại chuyên dụng với thành phần chính là a-xyannoacrylic axit. Đây là một thành phần đơn, có độ nhớt thấp và trong suốt. Với khả năng gắn kết tuyệt vời, X200 có thể gắn kết các bề mặt kim loại hay sắt của các chất liệu khác nhau. Biên độ chịu nhiệt rộng từ – 50 °C đến 80 °C. Khả năng chống chịu ngoại lực cao. Không thấm nước và chống hóa chất. Miễn nhiễm với các loại dung môi, axit và kiềm. Keo dán sắt tạo thành gắn kết chắc chắn giữa các bề mặt sắt, kim loại.
Trên thị trường hiện nay có nhiều loại keo dán sắt hay keo dán kim loại. Tuy nhiên, chỉ có những loại chất lượng mới có thể khiến các bề mặt kim loại liền nhau hoàn toàn. Keo X2000 có dạng loãng nên rất dễ sử dụng. Keo không bị đông cứng ở nhiệt độ thường (dưới 28°C) nên thời huạn sử dụng rất lâu.

 
2. Lưu ý khi sử dụngLưu ý đầu tiên là vệ sinh sạch sẽ bề mặt dán. Hãy làm sạch và làm khô bề mặt để gắn kết. Việc vệ sinh này cũng giúp bạn có thể sử dụng keo dán sắt – keo dán kim loại tiết kiệm và hiệu quả hơn.
Lưu ý thứ hai là hãy sử dụng một lượng nhỏ vừa đủ cho một bề mặt thôi. Hãy sử dụng tiết kiệm để có hiệu quả tốt nhất nhé !
Lưu ý thứ ba là tránh tiếp xúc với da. Nếu dính vào da, hãy ngâm nước ấm hoặc xà phòng, không dùng khan giấy.
Lưu ý thứ tư là nên dùng nơi thoáng khí.
Keo dán sắt – Keo dán kim loại

 
3. Ứng dụngKeo dán sắt – Keo dán kim loại X2000 có nhiều công dụng khác. Nó có khả năng gắn dính hầu như tất cả mọi loại vật liệu như :
Nhôm với sắtSắt với gỗSắt với nhựaNhựa với gỗGỗ với gỗBê tôngNgoài ra, nó có thể dán trám các vết nứt hay lấp kin các rò rỉ, rổ bề mặt chỉ bằng một vài giọt keo. Khả năng chống chịu cao. Vết rạn nứt được keo X2000 nối liền có thời hạn lâu dài vĩnh viễn cho các máy móc, đồ gia dụng, dụng cụ cầm tay và các động cơ. Keo dán sắt được sứng dụng nhiều trong sửa chữa ở các công trình dân dụng hay nhà công nghiệp. Vì vậy, nó được phân phối rộng rãi ở các cửa hàng đại lý khác nhau.
 





Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (44, N'Bộ tua vít đa năng sửa chữa điện thoại 25 in 1 vít từ tính chất liệu cao cấp S2', N'64.900 ₫', N'image/5581a2e95de7b05ed340316f2a4cf9a8.PNG', N'Chất liệu: thép nhậu khẩu HRC 60, hộp kim nhôm
Nặng: 300g
Kích thước: 168 x 67 x 17 mm.
Đầu vít: 24 đầu, gồm có 4 lớp.
Màu sắc: xám.

Hôm nay mình xin giới thiệu đến các bạn một bộ phụ kiện sửa chữa điện thoại, kính mắt đa năng bỏ túi.Nếu sỡ hữu cho mình bộ vít chắc chắn sẽ giúp ích cho công việc của bạn rất nhiều vì tính đa năng của nó, bạn có thể sử dụng nó đẻ tháo lắp đồng hồ, máy ảnh, laptop, điện thoại, mắt kính, đồ gia dụng…
Đối với dân kỹ thuật hay sữa chửa mà nói thị bộ vít chính là một phụ kiện vô cùng quan trọng, nó sẽ giúp họ rất nhiều trong công việc hàng ngày, thế nhưng chắc chắn sẽ có nhiều bạn đang sở hữu nhiều bộ vít có kích thước quá lớn hay các đầu vít không đạt tiêu chuẩn rất dễ bị mài mòn sau một quá trình sử dụng. Nhưng đối với sản phẩm này thì bạn hoàn toàn yên tâm.
 

Nhìn sơ qua về mặt thiết kế, có thể nói đến hộp đựng vít, được làm từ hợp kim nhôm aluminum,, 2 cạnh được bo tròn tạo cảm giác cho sản phẩm mềm mại hơn rất nhiều không thô cứng như các sản phẩm khác, với kích thước chỉ khoảng 168 x 67 x 17mm, nặng chỉ 300g,vừa nhỏ gọn vừa sang trọng, bề mặt chống thấm mồ hôi và chịu va đập tốt nên bạn có thể dễ dàng mang theo bên người.
Có tất cả là 24 đầu vít, được chia thành 4 tầng sắp gọn gàng trên hộp, ứng mỗi vị trí trên đầu vít thì trên thân hộp đều được in một hình vẽ tương ứng để bạn có thể dễ dàng lựa chọn, không những thế trên thân từng đầu vít đều được in những thông số như: U2.6, H2.0, PH2… con số ứng với từng đầu vít nhất định, cầu đầu vít đều được tích hợp nam chấm để dễ dàng hơn khi bạn bắt những con ốc.

 
Chất liệu để làm nên những đầu vít này là thép HRC 60 rất chắc chắn và cứng cáp chịu được lực khá tốt, nên sẽ ít có hiện tượng bị mài mòn hay bị chai sau một thời gian dài sử dụng. Phần thân cây viết cũng được làm từ chất liệu giống như đầu vít, dài khoảng 13cm, khá vừa tay người cầm rất cho cảm giác rất chắc chắn và thoải mái.
Sỡ hữu cho mình bộ vít này chắc chắn sẽ giúp ích cho công việc của bạn rất nhiều vì tính đa năng của nó, bạn có thể sử dụng nó đẻ tháo lắp đồng hồ, máy ảnh, laptop, điện thoại, mắt kính, đồ gia dụng…
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (45, N'Keo Dán Giày, Dây Nịt Đa Năng Selleys Kwik Grip (50ml)', N'33.000 ₫', N'image/d1bde64b3a4ac8a23805c26ed6cac4c4.jpg', N'Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (46, N'Khung máy cắt gắn máy mài cầm tay tiện lợi an toàn cứng cáp chuyên dụng cho ae chế đồ DIY chuyên nghiệp', N'325.000 ₫', N'image/28373a57f501cd0bde844ee1fed68a17.jpg', N'ĐẾ MÁY CẮT BÀN DÙNG CHO CÁC LOẠI MÁY CẮT MÀI CẦM TAY•Thích hợp cho máy mài với kích thước đĩa từ Ø 100 mm đến Ø 150 mm.- Với sự hỗ trợ của đế máy cắt bàn này, các đường cắt thép cắt, kim loại, ống,… vv trở nên đẹp hơn- Đối với việc sử dụng chung cho hầu hết các máy mài cắt góc cầm tay trên thị trường.• Thông số kỹ thuật:- Được đúc bằng hợp Kim chịu lực- Có lò xo đẩy mạnh mẽ- Có thiết bị kẹp điều chỉnh- Hỗ trợ dùng cho tất cả các loại máy mài, máy cắt góc cầm tay trên thị trường- Có bảo vệ chống tia lửa- Kích thước đế máy:200 × 240 mm- Dùng được cho các loại máy cắt góc có kích thước đá dưới 125mmBộ khung gắn máy mài máy cắt cầm tay sẽ biến máy cắt,máy mài cầm tay thành máy cắt, mày bàn để cắt sắt và cắt gỗ, máy mài bàn chắc chắn, chính xác , an toàn.Cắt góc tùy chỉnh Mang đi làm rất tiện Lắp được máy mài góc cỡ lưỡi 100, 110, 125 , 150 với nhiều loại lưỡi cắt, lưỡi mài sắt, gạch, gỗ tùy chếGiá rẻ hơn nhiều so với việc phải mua thêm cả 1 cái máy cắt bàn cồng kềnh






Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (47, N'Súng bắn keo nến silicon + Tặng 10 cây keo silicon nến', N'60.000 ₫', N'image/205ef2f03033f133def83403d2fb7354.png', N'Súng bắn keo nến silicon + Tặng 10 cây keo silicon nếnKích thước nhỏ gọnThen súng làm bằng nhựa cứng chắc chắnCông suất 20W giúp làm nóng keo nhanhCó công tắc bật tắtTặng 10 cây keoSúng bắn keo sử dụng để cố định những chi tiết trên các sản phẩm handmade.Sản phẩm có kích thước nhỏ gọn, dễ dàng mang theo và sử dụng trong nhiều không gian, vật dụng.
  
 

Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (48, N'Bộ dụng cụ di chuyển đồ vật nặng trong nhà thông minh KIOTOOL tải trọng 600kg chuyên dụng di chuyển don nhà - Màu ngầu nhiên', N'285.000 ₫', N'image/04882ddcfbdd34fcd2fbb0a4e9c321a3.jpg', N'Dụng cụ di chuyển đồ vật nặng trong nhà thông minh KIOTOOL tải trọng 600kg chuyên dụng di chuyển don nhà - Màu ngầu nhiên
Tải trọng 600kg di chuyển tủ giường ngay cả két sắt một cách dễ dành dù chỉ cần 1 ngườiVới thiết kế 3 bánh xoay linh động mỗi chânDễ dàng di chuyển đồ vật cồng kềnh, nặng mà không khó khăn hay mất nhiều sứcThiết kế thông minh, đơn giản và dễ sử dụngChế tạo từ hợp kim thép và nhựa ABS cao cấp, chịu lực tốtGiảm thời gian và tăng năng suất lao động hiệu quảChỉ cần 1 người cũng có thể chuyển đồ nặng
 









 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (49, N'Miếng xốp bọc chân cửa chắn gió chống bụi, ngăn tiếng ồn, ngăn côn trùng 93 x 9.6cm', N'24.993 ₫', N'image/8a227df4f70d8bff25f5daf72a2c2ca6.png', N'Xốp EVA
 
Điểm nổi bật:
- Miếng xốp bọc chân cửa là sản phẩm tiện ích cho gia đình giúp làm kín các khe hở giữa các cánh cửa, dưới chân cửa mà không gây tổn hại đến cửa hoặc sàn nhà, ngăn chặn bụi từ bên ngoài len qua các chân cửa.
- Chất liệu xốp EVA có độ đàn hồi và độ dẻo cao, chịu sự va đập mà không bị biến dạng, đảm bảo thời gian sử dụng lâu bền.
- Sản phẩm bọc và bịt kín khe hở của cửa phòng, ngăn chặn côn trùng và bụi bẩn xâm nhập, đồng thời hạn chế thoát gió mát của phòng điều hoà và chắn gió lạnh vào mùa đông.
- Dễ dàng cắt chỉnh và lắp đặt không cần băng keo hay miếng dán, sản phẩm còn giúp hạn chế sự va đập của cửa và tường nhà, ngăn tiếng ồn khi mở và đóng cửa vô cùng tiện lợi.
 
Thông tin sản phẩm:
- Tên sản phẩm: Miếng xốp bọc chân cửa chắn gió chống bụi, ngăn tiếng ồn, ngăn côn trùng
- Chất liệu: Xốp EVA
- Kích thước: 93 x 9.6cm
- Màu sắc: Xám
- Sử dụng cho: Khe cửa < 20mm.







Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (50, N'Máy Khoan Động Lực Bosch GSB 550 Set Và Bộ Dụng Cụ 100 Chi Tiết', N'1.359.000 ₫', N'image/8f80385390cfdbe1f26b951eb7b414ff4c.jpg', N'Máy Khoan Động Lực Bosch GSB 550 SET Và Bộ Dụng Cụ 100 Chi Tiết   được thiết kế với nhiều dụng cụ đi kèm nhằm hỗ trợ tối đa cho nhu cầu sử dụng của người tiêu dùng. Máy có công suất hoạt     động lớn cùng mũi khoan được làm từ chất liệu cao cấp giúp bề mặt được xử lý nhanh chóng cùng với màu xanh dương mang đến     cảm giác thoải mái và dịu nhẹ cho người sử dụng.
 Bộ sản phẩm gồm: 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (51, N'Dụng Cụ Lấy Dấu, Định Vị Điểm Khoan - Chống Trượt', N'28.999 ₫', N'image/0f2ef6a088a1d037f7232f5c4233725e.jpg', N'Dụng cụ đục lỗ, định vị điểm khoan là dụng cụ cầm tay giúp bạn dễ dàng đánh dấu trên các vật liệu sắt, gỗ, nhựa  với lực đẩy của lò xo cùng đầu mũi nhọn.
Thiết bị định vị được làm bằng ĐỒNG NGUYÊN CHẤT cùng lớp mạ màu vàng đẹp mắt, tránh việc gỉ cũng như đảm bảo độ bền của dụng cụ đục lỗ.
Việc sử dụng thiết bị đánh dấu điểm khoan là vô cùng đơn giản. Bạn chỉ cần xác định điểm cần đánh dấu. Sau đó, để đầu nhọn của thiết bị vào vị trí cần đánh dấu. 
Dùng tay ấn thiết bị định vị xuống và nhấc lên.
Kết quả: chúng ta có điểm đánh dấu mà không tốn nhiều sức.

Kích thước của dụng cụ đục lỗ
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (52, N'Khoan pin 21v Máy khoan bắt vít 21v', N'395.000 ₫', N'image/a90c117e7186a732539699e903bfc93b.jpg', N'UY TÍN- CHẤT LƯỢNG
CAM KẾT HỖ TRỢ ĐỔI TRẢ BẢO HÀNH TỐT NHẤT

KHOAN PIN HITACHI 21V ( Bộ sản phẩm gồm thân máy + 1 pin sạc và tặng 4 mũi khoan )

                                                           THÔNG SỐ KỸ THUẬT
- Điện thế pin: 21V - Loại Pin: Max Lithiium-ion 
- Lực siết/mở vít : Cứng (30Nm); Mềm (20Nm) 
- Dung lượng pin: 3 Ah 
- Kích thước sản phẩm: 25x 15x 8 cm 
- Trọng lượng cả hộp: 1.4 kg ( hộp carton ) 
- Tốc độ không tải: Cao (0 - 1.550 vòng/phút); Thấp (0 - 550 vòng/phút) 
- Sản xuất : Theo Dây chuyền JANPAN

PIN SIÊU TRÂU DÙNG ĐƯỢC 4 - 5 TIẾNG

BỘ SẢN PHẨM ĐẦY ĐỦ BAO GỒM THÂN MÁY, SẠC, PIN
VÀ TĂNG 2 MŨI BẮT VÍT

CÁC CHỨC NĂNG NỔI BẬT CỦA MÁY: CÓ ĐÈN LED  SIÊU SÁNG
25 CẤP ĐỘ SIẾT, CHỨC NĂNG ĐẢO CHIỀU, 2 TỐC ĐỘ

MÁY CÓ THỂ DỄ DÀNG XUYÊN QUA TƯỜNG, GỖ, SẮT
VÀ BẮT VÍT MỘT CÁCH NHANH GỌN

BẢO HÀNH 1 NĂM KHI MUA MÁY TẠI CỬA HÀNG
CÒN CHẦN CHỪ GÌ MÀ KHÔNG MUA NGAY CHIẾC
Khoan pin 21V VỀ SỬ DỤNG
SHOP CAM KẾT
Cam kết tất cả sản phẩm bên ngoài giống như trong ảnh 
Cam kết về chất lượng và dịch vụ bán hàng
Cung cấp các sản phẩm theo đúng tiêu chuẩn với chất lượng tốt nhất
Đáp ứng mọi yêu cầu của khách hàng trong thời gian ngắn nhất
Đảm bảo về số lượng và đúng chủng loại khách đặt
Tư vấn miễn phí 24/24 cho quý khách hàng về các sản phẩm của chúng tôi, bất cứ thắc mắc gì trước và sau khi mua sản phẩm
CHÚC QUÝ KHÁCH THAM QUAN VÀ MUA SẮM VUI VẺ!!
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (53, N'Đồng Hồ Đo Điện Vạn Năng Ampe Kìm + Bút Thử Điện Cảm Ứng Đa Chức Năng CTFAST An Toàn Tiện Dụng', N'155.000 ₫', N'image/161434b2764fc67dd748af07d107574d.jpg', N'Nhựa ABS cách điện
Bảo quản nơi thoáng mát
Đọc kỹ hướng dẫn sử dụng .
Do dòng tải AC, đo Diode và thông mạch, đo điện áp DC, đo điện áp AC, đo điện trở
Đồng Hồ Đo Điện Vạn Năng Ampe Kìm + Bút Thử Điện Cảm Ứng Đa Chức Năng CTFAST An Toàn Tiện Dụng :  Là Bộ Sản Phẩm Đo Điện Dân Dụng hoàn hảo trong tủ sửa dụng cụ điện của gia đình bạn .Cặp đôi sản phẩm là cánh tay đắc lực cho các bạn khi sửa chữa , thăm dò, đo lường các thiết bị điện trong nhà một cạch an toàn hiệu quả , nhanh chóng.

THÔNG TIN SẢN PHẨM :
1.Đồng Hồ Đo Điện Vạn Năng Ampe Kìm:

- Chức năng:



Hướng dẫn sử dụng:

2.Bút Thử Điện Cảm Ứng Đa Chức Năng CTFAST




 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (54, N'Bộ Tua Vít Bỏ Túi Đa Năng 24 Món - Tô Vít Sửa Chữa Mở Điện Thoại Vi Tính cao cấp', N'62.900 ₫', N'image/e8b80cf8757aa2373f563f6abad1a73f.jpg', N'Với Bộ tua vít đa năng  vấn đề của bạn sẽ được giải quyết. Sản phẩm có nhiều kiểu đầu vít khác nhau như: đầu dẹt, tam giác, lục giác, 3 cạnh, 4 cạnh, 5 cạnh và 6 cạnh, mỗi dạng đều có đủ các cỡ từ lớn đến nhỏ nên rất dễ dàng cho bạn trong việc sửa chữa đồ đạc.
Thiết kế gọn gàng giúp người dùng dễ dàng bỏ túi và mang theo bất cứ đâu. Bạn cũng có thể dễ dàng đóng mở


Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (55, N'Set 328 Ống Gen Co Nhiệt Cách Điện Bọc Dây Điện Xe Hơi, Xe Máy, Máy Tính Nhiều Kích Cỡ', N'30.999 ₫', N'image/552fcb3b7924ddec16d49e1da895c8e1.jpg', N'Qúy khách vui lòng xem kỹ mô tả và kích thước trước khi đặt hàng dùm Shop nhé!
Bọc ống cách điện cáp có thể cách điện cáp và dây điện chống lại nhiệt độ cực cao trong máy bay, tàu thuyền và xe quân đội.
Ống co nhiệt polyolefin cung cấp một rào cản giữa cáp và sựăn mòn.
Ống co nhiệt có thể cải thiện giao diện của cáp trong mod máy tính hoặc ô tô và xe máy tùy chỉnh.
Nó được sử dụng rộng rãi trong kết nối dây, bảo vệ và cách điện của dây nối, đầu dây, điện cảm và các thành phần điện tử.
Kích thước:
Đường kính: 1.0mm, 2.0mm, 3.0mm, 4.0mm, 6.0mm, 8.0mm, 10.0mm, 14.0mm.
120 ống :1,0 x 40mm (vàng+đen+đỏ+xanh lục)
60 ống:2.0 x 40mm (vàng+đen+đỏ+xanh dương) 
40 ống: 3.0 x 40mm (vàng+ đen+đỏ+xanh lục)
 32 ống: 4.0 x 40mm (vàng +đe+đỏ+xanh dương)
24 ống: 6.0 x 40mm (vàng+đen+đỏ+xanh lục)
 20 ống: 10 x 80mm (vàng+đen+đỏ+, xanh dương)
16 ống:12 x 80mm (vàng+đen+ đỏ+ xanh dương)
16 ống: 14,0 x 80mm (vàng+ đen+đỏ+ xanh)', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (56, N'Bộ dụng cụ sửa chữa đa năng 45 chi tiết Kachi MK166', N'464.000 ₫', N'image/2f2e22809bf79ec6d3a2324ca17a6b5d.jpg', N'thép không gỉ, nhựa
Có hộp nhựa đi kèm

Bộ dụng đa năng 45 chi tiết Kachi MK-166 dùng sửa chữa vật dụng trong nhà

Bộ dụng cụ đa năng Kachi 45 chi tiết được thiết kế hộp đựng bằng nhựa cứng chắc chắn, có phần quai cầm tiện lợi cho việc di chuyển trong lúc sử dụng. Với từng vị trí vừa khít với từng dụng cụ, người dùng có thể sắp xếp gọn gàng vật dụng khi không sử dụng, đảm bảo độ bền nâng cao cũng như giúp cho không gian nhà ở, nơi làm việc thêm gọn gàng.



Bộ dụng đa năng 45 chi tiết Kachi MK-166 bao gồm:
- 1 Tua vít đầu dẹp 5.8*100
- 1 Tua vít lớn đầu nhọn 5.8*100
- 1 Tua vít nhỏ đầu nhọn
- 1 Dao rọc
- 1 Bút thử điện
- 1 Băng keo điện
- 1 Tay cầm
- 9 Đầu vít 25mm
- 1 Đầu vít ADA
- 9 Đầu khẩu vặn ốc 1/4" 5/6/7/8/9/10/11/12/13
- 8 Lục giác 1.5/2/2.5/3/4/5/5.5/6
- 1 Cưa
- 1 Thước dây 3m
- 1 Kìm mỏ bằng 6”
- 1 Kìm mỏ nhọn 6”
- 1 Cờ lê
- 1 Búa
- 1 Hộp ốc vít 60 cái
- 1 Hộp đựng bằng nhựa




THÔNG SỐ KỸ THUẬT
Model: MK-166
Chất liệu: thép không gỉ, nhựa
Khối lượng: 2.7kg
Kích thước hộp: 35.7 x 27 x 7 cm
Xuất xứ thương hiệu: Việt Nam
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (57, N'Bộ dụng cụ sửa chữa đa năng 45 chi tiết Kachi MK166', N'464.000 ₫', N'image/2f2e22809bf79ec6d3a2324ca17a6b5d.jpg', N'thép không gỉ, nhựa
Có hộp nhựa đi kèm

Bộ dụng đa năng 45 chi tiết Kachi MK-166 dùng sửa chữa vật dụng trong nhà

Bộ dụng cụ đa năng Kachi 45 chi tiết được thiết kế hộp đựng bằng nhựa cứng chắc chắn, có phần quai cầm tiện lợi cho việc di chuyển trong lúc sử dụng. Với từng vị trí vừa khít với từng dụng cụ, người dùng có thể sắp xếp gọn gàng vật dụng khi không sử dụng, đảm bảo độ bền nâng cao cũng như giúp cho không gian nhà ở, nơi làm việc thêm gọn gàng.



Bộ dụng đa năng 45 chi tiết Kachi MK-166 bao gồm:
- 1 Tua vít đầu dẹp 5.8*100
- 1 Tua vít lớn đầu nhọn 5.8*100
- 1 Tua vít nhỏ đầu nhọn
- 1 Dao rọc
- 1 Bút thử điện
- 1 Băng keo điện
- 1 Tay cầm
- 9 Đầu vít 25mm
- 1 Đầu vít ADA
- 9 Đầu khẩu vặn ốc 1/4" 5/6/7/8/9/10/11/12/13
- 8 Lục giác 1.5/2/2.5/3/4/5/5.5/6
- 1 Cưa
- 1 Thước dây 3m
- 1 Kìm mỏ bằng 6”
- 1 Kìm mỏ nhọn 6”
- 1 Cờ lê
- 1 Búa
- 1 Hộp ốc vít 60 cái
- 1 Hộp đựng bằng nhựa




THÔNG SỐ KỸ THUẬT
Model: MK-166
Chất liệu: thép không gỉ, nhựa
Khối lượng: 2.7kg
Kích thước hộp: 35.7 x 27 x 7 cm
Xuất xứ thương hiệu: Việt Nam
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (58, N'Nhiệt ẩm kế điện tử phòng ngủ', N'162.990 ₫', N'image/08ed3eabbde11faa84eaff3f31985e21.jpg', N'Nhiệt Ẩm Kế Đo Nhiệt Độ phòng ngủ
Mua Nhiệt Ẩm Kế thì Dễ, nhưng mua máy đo có độ chính xác cao mới là khó ?
Thông số của máy:Màu sắc: TrắngCông dụng: Đo nhiệt độ.Chức năng hẹn giờ: khôngNăng lượng sử dụng: Pin Chất liệu: ABS, PSHiển thị: Nhiệt độ, Độ ẨmKích thước: 10x10x2 cm
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (59, N'Xe đẩy hàng 4 bánh SUMIKA T300 - Khung thép, tay cầm gấp mở tiện lợi, tải trọng 300kg', N'1.390.000 ₫', N'image/1a3c44c041edcc906cee23b5906af115.jpg', N'Xe đẩy hàng SUMIKA T300 di chuyển linh hoạt, dễ dàng.
- T300 là dòng xe đẩy hàng đa năng 1 tầng với kích thước tiêu chuẩn khi mở rộng là 69x90x89.5cm (Dài x Rộng x Cao), giúp bạn thao tác dễ dàng và nhanh hơn. Thiết kế nhỏ gọn, dễ dàng gập tay cầm xuống và cất dưới gầm bàn, gầm ghế hay cho dựa vào tường mà không sợ tốn diện tích. 
 

 
- Xe đẩy hàng SUMIKA T300 với khung xe được làm bằng thép siêu bền có độ bền cao, không bị biến dạng khi va đập mạnh và có thể chịu được tải trọng lên đến 300kg. 
 

 - Tay cầm của xe có độ cao phù hợp với người Việt Nam nên người dùng không phải cúi khom người khi đẩy (người cao 1m4 - 1m8 đều có thể dùng được), không gây đau lưng khi sử dụng lâu dài.
 


Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (60, N'Miếng xốp bọc chân cửa chắn gió chống bụi, ngăn tiếng ồn, ngăn côn trùng 93 x 9.6cm', N'24.993 ₫', N'image/8a227df4f70d8bff25f5daf72a2c2ca6.png', N'Xốp EVA
 
Điểm nổi bật:
- Miếng xốp bọc chân cửa là sản phẩm tiện ích cho gia đình giúp làm kín các khe hở giữa các cánh cửa, dưới chân cửa mà không gây tổn hại đến cửa hoặc sàn nhà, ngăn chặn bụi từ bên ngoài len qua các chân cửa.
- Chất liệu xốp EVA có độ đàn hồi và độ dẻo cao, chịu sự va đập mà không bị biến dạng, đảm bảo thời gian sử dụng lâu bền.
- Sản phẩm bọc và bịt kín khe hở của cửa phòng, ngăn chặn côn trùng và bụi bẩn xâm nhập, đồng thời hạn chế thoát gió mát của phòng điều hoà và chắn gió lạnh vào mùa đông.
- Dễ dàng cắt chỉnh và lắp đặt không cần băng keo hay miếng dán, sản phẩm còn giúp hạn chế sự va đập của cửa và tường nhà, ngăn tiếng ồn khi mở và đóng cửa vô cùng tiện lợi.
 
Thông tin sản phẩm:
- Tên sản phẩm: Miếng xốp bọc chân cửa chắn gió chống bụi, ngăn tiếng ồn, ngăn côn trùng
- Chất liệu: Xốp EVA
- Kích thước: 93 x 9.6cm
- Màu sắc: Xám
- Sử dụng cho: Khe cửa < 20mm.







Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (61, N'Khung máy cắt gắn máy mài cầm tay tiện lợi an toàn cứng cáp chuyên dụng cho ae chế đồ DIY chuyên nghiệp', N'325.000 ₫', N'image/28373a57f501cd0bde844ee1fed68a17.jpg', N'ĐẾ MÁY CẮT BÀN DÙNG CHO CÁC LOẠI MÁY CẮT MÀI CẦM TAY•Thích hợp cho máy mài với kích thước đĩa từ Ø 100 mm đến Ø 150 mm.- Với sự hỗ trợ của đế máy cắt bàn này, các đường cắt thép cắt, kim loại, ống,… vv trở nên đẹp hơn- Đối với việc sử dụng chung cho hầu hết các máy mài cắt góc cầm tay trên thị trường.• Thông số kỹ thuật:- Được đúc bằng hợp Kim chịu lực- Có lò xo đẩy mạnh mẽ- Có thiết bị kẹp điều chỉnh- Hỗ trợ dùng cho tất cả các loại máy mài, máy cắt góc cầm tay trên thị trường- Có bảo vệ chống tia lửa- Kích thước đế máy:200 × 240 mm- Dùng được cho các loại máy cắt góc có kích thước đá dưới 125mmBộ khung gắn máy mài máy cắt cầm tay sẽ biến máy cắt,máy mài cầm tay thành máy cắt, mày bàn để cắt sắt và cắt gỗ, máy mài bàn chắc chắn, chính xác , an toàn.Cắt góc tùy chỉnh Mang đi làm rất tiện Lắp được máy mài góc cỡ lưỡi 100, 110, 125 , 150 với nhiều loại lưỡi cắt, lưỡi mài sắt, gạch, gỗ tùy chếGiá rẻ hơn nhiều so với việc phải mua thêm cả 1 cái máy cắt bàn cồng kềnh






Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (62, N'Bộ Tua Vít Bỏ Túi Đa Năng 24 Món - Tô Vít Sửa Chữa Mở Điện Thoại Vi Tính cao cấp', N'62.900 ₫', N'image/e8b80cf8757aa2373f563f6abad1a73f.jpg', N'Với Bộ tua vít đa năng  vấn đề của bạn sẽ được giải quyết. Sản phẩm có nhiều kiểu đầu vít khác nhau như: đầu dẹt, tam giác, lục giác, 3 cạnh, 4 cạnh, 5 cạnh và 6 cạnh, mỗi dạng đều có đủ các cỡ từ lớn đến nhỏ nên rất dễ dàng cho bạn trong việc sửa chữa đồ đạc.
Thiết kế gọn gàng giúp người dùng dễ dàng bỏ túi và mang theo bất cứ đâu. Bạn cũng có thể dễ dàng đóng mở


Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (63, N'Keo Dán Giày, Dây Nịt Đa Năng Selleys Kwik Grip (50ml)', N'33.000 ₫', N'image/d1bde64b3a4ac8a23805c26ed6cac4c4.jpg', N'Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (64, N'Ê tô kẹp bàn mini', N'32.000 ₫', N'image/84f9bdaec22ee433d5e7ec2a9dba71ab.jpg', N'Khi bạn sửa chữa những đồ vật nhỏ mà cần cố định nó để thao tác trở lên dễ dàng thì chiếc ê tô kẹp bàn mini này chính là một trợ thủ đắc lực không thể thiếu. Đặc biệt cho những bạn nào đam mê sửa chữa mà bị mất một cánh tay hoặc 1 tay bị đau...
Kích thước tổng thể: 93*83mm
Độ mở kẹp bàn tối đa: 35mm
Độ mở tối đa của ê tô: 30mm    
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (65, N'Keo Dán Siêu Dính Đa Năng Mọi Chất Liệu Cực Mạnh - Dán Gỗ Thuỷ Tinh Kim Loại Sắt Gốm Sứ Nhựa Vải TBM1', N'35.000 ₫', N'image/d0808ee755689be431552171524487fd.jpg', N'------------  HƯỚNG DẪN SỬ DỤNG -------------  Làm sạch bề mặt muốn kết dính  Mở nắp và bôi keo lên bề mặt  Gắn kết bề mặt muốn dính và chờ trong tối thiểu 30s để phát huy tác dụng
️️LƯU Ý: - Bề mặt muốn kết dính cần được làm sạch hoàn toàn, không chứa bụi bẩn hay dung dịch khác - Có thể đeo găng tay cao su khi sử dụng keo dán. - Vì thành phần hoá học đặc biệt, dung dịch keo cần có khoảng không khí để thở nên chỉ có thể đổ đầy 75% lọ. - Tránh xa tầm tay trẻ em - Không để dung dịch dính vào mắt, da.
KEO DÁN ĐA NĂNG THẾ HỆ MỚI - BÁM DÍNH MẠNH MẼ HƠN 80 LẦN KEO 502 -
LOẠI TỐT NHẤT THỊ TRƯỜNG KHÔ NHANH CẤP TỐC SAU 30 GIÂY CHỐNG THẤM NƯỚC VÀ VA ĐẬP 
> ------------ TÍNH NĂNG NỔI BẬT -------------
Khác biệt với các loại keo truyền thống, KEO DÁN ĐA NĂNG THẾ HỆ MỚI được nâng cấp các tính năng để đáp ứng mọi nhu cầu sử dụng của bạn:
Bám dính mạnh mẽ hơn 80 lần so với keo 502 truyền thống. T ối ưu thời gian dính chỉ sau 30 giây, tiết kiệm thời gian sửa chữa. Gắn kết đa dạng chất liệu: gốm sứ, kim loại, nhựa, dép xốp, đồ ghỗ, gương, trang sức, đồ thủ công,linh kiện điện tử Không gây ố bẩn vết dính. Tạo nên sự gắn kết trong suốt hoàn hảo. Mùi nhẹ dịu, không gây khó chịu khi sử dụng, an toàn và thân thiện môi trường.
------------ THÔNG TIN SẢN PHẨM -------------Kích thước: 122 x 38 mmDung tích: 30 mlPhân loại: dung dịchMùi hương: ít mùi Hạn sử dụng: 18 thángThời gian phát huy công hiệu: sau 30 giây Bảo quản: tránh ánh nắng trực tiếp, đậy nắp sau khi sử dụng






Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (67, N'Túi vệ sinh máy lạnh TD01, Áo vệ sinh máy lạnh tại nhà', N'120.000 ₫', N'image/2842fb5deedb2b945dba0fa8974580a5.jpg', N'Vải dù tổ ong chống thấm
CÁCH SỬ DỤNG:
 
      Áo vệ sinh máy lạnh TD01 là mẫu thiết kế cải tiến nhất của nhà sản xuất Thuận Dung được thiết kế và sản xuất kể từ năm 2013, chuyên dùng cho thợ điện lạnh với độ bền cao, tiện lợi nhất với miệng áo có thun co dãn, và thiết kế luồn dây treo xung quanh máy lạnh.
     Trên thị trường hiện có rất nhiều Shop bán áo vệ sinh có nguồn gốc khác nhau, cần phân biệt sản phẩm bán bởi Thuận Dung và các sản phẩm khác như sau:

- Có tem sản phẩm từ nhà sản xuất Thuận Dung với mã sản phẩm là TD01, những sản phẩm không có tem này đều là hàng nhái không được sản xuất bởi Thuận Dung.
- Chất liệu: Vải dù tổ ong chống thấm, độ bền cao.
- Màu: Xanh đen (có màu xanh rêu nhưng chưa bán trên TIKI)
- Chiều rộng miệng túi: 1.8 mét, sử dụng đa năng cho tất cả các dòng máy lạnh dân dụng từ 1HP đến 3HP
- Ống xả : 2.5m tính từ phần đuôi áo, rất dài để tiện cho việc xả nước ở mọi độ cao gắn máy lạnh thông dụng.
- Trọng lượng: 600gr nhẹ hơn các loại vải khác giúp thao tác thuận tiện, không chì nặng vào máy khi xịt nước, không thấm vào vải, và cực kỳ mau khô sau khi sử dụng và giặt rữa giúp đảm bảo độ bền sử dụng lâu dài. 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (68, N'Bộ Bặn Vít Đa Năng Bosch 46 món - Giao màu ngẫu nhiên', N'448.000 ₫', N'image/5cd7bdacd92295496f87caba6c4b9900.jpg', N'Thông tin sản phẩm
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (69, N'Nhiệt ẩm kế Bamboo Life Nhiệt kế điện tử đo nhiệt độ phòng Ẩm kế điện tử đo độ ẩm phòng ngủ thông minh có đèn nhỏ gọn chính xác hàng chính hãng', N'189.000 ₫', N'image/e4cba1d459d2270b26fac6e0f8e9e3e2.jpg', N'Nhiệt ẩm kế Bamboo Life Nhiệt kế điện tử đo nhiệt độ phòng Ẩm kế điện tử đo độ ẩm phòng ngủ thông minh có đèn nhỏ gọn chính xác hàng chính hãng

Nhiệt độ và độ ẩm là 2 yếu tố ảnh hưởng rất lớn để giấc ngủ của bé. Nhiệt độ trên điều hòa sẽ không phản ánh được chính xác nhiệt độ trong phòng vì còn phụ thuộc vào nhiều yếu tố: nhiêt độ bên ngoài, diện tích phòng, vị trí bé nằm. Vì vậy cần có nhiệt ẩm kế để biết chính xác nhiệt độ trong phòng của bé.


Nhiệt ẩm kế có đèn sáng trong 7giây đến 10 giây giúp có thể xem được nhiệt độ trong đêm. 



 
️ Chức năng:
Đo nhiệt độ
Đo độ ẩm
Đồng hồ
️ Thông số kỹ thuật:
Màu sắc: Trắng.
Nhiệt độ đo trong khoảng -50 độ C - 70 độ C, sai số +- 1 độ C.
Kích thước 85*70 mm , kích thước màn: 40*60 mm
Đơn vị hiển thị 0.1 độ C.
Độ ẩm đo trong khoảng 10%RH - 90%RH, sai số +-5%RH
Đơn vị hiển thị 1%.
Sử dụng pin AAA (2 viên). Tặng kèm 2 pin khi mua máy
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (70, N'Thước kẹp điện tử 150mm thép hợp kim không rỉ màn hình LCD', N'319.999 ₫', N'image/82c99f5c210d8cd89c4bf7e403361a14.jpg', N'- Màn hình LCD lớn sắc nét (42mmx17mm) cho khả năng dễ đọc, có khả năng tự tắt khi không dùng tới, tiết kiệm pin.
- Hiển thị cỡ 0.01mm rất chính xác, dễ đọc kết quả.
THÔNG SỐ KỸ THUẬT CỦA SẢN PHẨM
- Vật liệu: Thép không gỉ.
- Dải đo: 0 - 150mm.
- Độ chia nhỏ nhất: ± 0,01mm
- Dung sai chính xác: ± 0.02mm
- Hệ thống đo lường: Hệ thống đo điện dung tuyến tính.
- Pin: một 1.5 V LR44 (Tặng kèm 2 pin dự phòng).
- Hộp đựng bằng nhựa cứng, đi kèm 2 pin LR44, 1 tô vít nhỏ 4 cạnh để tháo lắp pin
Dụng cụ cầm tay Trường Thành chuyên cung cấp sỉ, lẻ các mặt hàng đồ cơ khí cầm tay, bộ dụng cụ đo lường, cờ lê, tua vít, thước kẹp điện tử, máy khoan cầm tay, máy mài cầm 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (71, N'Máy Khoan Động Lực Bosch GSB 550 Set Và Bộ Dụng Cụ 100 Chi Tiết', N'1.359.000 ₫', N'image/8f80385390cfdbe1f26b951eb7b414ff4c.jpg', N'Máy Khoan Động Lực Bosch GSB 550 SET Và Bộ Dụng Cụ 100 Chi Tiết   được thiết kế với nhiều dụng cụ đi kèm nhằm hỗ trợ tối đa cho nhu cầu sử dụng của người tiêu dùng. Máy có công suất hoạt     động lớn cùng mũi khoan được làm từ chất liệu cao cấp giúp bề mặt được xử lý nhanh chóng cùng với màu xanh dương mang đến     cảm giác thoải mái và dịu nhẹ cho người sử dụng.
 Bộ sản phẩm gồm: 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (72, N'Thang nhôm rút gọn SUMIKA SK320 - Chiều cao tối đa 3.2m, chiều dài rút gọn 0.78m, hợp kim nhôm cao cấp, khóa chốt chắc chắn, đế cao su chống trượt, nhỏ gọn, di chuyển tiện lợi', N'1.180.000 ₫', N'image/393ea3255d13079d1942a23fd35ff5fc.jpg', N'- Đặc điểm nổi bật và chức năng ưu Việt của chiếc thang rút nhôm này là gì? Liệu thang nhôm có đảm bảo an toàn kĩ thuật khi sử dụng? Liệu thang nhôm có chắc chắn và bền bỉ hơn các dòng thang gỗ, tre hay tất cả các vật liệu khác? Thang rút nhôm có dễ sử dụng không? Dưới đây là một số thông tin về thang nhôm Sumika SK320 giúp khách hàng hiểu hơn trước khi lựa chọn cho mình một chiếc thang nhôm phù hợp có thể sử dụng được trong cuộc sống và công việc.

 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (73, N'Thang ghế 3 bậc kết hợp xe đẩy hàng Kachi MK183', N'820.000 ₫', N'image/6cbf20d0e9a173481017f70b291aec31.jpg', N'Khung thép, bậc nhôm

Thùng carton 48× 7.5 ×118cm

Thang nhôm đa năng kết hợp xe đẩu hàng Kachi MK-183 được tích hợp 2 trong 1 sản phẩm. Thang được thiết kế giống với các sản phẩm thang nhôm ghế thông thường với phần tay cầm và mặt bậc rộng rãi. 


 
Thang nhôm kết hợp xe đẩy hàng đa năng Kachi MK-183 là công cụ hỗ trợ tuyệt vời cho nhiều mục đích sử dụng với thiết kế thông minh đầy sáng tạo với sự kết hợp hoàn hảo của chiếc thang nhôm tiện dụng cho các công việc tầm cao và xe đẩy hỗ trợ vận chuyển hàng hóa. Đa chức năng cho nhiều mục đích sử dụng khác nhau giúp người dùng có thể thoải mái xử lý công việc và đạt được các kết quả cao nhất một cách dễ dàng.

 
Khung của Thang nhôm kết hợp xe đẩy hàng đa năng Kachi MK-183 làm từ chất liệu thép định hình, vừng chắc. Cùng các bậc thang nhôm nhám bám chắc chân.
Chiều cao sử dụng của thang nhôm kết hợp xe đẩy Kachi MK-183 là 74cm (chiều cao tính từ mặt đất lên đến mặt bậc trên cùng) bao gồm 3 bậc thang. Khi đứng trên bậc trên dùng tựa đầu gối vào phần tay cầm của thang sẽ tạo cảm giác chắc chắn cho người sử dụng. Đặc biệt an toàn đối với phụ nữ và người cao tuổi.

Mặt bậc được thiết kế dạng nhám giúp bạn yên tâm không sợ trượt chân khi đứng trên thang. Chân thang đằng trước có gắn hai bánh xe đây là bánh xe khi sử dụng với chức năng xe đẩy hàng.
Thang có thiết kế giá đỡ có thể gấp gọn linh hoạt cho việc đẩy hàng hóa, cùng bánh xe có thể gấp gọn tiện dụng, không chiếm diện tích.


 
Để sử dụng chức năng đẩy hàng: bạn chỉ cần gấp gọn bậc thang và kéo phần giá đỡ ra là có thể sử dụng được thành dạng xe đẩy. Phần tay cầm của thang cũng biến thành phần tay kéo cho xe đẩy hàng. Khi cần di chuyển hàng hóa bạn sẽ đặt hàng hóa lên mặt sàn và di chuyển như những chiếc xe đẩy hàng thông thường với tải trọng xe đẩy là 60kg. Phù hợp với mục đích sử dụng cho gia đình.
Tải trọng thang lên đến 120kg, làm việc trên sản phẩm thoải mái mà không lo xảy ra bất kỳ vấn đề nào đáng lo. Tải trọng xe đẩy đạt 60kg vận chuyển được nhiều hàng hóa hơn.
Bạn có thể gấp gọn thang lại sau khi sử dụng nhằm tiết kiệm không gian
THÔNG SỐ SẢN PHẨMModel: MK-183
Chất liệu chính: Khung thép, bậc nhôm
Chiều rộng mỗi bậc thang: 8cm
Khối lượng (N.w): 7.2kg
Khối lượng (G.w): 8.2kg
Kích thước sản phẩm: 67× 47.5 ×106.5cm
Kích thước đóng thùng: 48× 7.5 ×118cm
Xuất xứ thương hiệu: Việt Nam
Sản xuất tại: Trung Quốc
Hình ảnh thực tế: 


Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (74, N'Xe đẩy hàng 4 bánh SUMIKA T150 - Khung thép, tay cầm gấp mở tiện lợi, tải trọng 150kg', N'990.000 ₫', N'image/276569e0403e60e65b56c7df5c3d68f9.jpg', N'Xe đẩy hàng SUMIKA T150 di chuyển linh hoạt, dễ dàng.
- T150 là dòng xe đẩy hàng đa năng 1 tầng với kích thước tiêu chuẩn khi mở rộng là 47cmx73cmx86cm (Dài x Rộng x Cao), giúp bạn thao tác dễ dàng và nhanh hơn. Thiết kế nhỏ gọn, dễ dàng gập tay cầm xuống và cất dưới gầm bàn, gầm ghế hay cho dựa vào tường mà không sợ tốn diện tích. 
 

 
- Xe đẩy hàng SUMIKA T150 với khung xe được làm bằng thép siêu bền có độ bền cao, không bị biến dạng khi va đập mạnh và có thể chịu được tải trọng lên đến 150kg.
 

 - Tay cầm của xe có độ cao phù hợp với người Việt Nam nên người dùng không phải cúi khom người khi đẩy (người cao 1m4 - 1m8 đều có thể dùng được), không gây đau lưng khi sử dụng lâu dài.
 


Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (75, N'Máy vặn vít dùng pin Bosch go gen 2 Mới', N'971.000 ₫', N'image/29a3cc0f246fad6edb706aa688c601adb7.jpg', N'Bạn mất quá nhiều thời gian để chọn được loại vít phù hợp để vặn ốc của các thiết bị máy móc, kệ treo thường,… nhưng vẫn không thực sự hiệu quả và tốn thêm chi phí mua các loại vít với đầu vít khác nhau. Đã đến lúc phải sở hữu Máy vặn vít dùng pin Bosch go gen 2 với đầy đủ các dụng cụ đáp ứng đủ nhu cầu của bạn. 
 
THÔNG SỐ KỸ THUẬT
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (76, N'Súng bắn keo nến silicon + Tặng 10 cây keo silicon nến', N'60.000 ₫', N'image/205ef2f03033f133def83403d2fb7354.png', N'Súng bắn keo nến silicon + Tặng 10 cây keo silicon nếnKích thước nhỏ gọnThen súng làm bằng nhựa cứng chắc chắnCông suất 20W giúp làm nóng keo nhanhCó công tắc bật tắtTặng 10 cây keoSúng bắn keo sử dụng để cố định những chi tiết trên các sản phẩm handmade.Sản phẩm có kích thước nhỏ gọn, dễ dàng mang theo và sử dụng trong nhiều không gian, vật dụng.
  
 

Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (77, N'Bộ Dụng Cụ Sửa Chữa Đa Năng KIOTOOL 46 chi tiết - Bộ dụng cụ vặn bu long ốc vít sửa chữa xe máy', N'185.000 ₫', N'image/2b46fc92b97f4c77351aa26962474203.jpg', N'Bộ dụng cụ  KIOTOOL 46 chi tiết phù hợp với công việc sửa chữa trong gia đình
Chất liệu: thép không gỉ cao cấp, chắc chắn.
Mở ốc từ 4-14mm
Mở vít 2 cạnh, 4 cạnh, 6 cạnh các loại
Cờ lê đảo chiều, tay cầm tô vít, tay nối dài, dây nối dài giúp làm việc ở những góc hẹp
Hộp đựng sản phẩm bằng nhựa cứng gọn gàng, tiện dụng, tránh thất lạc phụ kiện
Kích thước hộp: 24*13*4cm.
Khối lượng: khoảng 1.5kg.
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (78, N'Mỏ hàn thiếc 220V 60W điều chỉnh nhiệt độ kèm phụ kiện - CK10', N'119.000 ₫', N'image/192d136b376198f08d975cb356394549.jpg', N'Kim loại, khác
Dây đồng phủ TPE
hộp
1




Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (79, N'Máy khoan bắn vít cầm tay  dùng nguồn điện trực tiếp', N'269.000 ₫', N'image/05c83c13f302a6e4b766d34825eec72c.jpg', N'Máy khoan bắn vít cầm tay dùng nguồn điện trực tiếp 
 
 

 

Máy thích hợp sử dụng cho nhiều công việc từ những việc gia đình như khoan tường treo tranh, giá sách, bắt tất kê, khoan gỗ,đến những công việc ngoài công trường hoặc xưởng chế tạo như khoan bê tông mỏng, khoan kim loại, làm nhôm kính…
 
 

 
Công suất: 880WKhả năng khoan thép/ gỗ: 10/ 20mmTốc độ không tải: 0-3.000v/pĐầu cặp: dùng mũi từ 0.8mm đến 10mmChức năng : Đảo chiềuNguồn điện : 220vBộ sản phẩm gồm : 1 máy khoan + 1 hộp giấy





 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (80, N'Bút đo độ PH của nước', N'95.300 ₫', N'image/d85d42d8faf84ac7ac6683640b94693e.jpg', N'PH là một chỉ số xác định tính chất hoá học của nước. Thang pH chỉ từ 0-14; Về lý thuyết, nước có pH = 7 là trung tính. Khi pH > 7, nước lại mang tính kiềm. Thang tính pH là một hàm số Logarrit. Ví dụ pH = 5 có tính a xit cao gấp 10 lần pH = 6, gấp 100 lần so với pH = 7. Theo tiêu chuẩn, pH của nước sử dụng cho sinh hoạt là 6,0 – 8,5 và của nước ăn uống uống là 6,5 – 8,5.
Bút đo pH dụng cụ hỗ trợ xác định (độ chua hoặc độ kiềm) trong nước - dung dịch. Các phép đo này rất quan trọng đối với nhiều ứng dụng trong nuôi trồng thủy sản,sinh vật cảnh, hồ bơi, nông nghiệp, y học, sinh học, hóa học, khoa học thực phẩm, khoa học môi trường, hải dương học, dinh dưỡng, xử lý nước và lọc nước các lĩnh vực khác. Bút đo độ PH-04 này được sử dụng rộng rãi trong sản xuất đo lường ph trong nuôi trồng thủy sản, quản lý bể bơi hồ chứa, canh tác nông nghiệp, sản xuất công nghiệp, phòng thí nghiệm, cơ sở kiểm soát chất lượng và giáo dục.
1 x máy Đo độ ph
2 x Bột dung dịch hiệu chuẩn  (pH 4.00 và 6.86 pH)
1 x Hướng dẫn sử dụng
1 x Vít hiệu chuẩn


 
Thực hiện theo các hướng dẫn trên các gói hiệu chuẩn 4.01 hoặc 6.86 đi kèm, nhúng bút đo pH vào dung dịch hiệu chuẩn và dùng tua vít để vặn về đúng chỉ sốt ghi trên gói dung dịch.

Nếu điện cực sử dụng trong thời gian dài và điện cực tiếp xúc với không khí, sau đó hiển thị các giá trị chậm và không ổn định là do điện cực khô. Chỉ cần nhúng điện cực vào nước trong vài giờ.
Khi giá trị hiển thị mờ hoặc không hiển thị, hãy nhanh chóng thay thế pin. Vặn nắp pin và thay pin. Chú ý đến tính phân cực của pin
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (81, N'Khung máy cắt gắn máy mài cầm tay tiện lợi an toàn cứng cáp chuyên dụng cho ae chế đồ DIY chuyên nghiệp', N'325.000 ₫', N'image/28373a57f501cd0bde844ee1fed68a17.jpg', N'ĐẾ MÁY CẮT BÀN DÙNG CHO CÁC LOẠI MÁY CẮT MÀI CẦM TAY•Thích hợp cho máy mài với kích thước đĩa từ Ø 100 mm đến Ø 150 mm.- Với sự hỗ trợ của đế máy cắt bàn này, các đường cắt thép cắt, kim loại, ống,… vv trở nên đẹp hơn- Đối với việc sử dụng chung cho hầu hết các máy mài cắt góc cầm tay trên thị trường.• Thông số kỹ thuật:- Được đúc bằng hợp Kim chịu lực- Có lò xo đẩy mạnh mẽ- Có thiết bị kẹp điều chỉnh- Hỗ trợ dùng cho tất cả các loại máy mài, máy cắt góc cầm tay trên thị trường- Có bảo vệ chống tia lửa- Kích thước đế máy:200 × 240 mm- Dùng được cho các loại máy cắt góc có kích thước đá dưới 125mmBộ khung gắn máy mài máy cắt cầm tay sẽ biến máy cắt,máy mài cầm tay thành máy cắt, mày bàn để cắt sắt và cắt gỗ, máy mài bàn chắc chắn, chính xác , an toàn.Cắt góc tùy chỉnh Mang đi làm rất tiện Lắp được máy mài góc cỡ lưỡi 100, 110, 125 , 150 với nhiều loại lưỡi cắt, lưỡi mài sắt, gạch, gỗ tùy chếGiá rẻ hơn nhiều so với việc phải mua thêm cả 1 cái máy cắt bàn cồng kềnh






Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (82, N'Máy Khoan Động Lực Bosch GSB 550 Set Và Bộ Dụng Cụ 100 Chi Tiết', N'1.359.000 ₫', N'image/8f80385390cfdbe1f26b951eb7b414ff4c.jpg', N'Máy Khoan Động Lực Bosch GSB 550 SET Và Bộ Dụng Cụ 100 Chi Tiết   được thiết kế với nhiều dụng cụ đi kèm nhằm hỗ trợ tối đa cho nhu cầu sử dụng của người tiêu dùng. Máy có công suất hoạt     động lớn cùng mũi khoan được làm từ chất liệu cao cấp giúp bề mặt được xử lý nhanh chóng cùng với màu xanh dương mang đến     cảm giác thoải mái và dịu nhẹ cho người sử dụng.
 Bộ sản phẩm gồm: 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (83, N'Máy hàn điện tử, máy hàn mini GGG420, máy hàn que 2,5 -Bộ phụ kiện đầy đủ dây hàn + dây mát+ kèm kẹp, mo hàn', N'758.000 ₫', N'image/2a6cff7d65bd9b9c8cd32c42c3677a57.jpg', N'Cách lắp dây: dây màu nào lắp với chân máy máy màu đó
Hàn que 2.5: Chỉnh dòng 360-370
Được thiết kế ứng dụng công nghệ tiết kiệm tiên tiến Inverter, Máy hàn que điện tử GGG có khả năng tiết kiệm điện lên đến 50% – 60% so với máy hàn que truyền thống, có thể hàn được tốt cửa sắt, Inox, vật dụng gia đình, công nghiệp, xây dự
Máy hàn que điện tử có thiết kế thông minh, nhỏ gọn giúp việc sử dụng và di chuyển một cách linh hoạt và an toàn. 
 Máy được thiết kế với dòng điện lưu 120A, có thể làm việc được với các que hàn kích thước 1,6-2,5mm.
Máy Có chế độ bảo vệ quá nhiệt, quá tải với nguồn điện không ổn định. 
Đồng hồ hiển thị dòng hàn bằng kỹ thuật số tăng hiệu suất làm việc và thời gian hàn không giới hạn. Cọc cắm được thiết kế lớn hơn so với những loại máy hàn cũ giúp nguồn điện đầu ra được mạnh và ổn định hơn khi làm việc.
Vỏ máy được sơn bằng tĩnh điện, giúp cho máy có độ bền cao hơn, chịu được ở môi trường khắc nghiệt, tăng khả năng chống chọi với oxi hóa trong thời gian dài. 
Bộ phụ kiện đi kèm máy VÔ CÙNG HẤP DẪN:
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (84, N'Bộ Bặn Vít Đa Năng Bosch 46 món - Giao màu ngẫu nhiên', N'448.000 ₫', N'image/5cd7bdacd92295496f87caba6c4b9900.jpg', N'Thông tin sản phẩm
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (85, N'Bộ dụng cụ đa năng 108 món của Bosch 2607002788', N'1.523.000 ₫', N'image/62aad7d39da288e5580b1677f27959b341.jpg', N'Bộ dụng cụ đa năng 108 món của Bosch 2607002788 với nhiều món khác nhau giúp cho công việc sửa chữa lắp đặt máy móc trong gia đình của bạn trở nên dễ dàng hơn rất nhiều, đảm bảo mở được tất cả các linh kiện. 108 món phụ kiện được xếp trong hộp rất tiện dụng và khoa học, chỉ cần một thao tác đơn giản, bạn sẽ chọn được ngay món phụ kiện cần sử dụng. Bộ dụng cụ chắc chắn sẽ là dụng cụ hỗ trợ đắc lực phục vụ các công việc của bạn được nhanh chóng và hiệu quả hơn rất nhiều.
THÔNG SỐ KỸ THUẬT
Bộ được đựng trong hộp nhựa bao gồm:
- Kìm điện Bosch = 1 cái- Kìm nhọn Bosch = 1 cái- Mỏ lết Bosch = 1 cái- Đèn pin chiếu sáng = 1 cái- Bút thử điện = 1 cái- Búa nhổ đinh Bosch = 1 cái- Cưa sắt cầm tay có lưỡi cưa Bosch = 1 cái- Băng keo điện màu đen = 1 cuộn- Thước kéo thép Bosch 3m = 1 cái- Cần lục giác chữ L: 1.5, 2, 2.5, 3, 4, 5, 5.5, 6mm = 8 cái- Tuốc nơ vít cầm tay có từ = 1 cái- Bộ đầu tuốc nơ vít: PH1, PH2, PH2, PH3, S6, S7, H5, H6, T15, T20 = 10 cái- Đầu chuyển từ lục giác ngoài 1/4" ra lục giác trong 4mm = 1 cái- Bộ đầu tuốc nơ vít lụgia1c ngoài 4mm: Dẹp 1.5, 2. Sao 0.8, 0.8, 6mm. Bake 00, 000 = 8 cái- Đầu chuyển từ lục giác ngoài 1/4" ra đầu vuông 1/4": 5, 6, 7, 8, 9, 10 = 7 cái- Mũi khoan bê tông đầu trụ: 5, 6, 8mm = 3 mũi- Tắc kê nhựa 5, 6, 8mm = 30 cái- Vít sắt bắt tắc kê nhựa 3, 4, 5mm = 30 cái
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (86, N'Keo dán siêu dính X2000 (50g) dán gỗ, sắt, sứ, kim loại đa năng', N'23.999 ₫', N'image/b98d2798a6ed7a4b6dfca64bc458e640.jpg', N'1.Tính năng ưu việtKeo X2000 là loại keo dán sắt – keo dán kim loại chuyên dụng với thành phần chính là a-xyannoacrylic axit. Đây là một thành phần đơn, có độ nhớt thấp và trong suốt. Với khả năng gắn kết tuyệt vời, X200 có thể gắn kết các bề mặt kim loại hay sắt của các chất liệu khác nhau. Biên độ chịu nhiệt rộng từ – 50 °C đến 80 °C. Khả năng chống chịu ngoại lực cao. Không thấm nước và chống hóa chất. Miễn nhiễm với các loại dung môi, axit và kiềm. Keo dán sắt tạo thành gắn kết chắc chắn giữa các bề mặt sắt, kim loại.
Trên thị trường hiện nay có nhiều loại keo dán sắt hay keo dán kim loại. Tuy nhiên, chỉ có những loại chất lượng mới có thể khiến các bề mặt kim loại liền nhau hoàn toàn. Keo X2000 có dạng loãng nên rất dễ sử dụng. Keo không bị đông cứng ở nhiệt độ thường (dưới 28°C) nên thời huạn sử dụng rất lâu.

 
2. Lưu ý khi sử dụngLưu ý đầu tiên là vệ sinh sạch sẽ bề mặt dán. Hãy làm sạch và làm khô bề mặt để gắn kết. Việc vệ sinh này cũng giúp bạn có thể sử dụng keo dán sắt – keo dán kim loại tiết kiệm và hiệu quả hơn.
Lưu ý thứ hai là hãy sử dụng một lượng nhỏ vừa đủ cho một bề mặt thôi. Hãy sử dụng tiết kiệm để có hiệu quả tốt nhất nhé !
Lưu ý thứ ba là tránh tiếp xúc với da. Nếu dính vào da, hãy ngâm nước ấm hoặc xà phòng, không dùng khan giấy.
Lưu ý thứ tư là nên dùng nơi thoáng khí.
Keo dán sắt – Keo dán kim loại

 
3. Ứng dụngKeo dán sắt – Keo dán kim loại X2000 có nhiều công dụng khác. Nó có khả năng gắn dính hầu như tất cả mọi loại vật liệu như :
Nhôm với sắtSắt với gỗSắt với nhựaNhựa với gỗGỗ với gỗBê tôngNgoài ra, nó có thể dán trám các vết nứt hay lấp kin các rò rỉ, rổ bề mặt chỉ bằng một vài giọt keo. Khả năng chống chịu cao. Vết rạn nứt được keo X2000 nối liền có thời hạn lâu dài vĩnh viễn cho các máy móc, đồ gia dụng, dụng cụ cầm tay và các động cơ. Keo dán sắt được sứng dụng nhiều trong sửa chữa ở các công trình dân dụng hay nhà công nghiệp. Vì vậy, nó được phân phối rộng rãi ở các cửa hàng đại lý khác nhau.
 





Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (87, N'Máy mài góc cầm tay INGCO AG750282 đường kính 100mm công suất 750W công tắc ở đuôi.', N'495.900 ₫', N'image/304e83a348de498d709bfc4fd11b0220.jpg', N'INGCO là một thương hiệu chuyên sản xuất các công cụ , dụng cụ, máy cầm tay theo tiêu chuẩn Châu Âu, Mục tiêu phát triển của thương hiệu là mang tới cho người tiêu dùng những máy móc và đồ nghề giá cạnh tranh, chất lượng vượt trội.
INGCO VIỆT NAM là nhà phân phối và bảo hành chính hãng tại Việt Nam.
Thông số kỹ thuật:- Điện thế: 220-240V~50-60Hz- Công suất: 750W- Tốc độ không tải: 12000rpm, - Đường kính đĩa mài: 100mm, cốt mài: M10.- Kèm theo 1 tay cầm phụ, đóng gói trong hộp màu.. TL: 2.6 kg- Sản phẩm bảo hành: 6 tháng.
Cám ơn quý khách hàng đã sử dụng sản phẩm chính hãng được phân phối bởi INGCO Việt Nam. Mọi hổ trợ, vui lòng liên hệ hotline: 0777.424.777
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (88, N'Thước kẹp điện tử 150mm thép hợp kim không rỉ màn hình LCD', N'319.999 ₫', N'image/82c99f5c210d8cd89c4bf7e403361a14.jpg', N'- Màn hình LCD lớn sắc nét (42mmx17mm) cho khả năng dễ đọc, có khả năng tự tắt khi không dùng tới, tiết kiệm pin.
- Hiển thị cỡ 0.01mm rất chính xác, dễ đọc kết quả.
THÔNG SỐ KỸ THUẬT CỦA SẢN PHẨM
- Vật liệu: Thép không gỉ.
- Dải đo: 0 - 150mm.
- Độ chia nhỏ nhất: ± 0,01mm
- Dung sai chính xác: ± 0.02mm
- Hệ thống đo lường: Hệ thống đo điện dung tuyến tính.
- Pin: một 1.5 V LR44 (Tặng kèm 2 pin dự phòng).
- Hộp đựng bằng nhựa cứng, đi kèm 2 pin LR44, 1 tô vít nhỏ 4 cạnh để tháo lắp pin
Dụng cụ cầm tay Trường Thành chuyên cung cấp sỉ, lẻ các mặt hàng đồ cơ khí cầm tay, bộ dụng cụ đo lường, cờ lê, tua vít, thước kẹp điện tử, máy khoan cầm tay, máy mài cầm 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (89, N'Thang ghế 3 bậc kết hợp xe đẩy hàng Kachi MK183', N'820.000 ₫', N'image/6cbf20d0e9a173481017f70b291aec31.jpg', N'Khung thép, bậc nhôm

Thùng carton 48× 7.5 ×118cm

Thang nhôm đa năng kết hợp xe đẩu hàng Kachi MK-183 được tích hợp 2 trong 1 sản phẩm. Thang được thiết kế giống với các sản phẩm thang nhôm ghế thông thường với phần tay cầm và mặt bậc rộng rãi. 


 
Thang nhôm kết hợp xe đẩy hàng đa năng Kachi MK-183 là công cụ hỗ trợ tuyệt vời cho nhiều mục đích sử dụng với thiết kế thông minh đầy sáng tạo với sự kết hợp hoàn hảo của chiếc thang nhôm tiện dụng cho các công việc tầm cao và xe đẩy hỗ trợ vận chuyển hàng hóa. Đa chức năng cho nhiều mục đích sử dụng khác nhau giúp người dùng có thể thoải mái xử lý công việc và đạt được các kết quả cao nhất một cách dễ dàng.

 
Khung của Thang nhôm kết hợp xe đẩy hàng đa năng Kachi MK-183 làm từ chất liệu thép định hình, vừng chắc. Cùng các bậc thang nhôm nhám bám chắc chân.
Chiều cao sử dụng của thang nhôm kết hợp xe đẩy Kachi MK-183 là 74cm (chiều cao tính từ mặt đất lên đến mặt bậc trên cùng) bao gồm 3 bậc thang. Khi đứng trên bậc trên dùng tựa đầu gối vào phần tay cầm của thang sẽ tạo cảm giác chắc chắn cho người sử dụng. Đặc biệt an toàn đối với phụ nữ và người cao tuổi.

Mặt bậc được thiết kế dạng nhám giúp bạn yên tâm không sợ trượt chân khi đứng trên thang. Chân thang đằng trước có gắn hai bánh xe đây là bánh xe khi sử dụng với chức năng xe đẩy hàng.
Thang có thiết kế giá đỡ có thể gấp gọn linh hoạt cho việc đẩy hàng hóa, cùng bánh xe có thể gấp gọn tiện dụng, không chiếm diện tích.


 
Để sử dụng chức năng đẩy hàng: bạn chỉ cần gấp gọn bậc thang và kéo phần giá đỡ ra là có thể sử dụng được thành dạng xe đẩy. Phần tay cầm của thang cũng biến thành phần tay kéo cho xe đẩy hàng. Khi cần di chuyển hàng hóa bạn sẽ đặt hàng hóa lên mặt sàn và di chuyển như những chiếc xe đẩy hàng thông thường với tải trọng xe đẩy là 60kg. Phù hợp với mục đích sử dụng cho gia đình.
Tải trọng thang lên đến 120kg, làm việc trên sản phẩm thoải mái mà không lo xảy ra bất kỳ vấn đề nào đáng lo. Tải trọng xe đẩy đạt 60kg vận chuyển được nhiều hàng hóa hơn.
Bạn có thể gấp gọn thang lại sau khi sử dụng nhằm tiết kiệm không gian
THÔNG SỐ SẢN PHẨMModel: MK-183
Chất liệu chính: Khung thép, bậc nhôm
Chiều rộng mỗi bậc thang: 8cm
Khối lượng (N.w): 7.2kg
Khối lượng (G.w): 8.2kg
Kích thước sản phẩm: 67× 47.5 ×106.5cm
Kích thước đóng thùng: 48× 7.5 ×118cm
Xuất xứ thương hiệu: Việt Nam
Sản xuất tại: Trung Quốc
Hình ảnh thực tế: 


Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (90, N'Ê tô kẹp bàn mini', N'32.000 ₫', N'image/84f9bdaec22ee433d5e7ec2a9dba71ab.jpg', N'Khi bạn sửa chữa những đồ vật nhỏ mà cần cố định nó để thao tác trở lên dễ dàng thì chiếc ê tô kẹp bàn mini này chính là một trợ thủ đắc lực không thể thiếu. Đặc biệt cho những bạn nào đam mê sửa chữa mà bị mất một cánh tay hoặc 1 tay bị đau...
Kích thước tổng thể: 93*83mm
Độ mở kẹp bàn tối đa: 35mm
Độ mở tối đa của ê tô: 30mm    
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (91, N'Nhiệt ẩm kế điện tử phòng ngủ', N'162.990 ₫', N'image/08ed3eabbde11faa84eaff3f31985e21.jpg', N'Nhiệt Ẩm Kế Đo Nhiệt Độ phòng ngủ
Mua Nhiệt Ẩm Kế thì Dễ, nhưng mua máy đo có độ chính xác cao mới là khó ?
Thông số của máy:Màu sắc: TrắngCông dụng: Đo nhiệt độ.Chức năng hẹn giờ: khôngNăng lượng sử dụng: Pin Chất liệu: ABS, PSHiển thị: Nhiệt độ, Độ ẨmKích thước: 10x10x2 cm
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (92, N'Miếng Tấm Pát Pad Thép Vuông Sửa Bản Lề Tủ Cửa Gỗ Lỗ Vít Door Hinge Repair Kit', N'9.000 ₫', N'image/08b2c23f6570a4d2f478edb42f121868.jpg', N'Thông tin sản phẩm:
- Chất liệu thép dày 0.7 mm, kích thước 9*9cm
- Lắp đặt dễ dàng
- Lắp cánh và lắp tủ đều được
- Kích thước vừa hầu hết các loại bản lề giảm chấn hiện nay. Quý khách vui lòng xem trước kích thước sản phẩm
 
 
 
Công dụng:
- Sửa cánh bản lề cửa bị mục hỏng nhanh chóng mà không cần phải thay cửa tủ mới
- Che phủ khu vực bị hỏng thẩm mỹ và đẹp mắt
 
 
 
Hướng dẫn sử dụng
Xác định vị trí lỗ thép tương ứng vs bản lề
Bắt vít vào 4 góc tấm thép
 
 
 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (93, N'Set 328 Ống Gen Co Nhiệt Cách Điện Bọc Dây Điện Xe Hơi, Xe Máy, Máy Tính Nhiều Kích Cỡ', N'30.999 ₫', N'image/552fcb3b7924ddec16d49e1da895c8e1.jpg', N'Qúy khách vui lòng xem kỹ mô tả và kích thước trước khi đặt hàng dùm Shop nhé!
Bọc ống cách điện cáp có thể cách điện cáp và dây điện chống lại nhiệt độ cực cao trong máy bay, tàu thuyền và xe quân đội.
Ống co nhiệt polyolefin cung cấp một rào cản giữa cáp và sựăn mòn.
Ống co nhiệt có thể cải thiện giao diện của cáp trong mod máy tính hoặc ô tô và xe máy tùy chỉnh.
Nó được sử dụng rộng rãi trong kết nối dây, bảo vệ và cách điện của dây nối, đầu dây, điện cảm và các thành phần điện tử.
Kích thước:
Đường kính: 1.0mm, 2.0mm, 3.0mm, 4.0mm, 6.0mm, 8.0mm, 10.0mm, 14.0mm.
120 ống :1,0 x 40mm (vàng+đen+đỏ+xanh lục)
60 ống:2.0 x 40mm (vàng+đen+đỏ+xanh dương) 
40 ống: 3.0 x 40mm (vàng+ đen+đỏ+xanh lục)
 32 ống: 4.0 x 40mm (vàng +đe+đỏ+xanh dương)
24 ống: 6.0 x 40mm (vàng+đen+đỏ+xanh lục)
 20 ống: 10 x 80mm (vàng+đen+đỏ+, xanh dương)
16 ống:12 x 80mm (vàng+đen+ đỏ+ xanh dương)
16 ống: 14,0 x 80mm (vàng+ đen+đỏ+ xanh)', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (94, N'Miếng xốp bọc chân cửa chắn gió chống bụi, ngăn tiếng ồn, ngăn côn trùng 93 x 9.6cm', N'24.993 ₫', N'image/8a227df4f70d8bff25f5daf72a2c2ca6.png', N'Xốp EVA
 
Điểm nổi bật:
- Miếng xốp bọc chân cửa là sản phẩm tiện ích cho gia đình giúp làm kín các khe hở giữa các cánh cửa, dưới chân cửa mà không gây tổn hại đến cửa hoặc sàn nhà, ngăn chặn bụi từ bên ngoài len qua các chân cửa.
- Chất liệu xốp EVA có độ đàn hồi và độ dẻo cao, chịu sự va đập mà không bị biến dạng, đảm bảo thời gian sử dụng lâu bền.
- Sản phẩm bọc và bịt kín khe hở của cửa phòng, ngăn chặn côn trùng và bụi bẩn xâm nhập, đồng thời hạn chế thoát gió mát của phòng điều hoà và chắn gió lạnh vào mùa đông.
- Dễ dàng cắt chỉnh và lắp đặt không cần băng keo hay miếng dán, sản phẩm còn giúp hạn chế sự va đập của cửa và tường nhà, ngăn tiếng ồn khi mở và đóng cửa vô cùng tiện lợi.
 
Thông tin sản phẩm:
- Tên sản phẩm: Miếng xốp bọc chân cửa chắn gió chống bụi, ngăn tiếng ồn, ngăn côn trùng
- Chất liệu: Xốp EVA
- Kích thước: 93 x 9.6cm
- Màu sắc: Xám
- Sử dụng cho: Khe cửa < 20mm.







Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (95, N'Thước kẹp điện tử 150mm thép hợp kim không rỉ màn hình LCD', N'319.999 ₫', N'image/82c99f5c210d8cd89c4bf7e403361a14.jpg', N'- Màn hình LCD lớn sắc nét (42mmx17mm) cho khả năng dễ đọc, có khả năng tự tắt khi không dùng tới, tiết kiệm pin.
- Hiển thị cỡ 0.01mm rất chính xác, dễ đọc kết quả.
THÔNG SỐ KỸ THUẬT CỦA SẢN PHẨM
- Vật liệu: Thép không gỉ.
- Dải đo: 0 - 150mm.
- Độ chia nhỏ nhất: ± 0,01mm
- Dung sai chính xác: ± 0.02mm
- Hệ thống đo lường: Hệ thống đo điện dung tuyến tính.
- Pin: một 1.5 V LR44 (Tặng kèm 2 pin dự phòng).
- Hộp đựng bằng nhựa cứng, đi kèm 2 pin LR44, 1 tô vít nhỏ 4 cạnh để tháo lắp pin
Dụng cụ cầm tay Trường Thành chuyên cung cấp sỉ, lẻ các mặt hàng đồ cơ khí cầm tay, bộ dụng cụ đo lường, cờ lê, tua vít, thước kẹp điện tử, máy khoan cầm tay, máy mài cầm 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (96, N'Miếng Tấm Pát Pad Thép Vuông Sửa Bản Lề Tủ Cửa Gỗ Lỗ Vít Door Hinge Repair Kit', N'9.000 ₫', N'image/08b2c23f6570a4d2f478edb42f121868.jpg', N'Thông tin sản phẩm:
- Chất liệu thép dày 0.7 mm, kích thước 9*9cm
- Lắp đặt dễ dàng
- Lắp cánh và lắp tủ đều được
- Kích thước vừa hầu hết các loại bản lề giảm chấn hiện nay. Quý khách vui lòng xem trước kích thước sản phẩm
 
 
 
Công dụng:
- Sửa cánh bản lề cửa bị mục hỏng nhanh chóng mà không cần phải thay cửa tủ mới
- Che phủ khu vực bị hỏng thẩm mỹ và đẹp mắt
 
 
 
Hướng dẫn sử dụng
Xác định vị trí lỗ thép tương ứng vs bản lề
Bắt vít vào 4 góc tấm thép
 
 
 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (97, N'Thang nhôm rút gọn SUMIKA SK440 - Chiều cao tối đa 4.4m, chiều dài rút gọn 0.92m', N'1.685.000 ₫', N'image/0abc74a5542f0b0a22d78dbff4eb2a90.jpg', N'Thang Nhôm Rút Gọn Sumika SK440 được thiết kế thông minh với kiểu rút gọn, bạn có thể sử dụng ở nhiều độ cao khác nhau bằng cách kéo lên, rút xuống linh hoạt. Sản phẩm được sử dụng rộng rãi trong gia đình, trang trí nội thất, dùng trong nhà và ngoài trời. Đặc biệt còn được ứng dụng nhiều trong ngành bưu điện, điện lực, truyền hình cáp, Có thể phục vụ cho nhiều mục đích sử dụng khác nhau với chiều cao hợp lý của mình.
 

 
Sản phẩm được làm bằng chất liệu nhôm dày với độ dày 1.2 - 1.5 mm, chống móp méo, tránh tác động, chịu được lực cao. Chống lại sự oxy hoá khi tiếp xúc với môi trường bên ngoài và chịu được nhiệt khi dùng ở ngoài trời.
Đặc biệt, mỗi bậc thang được trang bị chốt khoá nhựa, cố định, chắc chắn, bậc thang đủ chắc giúp người dùng leo lên xuống thoải mái. Hơn nữa, chân than có đế cao su chống trơn trượt, đảm bảo an toàn cho người sử dụng và chống trầy sàn nhà bạn, giúp người sử dụng an tâm hơn.
 

 
Thang Nhôm Rút Gọn Sumika đươc thiết kế với số bậc thang là 15, trọng lượng nhẹ có thể xách tay dễ dàng cùng với thao tác sử dụng đơn giản: Mở rộng, rút ra theo từng bậc, dễ vận hành và sử dụng. Kích thước nhỏ gọn, thuận tiện để cất giữ trong không gian nhỏ. Ngoài ra sản phẩm có khóa gấp tự động với mức tải trọng lên đến 300kg đã đạt được tiêu chuẩn châu Âu EN131, đảm bảo an toàn cho bạn.
 

 
Thang nhôm rút gọn SUMIKA Model: SK440- Kích thước: 50x10x94cm- Chiều cao tối đa: 4.4m- Chiều dài rút gọn: 0.92m- Trọng lượng 12,3 kg- Số bậc: 15 bậc- Khoảng cách bậc: 30cm- Độ dày nhôm: 1,2-1,5 mm- Tải trọng 300kg, tiêu chuẩn EN131
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (98, N'Bộ dụng cụ di chuyển đồ vật nặng trong nhà thông minh KIOTOOL tải trọng 600kg chuyên dụng di chuyển don nhà - Màu ngầu nhiên', N'285.000 ₫', N'image/04882ddcfbdd34fcd2fbb0a4e9c321a3.jpg', N'Dụng cụ di chuyển đồ vật nặng trong nhà thông minh KIOTOOL tải trọng 600kg chuyên dụng di chuyển don nhà - Màu ngầu nhiên
Tải trọng 600kg di chuyển tủ giường ngay cả két sắt một cách dễ dành dù chỉ cần 1 ngườiVới thiết kế 3 bánh xoay linh động mỗi chânDễ dàng di chuyển đồ vật cồng kềnh, nặng mà không khó khăn hay mất nhiều sứcThiết kế thông minh, đơn giản và dễ sử dụngChế tạo từ hợp kim thép và nhựa ABS cao cấp, chịu lực tốtGiảm thời gian và tăng năng suất lao động hiệu quảChỉ cần 1 người cũng có thể chuyển đồ nặng
 









 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (99, N'Bộ Máy Khoan Bắt Vít Không Dây Dùng Pin 24V Kachi MK247 – Đi Kèm 1 Pin - hàng chính hãng', N'768.000 ₫', N'image/5ebcb709dbd46d2dda5c14622f35293b.png', N'dùng pin
Nơi khô ráo
Lắp pin khi sử dụng
Máy khỏe với 2 nấc điều chỉnh tốc độ làm việc. Có chức năng khoan, bắt vít, bắt ốc chống trượt nhiều cấp độ. Hỗ trợ công việc một cách hiệu quả. Máy khoan Kachi MK247 khoan mạnh mẽ với tốc độ thấp 0-400 vòng/phút, và mức cao là 0-1450 vòng/phút.
Pin: 24V Lithium-ION
Mô men xoắn cực đại: 40 N.m
Tốc độ không tải thấp/cao: 0-400/0-1450 vòng/phút
1 hộp
Tốc độ không tải thấp/cao: 0-400/0-1450 vòng/phút
Bộ máy khoan bắt vít không dây dùng Pin 24V Kachi MK247 là một model khoan mới nhất năm nay đến từ thương hiệu Kachi. Bộ máy khoan không dây, dùng pin 24V – đi kèm một pin phụ, giúp khách hàng có thể sử dụng liên tục mà không mất thời gian chờ sạc. Máy có thiết kế nhỏ gọn, với bộ phụ kiện chuyển đổi khoan giúp khoan tường, khoan sắt, gỗ nhanh chóng. Sản phẩm đi kèm vali đựng tiện lợi.
Bộ khoan dùng pin Kachi MK247 được thiết kế nhỏ gọn và vận dụng bằng pin sẽ cho phép bạn sử dụng linh hoạt và tiện lợi hơn. Trọng lượng máy khoan nhẹ chỉ với 1,1kg (bao gồm cả pin) và các phụ kiện đi kèm hơn 2kg giúp thao tác dễ dàng ở mọi ngóc ngách, đặc biệt với những mũi khoan ở chiều cao quá đầu.

- Đảo chiều trái phải.
 - Điều chỉnh tốc độ
 - Khoan tường
 - Khoan sắt
- Bắn vít và rất nhiều ứng dụng
Máy khoan này sử dụng rất phù hợp cho gia đình hoặc thi công công trình nhỏ. Tiện lợi khi các bạn làm việc ở các vị trí khó khăn: bắn vít tường, khoan trần, thi công mành rèm, bóng điện, các vị trí không thể kéo dây điện tới.

Máy khoan Kachi MK247 đi kèm 2 viên pin 24V Lithium/ION cùng sạc. Pin đi kèm có độ bền cao, có thể sử dụng trong một khoản thời gian dài mà không cần sạc liên tục. Ngoài ra Máy được trang bị công nghệ sạc nhanh giúp cho bạn tiết kiệm thời gian chờ,không bị gián đoạn trong công việc.

 
Hơn nữa,  bắt vít không dây dùng Pin 24V Kachi MK247 được trang bị hệ thống đèn báo và đèn LED để bạn có thể nhìn rõ vị trí cần bắn vít hoặc khoan. Đây là một điểm khá nổi bật mà máy được trang bị.

 
Máy khỏe với 2 nấc điều chỉnh tốc độ làm việc. Có chức năng khoan, bắt vít, bắt ốc chống trượt nhiều cấp độ. Hỗ trợ công việc một cách hiệu quả. Máy khoan Kachi MK247 khoan mạnh mẽ với tốc độ thấp 0-400 vòng/phút, và mức cao là 0-1450 vòng/phút.
 
Thương hiệu: Kachi
Model: MK247
Chức năng: khoan tường, khoan gỗ, khoan kim loại…
Pin: 24V Lithium-ION
Mô men xoắn cực đại: 40 N
Tốc độ không tải thấp/cao: 0-400/0-1450 vòng/phút
Kích thước hộp nhựa: 28.7 x 8.4 x 25.1cm
Khối lượng: 2.3kg
Xuất xứ thương hiệu: Việt Nam
Sản xuất tại: Trung Quốc
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (100, N'Bút thử nước TDS, dụng cụ đo TDS, máy đo độ cứng của nước - Hàng chính hãng', N'150.000 ₫', N'image/65dabeca667b93081d3b439dde36206d.png', N'Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (101, N'Túi vệ sinh máy lạnh TD01, Áo vệ sinh máy lạnh tại nhà', N'120.000 ₫', N'image/2842fb5deedb2b945dba0fa8974580a5.jpg', N'Vải dù tổ ong chống thấm
CÁCH SỬ DỤNG:
 
      Áo vệ sinh máy lạnh TD01 là mẫu thiết kế cải tiến nhất của nhà sản xuất Thuận Dung được thiết kế và sản xuất kể từ năm 2013, chuyên dùng cho thợ điện lạnh với độ bền cao, tiện lợi nhất với miệng áo có thun co dãn, và thiết kế luồn dây treo xung quanh máy lạnh.
     Trên thị trường hiện có rất nhiều Shop bán áo vệ sinh có nguồn gốc khác nhau, cần phân biệt sản phẩm bán bởi Thuận Dung và các sản phẩm khác như sau:

- Có tem sản phẩm từ nhà sản xuất Thuận Dung với mã sản phẩm là TD01, những sản phẩm không có tem này đều là hàng nhái không được sản xuất bởi Thuận Dung.
- Chất liệu: Vải dù tổ ong chống thấm, độ bền cao.
- Màu: Xanh đen (có màu xanh rêu nhưng chưa bán trên TIKI)
- Chiều rộng miệng túi: 1.8 mét, sử dụng đa năng cho tất cả các dòng máy lạnh dân dụng từ 1HP đến 3HP
- Ống xả : 2.5m tính từ phần đuôi áo, rất dài để tiện cho việc xả nước ở mọi độ cao gắn máy lạnh thông dụng.
- Trọng lượng: 600gr nhẹ hơn các loại vải khác giúp thao tác thuận tiện, không chì nặng vào máy khi xịt nước, không thấm vào vải, và cực kỳ mau khô sau khi sử dụng và giặt rữa giúp đảm bảo độ bền sử dụng lâu dài. 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
GO
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (102, N'Cuộn Ron Dán Che Khe Cửa,Chân Cửa HT SYS - Chống Nước - Chống Gió Lùa - Chống Ồn - Bụi Bẩn - Ngăn Côn Trùng Cuộn Dài 2 Mét', N'50.000 ₫', N'image/00bc1a413b283d5d70f541bed96ef65e.jpg', N'Bước 1: Vệ sinh thật sạch bề mặt cần dán. Bước 2: Đo chiều cửa cửa sổBước 3: Cắt ron cửa HT SYS khít với chiều dài cửa đã đo. Bước 4: Dán ron cẩn thận lên bề mặt, miết chắc chắn, tránh gỡ ra dán lại nhiều lần.
Túi OPP: gồm 01 cuộn dài 2 mét
 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (103, N'Nhiệt ẩm kế điện tử phòng ngủ', N'162.990 ₫', N'image/08ed3eabbde11faa84eaff3f31985e21.jpg', N'Nhiệt Ẩm Kế Đo Nhiệt Độ phòng ngủ
Mua Nhiệt Ẩm Kế thì Dễ, nhưng mua máy đo có độ chính xác cao mới là khó ?
Thông số của máy:Màu sắc: TrắngCông dụng: Đo nhiệt độ.Chức năng hẹn giờ: khôngNăng lượng sử dụng: Pin Chất liệu: ABS, PSHiển thị: Nhiệt độ, Độ ẨmKích thước: 10x10x2 cm
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (104, N'Bộ dụng cụ sửa chữa đa năng 45 chi tiết Kachi MK166', N'464.000 ₫', N'image/2f2e22809bf79ec6d3a2324ca17a6b5d.jpg', N'thép không gỉ, nhựa
Có hộp nhựa đi kèm

Bộ dụng đa năng 45 chi tiết Kachi MK-166 dùng sửa chữa vật dụng trong nhà

Bộ dụng cụ đa năng Kachi 45 chi tiết được thiết kế hộp đựng bằng nhựa cứng chắc chắn, có phần quai cầm tiện lợi cho việc di chuyển trong lúc sử dụng. Với từng vị trí vừa khít với từng dụng cụ, người dùng có thể sắp xếp gọn gàng vật dụng khi không sử dụng, đảm bảo độ bền nâng cao cũng như giúp cho không gian nhà ở, nơi làm việc thêm gọn gàng.



Bộ dụng đa năng 45 chi tiết Kachi MK-166 bao gồm:
- 1 Tua vít đầu dẹp 5.8*100
- 1 Tua vít lớn đầu nhọn 5.8*100
- 1 Tua vít nhỏ đầu nhọn
- 1 Dao rọc
- 1 Bút thử điện
- 1 Băng keo điện
- 1 Tay cầm
- 9 Đầu vít 25mm
- 1 Đầu vít ADA
- 9 Đầu khẩu vặn ốc 1/4" 5/6/7/8/9/10/11/12/13
- 8 Lục giác 1.5/2/2.5/3/4/5/5.5/6
- 1 Cưa
- 1 Thước dây 3m
- 1 Kìm mỏ bằng 6”
- 1 Kìm mỏ nhọn 6”
- 1 Cờ lê
- 1 Búa
- 1 Hộp ốc vít 60 cái
- 1 Hộp đựng bằng nhựa




THÔNG SỐ KỸ THUẬT
Model: MK-166
Chất liệu: thép không gỉ, nhựa
Khối lượng: 2.7kg
Kích thước hộp: 35.7 x 27 x 7 cm
Xuất xứ thương hiệu: Việt Nam
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (105, N'Bộ dụng cụ di chuyển đồ vật nặng trong nhà thông minh KIOTOOL tải trọng 600kg chuyên dụng di chuyển don nhà - Màu ngầu nhiên', N'285.000 ₫', N'image/04882ddcfbdd34fcd2fbb0a4e9c321a3.jpg', N'Dụng cụ di chuyển đồ vật nặng trong nhà thông minh KIOTOOL tải trọng 600kg chuyên dụng di chuyển don nhà - Màu ngầu nhiên
Tải trọng 600kg di chuyển tủ giường ngay cả két sắt một cách dễ dành dù chỉ cần 1 ngườiVới thiết kế 3 bánh xoay linh động mỗi chânDễ dàng di chuyển đồ vật cồng kềnh, nặng mà không khó khăn hay mất nhiều sứcThiết kế thông minh, đơn giản và dễ sử dụngChế tạo từ hợp kim thép và nhựa ABS cao cấp, chịu lực tốtGiảm thời gian và tăng năng suất lao động hiệu quảChỉ cần 1 người cũng có thể chuyển đồ nặng
 









 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (106, N'Máy Phun Khử Khuẩn Nano K5 Pro Tia UV, Máy Xịt Khử Khuẩn Cầm Tay, Máy Diệt Khuẩn Nano Siêu Tiện Lợi', N'59.000 ₫', N'image/84fc9b40c17847ef850660ad05535cd1.png', N'Nhựa cao cấp

Để nơi khô mát

HƯỚNG DẨN SỬ DỤNG
- Rót dung dịch cồn y tế vào bình chứa
- Xoay bình chứa để treo bình vào thân súng
- Bật công tắc khởi động
- Điều chỉnh tốc độ phun


Máy Phun Khử Khuẩn Nano K5 Pro Tia UV, Máy Xịt Khử Khuẩn Cầm Tay, Máy Diệt Khuẩn Nano Siêu Tiện Lợi

 
️1. THÔNG TIN CHUNG
- Hàng có sẳn
- Hàng được bao bọc kỹ, đảm bảo khi vận chuyển
- Chất liệu cao cấp
- Sản phẩm rất nhẹ, bền, tiện lợi.
----------------------------------------------------
️2. THÔNG TIN SẢN PHẨM
Tên sản phẩm: Máy tiệt trùng phun tia UV khử khuẩn
Model sản phẩm: K5 Pro
Phạm vi: 200-300cm
Công suất định mức: 10W
Dung lượng pin  : 2000mah
Thời gian sạc: 2-4 giờ
Cổng sạc; USB
Thời gian sử dụng: 3-8giờ
Dung tích bình nước: 360ml
----------------------------------------------------
️3. SẢN PHẨM ĐƯỢC DÙNG KHI
- Khử khuẩn khi nhận hàng, vật liệu thông dụng
- Khử khuẩn tay cầm cửa
- Khử khuẩn thang máy
- Khử khuẩn nội thất xe hơi
- Khử khuẩn tay, chân khi hoạt động nơi công cộng
- Khử khuẩn vật dụng trong gia đình, công ty
----------------------------------------------------
️4. CAM KẾT CỦA SHOP
- Sản phẩm y ảnh 100.
- Đóng gói cẩn thận, bảo vệ sản phẩm nguyên vẹn trong quá trình vận chuyển
- Giao hàng nhanh chóng.
- Đươc đổi trả 1 đổi 1 hoàn toàn miễn phí nếu sản phẩm khi nhận hàng bị vỡ - hỏng – không giống hình ảnh.
- Hỗ trợ giải quyết đơn hàng trong thời gian sớm nhất với phương án tốt nhất để khách hàng luôn cảm thấy hài lòng và yên tâm khi mua sắm
️_️_️ XIN CHÂN THÀNH CẢM ƠN VÌ BẠN ĐÃ LỰA CHỌN CHÚNG TÔI ️_️_️
 


THÔNG TIN SẢN PHẨM
Tên sản phẩm: Máy tiệt trùng phun tia UV khử khuẩn
Model sản phẩm: K5 Pro
Phạm vi: 200-300cm
Công suất định mức: 10W
Dung lượng pin  : 2000mah
Thời gian sạc: 2-4 giờ
Cổng sạc; USB
Thời gian sử dụng: 3-8giờ
Dung tích bình nước: 360ml

Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (107, N'Bộ dụng cụ nâng và di chuyển đồ thông minh, Dụng cụ di chuyển đồ đạc, Dụng cụ hỗ trợ di chuyển vật nặng', N'145.000 ₫', N'image/45f61952cef51f1f2b4c5c04e6c10b96.png', N'BỘ DỤNG CỤ NÂNG VÀ DI CHUYỂN ĐỒ THÔNG MINH
Hỗ trợ di chuyển vật dụng nặng: tủ lạnh, két sắt, tủ, giường,ết kiệm thời gian, nhân lực, tăng năng suất lao động. Giảm các nguy cơ chấn thương, tai nạn nghề nghiệp không đáng có.
CÁC TIỆN ÍCH MANG LẠI:
- Dễ dàng sử dụng xung quanh nhà, sắp xếp lại toàn bộ ngôi nhà hay chỉ đơn giản là điều chỉnh vị trí của một vài đồ vật.
- Là dụng cụ hỗ trợ không thể thiếu giúp giảm các nguy cơ chấn thương, tai nạn nghề nghiệp không đáng có khi khiêng nặng quá sức trong quá trình di chuyển, bê đồ vật
- Bộ sản phẩm bao gồm một tay nâng và hệ 4 con lăn. Tay nâng được làm từ chất liệu thép siêu cứng và siêu bền. Con lăn với các bánh xe được làm từ nhựa ABS chịu lực cao, có khả năng xoay 360 độ giúp bạn dễ dàng di chuyển vật dụng đến đúng vị trí mình mong muố
- Dùng để di chuyển vật dụng nặng: tủ lạnh, két sắt, tủ, giường,
- Tiết kiệm thời gian, nhân lực, tăng năng suất lao động.
- Chất liệu chế tạo tay nâng bằng hợp kim thép cao cấp, con lăn bánh xe làm từ nhựa ABS chịu lực tốt.
- Con lăn bánh xe xoay 360°, giúp dễ dàng di chuyển đồ.
- Tải trọng di chuyển tối đa mỗi còn lăn lên đến 150kg, Tổng tải trọng di chuyển là 600kg.
Thông tin sản phẩm:
Một bộ sản phẩm gồm: 1 tay nâng và 4 bánh xe chât liệu nhựa ABS và thép chất lượng cao.


Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (108, N'Bút thử nước TDS, dụng cụ đo TDS, máy đo độ cứng của nước - Hàng chính hãng', N'150.000 ₫', N'image/65dabeca667b93081d3b439dde36206d.png', N'Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (109, N'Miếng Tấm Pát Pad Thép Vuông Sửa Bản Lề Tủ Cửa Gỗ Lỗ Vít Door Hinge Repair Kit', N'9.000 ₫', N'image/08b2c23f6570a4d2f478edb42f121868.jpg', N'Thông tin sản phẩm:
- Chất liệu thép dày 0.7 mm, kích thước 9*9cm
- Lắp đặt dễ dàng
- Lắp cánh và lắp tủ đều được
- Kích thước vừa hầu hết các loại bản lề giảm chấn hiện nay. Quý khách vui lòng xem trước kích thước sản phẩm
 
 
 
Công dụng:
- Sửa cánh bản lề cửa bị mục hỏng nhanh chóng mà không cần phải thay cửa tủ mới
- Che phủ khu vực bị hỏng thẩm mỹ và đẹp mắt
 
 
 
Hướng dẫn sử dụng
Xác định vị trí lỗ thép tương ứng vs bản lề
Bắt vít vào 4 góc tấm thép
 
 
 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (110, N'Keo Dán Siêu Dính Đa Năng Mọi Chất Liệu Cực Mạnh - Dán Gỗ Thuỷ Tinh Kim Loại Sắt Gốm Sứ Nhựa Vải TBM1', N'35.000 ₫', N'image/d0808ee755689be431552171524487fd.jpg', N'------------  HƯỚNG DẪN SỬ DỤNG -------------  Làm sạch bề mặt muốn kết dính  Mở nắp và bôi keo lên bề mặt  Gắn kết bề mặt muốn dính và chờ trong tối thiểu 30s để phát huy tác dụng
️️LƯU Ý: - Bề mặt muốn kết dính cần được làm sạch hoàn toàn, không chứa bụi bẩn hay dung dịch khác - Có thể đeo găng tay cao su khi sử dụng keo dán. - Vì thành phần hoá học đặc biệt, dung dịch keo cần có khoảng không khí để thở nên chỉ có thể đổ đầy 75% lọ. - Tránh xa tầm tay trẻ em - Không để dung dịch dính vào mắt, da.
KEO DÁN ĐA NĂNG THẾ HỆ MỚI - BÁM DÍNH MẠNH MẼ HƠN 80 LẦN KEO 502 -
LOẠI TỐT NHẤT THỊ TRƯỜNG KHÔ NHANH CẤP TỐC SAU 30 GIÂY CHỐNG THẤM NƯỚC VÀ VA ĐẬP 
> ------------ TÍNH NĂNG NỔI BẬT -------------
Khác biệt với các loại keo truyền thống, KEO DÁN ĐA NĂNG THẾ HỆ MỚI được nâng cấp các tính năng để đáp ứng mọi nhu cầu sử dụng của bạn:
Bám dính mạnh mẽ hơn 80 lần so với keo 502 truyền thống. T ối ưu thời gian dính chỉ sau 30 giây, tiết kiệm thời gian sửa chữa. Gắn kết đa dạng chất liệu: gốm sứ, kim loại, nhựa, dép xốp, đồ ghỗ, gương, trang sức, đồ thủ công,linh kiện điện tử Không gây ố bẩn vết dính. Tạo nên sự gắn kết trong suốt hoàn hảo. Mùi nhẹ dịu, không gây khó chịu khi sử dụng, an toàn và thân thiện môi trường.
------------ THÔNG TIN SẢN PHẨM -------------Kích thước: 122 x 38 mmDung tích: 30 mlPhân loại: dung dịchMùi hương: ít mùi Hạn sử dụng: 18 thángThời gian phát huy công hiệu: sau 30 giây Bảo quản: tránh ánh nắng trực tiếp, đậy nắp sau khi sử dụng






Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (111, N'Bút đo độ PH của nước', N'95.300 ₫', N'image/d85d42d8faf84ac7ac6683640b94693e.jpg', N'PH là một chỉ số xác định tính chất hoá học của nước. Thang pH chỉ từ 0-14; Về lý thuyết, nước có pH = 7 là trung tính. Khi pH > 7, nước lại mang tính kiềm. Thang tính pH là một hàm số Logarrit. Ví dụ pH = 5 có tính a xit cao gấp 10 lần pH = 6, gấp 100 lần so với pH = 7. Theo tiêu chuẩn, pH của nước sử dụng cho sinh hoạt là 6,0 – 8,5 và của nước ăn uống uống là 6,5 – 8,5.
Bút đo pH dụng cụ hỗ trợ xác định (độ chua hoặc độ kiềm) trong nước - dung dịch. Các phép đo này rất quan trọng đối với nhiều ứng dụng trong nuôi trồng thủy sản,sinh vật cảnh, hồ bơi, nông nghiệp, y học, sinh học, hóa học, khoa học thực phẩm, khoa học môi trường, hải dương học, dinh dưỡng, xử lý nước và lọc nước các lĩnh vực khác. Bút đo độ PH-04 này được sử dụng rộng rãi trong sản xuất đo lường ph trong nuôi trồng thủy sản, quản lý bể bơi hồ chứa, canh tác nông nghiệp, sản xuất công nghiệp, phòng thí nghiệm, cơ sở kiểm soát chất lượng và giáo dục.
1 x máy Đo độ ph
2 x Bột dung dịch hiệu chuẩn  (pH 4.00 và 6.86 pH)
1 x Hướng dẫn sử dụng
1 x Vít hiệu chuẩn


 
Thực hiện theo các hướng dẫn trên các gói hiệu chuẩn 4.01 hoặc 6.86 đi kèm, nhúng bút đo pH vào dung dịch hiệu chuẩn và dùng tua vít để vặn về đúng chỉ sốt ghi trên gói dung dịch.

Nếu điện cực sử dụng trong thời gian dài và điện cực tiếp xúc với không khí, sau đó hiển thị các giá trị chậm và không ổn định là do điện cực khô. Chỉ cần nhúng điện cực vào nước trong vài giờ.
Khi giá trị hiển thị mờ hoặc không hiển thị, hãy nhanh chóng thay thế pin. Vặn nắp pin và thay pin. Chú ý đến tính phân cực của pin
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (112, N'Keo dán giày, gỗ, nhựa đa năng siêu dính 3M Scotch 3M-3M-AD113', N'24.000 ₫', N'image/4442b3f581cb226ee1ec4c4a182846a5.jpg', N'Tránh ánh nắng trực tiếp, đậy nắp sau khi sử dụng để bảo quản sản phẩm được lâu.
Sử dụng đơn giản như keo dán sắt thông thường, bề mặt cần dán cần sạch và khô.
18cm x 12xm x 4cm
Nhờ những đặc tính siêu dính, siêu chắc, khô nhanh nên Keo dán giày, gỗ, nhựa đa năng siêu dính 3M Scotch AD113 thường dùng dán đồ thể thao (giày, dép), dụng cụ thể thao và vật dụng gia đình, Với đặc tính trên Keo dán giày, gỗ, nhựa đa năng siêu dính 3M Scotch AD113 có thể sử dụng được cho các bề mặt khó dính như gỗ, kim loại, gốm sứ, cao su,…Thông tin sản phẩm


Tránh ánh nắng trực tiếp, đậy nắp sau khi sử dụng để bảo quản sản phẩm được lâu.
Sử dụng đơn giản như keo dán sắt thông thường, bề mặt cần dán cần sạch và khô.
Lưu ý: tùy theo đợt nhập hàng mà bao bì sản phẩm sẽ có sự thay đổi
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (113, N'Máy Khoan Động Lực Bosch GSB 550 Set Và Bộ Dụng Cụ 100 Chi Tiết', N'1.359.000 ₫', N'image/8f80385390cfdbe1f26b951eb7b414ff4c.jpg', N'Máy Khoan Động Lực Bosch GSB 550 SET Và Bộ Dụng Cụ 100 Chi Tiết   được thiết kế với nhiều dụng cụ đi kèm nhằm hỗ trợ tối đa cho nhu cầu sử dụng của người tiêu dùng. Máy có công suất hoạt     động lớn cùng mũi khoan được làm từ chất liệu cao cấp giúp bề mặt được xử lý nhanh chóng cùng với màu xanh dương mang đến     cảm giác thoải mái và dịu nhẹ cho người sử dụng.
 Bộ sản phẩm gồm: 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (114, N'Găng tay lao động chống cắt 3M Cấp độ 1 - Găng tay bảo hộ chống đâm xuyên tiêu chuẩn EN388:4131 - Sản phẩm chính hãng', N'32.000 ₫', N'image/be7de3c53a72447a6e50a8df90d2c6eb.jpeg', N'Sản phẩm được phân phối chính hãng bới Bảo Hộ Xsafe
--------
- Vân chuyển hàng hóa trong kho
- Làm vườn
Những tính năng ưu việt giúp bảo vệ tốt bàn tay của người sử dụng:
- Mật độ vải cao kết hợp với sợi chỉ nhỏ nên độ ôm tay rất tốt giúp người sử dụng có cảm xác tiếp xúc chính xác.
- Lòng bàn tay phủ PU tạo độ bám khi cầm nắm.
- Sợi găng tay cấu tạo chính từ sợi Nylon giúp thoát khí.
- Độ bền cao, có thể giặt và tái sử dụng.
- Găng tay 3M chống cắt chủ yếu được sử dụng trong các thao tác máy móc có chi tiết sắt bén.
Thương hiệu:3M
Sản xuất:Việt Nam
Chất liệu: Nylon, PU
Một số lưu ý cho người dùng:
- Chống mài mòn: 4/5
- Chống cắt: 1/5
- Chống xé rách: 3/5
- Chống đ-â-m xuyên: 1/5
Xin cảm ơn!
TẠI SAO NÊN MUA GĂNG TAY CHỐNG CẮT 3M LEVEL 1 TẠI BẢO HỘ XSAFE ?
- Nhà Phân phối chính thứ của các thương hiệu bảo hộ hàng đầu: 3M, Ansell, J
- Bảo hành chính hãng và đổi trả sản phẩm với bất kỳ lỗi nào từ NSX
-------------------
[Giải Pháp Bảo Hộ Toàn Diện Cho Doanh Nghiệp Cá Nhân]
* Add: 20 đường số 1, KDC CityLand ParkHills, Phường 10, Quận Gò Vấp, 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (115, N'Bộ Máy Khoan Bắt Vít Không Dây Dùng Pin 24V Kachi MK247 – Đi Kèm 1 Pin - hàng chính hãng', N'768.000 ₫', N'image/5ebcb709dbd46d2dda5c14622f35293b.png', N'dùng pin
Nơi khô ráo
Lắp pin khi sử dụng
Máy khỏe với 2 nấc điều chỉnh tốc độ làm việc. Có chức năng khoan, bắt vít, bắt ốc chống trượt nhiều cấp độ. Hỗ trợ công việc một cách hiệu quả. Máy khoan Kachi MK247 khoan mạnh mẽ với tốc độ thấp 0-400 vòng/phút, và mức cao là 0-1450 vòng/phút.
Pin: 24V Lithium-ION
Mô men xoắn cực đại: 40 N.m
Tốc độ không tải thấp/cao: 0-400/0-1450 vòng/phút
1 hộp
Tốc độ không tải thấp/cao: 0-400/0-1450 vòng/phút
Bộ máy khoan bắt vít không dây dùng Pin 24V Kachi MK247 là một model khoan mới nhất năm nay đến từ thương hiệu Kachi. Bộ máy khoan không dây, dùng pin 24V – đi kèm một pin phụ, giúp khách hàng có thể sử dụng liên tục mà không mất thời gian chờ sạc. Máy có thiết kế nhỏ gọn, với bộ phụ kiện chuyển đổi khoan giúp khoan tường, khoan sắt, gỗ nhanh chóng. Sản phẩm đi kèm vali đựng tiện lợi.
Bộ khoan dùng pin Kachi MK247 được thiết kế nhỏ gọn và vận dụng bằng pin sẽ cho phép bạn sử dụng linh hoạt và tiện lợi hơn. Trọng lượng máy khoan nhẹ chỉ với 1,1kg (bao gồm cả pin) và các phụ kiện đi kèm hơn 2kg giúp thao tác dễ dàng ở mọi ngóc ngách, đặc biệt với những mũi khoan ở chiều cao quá đầu.

- Đảo chiều trái phải.
 - Điều chỉnh tốc độ
 - Khoan tường
 - Khoan sắt
- Bắn vít và rất nhiều ứng dụng
Máy khoan này sử dụng rất phù hợp cho gia đình hoặc thi công công trình nhỏ. Tiện lợi khi các bạn làm việc ở các vị trí khó khăn: bắn vít tường, khoan trần, thi công mành rèm, bóng điện, các vị trí không thể kéo dây điện tới.

Máy khoan Kachi MK247 đi kèm 2 viên pin 24V Lithium/ION cùng sạc. Pin đi kèm có độ bền cao, có thể sử dụng trong một khoản thời gian dài mà không cần sạc liên tục. Ngoài ra Máy được trang bị công nghệ sạc nhanh giúp cho bạn tiết kiệm thời gian chờ,không bị gián đoạn trong công việc.

 
Hơn nữa,  bắt vít không dây dùng Pin 24V Kachi MK247 được trang bị hệ thống đèn báo và đèn LED để bạn có thể nhìn rõ vị trí cần bắn vít hoặc khoan. Đây là một điểm khá nổi bật mà máy được trang bị.

 
Máy khỏe với 2 nấc điều chỉnh tốc độ làm việc. Có chức năng khoan, bắt vít, bắt ốc chống trượt nhiều cấp độ. Hỗ trợ công việc một cách hiệu quả. Máy khoan Kachi MK247 khoan mạnh mẽ với tốc độ thấp 0-400 vòng/phút, và mức cao là 0-1450 vòng/phút.
 
Thương hiệu: Kachi
Model: MK247
Chức năng: khoan tường, khoan gỗ, khoan kim loại…
Pin: 24V Lithium-ION
Mô men xoắn cực đại: 40 N
Tốc độ không tải thấp/cao: 0-400/0-1450 vòng/phút
Kích thước hộp nhựa: 28.7 x 8.4 x 25.1cm
Khối lượng: 2.3kg
Xuất xứ thương hiệu: Việt Nam
Sản xuất tại: Trung Quốc
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (116, N'Đồng Hồ Đo Điện Vạn Năng Ampe Kìm + Bút Thử Điện Cảm Ứng Đa Chức Năng CTFAST An Toàn Tiện Dụng', N'155.000 ₫', N'image/161434b2764fc67dd748af07d107574d.jpg', N'Nhựa ABS cách điện
Bảo quản nơi thoáng mát
Đọc kỹ hướng dẫn sử dụng .
Do dòng tải AC, đo Diode và thông mạch, đo điện áp DC, đo điện áp AC, đo điện trở
Đồng Hồ Đo Điện Vạn Năng Ampe Kìm + Bút Thử Điện Cảm Ứng Đa Chức Năng CTFAST An Toàn Tiện Dụng :  Là Bộ Sản Phẩm Đo Điện Dân Dụng hoàn hảo trong tủ sửa dụng cụ điện của gia đình bạn .Cặp đôi sản phẩm là cánh tay đắc lực cho các bạn khi sửa chữa , thăm dò, đo lường các thiết bị điện trong nhà một cạch an toàn hiệu quả , nhanh chóng.

THÔNG TIN SẢN PHẨM :
1.Đồng Hồ Đo Điện Vạn Năng Ampe Kìm:

- Chức năng:



Hướng dẫn sử dụng:

2.Bút Thử Điện Cảm Ứng Đa Chức Năng CTFAST




 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (117, N'Găng tay bảo hộ lao động Jogger Superpro - Bao tay lao động chống dầu nhớt, trơn trượt, độ linh hoạt cao - Chính hãng', N'11.000 ₫', N'image/dedfc8e84f2572dd64897faae8eb442e.jpeg', N'GĂNG TAY CHỐNG DẦU JOGGER SUPERPRO 2121 - GĂNG TAY BẢO HỘ LAO ĐỘNG ĐA NĂNG
Được nhập khẩu và phân phối chính thức bởi Xsafe
------
 CẤU TẠO SẢN PHẨM:
- Đảm bảo sự linh hoạt khi thao tác cả với các chi tiết, vật dụng nhỏ. Và khả năng kháng dầu.
 ỨNG DỤNG GĂNG TAY BẢO HỘ JOGGER SUPERPRO 2121
- Superpro là găng tay bảo hộ chống dầu hoàn hảo để tăng hiệu suất làm việc khi thao tác với các chi tiết có dầu,
dính nhớt.
- EN 388:2003
- Chống hao mòn: 4/4
- Chống cắt: 1/5
- Chống rách: 2/4
- Chống đâm xuyên: 1/4
 CHI TIẾT GĂNG TAY BẢO HỘ JOGGER SUPERPRO 2121
- Model: Superpro
- Có thể giặt rửa bình thường (không sử dụng chất tẩy rửa mạnh).
- Bảo quản tránh sương, môi trường băng giá và ánh nắng mặt trời.
 THÔNG TIN CHUNG
THƯƠNG HIỆU Safety Jogger
NHÀ PHÂN PHỐI: Bảo Hộ Xsafe
 TẠI SAO NÊN MUA GĂNG TAY CHỐNG DẦU JOGGER CONSTRUCTO TẠI BẢO HỘ XSAFE ?
- Giá luôn tốt nhất
- Bảo hành chính hãng
-------
[Giải Pháp Bảo Hộ Toàn Diện Cho Doanh Nghiệp Cá Nhân]
* Add: 40/64 Lê Đức Thọ, P7, Q.Gò Vấp, HCM
* 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (118, N'Keo Dán Siêu Dính Đa Năng Mọi Chất Liệu Cực Mạnh - Dán Gỗ Thuỷ Tinh Kim Loại Sắt Gốm Sứ Nhựa Vải TBM1', N'35.000 ₫', N'image/d0808ee755689be431552171524487fd.jpg', N'------------  HƯỚNG DẪN SỬ DỤNG -------------  Làm sạch bề mặt muốn kết dính  Mở nắp và bôi keo lên bề mặt  Gắn kết bề mặt muốn dính và chờ trong tối thiểu 30s để phát huy tác dụng
️️LƯU Ý: - Bề mặt muốn kết dính cần được làm sạch hoàn toàn, không chứa bụi bẩn hay dung dịch khác - Có thể đeo găng tay cao su khi sử dụng keo dán. - Vì thành phần hoá học đặc biệt, dung dịch keo cần có khoảng không khí để thở nên chỉ có thể đổ đầy 75% lọ. - Tránh xa tầm tay trẻ em - Không để dung dịch dính vào mắt, da.
KEO DÁN ĐA NĂNG THẾ HỆ MỚI - BÁM DÍNH MẠNH MẼ HƠN 80 LẦN KEO 502 -
LOẠI TỐT NHẤT THỊ TRƯỜNG KHÔ NHANH CẤP TỐC SAU 30 GIÂY CHỐNG THẤM NƯỚC VÀ VA ĐẬP 
> ------------ TÍNH NĂNG NỔI BẬT -------------
Khác biệt với các loại keo truyền thống, KEO DÁN ĐA NĂNG THẾ HỆ MỚI được nâng cấp các tính năng để đáp ứng mọi nhu cầu sử dụng của bạn:
Bám dính mạnh mẽ hơn 80 lần so với keo 502 truyền thống. T ối ưu thời gian dính chỉ sau 30 giây, tiết kiệm thời gian sửa chữa. Gắn kết đa dạng chất liệu: gốm sứ, kim loại, nhựa, dép xốp, đồ ghỗ, gương, trang sức, đồ thủ công,linh kiện điện tử Không gây ố bẩn vết dính. Tạo nên sự gắn kết trong suốt hoàn hảo. Mùi nhẹ dịu, không gây khó chịu khi sử dụng, an toàn và thân thiện môi trường.
------------ THÔNG TIN SẢN PHẨM -------------Kích thước: 122 x 38 mmDung tích: 30 mlPhân loại: dung dịchMùi hương: ít mùi Hạn sử dụng: 18 thángThời gian phát huy công hiệu: sau 30 giây Bảo quản: tránh ánh nắng trực tiếp, đậy nắp sau khi sử dụng






Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (119, N'Cuộn Ron Dán Che Khe Cửa,Chân Cửa HT SYS - Chống Nước - Chống Gió Lùa - Chống Ồn - Bụi Bẩn - Ngăn Côn Trùng Cuộn Dài 2 Mét', N'50.000 ₫', N'image/00bc1a413b283d5d70f541bed96ef65e.jpg', N'Bước 1: Vệ sinh thật sạch bề mặt cần dán. Bước 2: Đo chiều cửa cửa sổBước 3: Cắt ron cửa HT SYS khít với chiều dài cửa đã đo. Bước 4: Dán ron cẩn thận lên bề mặt, miết chắc chắn, tránh gỡ ra dán lại nhiều lần.
Túi OPP: gồm 01 cuộn dài 2 mét
 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (120, N'Bộ dụng cụ nâng và di chuyển đồ thông minh, Dụng cụ di chuyển đồ đạc, Dụng cụ hỗ trợ di chuyển vật nặng', N'145.000 ₫', N'image/45f61952cef51f1f2b4c5c04e6c10b96.png', N'BỘ DỤNG CỤ NÂNG VÀ DI CHUYỂN ĐỒ THÔNG MINH
Hỗ trợ di chuyển vật dụng nặng: tủ lạnh, két sắt, tủ, giường,ết kiệm thời gian, nhân lực, tăng năng suất lao động. Giảm các nguy cơ chấn thương, tai nạn nghề nghiệp không đáng có.
CÁC TIỆN ÍCH MANG LẠI:
- Dễ dàng sử dụng xung quanh nhà, sắp xếp lại toàn bộ ngôi nhà hay chỉ đơn giản là điều chỉnh vị trí của một vài đồ vật.
- Là dụng cụ hỗ trợ không thể thiếu giúp giảm các nguy cơ chấn thương, tai nạn nghề nghiệp không đáng có khi khiêng nặng quá sức trong quá trình di chuyển, bê đồ vật
- Bộ sản phẩm bao gồm một tay nâng và hệ 4 con lăn. Tay nâng được làm từ chất liệu thép siêu cứng và siêu bền. Con lăn với các bánh xe được làm từ nhựa ABS chịu lực cao, có khả năng xoay 360 độ giúp bạn dễ dàng di chuyển vật dụng đến đúng vị trí mình mong muố
- Dùng để di chuyển vật dụng nặng: tủ lạnh, két sắt, tủ, giường,
- Tiết kiệm thời gian, nhân lực, tăng năng suất lao động.
- Chất liệu chế tạo tay nâng bằng hợp kim thép cao cấp, con lăn bánh xe làm từ nhựa ABS chịu lực tốt.
- Con lăn bánh xe xoay 360°, giúp dễ dàng di chuyển đồ.
- Tải trọng di chuyển tối đa mỗi còn lăn lên đến 150kg, Tổng tải trọng di chuyển là 600kg.
Thông tin sản phẩm:
Một bộ sản phẩm gồm: 1 tay nâng và 4 bánh xe chât liệu nhựa ABS và thép chất lượng cao.


Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (121, N'Máy khoan bắn vít cầm tay  dùng nguồn điện trực tiếp', N'269.000 ₫', N'image/05c83c13f302a6e4b766d34825eec72c.jpg', N'Máy khoan bắn vít cầm tay dùng nguồn điện trực tiếp 
 
 

 

Máy thích hợp sử dụng cho nhiều công việc từ những việc gia đình như khoan tường treo tranh, giá sách, bắt tất kê, khoan gỗ,đến những công việc ngoài công trường hoặc xưởng chế tạo như khoan bê tông mỏng, khoan kim loại, làm nhôm kính…
 
 

 
Công suất: 880WKhả năng khoan thép/ gỗ: 10/ 20mmTốc độ không tải: 0-3.000v/pĐầu cặp: dùng mũi từ 0.8mm đến 10mmChức năng : Đảo chiềuNguồn điện : 220vBộ sản phẩm gồm : 1 máy khoan + 1 hộp giấy





 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (122, N'Keo dán siêu dính X2000 (50g) dán gỗ, sắt, sứ, kim loại đa năng', N'23.999 ₫', N'image/b98d2798a6ed7a4b6dfca64bc458e640.jpg', N'1.Tính năng ưu việtKeo X2000 là loại keo dán sắt – keo dán kim loại chuyên dụng với thành phần chính là a-xyannoacrylic axit. Đây là một thành phần đơn, có độ nhớt thấp và trong suốt. Với khả năng gắn kết tuyệt vời, X200 có thể gắn kết các bề mặt kim loại hay sắt của các chất liệu khác nhau. Biên độ chịu nhiệt rộng từ – 50 °C đến 80 °C. Khả năng chống chịu ngoại lực cao. Không thấm nước và chống hóa chất. Miễn nhiễm với các loại dung môi, axit và kiềm. Keo dán sắt tạo thành gắn kết chắc chắn giữa các bề mặt sắt, kim loại.
Trên thị trường hiện nay có nhiều loại keo dán sắt hay keo dán kim loại. Tuy nhiên, chỉ có những loại chất lượng mới có thể khiến các bề mặt kim loại liền nhau hoàn toàn. Keo X2000 có dạng loãng nên rất dễ sử dụng. Keo không bị đông cứng ở nhiệt độ thường (dưới 28°C) nên thời huạn sử dụng rất lâu.

 
2. Lưu ý khi sử dụngLưu ý đầu tiên là vệ sinh sạch sẽ bề mặt dán. Hãy làm sạch và làm khô bề mặt để gắn kết. Việc vệ sinh này cũng giúp bạn có thể sử dụng keo dán sắt – keo dán kim loại tiết kiệm và hiệu quả hơn.
Lưu ý thứ hai là hãy sử dụng một lượng nhỏ vừa đủ cho một bề mặt thôi. Hãy sử dụng tiết kiệm để có hiệu quả tốt nhất nhé !
Lưu ý thứ ba là tránh tiếp xúc với da. Nếu dính vào da, hãy ngâm nước ấm hoặc xà phòng, không dùng khan giấy.
Lưu ý thứ tư là nên dùng nơi thoáng khí.
Keo dán sắt – Keo dán kim loại

 
3. Ứng dụngKeo dán sắt – Keo dán kim loại X2000 có nhiều công dụng khác. Nó có khả năng gắn dính hầu như tất cả mọi loại vật liệu như :
Nhôm với sắtSắt với gỗSắt với nhựaNhựa với gỗGỗ với gỗBê tôngNgoài ra, nó có thể dán trám các vết nứt hay lấp kin các rò rỉ, rổ bề mặt chỉ bằng một vài giọt keo. Khả năng chống chịu cao. Vết rạn nứt được keo X2000 nối liền có thời hạn lâu dài vĩnh viễn cho các máy móc, đồ gia dụng, dụng cụ cầm tay và các động cơ. Keo dán sắt được sứng dụng nhiều trong sửa chữa ở các công trình dân dụng hay nhà công nghiệp. Vì vậy, nó được phân phối rộng rãi ở các cửa hàng đại lý khác nhau.
 





Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (123, N'Xe đẩy hàng 4 bánh SUMIKA T300 - Khung thép, tay cầm gấp mở tiện lợi, tải trọng 300kg', N'1.390.000 ₫', N'image/1a3c44c041edcc906cee23b5906af115.jpg', N'Xe đẩy hàng SUMIKA T300 di chuyển linh hoạt, dễ dàng.
- T300 là dòng xe đẩy hàng đa năng 1 tầng với kích thước tiêu chuẩn khi mở rộng là 69x90x89.5cm (Dài x Rộng x Cao), giúp bạn thao tác dễ dàng và nhanh hơn. Thiết kế nhỏ gọn, dễ dàng gập tay cầm xuống và cất dưới gầm bàn, gầm ghế hay cho dựa vào tường mà không sợ tốn diện tích. 
 

 
- Xe đẩy hàng SUMIKA T300 với khung xe được làm bằng thép siêu bền có độ bền cao, không bị biến dạng khi va đập mạnh và có thể chịu được tải trọng lên đến 300kg. 
 

 - Tay cầm của xe có độ cao phù hợp với người Việt Nam nên người dùng không phải cúi khom người khi đẩy (người cao 1m4 - 1m8 đều có thể dùng được), không gây đau lưng khi sử dụng lâu dài.
 


Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (124, N'Xe đẩy hàng 4 bánh SUMIKA T150 - Khung thép, tay cầm gấp mở tiện lợi, tải trọng 150kg', N'990.000 ₫', N'image/276569e0403e60e65b56c7df5c3d68f9.jpg', N'Xe đẩy hàng SUMIKA T150 di chuyển linh hoạt, dễ dàng.
- T150 là dòng xe đẩy hàng đa năng 1 tầng với kích thước tiêu chuẩn khi mở rộng là 47cmx73cmx86cm (Dài x Rộng x Cao), giúp bạn thao tác dễ dàng và nhanh hơn. Thiết kế nhỏ gọn, dễ dàng gập tay cầm xuống và cất dưới gầm bàn, gầm ghế hay cho dựa vào tường mà không sợ tốn diện tích. 
 

 
- Xe đẩy hàng SUMIKA T150 với khung xe được làm bằng thép siêu bền có độ bền cao, không bị biến dạng khi va đập mạnh và có thể chịu được tải trọng lên đến 150kg.
 

 - Tay cầm của xe có độ cao phù hợp với người Việt Nam nên người dùng không phải cúi khom người khi đẩy (người cao 1m4 - 1m8 đều có thể dùng được), không gây đau lưng khi sử dụng lâu dài.
 


Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (125, N'Máy vặn vít dùng pin Bosch go gen 2 Mới', N'971.000 ₫', N'image/29a3cc0f246fad6edb706aa688c601adb7.jpg', N'Bạn mất quá nhiều thời gian để chọn được loại vít phù hợp để vặn ốc của các thiết bị máy móc, kệ treo thường,… nhưng vẫn không thực sự hiệu quả và tốn thêm chi phí mua các loại vít với đầu vít khác nhau. Đã đến lúc phải sở hữu Máy vặn vít dùng pin Bosch go gen 2 với đầy đủ các dụng cụ đáp ứng đủ nhu cầu của bạn. 
 
THÔNG SỐ KỸ THUẬT
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (126, N'Xe đẩy hàng 4 bánh SUMIKA T150 - Khung thép, tay cầm gấp mở tiện lợi, tải trọng 150kg', N'990.000 ₫', N'image/276569e0403e60e65b56c7df5c3d68f9.jpg', N'Xe đẩy hàng SUMIKA T150 di chuyển linh hoạt, dễ dàng.
- T150 là dòng xe đẩy hàng đa năng 1 tầng với kích thước tiêu chuẩn khi mở rộng là 47cmx73cmx86cm (Dài x Rộng x Cao), giúp bạn thao tác dễ dàng và nhanh hơn. Thiết kế nhỏ gọn, dễ dàng gập tay cầm xuống và cất dưới gầm bàn, gầm ghế hay cho dựa vào tường mà không sợ tốn diện tích. 
 

 
- Xe đẩy hàng SUMIKA T150 với khung xe được làm bằng thép siêu bền có độ bền cao, không bị biến dạng khi va đập mạnh và có thể chịu được tải trọng lên đến 150kg.
 

 - Tay cầm của xe có độ cao phù hợp với người Việt Nam nên người dùng không phải cúi khom người khi đẩy (người cao 1m4 - 1m8 đều có thể dùng được), không gây đau lưng khi sử dụng lâu dài.
 


Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (127, N'Thang ghế 3 bậc kết hợp xe đẩy hàng Kachi MK183', N'820.000 ₫', N'image/6cbf20d0e9a173481017f70b291aec31.jpg', N'Khung thép, bậc nhôm

Thùng carton 48× 7.5 ×118cm

Thang nhôm đa năng kết hợp xe đẩu hàng Kachi MK-183 được tích hợp 2 trong 1 sản phẩm. Thang được thiết kế giống với các sản phẩm thang nhôm ghế thông thường với phần tay cầm và mặt bậc rộng rãi. 


 
Thang nhôm kết hợp xe đẩy hàng đa năng Kachi MK-183 là công cụ hỗ trợ tuyệt vời cho nhiều mục đích sử dụng với thiết kế thông minh đầy sáng tạo với sự kết hợp hoàn hảo của chiếc thang nhôm tiện dụng cho các công việc tầm cao và xe đẩy hỗ trợ vận chuyển hàng hóa. Đa chức năng cho nhiều mục đích sử dụng khác nhau giúp người dùng có thể thoải mái xử lý công việc và đạt được các kết quả cao nhất một cách dễ dàng.

 
Khung của Thang nhôm kết hợp xe đẩy hàng đa năng Kachi MK-183 làm từ chất liệu thép định hình, vừng chắc. Cùng các bậc thang nhôm nhám bám chắc chân.
Chiều cao sử dụng của thang nhôm kết hợp xe đẩy Kachi MK-183 là 74cm (chiều cao tính từ mặt đất lên đến mặt bậc trên cùng) bao gồm 3 bậc thang. Khi đứng trên bậc trên dùng tựa đầu gối vào phần tay cầm của thang sẽ tạo cảm giác chắc chắn cho người sử dụng. Đặc biệt an toàn đối với phụ nữ và người cao tuổi.

Mặt bậc được thiết kế dạng nhám giúp bạn yên tâm không sợ trượt chân khi đứng trên thang. Chân thang đằng trước có gắn hai bánh xe đây là bánh xe khi sử dụng với chức năng xe đẩy hàng.
Thang có thiết kế giá đỡ có thể gấp gọn linh hoạt cho việc đẩy hàng hóa, cùng bánh xe có thể gấp gọn tiện dụng, không chiếm diện tích.


 
Để sử dụng chức năng đẩy hàng: bạn chỉ cần gấp gọn bậc thang và kéo phần giá đỡ ra là có thể sử dụng được thành dạng xe đẩy. Phần tay cầm của thang cũng biến thành phần tay kéo cho xe đẩy hàng. Khi cần di chuyển hàng hóa bạn sẽ đặt hàng hóa lên mặt sàn và di chuyển như những chiếc xe đẩy hàng thông thường với tải trọng xe đẩy là 60kg. Phù hợp với mục đích sử dụng cho gia đình.
Tải trọng thang lên đến 120kg, làm việc trên sản phẩm thoải mái mà không lo xảy ra bất kỳ vấn đề nào đáng lo. Tải trọng xe đẩy đạt 60kg vận chuyển được nhiều hàng hóa hơn.
Bạn có thể gấp gọn thang lại sau khi sử dụng nhằm tiết kiệm không gian
THÔNG SỐ SẢN PHẨMModel: MK-183
Chất liệu chính: Khung thép, bậc nhôm
Chiều rộng mỗi bậc thang: 8cm
Khối lượng (N.w): 7.2kg
Khối lượng (G.w): 8.2kg
Kích thước sản phẩm: 67× 47.5 ×106.5cm
Kích thước đóng thùng: 48× 7.5 ×118cm
Xuất xứ thương hiệu: Việt Nam
Sản xuất tại: Trung Quốc
Hình ảnh thực tế: 


Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (128, N'Keo dán siêu dính X2000 (50g) dán gỗ, sắt, sứ, kim loại đa năng', N'23.999 ₫', N'image/b98d2798a6ed7a4b6dfca64bc458e640.jpg', N'1.Tính năng ưu việtKeo X2000 là loại keo dán sắt – keo dán kim loại chuyên dụng với thành phần chính là a-xyannoacrylic axit. Đây là một thành phần đơn, có độ nhớt thấp và trong suốt. Với khả năng gắn kết tuyệt vời, X200 có thể gắn kết các bề mặt kim loại hay sắt của các chất liệu khác nhau. Biên độ chịu nhiệt rộng từ – 50 °C đến 80 °C. Khả năng chống chịu ngoại lực cao. Không thấm nước và chống hóa chất. Miễn nhiễm với các loại dung môi, axit và kiềm. Keo dán sắt tạo thành gắn kết chắc chắn giữa các bề mặt sắt, kim loại.
Trên thị trường hiện nay có nhiều loại keo dán sắt hay keo dán kim loại. Tuy nhiên, chỉ có những loại chất lượng mới có thể khiến các bề mặt kim loại liền nhau hoàn toàn. Keo X2000 có dạng loãng nên rất dễ sử dụng. Keo không bị đông cứng ở nhiệt độ thường (dưới 28°C) nên thời huạn sử dụng rất lâu.

 
2. Lưu ý khi sử dụngLưu ý đầu tiên là vệ sinh sạch sẽ bề mặt dán. Hãy làm sạch và làm khô bề mặt để gắn kết. Việc vệ sinh này cũng giúp bạn có thể sử dụng keo dán sắt – keo dán kim loại tiết kiệm và hiệu quả hơn.
Lưu ý thứ hai là hãy sử dụng một lượng nhỏ vừa đủ cho một bề mặt thôi. Hãy sử dụng tiết kiệm để có hiệu quả tốt nhất nhé !
Lưu ý thứ ba là tránh tiếp xúc với da. Nếu dính vào da, hãy ngâm nước ấm hoặc xà phòng, không dùng khan giấy.
Lưu ý thứ tư là nên dùng nơi thoáng khí.
Keo dán sắt – Keo dán kim loại

 
3. Ứng dụngKeo dán sắt – Keo dán kim loại X2000 có nhiều công dụng khác. Nó có khả năng gắn dính hầu như tất cả mọi loại vật liệu như :
Nhôm với sắtSắt với gỗSắt với nhựaNhựa với gỗGỗ với gỗBê tôngNgoài ra, nó có thể dán trám các vết nứt hay lấp kin các rò rỉ, rổ bề mặt chỉ bằng một vài giọt keo. Khả năng chống chịu cao. Vết rạn nứt được keo X2000 nối liền có thời hạn lâu dài vĩnh viễn cho các máy móc, đồ gia dụng, dụng cụ cầm tay và các động cơ. Keo dán sắt được sứng dụng nhiều trong sửa chữa ở các công trình dân dụng hay nhà công nghiệp. Vì vậy, nó được phân phối rộng rãi ở các cửa hàng đại lý khác nhau.
 





Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (129, N'Ê tô kẹp bàn mini', N'32.000 ₫', N'image/84f9bdaec22ee433d5e7ec2a9dba71ab.jpg', N'Khi bạn sửa chữa những đồ vật nhỏ mà cần cố định nó để thao tác trở lên dễ dàng thì chiếc ê tô kẹp bàn mini này chính là một trợ thủ đắc lực không thể thiếu. Đặc biệt cho những bạn nào đam mê sửa chữa mà bị mất một cánh tay hoặc 1 tay bị đau...
Kích thước tổng thể: 93*83mm
Độ mở kẹp bàn tối đa: 35mm
Độ mở tối đa của ê tô: 30mm    
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (130, N'Bộ dụng cụ nâng và di chuyển đồ thông minh, Dụng cụ di chuyển đồ đạc, Dụng cụ hỗ trợ di chuyển vật nặng', N'145.000 ₫', N'image/45f61952cef51f1f2b4c5c04e6c10b96.png', N'BỘ DỤNG CỤ NÂNG VÀ DI CHUYỂN ĐỒ THÔNG MINH
Hỗ trợ di chuyển vật dụng nặng: tủ lạnh, két sắt, tủ, giường,ết kiệm thời gian, nhân lực, tăng năng suất lao động. Giảm các nguy cơ chấn thương, tai nạn nghề nghiệp không đáng có.
CÁC TIỆN ÍCH MANG LẠI:
- Dễ dàng sử dụng xung quanh nhà, sắp xếp lại toàn bộ ngôi nhà hay chỉ đơn giản là điều chỉnh vị trí của một vài đồ vật.
- Là dụng cụ hỗ trợ không thể thiếu giúp giảm các nguy cơ chấn thương, tai nạn nghề nghiệp không đáng có khi khiêng nặng quá sức trong quá trình di chuyển, bê đồ vật
- Bộ sản phẩm bao gồm một tay nâng và hệ 4 con lăn. Tay nâng được làm từ chất liệu thép siêu cứng và siêu bền. Con lăn với các bánh xe được làm từ nhựa ABS chịu lực cao, có khả năng xoay 360 độ giúp bạn dễ dàng di chuyển vật dụng đến đúng vị trí mình mong muố
- Dùng để di chuyển vật dụng nặng: tủ lạnh, két sắt, tủ, giường,
- Tiết kiệm thời gian, nhân lực, tăng năng suất lao động.
- Chất liệu chế tạo tay nâng bằng hợp kim thép cao cấp, con lăn bánh xe làm từ nhựa ABS chịu lực tốt.
- Con lăn bánh xe xoay 360°, giúp dễ dàng di chuyển đồ.
- Tải trọng di chuyển tối đa mỗi còn lăn lên đến 150kg, Tổng tải trọng di chuyển là 600kg.
Thông tin sản phẩm:
Một bộ sản phẩm gồm: 1 tay nâng và 4 bánh xe chât liệu nhựa ABS và thép chất lượng cao.


Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (131, N'Cuộn Ron Dán Che Khe Cửa,Chân Cửa HT SYS - Chống Nước - Chống Gió Lùa - Chống Ồn - Bụi Bẩn - Ngăn Côn Trùng Cuộn Dài 2 Mét', N'50.000 ₫', N'image/00bc1a413b283d5d70f541bed96ef65e.jpg', N'Bước 1: Vệ sinh thật sạch bề mặt cần dán. Bước 2: Đo chiều cửa cửa sổBước 3: Cắt ron cửa HT SYS khít với chiều dài cửa đã đo. Bước 4: Dán ron cẩn thận lên bề mặt, miết chắc chắn, tránh gỡ ra dán lại nhiều lần.
Túi OPP: gồm 01 cuộn dài 2 mét
 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (132, N'Cuộn Ron Dán Che Khe Cửa,Chân Cửa HT SYS - Chống Nước - Chống Gió Lùa - Chống Ồn - Bụi Bẩn - Ngăn Côn Trùng Cuộn Dài 2 Mét', N'50.000 ₫', N'image/00bc1a413b283d5d70f541bed96ef65e.jpg', N'Bước 1: Vệ sinh thật sạch bề mặt cần dán. Bước 2: Đo chiều cửa cửa sổBước 3: Cắt ron cửa HT SYS khít với chiều dài cửa đã đo. Bước 4: Dán ron cẩn thận lên bề mặt, miết chắc chắn, tránh gỡ ra dán lại nhiều lần.
Túi OPP: gồm 01 cuộn dài 2 mét
 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (133, N'Bút thử nước TDS, dụng cụ đo TDS, máy đo độ cứng của nước - Hàng chính hãng', N'150.000 ₫', N'image/65dabeca667b93081d3b439dde36206d.png', N'Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (134, N'Khoan pin 21v Máy khoan bắt vít 21v', N'395.000 ₫', N'image/a90c117e7186a732539699e903bfc93b.jpg', N'UY TÍN- CHẤT LƯỢNG
CAM KẾT HỖ TRỢ ĐỔI TRẢ BẢO HÀNH TỐT NHẤT

KHOAN PIN HITACHI 21V ( Bộ sản phẩm gồm thân máy + 1 pin sạc và tặng 4 mũi khoan )

                                                           THÔNG SỐ KỸ THUẬT
- Điện thế pin: 21V - Loại Pin: Max Lithiium-ion 
- Lực siết/mở vít : Cứng (30Nm); Mềm (20Nm) 
- Dung lượng pin: 3 Ah 
- Kích thước sản phẩm: 25x 15x 8 cm 
- Trọng lượng cả hộp: 1.4 kg ( hộp carton ) 
- Tốc độ không tải: Cao (0 - 1.550 vòng/phút); Thấp (0 - 550 vòng/phút) 
- Sản xuất : Theo Dây chuyền JANPAN

PIN SIÊU TRÂU DÙNG ĐƯỢC 4 - 5 TIẾNG

BỘ SẢN PHẨM ĐẦY ĐỦ BAO GỒM THÂN MÁY, SẠC, PIN
VÀ TĂNG 2 MŨI BẮT VÍT

CÁC CHỨC NĂNG NỔI BẬT CỦA MÁY: CÓ ĐÈN LED  SIÊU SÁNG
25 CẤP ĐỘ SIẾT, CHỨC NĂNG ĐẢO CHIỀU, 2 TỐC ĐỘ

MÁY CÓ THỂ DỄ DÀNG XUYÊN QUA TƯỜNG, GỖ, SẮT
VÀ BẮT VÍT MỘT CÁCH NHANH GỌN

BẢO HÀNH 1 NĂM KHI MUA MÁY TẠI CỬA HÀNG
CÒN CHẦN CHỪ GÌ MÀ KHÔNG MUA NGAY CHIẾC
Khoan pin 21V VỀ SỬ DỤNG
SHOP CAM KẾT
Cam kết tất cả sản phẩm bên ngoài giống như trong ảnh 
Cam kết về chất lượng và dịch vụ bán hàng
Cung cấp các sản phẩm theo đúng tiêu chuẩn với chất lượng tốt nhất
Đáp ứng mọi yêu cầu của khách hàng trong thời gian ngắn nhất
Đảm bảo về số lượng và đúng chủng loại khách đặt
Tư vấn miễn phí 24/24 cho quý khách hàng về các sản phẩm của chúng tôi, bất cứ thắc mắc gì trước và sau khi mua sản phẩm
CHÚC QUÝ KHÁCH THAM QUAN VÀ MUA SẮM VUI VẺ!!
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (135, N'Nhiệt ẩm kế điện tử phòng ngủ', N'162.990 ₫', N'image/08ed3eabbde11faa84eaff3f31985e21.jpg', N'Nhiệt Ẩm Kế Đo Nhiệt Độ phòng ngủ
Mua Nhiệt Ẩm Kế thì Dễ, nhưng mua máy đo có độ chính xác cao mới là khó ?
Thông số của máy:Màu sắc: TrắngCông dụng: Đo nhiệt độ.Chức năng hẹn giờ: khôngNăng lượng sử dụng: Pin Chất liệu: ABS, PSHiển thị: Nhiệt độ, Độ ẨmKích thước: 10x10x2 cm
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (136, N'Thang ghế 3 bậc kết hợp xe đẩy hàng Kachi MK183', N'820.000 ₫', N'image/6cbf20d0e9a173481017f70b291aec31.jpg', N'Khung thép, bậc nhôm

Thùng carton 48× 7.5 ×118cm

Thang nhôm đa năng kết hợp xe đẩu hàng Kachi MK-183 được tích hợp 2 trong 1 sản phẩm. Thang được thiết kế giống với các sản phẩm thang nhôm ghế thông thường với phần tay cầm và mặt bậc rộng rãi. 


 
Thang nhôm kết hợp xe đẩy hàng đa năng Kachi MK-183 là công cụ hỗ trợ tuyệt vời cho nhiều mục đích sử dụng với thiết kế thông minh đầy sáng tạo với sự kết hợp hoàn hảo của chiếc thang nhôm tiện dụng cho các công việc tầm cao và xe đẩy hỗ trợ vận chuyển hàng hóa. Đa chức năng cho nhiều mục đích sử dụng khác nhau giúp người dùng có thể thoải mái xử lý công việc và đạt được các kết quả cao nhất một cách dễ dàng.

 
Khung của Thang nhôm kết hợp xe đẩy hàng đa năng Kachi MK-183 làm từ chất liệu thép định hình, vừng chắc. Cùng các bậc thang nhôm nhám bám chắc chân.
Chiều cao sử dụng của thang nhôm kết hợp xe đẩy Kachi MK-183 là 74cm (chiều cao tính từ mặt đất lên đến mặt bậc trên cùng) bao gồm 3 bậc thang. Khi đứng trên bậc trên dùng tựa đầu gối vào phần tay cầm của thang sẽ tạo cảm giác chắc chắn cho người sử dụng. Đặc biệt an toàn đối với phụ nữ và người cao tuổi.

Mặt bậc được thiết kế dạng nhám giúp bạn yên tâm không sợ trượt chân khi đứng trên thang. Chân thang đằng trước có gắn hai bánh xe đây là bánh xe khi sử dụng với chức năng xe đẩy hàng.
Thang có thiết kế giá đỡ có thể gấp gọn linh hoạt cho việc đẩy hàng hóa, cùng bánh xe có thể gấp gọn tiện dụng, không chiếm diện tích.


 
Để sử dụng chức năng đẩy hàng: bạn chỉ cần gấp gọn bậc thang và kéo phần giá đỡ ra là có thể sử dụng được thành dạng xe đẩy. Phần tay cầm của thang cũng biến thành phần tay kéo cho xe đẩy hàng. Khi cần di chuyển hàng hóa bạn sẽ đặt hàng hóa lên mặt sàn và di chuyển như những chiếc xe đẩy hàng thông thường với tải trọng xe đẩy là 60kg. Phù hợp với mục đích sử dụng cho gia đình.
Tải trọng thang lên đến 120kg, làm việc trên sản phẩm thoải mái mà không lo xảy ra bất kỳ vấn đề nào đáng lo. Tải trọng xe đẩy đạt 60kg vận chuyển được nhiều hàng hóa hơn.
Bạn có thể gấp gọn thang lại sau khi sử dụng nhằm tiết kiệm không gian
THÔNG SỐ SẢN PHẨMModel: MK-183
Chất liệu chính: Khung thép, bậc nhôm
Chiều rộng mỗi bậc thang: 8cm
Khối lượng (N.w): 7.2kg
Khối lượng (G.w): 8.2kg
Kích thước sản phẩm: 67× 47.5 ×106.5cm
Kích thước đóng thùng: 48× 7.5 ×118cm
Xuất xứ thương hiệu: Việt Nam
Sản xuất tại: Trung Quốc
Hình ảnh thực tế: 


Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (137, N'Máy hàn điện tử, máy hàn mini GGG420, máy hàn que 2,5 -Bộ phụ kiện đầy đủ dây hàn + dây mát+ kèm kẹp, mo hàn', N'758.000 ₫', N'image/2a6cff7d65bd9b9c8cd32c42c3677a57.jpg', N'Cách lắp dây: dây màu nào lắp với chân máy máy màu đó
Hàn que 2.5: Chỉnh dòng 360-370
Được thiết kế ứng dụng công nghệ tiết kiệm tiên tiến Inverter, Máy hàn que điện tử GGG có khả năng tiết kiệm điện lên đến 50% – 60% so với máy hàn que truyền thống, có thể hàn được tốt cửa sắt, Inox, vật dụng gia đình, công nghiệp, xây dự
Máy hàn que điện tử có thiết kế thông minh, nhỏ gọn giúp việc sử dụng và di chuyển một cách linh hoạt và an toàn. 
 Máy được thiết kế với dòng điện lưu 120A, có thể làm việc được với các que hàn kích thước 1,6-2,5mm.
Máy Có chế độ bảo vệ quá nhiệt, quá tải với nguồn điện không ổn định. 
Đồng hồ hiển thị dòng hàn bằng kỹ thuật số tăng hiệu suất làm việc và thời gian hàn không giới hạn. Cọc cắm được thiết kế lớn hơn so với những loại máy hàn cũ giúp nguồn điện đầu ra được mạnh và ổn định hơn khi làm việc.
Vỏ máy được sơn bằng tĩnh điện, giúp cho máy có độ bền cao hơn, chịu được ở môi trường khắc nghiệt, tăng khả năng chống chọi với oxi hóa trong thời gian dài. 
Bộ phụ kiện đi kèm máy VÔ CÙNG HẤP DẪN:
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (138, N'Thang nhôm rút gọn SUMIKA SK440 - Chiều cao tối đa 4.4m, chiều dài rút gọn 0.92m', N'1.685.000 ₫', N'image/0abc74a5542f0b0a22d78dbff4eb2a90.jpg', N'Thang Nhôm Rút Gọn Sumika SK440 được thiết kế thông minh với kiểu rút gọn, bạn có thể sử dụng ở nhiều độ cao khác nhau bằng cách kéo lên, rút xuống linh hoạt. Sản phẩm được sử dụng rộng rãi trong gia đình, trang trí nội thất, dùng trong nhà và ngoài trời. Đặc biệt còn được ứng dụng nhiều trong ngành bưu điện, điện lực, truyền hình cáp, Có thể phục vụ cho nhiều mục đích sử dụng khác nhau với chiều cao hợp lý của mình.
 

 
Sản phẩm được làm bằng chất liệu nhôm dày với độ dày 1.2 - 1.5 mm, chống móp méo, tránh tác động, chịu được lực cao. Chống lại sự oxy hoá khi tiếp xúc với môi trường bên ngoài và chịu được nhiệt khi dùng ở ngoài trời.
Đặc biệt, mỗi bậc thang được trang bị chốt khoá nhựa, cố định, chắc chắn, bậc thang đủ chắc giúp người dùng leo lên xuống thoải mái. Hơn nữa, chân than có đế cao su chống trơn trượt, đảm bảo an toàn cho người sử dụng và chống trầy sàn nhà bạn, giúp người sử dụng an tâm hơn.
 

 
Thang Nhôm Rút Gọn Sumika đươc thiết kế với số bậc thang là 15, trọng lượng nhẹ có thể xách tay dễ dàng cùng với thao tác sử dụng đơn giản: Mở rộng, rút ra theo từng bậc, dễ vận hành và sử dụng. Kích thước nhỏ gọn, thuận tiện để cất giữ trong không gian nhỏ. Ngoài ra sản phẩm có khóa gấp tự động với mức tải trọng lên đến 300kg đã đạt được tiêu chuẩn châu Âu EN131, đảm bảo an toàn cho bạn.
 

 
Thang nhôm rút gọn SUMIKA Model: SK440- Kích thước: 50x10x94cm- Chiều cao tối đa: 4.4m- Chiều dài rút gọn: 0.92m- Trọng lượng 12,3 kg- Số bậc: 15 bậc- Khoảng cách bậc: 30cm- Độ dày nhôm: 1,2-1,5 mm- Tải trọng 300kg, tiêu chuẩn EN131
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (139, N'Máy Khoan Động Lực Bosch GSB 550 Set Và Bộ Dụng Cụ 100 Chi Tiết', N'1.359.000 ₫', N'image/8f80385390cfdbe1f26b951eb7b414ff4c.jpg', N'Máy Khoan Động Lực Bosch GSB 550 SET Và Bộ Dụng Cụ 100 Chi Tiết   được thiết kế với nhiều dụng cụ đi kèm nhằm hỗ trợ tối đa cho nhu cầu sử dụng của người tiêu dùng. Máy có công suất hoạt     động lớn cùng mũi khoan được làm từ chất liệu cao cấp giúp bề mặt được xử lý nhanh chóng cùng với màu xanh dương mang đến     cảm giác thoải mái và dịu nhẹ cho người sử dụng.
 Bộ sản phẩm gồm: 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (140, N'Bộ Tua Vít Bỏ Túi Đa Năng 24 Món - Tô Vít Sửa Chữa Mở Điện Thoại Vi Tính cao cấp', N'62.900 ₫', N'image/e8b80cf8757aa2373f563f6abad1a73f.jpg', N'Với Bộ tua vít đa năng  vấn đề của bạn sẽ được giải quyết. Sản phẩm có nhiều kiểu đầu vít khác nhau như: đầu dẹt, tam giác, lục giác, 3 cạnh, 4 cạnh, 5 cạnh và 6 cạnh, mỗi dạng đều có đủ các cỡ từ lớn đến nhỏ nên rất dễ dàng cho bạn trong việc sửa chữa đồ đạc.
Thiết kế gọn gàng giúp người dùng dễ dàng bỏ túi và mang theo bất cứ đâu. Bạn cũng có thể dễ dàng đóng mở


Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (141, N'Xe đẩy hàng 4 bánh SUMIKA T150 - Khung thép, tay cầm gấp mở tiện lợi, tải trọng 150kg', N'990.000 ₫', N'image/276569e0403e60e65b56c7df5c3d68f9.jpg', N'Xe đẩy hàng SUMIKA T150 di chuyển linh hoạt, dễ dàng.
- T150 là dòng xe đẩy hàng đa năng 1 tầng với kích thước tiêu chuẩn khi mở rộng là 47cmx73cmx86cm (Dài x Rộng x Cao), giúp bạn thao tác dễ dàng và nhanh hơn. Thiết kế nhỏ gọn, dễ dàng gập tay cầm xuống và cất dưới gầm bàn, gầm ghế hay cho dựa vào tường mà không sợ tốn diện tích. 
 

 
- Xe đẩy hàng SUMIKA T150 với khung xe được làm bằng thép siêu bền có độ bền cao, không bị biến dạng khi va đập mạnh và có thể chịu được tải trọng lên đến 150kg.
 

 - Tay cầm của xe có độ cao phù hợp với người Việt Nam nên người dùng không phải cúi khom người khi đẩy (người cao 1m4 - 1m8 đều có thể dùng được), không gây đau lưng khi sử dụng lâu dài.
 


Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (142, N'Mỏ hàn thiếc 220V 60W điều chỉnh nhiệt độ kèm phụ kiện - CK10', N'119.000 ₫', N'image/192d136b376198f08d975cb356394549.jpg', N'Kim loại, khác
Dây đồng phủ TPE
hộp
1




Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (143, N'Miếng xốp bọc chân cửa chắn gió chống bụi, ngăn tiếng ồn, ngăn côn trùng 93 x 9.6cm', N'24.993 ₫', N'image/8a227df4f70d8bff25f5daf72a2c2ca6.png', N'Xốp EVA
 
Điểm nổi bật:
- Miếng xốp bọc chân cửa là sản phẩm tiện ích cho gia đình giúp làm kín các khe hở giữa các cánh cửa, dưới chân cửa mà không gây tổn hại đến cửa hoặc sàn nhà, ngăn chặn bụi từ bên ngoài len qua các chân cửa.
- Chất liệu xốp EVA có độ đàn hồi và độ dẻo cao, chịu sự va đập mà không bị biến dạng, đảm bảo thời gian sử dụng lâu bền.
- Sản phẩm bọc và bịt kín khe hở của cửa phòng, ngăn chặn côn trùng và bụi bẩn xâm nhập, đồng thời hạn chế thoát gió mát của phòng điều hoà và chắn gió lạnh vào mùa đông.
- Dễ dàng cắt chỉnh và lắp đặt không cần băng keo hay miếng dán, sản phẩm còn giúp hạn chế sự va đập của cửa và tường nhà, ngăn tiếng ồn khi mở và đóng cửa vô cùng tiện lợi.
 
Thông tin sản phẩm:
- Tên sản phẩm: Miếng xốp bọc chân cửa chắn gió chống bụi, ngăn tiếng ồn, ngăn côn trùng
- Chất liệu: Xốp EVA
- Kích thước: 93 x 9.6cm
- Màu sắc: Xám
- Sử dụng cho: Khe cửa < 20mm.







Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (144, N'Đồng Hồ Đo Điện Vạn Năng Ampe Kìm + Bút Thử Điện Cảm Ứng Đa Chức Năng CTFAST An Toàn Tiện Dụng', N'155.000 ₫', N'image/161434b2764fc67dd748af07d107574d.jpg', N'Nhựa ABS cách điện
Bảo quản nơi thoáng mát
Đọc kỹ hướng dẫn sử dụng .
Do dòng tải AC, đo Diode và thông mạch, đo điện áp DC, đo điện áp AC, đo điện trở
Đồng Hồ Đo Điện Vạn Năng Ampe Kìm + Bút Thử Điện Cảm Ứng Đa Chức Năng CTFAST An Toàn Tiện Dụng :  Là Bộ Sản Phẩm Đo Điện Dân Dụng hoàn hảo trong tủ sửa dụng cụ điện của gia đình bạn .Cặp đôi sản phẩm là cánh tay đắc lực cho các bạn khi sửa chữa , thăm dò, đo lường các thiết bị điện trong nhà một cạch an toàn hiệu quả , nhanh chóng.

THÔNG TIN SẢN PHẨM :
1.Đồng Hồ Đo Điện Vạn Năng Ampe Kìm:

- Chức năng:



Hướng dẫn sử dụng:

2.Bút Thử Điện Cảm Ứng Đa Chức Năng CTFAST




 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (145, N'Xe đẩy hàng 4 bánh SUMIKA T300 - Khung thép, tay cầm gấp mở tiện lợi, tải trọng 300kg', N'1.390.000 ₫', N'image/1a3c44c041edcc906cee23b5906af115.jpg', N'Xe đẩy hàng SUMIKA T300 di chuyển linh hoạt, dễ dàng.
- T300 là dòng xe đẩy hàng đa năng 1 tầng với kích thước tiêu chuẩn khi mở rộng là 69x90x89.5cm (Dài x Rộng x Cao), giúp bạn thao tác dễ dàng và nhanh hơn. Thiết kế nhỏ gọn, dễ dàng gập tay cầm xuống và cất dưới gầm bàn, gầm ghế hay cho dựa vào tường mà không sợ tốn diện tích. 
 

 
- Xe đẩy hàng SUMIKA T300 với khung xe được làm bằng thép siêu bền có độ bền cao, không bị biến dạng khi va đập mạnh và có thể chịu được tải trọng lên đến 300kg. 
 

 - Tay cầm của xe có độ cao phù hợp với người Việt Nam nên người dùng không phải cúi khom người khi đẩy (người cao 1m4 - 1m8 đều có thể dùng được), không gây đau lưng khi sử dụng lâu dài.
 


Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (146, N'Nhiệt ẩm kế điện tử phòng ngủ', N'162.990 ₫', N'image/08ed3eabbde11faa84eaff3f31985e21.jpg', N'Nhiệt Ẩm Kế Đo Nhiệt Độ phòng ngủ
Mua Nhiệt Ẩm Kế thì Dễ, nhưng mua máy đo có độ chính xác cao mới là khó ?
Thông số của máy:Màu sắc: TrắngCông dụng: Đo nhiệt độ.Chức năng hẹn giờ: khôngNăng lượng sử dụng: Pin Chất liệu: ABS, PSHiển thị: Nhiệt độ, Độ ẨmKích thước: 10x10x2 cm
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (148, N'Nhiệt ẩm kế Bamboo Life Nhiệt kế điện tử đo nhiệt độ phòng Ẩm kế điện tử đo độ ẩm phòng ngủ thông minh có đèn nhỏ gọn chính xác hàng chính hãng', N'189.000 ₫', N'image/e4cba1d459d2270b26fac6e0f8e9e3e2.jpg', N'Nhiệt ẩm kế Bamboo Life Nhiệt kế điện tử đo nhiệt độ phòng Ẩm kế điện tử đo độ ẩm phòng ngủ thông minh có đèn nhỏ gọn chính xác hàng chính hãng

Nhiệt độ và độ ẩm là 2 yếu tố ảnh hưởng rất lớn để giấc ngủ của bé. Nhiệt độ trên điều hòa sẽ không phản ánh được chính xác nhiệt độ trong phòng vì còn phụ thuộc vào nhiều yếu tố: nhiêt độ bên ngoài, diện tích phòng, vị trí bé nằm. Vì vậy cần có nhiệt ẩm kế để biết chính xác nhiệt độ trong phòng của bé.


Nhiệt ẩm kế có đèn sáng trong 7giây đến 10 giây giúp có thể xem được nhiệt độ trong đêm. 



 
️ Chức năng:
Đo nhiệt độ
Đo độ ẩm
Đồng hồ
️ Thông số kỹ thuật:
Màu sắc: Trắng.
Nhiệt độ đo trong khoảng -50 độ C - 70 độ C, sai số +- 1 độ C.
Kích thước 85*70 mm , kích thước màn: 40*60 mm
Đơn vị hiển thị 0.1 độ C.
Độ ẩm đo trong khoảng 10%RH - 90%RH, sai số +-5%RH
Đơn vị hiển thị 1%.
Sử dụng pin AAA (2 viên). Tặng kèm 2 pin khi mua máy
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (149, N'Găng tay bảo hộ lao động Jogger Superpro - Bao tay lao động chống dầu nhớt, trơn trượt, độ linh hoạt cao - Chính hãng', N'11.000 ₫', N'image/dedfc8e84f2572dd64897faae8eb442e.jpeg', N'GĂNG TAY CHỐNG DẦU JOGGER SUPERPRO 2121 - GĂNG TAY BẢO HỘ LAO ĐỘNG ĐA NĂNG
Được nhập khẩu và phân phối chính thức bởi Xsafe
------
 CẤU TẠO SẢN PHẨM:
- Đảm bảo sự linh hoạt khi thao tác cả với các chi tiết, vật dụng nhỏ. Và khả năng kháng dầu.
 ỨNG DỤNG GĂNG TAY BẢO HỘ JOGGER SUPERPRO 2121
- Superpro là găng tay bảo hộ chống dầu hoàn hảo để tăng hiệu suất làm việc khi thao tác với các chi tiết có dầu,
dính nhớt.
- EN 388:2003
- Chống hao mòn: 4/4
- Chống cắt: 1/5
- Chống rách: 2/4
- Chống đâm xuyên: 1/4
 CHI TIẾT GĂNG TAY BẢO HỘ JOGGER SUPERPRO 2121
- Model: Superpro
- Có thể giặt rửa bình thường (không sử dụng chất tẩy rửa mạnh).
- Bảo quản tránh sương, môi trường băng giá và ánh nắng mặt trời.
 THÔNG TIN CHUNG
THƯƠNG HIỆU Safety Jogger
NHÀ PHÂN PHỐI: Bảo Hộ Xsafe
 TẠI SAO NÊN MUA GĂNG TAY CHỐNG DẦU JOGGER CONSTRUCTO TẠI BẢO HỘ XSAFE ?
- Giá luôn tốt nhất
- Bảo hành chính hãng
-------
[Giải Pháp Bảo Hộ Toàn Diện Cho Doanh Nghiệp Cá Nhân]
* Add: 40/64 Lê Đức Thọ, P7, Q.Gò Vấp, HCM
* 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (150, N'Thang nhôm rút gọn SUMIKA SK320 - Chiều cao tối đa 3.2m, chiều dài rút gọn 0.78m, hợp kim nhôm cao cấp, khóa chốt chắc chắn, đế cao su chống trượt, nhỏ gọn, di chuyển tiện lợi', N'1.180.000 ₫', N'image/393ea3255d13079d1942a23fd35ff5fc.jpg', N'- Đặc điểm nổi bật và chức năng ưu Việt của chiếc thang rút nhôm này là gì? Liệu thang nhôm có đảm bảo an toàn kĩ thuật khi sử dụng? Liệu thang nhôm có chắc chắn và bền bỉ hơn các dòng thang gỗ, tre hay tất cả các vật liệu khác? Thang rút nhôm có dễ sử dụng không? Dưới đây là một số thông tin về thang nhôm Sumika SK320 giúp khách hàng hiểu hơn trước khi lựa chọn cho mình một chiếc thang nhôm phù hợp có thể sử dụng được trong cuộc sống và công việc.

 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (151, N'Bộ Máy Khoan Bắt Vít Không Dây Dùng Pin 24V Kachi MK247 – Đi Kèm 1 Pin - hàng chính hãng', N'768.000 ₫', N'image/5ebcb709dbd46d2dda5c14622f35293b.png', N'dùng pin
Nơi khô ráo
Lắp pin khi sử dụng
Máy khỏe với 2 nấc điều chỉnh tốc độ làm việc. Có chức năng khoan, bắt vít, bắt ốc chống trượt nhiều cấp độ. Hỗ trợ công việc một cách hiệu quả. Máy khoan Kachi MK247 khoan mạnh mẽ với tốc độ thấp 0-400 vòng/phút, và mức cao là 0-1450 vòng/phút.
Pin: 24V Lithium-ION
Mô men xoắn cực đại: 40 N.m
Tốc độ không tải thấp/cao: 0-400/0-1450 vòng/phút
1 hộp
Tốc độ không tải thấp/cao: 0-400/0-1450 vòng/phút
Bộ máy khoan bắt vít không dây dùng Pin 24V Kachi MK247 là một model khoan mới nhất năm nay đến từ thương hiệu Kachi. Bộ máy khoan không dây, dùng pin 24V – đi kèm một pin phụ, giúp khách hàng có thể sử dụng liên tục mà không mất thời gian chờ sạc. Máy có thiết kế nhỏ gọn, với bộ phụ kiện chuyển đổi khoan giúp khoan tường, khoan sắt, gỗ nhanh chóng. Sản phẩm đi kèm vali đựng tiện lợi.
Bộ khoan dùng pin Kachi MK247 được thiết kế nhỏ gọn và vận dụng bằng pin sẽ cho phép bạn sử dụng linh hoạt và tiện lợi hơn. Trọng lượng máy khoan nhẹ chỉ với 1,1kg (bao gồm cả pin) và các phụ kiện đi kèm hơn 2kg giúp thao tác dễ dàng ở mọi ngóc ngách, đặc biệt với những mũi khoan ở chiều cao quá đầu.

- Đảo chiều trái phải.
 - Điều chỉnh tốc độ
 - Khoan tường
 - Khoan sắt
- Bắn vít và rất nhiều ứng dụng
Máy khoan này sử dụng rất phù hợp cho gia đình hoặc thi công công trình nhỏ. Tiện lợi khi các bạn làm việc ở các vị trí khó khăn: bắn vít tường, khoan trần, thi công mành rèm, bóng điện, các vị trí không thể kéo dây điện tới.

Máy khoan Kachi MK247 đi kèm 2 viên pin 24V Lithium/ION cùng sạc. Pin đi kèm có độ bền cao, có thể sử dụng trong một khoản thời gian dài mà không cần sạc liên tục. Ngoài ra Máy được trang bị công nghệ sạc nhanh giúp cho bạn tiết kiệm thời gian chờ,không bị gián đoạn trong công việc.

 
Hơn nữa,  bắt vít không dây dùng Pin 24V Kachi MK247 được trang bị hệ thống đèn báo và đèn LED để bạn có thể nhìn rõ vị trí cần bắn vít hoặc khoan. Đây là một điểm khá nổi bật mà máy được trang bị.

 
Máy khỏe với 2 nấc điều chỉnh tốc độ làm việc. Có chức năng khoan, bắt vít, bắt ốc chống trượt nhiều cấp độ. Hỗ trợ công việc một cách hiệu quả. Máy khoan Kachi MK247 khoan mạnh mẽ với tốc độ thấp 0-400 vòng/phút, và mức cao là 0-1450 vòng/phút.
 
Thương hiệu: Kachi
Model: MK247
Chức năng: khoan tường, khoan gỗ, khoan kim loại…
Pin: 24V Lithium-ION
Mô men xoắn cực đại: 40 N
Tốc độ không tải thấp/cao: 0-400/0-1450 vòng/phút
Kích thước hộp nhựa: 28.7 x 8.4 x 25.1cm
Khối lượng: 2.3kg
Xuất xứ thương hiệu: Việt Nam
Sản xuất tại: Trung Quốc
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (152, N'Bộ Tua Vít Bỏ Túi Đa Năng 24 Món - Tô Vít Sửa Chữa Mở Điện Thoại Vi Tính cao cấp', N'62.900 ₫', N'image/e8b80cf8757aa2373f563f6abad1a73f.jpg', N'Với Bộ tua vít đa năng  vấn đề của bạn sẽ được giải quyết. Sản phẩm có nhiều kiểu đầu vít khác nhau như: đầu dẹt, tam giác, lục giác, 3 cạnh, 4 cạnh, 5 cạnh và 6 cạnh, mỗi dạng đều có đủ các cỡ từ lớn đến nhỏ nên rất dễ dàng cho bạn trong việc sửa chữa đồ đạc.
Thiết kế gọn gàng giúp người dùng dễ dàng bỏ túi và mang theo bất cứ đâu. Bạn cũng có thể dễ dàng đóng mở


Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (153, N'Keo chà ron gạch cao cấp, keo dán mạch gạch siêu bám dính chống thấm nước dung tích 280ml - màu trắng', N'36.499 ₫', N'image/cd91cfe0f33f58974ed7348ca3ef4627.png', N'Keo chà ron gạch cao cấp, keo dán mạch gạch siêu bám dính chống thấm nước dung tích 280ml - màu trắngHiện tượng các đường ron nhỏ trên sàn bị tróc ra sau một thời gian ngắn đi vào sử dụng là một hiện tượng khá phổ biến và thường thấy ở bất cứ công trình nào. Bên cạnh đó, hiện nay xu hướng sử dụng gạch lớn như đá hoa cương, đá cẩm thạch,… là khá phổ biến. Với những loại gạch/đá này, phải ốp lát rất sát với nhau sao cho không thấy các mối nối, do đó các đường ron sẽ trở nên rất nhỏ.Kết hợp hai vấn đề trên, nếu không sử dụng đúng loại keo chà ron/ dán mạch có những tính năng chuyên dụng thông thường thì công trình thi công sẽ dễ xảy ra những sự cố ảnh hưởng đến chất lượng và tính thẩm mỹ của công trình. Keo chà ron gạch, keo dán mạch gạch siêu bám dính chống thấm nước của chúng tôi tự tin là sản phẩm có thể giải quyết hết tất cả các vấn đề trên.Là sản phẩm chà ron thế hệ mới, keo chà ron gạch, keo dán mạch gạch sẽ giải quyết tận gốc các vấn đề nhiễm bẩn, nấm mốc hay bong tróc trên ron sàn gạch


Ưu điểm :Siêu bám dínhChống thấm tuyệt đốiKhông rêu mốc, không ố đen, sạch sẽ, giữ nguyên màu sắc sau nhiều năm.Không rạn nứt, co ngót, bong táchKhông làm ố gạch, loang màu gạchThi công dễ dàng, dễ sử dụngBề mặt bóng mịn rất dễ dàng vệ sinhSản phẩm thân thiện với môi trường

Thông tin sản phẩm :Tên sản phẩm : Keo chà ron gạch cao cấp, keo dán mạch gạch siêu bám dính chống thấm nước dung tích 280ml - màu trắngDung tích : 280mlMàu sắc : trắngCông dụng : Sản phẩm được dùng để chà ron gạch, dán mạch gạch, sơn lại những khe nứt ở bồn rửa bát, bếp ga âm bàn.,Thích hợp sử dụng nhà tắm (bồn tắm, phòng vệ sinh, bồn rửa tay, gạch ốp lát, gạch hành lang), nhà bếp, 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (154, N'Miếng Tấm Pát Pad Thép Vuông Sửa Bản Lề Tủ Cửa Gỗ Lỗ Vít Door Hinge Repair Kit', N'9.000 ₫', N'image/08b2c23f6570a4d2f478edb42f121868.jpg', N'Thông tin sản phẩm:
- Chất liệu thép dày 0.7 mm, kích thước 9*9cm
- Lắp đặt dễ dàng
- Lắp cánh và lắp tủ đều được
- Kích thước vừa hầu hết các loại bản lề giảm chấn hiện nay. Quý khách vui lòng xem trước kích thước sản phẩm
 
 
 
Công dụng:
- Sửa cánh bản lề cửa bị mục hỏng nhanh chóng mà không cần phải thay cửa tủ mới
- Che phủ khu vực bị hỏng thẩm mỹ và đẹp mắt
 
 
 
Hướng dẫn sử dụng
Xác định vị trí lỗ thép tương ứng vs bản lề
Bắt vít vào 4 góc tấm thép
 
 
 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (155, N'Bộ tua vít đa năng sửa chữa điện thoại 25 in 1 vít từ tính chất liệu cao cấp S2', N'64.900 ₫', N'image/5581a2e95de7b05ed340316f2a4cf9a8.PNG', N'Chất liệu: thép nhậu khẩu HRC 60, hộp kim nhôm
Nặng: 300g
Kích thước: 168 x 67 x 17 mm.
Đầu vít: 24 đầu, gồm có 4 lớp.
Màu sắc: xám.

Hôm nay mình xin giới thiệu đến các bạn một bộ phụ kiện sửa chữa điện thoại, kính mắt đa năng bỏ túi.Nếu sỡ hữu cho mình bộ vít chắc chắn sẽ giúp ích cho công việc của bạn rất nhiều vì tính đa năng của nó, bạn có thể sử dụng nó đẻ tháo lắp đồng hồ, máy ảnh, laptop, điện thoại, mắt kính, đồ gia dụng…
Đối với dân kỹ thuật hay sữa chửa mà nói thị bộ vít chính là một phụ kiện vô cùng quan trọng, nó sẽ giúp họ rất nhiều trong công việc hàng ngày, thế nhưng chắc chắn sẽ có nhiều bạn đang sở hữu nhiều bộ vít có kích thước quá lớn hay các đầu vít không đạt tiêu chuẩn rất dễ bị mài mòn sau một quá trình sử dụng. Nhưng đối với sản phẩm này thì bạn hoàn toàn yên tâm.
 

Nhìn sơ qua về mặt thiết kế, có thể nói đến hộp đựng vít, được làm từ hợp kim nhôm aluminum,, 2 cạnh được bo tròn tạo cảm giác cho sản phẩm mềm mại hơn rất nhiều không thô cứng như các sản phẩm khác, với kích thước chỉ khoảng 168 x 67 x 17mm, nặng chỉ 300g,vừa nhỏ gọn vừa sang trọng, bề mặt chống thấm mồ hôi và chịu va đập tốt nên bạn có thể dễ dàng mang theo bên người.
Có tất cả là 24 đầu vít, được chia thành 4 tầng sắp gọn gàng trên hộp, ứng mỗi vị trí trên đầu vít thì trên thân hộp đều được in một hình vẽ tương ứng để bạn có thể dễ dàng lựa chọn, không những thế trên thân từng đầu vít đều được in những thông số như: U2.6, H2.0, PH2… con số ứng với từng đầu vít nhất định, cầu đầu vít đều được tích hợp nam chấm để dễ dàng hơn khi bạn bắt những con ốc.

 
Chất liệu để làm nên những đầu vít này là thép HRC 60 rất chắc chắn và cứng cáp chịu được lực khá tốt, nên sẽ ít có hiện tượng bị mài mòn hay bị chai sau một thời gian dài sử dụng. Phần thân cây viết cũng được làm từ chất liệu giống như đầu vít, dài khoảng 13cm, khá vừa tay người cầm rất cho cảm giác rất chắc chắn và thoải mái.
Sỡ hữu cho mình bộ vít này chắc chắn sẽ giúp ích cho công việc của bạn rất nhiều vì tính đa năng của nó, bạn có thể sử dụng nó đẻ tháo lắp đồng hồ, máy ảnh, laptop, điện thoại, mắt kính, đồ gia dụng…
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (156, N'Khoan pin 21v Máy khoan bắt vít 21v', N'395.000 ₫', N'image/a90c117e7186a732539699e903bfc93b.jpg', N'UY TÍN- CHẤT LƯỢNG
CAM KẾT HỖ TRỢ ĐỔI TRẢ BẢO HÀNH TỐT NHẤT

KHOAN PIN HITACHI 21V ( Bộ sản phẩm gồm thân máy + 1 pin sạc và tặng 4 mũi khoan )

                                                           THÔNG SỐ KỸ THUẬT
- Điện thế pin: 21V - Loại Pin: Max Lithiium-ion 
- Lực siết/mở vít : Cứng (30Nm); Mềm (20Nm) 
- Dung lượng pin: 3 Ah 
- Kích thước sản phẩm: 25x 15x 8 cm 
- Trọng lượng cả hộp: 1.4 kg ( hộp carton ) 
- Tốc độ không tải: Cao (0 - 1.550 vòng/phút); Thấp (0 - 550 vòng/phút) 
- Sản xuất : Theo Dây chuyền JANPAN

PIN SIÊU TRÂU DÙNG ĐƯỢC 4 - 5 TIẾNG

BỘ SẢN PHẨM ĐẦY ĐỦ BAO GỒM THÂN MÁY, SẠC, PIN
VÀ TĂNG 2 MŨI BẮT VÍT

CÁC CHỨC NĂNG NỔI BẬT CỦA MÁY: CÓ ĐÈN LED  SIÊU SÁNG
25 CẤP ĐỘ SIẾT, CHỨC NĂNG ĐẢO CHIỀU, 2 TỐC ĐỘ

MÁY CÓ THỂ DỄ DÀNG XUYÊN QUA TƯỜNG, GỖ, SẮT
VÀ BẮT VÍT MỘT CÁCH NHANH GỌN

BẢO HÀNH 1 NĂM KHI MUA MÁY TẠI CỬA HÀNG
CÒN CHẦN CHỪ GÌ MÀ KHÔNG MUA NGAY CHIẾC
Khoan pin 21V VỀ SỬ DỤNG
SHOP CAM KẾT
Cam kết tất cả sản phẩm bên ngoài giống như trong ảnh 
Cam kết về chất lượng và dịch vụ bán hàng
Cung cấp các sản phẩm theo đúng tiêu chuẩn với chất lượng tốt nhất
Đáp ứng mọi yêu cầu của khách hàng trong thời gian ngắn nhất
Đảm bảo về số lượng và đúng chủng loại khách đặt
Tư vấn miễn phí 24/24 cho quý khách hàng về các sản phẩm của chúng tôi, bất cứ thắc mắc gì trước và sau khi mua sản phẩm
CHÚC QUÝ KHÁCH THAM QUAN VÀ MUA SẮM VUI VẺ!!
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (157, N'Set 328 Ống Gen Co Nhiệt Cách Điện Bọc Dây Điện Xe Hơi, Xe Máy, Máy Tính Nhiều Kích Cỡ', N'30.999 ₫', N'image/552fcb3b7924ddec16d49e1da895c8e1.jpg', N'Qúy khách vui lòng xem kỹ mô tả và kích thước trước khi đặt hàng dùm Shop nhé!
Bọc ống cách điện cáp có thể cách điện cáp và dây điện chống lại nhiệt độ cực cao trong máy bay, tàu thuyền và xe quân đội.
Ống co nhiệt polyolefin cung cấp một rào cản giữa cáp và sựăn mòn.
Ống co nhiệt có thể cải thiện giao diện của cáp trong mod máy tính hoặc ô tô và xe máy tùy chỉnh.
Nó được sử dụng rộng rãi trong kết nối dây, bảo vệ và cách điện của dây nối, đầu dây, điện cảm và các thành phần điện tử.
Kích thước:
Đường kính: 1.0mm, 2.0mm, 3.0mm, 4.0mm, 6.0mm, 8.0mm, 10.0mm, 14.0mm.
120 ống :1,0 x 40mm (vàng+đen+đỏ+xanh lục)
60 ống:2.0 x 40mm (vàng+đen+đỏ+xanh dương) 
40 ống: 3.0 x 40mm (vàng+ đen+đỏ+xanh lục)
 32 ống: 4.0 x 40mm (vàng +đe+đỏ+xanh dương)
24 ống: 6.0 x 40mm (vàng+đen+đỏ+xanh lục)
 20 ống: 10 x 80mm (vàng+đen+đỏ+, xanh dương)
16 ống:12 x 80mm (vàng+đen+ đỏ+ xanh dương)
16 ống: 14,0 x 80mm (vàng+ đen+đỏ+ xanh)', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (158, N'Set 328 Ống Gen Co Nhiệt Cách Điện Bọc Dây Điện Xe Hơi, Xe Máy, Máy Tính Nhiều Kích Cỡ', N'30.999 ₫', N'image/552fcb3b7924ddec16d49e1da895c8e1.jpg', N'Qúy khách vui lòng xem kỹ mô tả và kích thước trước khi đặt hàng dùm Shop nhé!
Bọc ống cách điện cáp có thể cách điện cáp và dây điện chống lại nhiệt độ cực cao trong máy bay, tàu thuyền và xe quân đội.
Ống co nhiệt polyolefin cung cấp một rào cản giữa cáp và sựăn mòn.
Ống co nhiệt có thể cải thiện giao diện của cáp trong mod máy tính hoặc ô tô và xe máy tùy chỉnh.
Nó được sử dụng rộng rãi trong kết nối dây, bảo vệ và cách điện của dây nối, đầu dây, điện cảm và các thành phần điện tử.
Kích thước:
Đường kính: 1.0mm, 2.0mm, 3.0mm, 4.0mm, 6.0mm, 8.0mm, 10.0mm, 14.0mm.
120 ống :1,0 x 40mm (vàng+đen+đỏ+xanh lục)
60 ống:2.0 x 40mm (vàng+đen+đỏ+xanh dương) 
40 ống: 3.0 x 40mm (vàng+ đen+đỏ+xanh lục)
 32 ống: 4.0 x 40mm (vàng +đe+đỏ+xanh dương)
24 ống: 6.0 x 40mm (vàng+đen+đỏ+xanh lục)
 20 ống: 10 x 80mm (vàng+đen+đỏ+, xanh dương)
16 ống:12 x 80mm (vàng+đen+ đỏ+ xanh dương)
16 ống: 14,0 x 80mm (vàng+ đen+đỏ+ xanh)', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (159, N'Máy khoan bắn vít cầm tay  dùng nguồn điện trực tiếp', N'269.000 ₫', N'image/05c83c13f302a6e4b766d34825eec72c.jpg', N'Máy khoan bắn vít cầm tay dùng nguồn điện trực tiếp 
 
 

 

Máy thích hợp sử dụng cho nhiều công việc từ những việc gia đình như khoan tường treo tranh, giá sách, bắt tất kê, khoan gỗ,đến những công việc ngoài công trường hoặc xưởng chế tạo như khoan bê tông mỏng, khoan kim loại, làm nhôm kính…
 
 

 
Công suất: 880WKhả năng khoan thép/ gỗ: 10/ 20mmTốc độ không tải: 0-3.000v/pĐầu cặp: dùng mũi từ 0.8mm đến 10mmChức năng : Đảo chiềuNguồn điện : 220vBộ sản phẩm gồm : 1 máy khoan + 1 hộp giấy





 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (160, N'Máy Khoan Vặn Vít Dùng Pin Bosch GSR 120-LI (1 Pin, 1 Sạc)', N'1.665.000 ₫', N'image/aa6c01dcd81d705c3a56b442afd1a19b.png', N'Máy Khoan Vặn Vít Dùng Pin Bosch GSR 120 GEN II là dòng sản phẩm khoan pin mới nhất của Bosch ra mắt trong năm 2019. Dòng sản phẩm cải tiến từ dòng khoan pin GSR 120Li. Vẫn sử dụng pin lion 12V xong Máy khoan pin Bosch GSR 120-LI GEN II cải tiến về tốc độ không tải, lực xoắn giúp bạn tối ưu hóa công việc khoan, bắt vít.



Ưu điểm của sản phẩm
Thân máy làm từ nhựa chất liệu cao cấp, cứng chắn, sản xuất theo tiêu chuẩn châu Âu đảm bảo độ bền. Máy có hai chế độ: khoan và bắt vít với 20 cấp trượt.
Máy khoan vặn vít GSR 120 GEN II có thể điều chỉnh tốc độ không tải ở 2 mức:
Máy có chế độ dừng thông minh: Tự động dừng máy trong trường hợp vít đã vặn hết vào vật liệu, ngay cả khi vẫn giữ nút khởi động giúp bảo vệ vật liệu không bị vặn vít quá đà.
Thông số kỹ thuật
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (161, N'Bộ dụng cụ đa năng 108 món của Bosch 2607002788', N'1.523.000 ₫', N'image/62aad7d39da288e5580b1677f27959b341.jpg', N'Bộ dụng cụ đa năng 108 món của Bosch 2607002788 với nhiều món khác nhau giúp cho công việc sửa chữa lắp đặt máy móc trong gia đình của bạn trở nên dễ dàng hơn rất nhiều, đảm bảo mở được tất cả các linh kiện. 108 món phụ kiện được xếp trong hộp rất tiện dụng và khoa học, chỉ cần một thao tác đơn giản, bạn sẽ chọn được ngay món phụ kiện cần sử dụng. Bộ dụng cụ chắc chắn sẽ là dụng cụ hỗ trợ đắc lực phục vụ các công việc của bạn được nhanh chóng và hiệu quả hơn rất nhiều.
THÔNG SỐ KỸ THUẬT
Bộ được đựng trong hộp nhựa bao gồm:
- Kìm điện Bosch = 1 cái- Kìm nhọn Bosch = 1 cái- Mỏ lết Bosch = 1 cái- Đèn pin chiếu sáng = 1 cái- Bút thử điện = 1 cái- Búa nhổ đinh Bosch = 1 cái- Cưa sắt cầm tay có lưỡi cưa Bosch = 1 cái- Băng keo điện màu đen = 1 cuộn- Thước kéo thép Bosch 3m = 1 cái- Cần lục giác chữ L: 1.5, 2, 2.5, 3, 4, 5, 5.5, 6mm = 8 cái- Tuốc nơ vít cầm tay có từ = 1 cái- Bộ đầu tuốc nơ vít: PH1, PH2, PH2, PH3, S6, S7, H5, H6, T15, T20 = 10 cái- Đầu chuyển từ lục giác ngoài 1/4" ra lục giác trong 4mm = 1 cái- Bộ đầu tuốc nơ vít lụgia1c ngoài 4mm: Dẹp 1.5, 2. Sao 0.8, 0.8, 6mm. Bake 00, 000 = 8 cái- Đầu chuyển từ lục giác ngoài 1/4" ra đầu vuông 1/4": 5, 6, 7, 8, 9, 10 = 7 cái- Mũi khoan bê tông đầu trụ: 5, 6, 8mm = 3 mũi- Tắc kê nhựa 5, 6, 8mm = 30 cái- Vít sắt bắt tắc kê nhựa 3, 4, 5mm = 30 cái
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (162, N'Cuộn Ron Dán Che Khe Cửa,Chân Cửa HT SYS - Chống Nước - Chống Gió Lùa - Chống Ồn - Bụi Bẩn - Ngăn Côn Trùng Cuộn Dài 2 Mét', N'50.000 ₫', N'image/00bc1a413b283d5d70f541bed96ef65e.jpg', N'Bước 1: Vệ sinh thật sạch bề mặt cần dán. Bước 2: Đo chiều cửa cửa sổBước 3: Cắt ron cửa HT SYS khít với chiều dài cửa đã đo. Bước 4: Dán ron cẩn thận lên bề mặt, miết chắc chắn, tránh gỡ ra dán lại nhiều lần.
Túi OPP: gồm 01 cuộn dài 2 mét
 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (163, N'Thước kẹp điện tử 150mm thép hợp kim không rỉ màn hình LCD', N'319.999 ₫', N'image/82c99f5c210d8cd89c4bf7e403361a14.jpg', N'- Màn hình LCD lớn sắc nét (42mmx17mm) cho khả năng dễ đọc, có khả năng tự tắt khi không dùng tới, tiết kiệm pin.
- Hiển thị cỡ 0.01mm rất chính xác, dễ đọc kết quả.
THÔNG SỐ KỸ THUẬT CỦA SẢN PHẨM
- Vật liệu: Thép không gỉ.
- Dải đo: 0 - 150mm.
- Độ chia nhỏ nhất: ± 0,01mm
- Dung sai chính xác: ± 0.02mm
- Hệ thống đo lường: Hệ thống đo điện dung tuyến tính.
- Pin: một 1.5 V LR44 (Tặng kèm 2 pin dự phòng).
- Hộp đựng bằng nhựa cứng, đi kèm 2 pin LR44, 1 tô vít nhỏ 4 cạnh để tháo lắp pin
Dụng cụ cầm tay Trường Thành chuyên cung cấp sỉ, lẻ các mặt hàng đồ cơ khí cầm tay, bộ dụng cụ đo lường, cờ lê, tua vít, thước kẹp điện tử, máy khoan cầm tay, máy mài cầm 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (164, N'Máy mài góc cầm tay INGCO AG750282 đường kính 100mm công suất 750W công tắc ở đuôi.', N'495.900 ₫', N'image/304e83a348de498d709bfc4fd11b0220.jpg', N'INGCO là một thương hiệu chuyên sản xuất các công cụ , dụng cụ, máy cầm tay theo tiêu chuẩn Châu Âu, Mục tiêu phát triển của thương hiệu là mang tới cho người tiêu dùng những máy móc và đồ nghề giá cạnh tranh, chất lượng vượt trội.
INGCO VIỆT NAM là nhà phân phối và bảo hành chính hãng tại Việt Nam.
Thông số kỹ thuật:- Điện thế: 220-240V~50-60Hz- Công suất: 750W- Tốc độ không tải: 12000rpm, - Đường kính đĩa mài: 100mm, cốt mài: M10.- Kèm theo 1 tay cầm phụ, đóng gói trong hộp màu.. TL: 2.6 kg- Sản phẩm bảo hành: 6 tháng.
Cám ơn quý khách hàng đã sử dụng sản phẩm chính hãng được phân phối bởi INGCO Việt Nam. Mọi hổ trợ, vui lòng liên hệ hotline: 0777.424.777
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (165, N'Súng bắn keo nến silicon + Tặng 10 cây keo silicon nến', N'60.000 ₫', N'image/205ef2f03033f133def83403d2fb7354.png', N'Súng bắn keo nến silicon + Tặng 10 cây keo silicon nếnKích thước nhỏ gọnThen súng làm bằng nhựa cứng chắc chắnCông suất 20W giúp làm nóng keo nhanhCó công tắc bật tắtTặng 10 cây keoSúng bắn keo sử dụng để cố định những chi tiết trên các sản phẩm handmade.Sản phẩm có kích thước nhỏ gọn, dễ dàng mang theo và sử dụng trong nhiều không gian, vật dụng.
  
 

Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (166, N'Dụng Cụ Lấy Dấu, Định Vị Điểm Khoan - Chống Trượt', N'28.999 ₫', N'image/0f2ef6a088a1d037f7232f5c4233725e.jpg', N'Dụng cụ đục lỗ, định vị điểm khoan là dụng cụ cầm tay giúp bạn dễ dàng đánh dấu trên các vật liệu sắt, gỗ, nhựa  với lực đẩy của lò xo cùng đầu mũi nhọn.
Thiết bị định vị được làm bằng ĐỒNG NGUYÊN CHẤT cùng lớp mạ màu vàng đẹp mắt, tránh việc gỉ cũng như đảm bảo độ bền của dụng cụ đục lỗ.
Việc sử dụng thiết bị đánh dấu điểm khoan là vô cùng đơn giản. Bạn chỉ cần xác định điểm cần đánh dấu. Sau đó, để đầu nhọn của thiết bị vào vị trí cần đánh dấu. 
Dùng tay ấn thiết bị định vị xuống và nhấc lên.
Kết quả: chúng ta có điểm đánh dấu mà không tốn nhiều sức.

Kích thước của dụng cụ đục lỗ
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (167, N'Keo chà ron gạch cao cấp, keo dán mạch gạch siêu bám dính chống thấm nước dung tích 280ml - màu trắng', N'36.499 ₫', N'image/cd91cfe0f33f58974ed7348ca3ef4627.png', N'Keo chà ron gạch cao cấp, keo dán mạch gạch siêu bám dính chống thấm nước dung tích 280ml - màu trắngHiện tượng các đường ron nhỏ trên sàn bị tróc ra sau một thời gian ngắn đi vào sử dụng là một hiện tượng khá phổ biến và thường thấy ở bất cứ công trình nào. Bên cạnh đó, hiện nay xu hướng sử dụng gạch lớn như đá hoa cương, đá cẩm thạch,… là khá phổ biến. Với những loại gạch/đá này, phải ốp lát rất sát với nhau sao cho không thấy các mối nối, do đó các đường ron sẽ trở nên rất nhỏ.Kết hợp hai vấn đề trên, nếu không sử dụng đúng loại keo chà ron/ dán mạch có những tính năng chuyên dụng thông thường thì công trình thi công sẽ dễ xảy ra những sự cố ảnh hưởng đến chất lượng và tính thẩm mỹ của công trình. Keo chà ron gạch, keo dán mạch gạch siêu bám dính chống thấm nước của chúng tôi tự tin là sản phẩm có thể giải quyết hết tất cả các vấn đề trên.Là sản phẩm chà ron thế hệ mới, keo chà ron gạch, keo dán mạch gạch sẽ giải quyết tận gốc các vấn đề nhiễm bẩn, nấm mốc hay bong tróc trên ron sàn gạch


Ưu điểm :Siêu bám dínhChống thấm tuyệt đốiKhông rêu mốc, không ố đen, sạch sẽ, giữ nguyên màu sắc sau nhiều năm.Không rạn nứt, co ngót, bong táchKhông làm ố gạch, loang màu gạchThi công dễ dàng, dễ sử dụngBề mặt bóng mịn rất dễ dàng vệ sinhSản phẩm thân thiện với môi trường

Thông tin sản phẩm :Tên sản phẩm : Keo chà ron gạch cao cấp, keo dán mạch gạch siêu bám dính chống thấm nước dung tích 280ml - màu trắngDung tích : 280mlMàu sắc : trắngCông dụng : Sản phẩm được dùng để chà ron gạch, dán mạch gạch, sơn lại những khe nứt ở bồn rửa bát, bếp ga âm bàn.,Thích hợp sử dụng nhà tắm (bồn tắm, phòng vệ sinh, bồn rửa tay, gạch ốp lát, gạch hành lang), nhà bếp, 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (168, N'Ê tô kẹp bàn mini', N'32.000 ₫', N'image/84f9bdaec22ee433d5e7ec2a9dba71ab.jpg', N'Khi bạn sửa chữa những đồ vật nhỏ mà cần cố định nó để thao tác trở lên dễ dàng thì chiếc ê tô kẹp bàn mini này chính là một trợ thủ đắc lực không thể thiếu. Đặc biệt cho những bạn nào đam mê sửa chữa mà bị mất một cánh tay hoặc 1 tay bị đau...
Kích thước tổng thể: 93*83mm
Độ mở kẹp bàn tối đa: 35mm
Độ mở tối đa của ê tô: 30mm    
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (169, N'Dây chằng hàng tăng đơ (dây cảo) bản 25mm dài 3 - 5m tải trọng 500-800kg', N'50.000 ₫', N'image/ccb69be66020983c521de76bc8d5ca3e.jpg', N'Dây chằng hàng tăng đơ (dây cảo) bản 25mm dài 3 - 5m tải trọng 500-800kg - capthepgiasi
Công Dụng:
- Dây được thiết kế với trọng lượng vô cùng nhẹ nên rất dễ cầm nắm và bảo quản.
- Với công dụng chằng, buộc hàng hóa, phương tiện cố định và vững chắc nhất, dây chằng hàng (tăng đơ vải) có độ linh hoạt tốt giúp vận hành an toàn và dễ dàng phù hợp cho các sản phẩm.
Độ dài: Từ 3 mét đến 12 mét
Chuyên cung cấp Sỉ - Lẻ: Dây Chằng Hàng ( Tăng Dây, Tăng Đơ Vải), Cáp Vải Cẩu Hàng ( Dây Bẹ ) đủ size, đủ kích cỡ.
CÔNG TY TNHH CÁP THÉP NAM LONG CHÂU
Website: - 
ĐC: Số 684 Quốc lộ 1A, Phường Thạnh Lộc, Quận 12, TP. HCM
Trân Trọng!
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (171, N'Keo Dán Siêu Dính Đa Năng Mọi Chất Liệu Cực Mạnh - Dán Gỗ Thuỷ Tinh Kim Loại Sắt Gốm Sứ Nhựa Vải TBM1', N'35.000 ₫', N'image/d0808ee755689be431552171524487fd.jpg', N'------------  HƯỚNG DẪN SỬ DỤNG -------------  Làm sạch bề mặt muốn kết dính  Mở nắp và bôi keo lên bề mặt  Gắn kết bề mặt muốn dính và chờ trong tối thiểu 30s để phát huy tác dụng
️️LƯU Ý: - Bề mặt muốn kết dính cần được làm sạch hoàn toàn, không chứa bụi bẩn hay dung dịch khác - Có thể đeo găng tay cao su khi sử dụng keo dán. - Vì thành phần hoá học đặc biệt, dung dịch keo cần có khoảng không khí để thở nên chỉ có thể đổ đầy 75% lọ. - Tránh xa tầm tay trẻ em - Không để dung dịch dính vào mắt, da.
KEO DÁN ĐA NĂNG THẾ HỆ MỚI - BÁM DÍNH MẠNH MẼ HƠN 80 LẦN KEO 502 -
LOẠI TỐT NHẤT THỊ TRƯỜNG KHÔ NHANH CẤP TỐC SAU 30 GIÂY CHỐNG THẤM NƯỚC VÀ VA ĐẬP 
> ------------ TÍNH NĂNG NỔI BẬT -------------
Khác biệt với các loại keo truyền thống, KEO DÁN ĐA NĂNG THẾ HỆ MỚI được nâng cấp các tính năng để đáp ứng mọi nhu cầu sử dụng của bạn:
Bám dính mạnh mẽ hơn 80 lần so với keo 502 truyền thống. T ối ưu thời gian dính chỉ sau 30 giây, tiết kiệm thời gian sửa chữa. Gắn kết đa dạng chất liệu: gốm sứ, kim loại, nhựa, dép xốp, đồ ghỗ, gương, trang sức, đồ thủ công,linh kiện điện tử Không gây ố bẩn vết dính. Tạo nên sự gắn kết trong suốt hoàn hảo. Mùi nhẹ dịu, không gây khó chịu khi sử dụng, an toàn và thân thiện môi trường.
------------ THÔNG TIN SẢN PHẨM -------------Kích thước: 122 x 38 mmDung tích: 30 mlPhân loại: dung dịchMùi hương: ít mùi Hạn sử dụng: 18 thángThời gian phát huy công hiệu: sau 30 giây Bảo quản: tránh ánh nắng trực tiếp, đậy nắp sau khi sử dụng






Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (172, N'Bộ dụng cụ sửa chữa đa năng 45 chi tiết Kachi MK166', N'464.000 ₫', N'image/2f2e22809bf79ec6d3a2324ca17a6b5d.jpg', N'thép không gỉ, nhựa
Có hộp nhựa đi kèm

Bộ dụng đa năng 45 chi tiết Kachi MK-166 dùng sửa chữa vật dụng trong nhà

Bộ dụng cụ đa năng Kachi 45 chi tiết được thiết kế hộp đựng bằng nhựa cứng chắc chắn, có phần quai cầm tiện lợi cho việc di chuyển trong lúc sử dụng. Với từng vị trí vừa khít với từng dụng cụ, người dùng có thể sắp xếp gọn gàng vật dụng khi không sử dụng, đảm bảo độ bền nâng cao cũng như giúp cho không gian nhà ở, nơi làm việc thêm gọn gàng.



Bộ dụng đa năng 45 chi tiết Kachi MK-166 bao gồm:
- 1 Tua vít đầu dẹp 5.8*100
- 1 Tua vít lớn đầu nhọn 5.8*100
- 1 Tua vít nhỏ đầu nhọn
- 1 Dao rọc
- 1 Bút thử điện
- 1 Băng keo điện
- 1 Tay cầm
- 9 Đầu vít 25mm
- 1 Đầu vít ADA
- 9 Đầu khẩu vặn ốc 1/4" 5/6/7/8/9/10/11/12/13
- 8 Lục giác 1.5/2/2.5/3/4/5/5.5/6
- 1 Cưa
- 1 Thước dây 3m
- 1 Kìm mỏ bằng 6”
- 1 Kìm mỏ nhọn 6”
- 1 Cờ lê
- 1 Búa
- 1 Hộp ốc vít 60 cái
- 1 Hộp đựng bằng nhựa




THÔNG SỐ KỸ THUẬT
Model: MK-166
Chất liệu: thép không gỉ, nhựa
Khối lượng: 2.7kg
Kích thước hộp: 35.7 x 27 x 7 cm
Xuất xứ thương hiệu: Việt Nam
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (173, N'Túi vệ sinh máy lạnh TD01, Áo vệ sinh máy lạnh tại nhà', N'120.000 ₫', N'image/2842fb5deedb2b945dba0fa8974580a5.jpg', N'Vải dù tổ ong chống thấm
CÁCH SỬ DỤNG:
 
      Áo vệ sinh máy lạnh TD01 là mẫu thiết kế cải tiến nhất của nhà sản xuất Thuận Dung được thiết kế và sản xuất kể từ năm 2013, chuyên dùng cho thợ điện lạnh với độ bền cao, tiện lợi nhất với miệng áo có thun co dãn, và thiết kế luồn dây treo xung quanh máy lạnh.
     Trên thị trường hiện có rất nhiều Shop bán áo vệ sinh có nguồn gốc khác nhau, cần phân biệt sản phẩm bán bởi Thuận Dung và các sản phẩm khác như sau:

- Có tem sản phẩm từ nhà sản xuất Thuận Dung với mã sản phẩm là TD01, những sản phẩm không có tem này đều là hàng nhái không được sản xuất bởi Thuận Dung.
- Chất liệu: Vải dù tổ ong chống thấm, độ bền cao.
- Màu: Xanh đen (có màu xanh rêu nhưng chưa bán trên TIKI)
- Chiều rộng miệng túi: 1.8 mét, sử dụng đa năng cho tất cả các dòng máy lạnh dân dụng từ 1HP đến 3HP
- Ống xả : 2.5m tính từ phần đuôi áo, rất dài để tiện cho việc xả nước ở mọi độ cao gắn máy lạnh thông dụng.
- Trọng lượng: 600gr nhẹ hơn các loại vải khác giúp thao tác thuận tiện, không chì nặng vào máy khi xịt nước, không thấm vào vải, và cực kỳ mau khô sau khi sử dụng và giặt rữa giúp đảm bảo độ bền sử dụng lâu dài. 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (174, N'Máy mài góc cầm tay INGCO AG750282 đường kính 100mm công suất 750W công tắc ở đuôi.', N'495.900 ₫', N'image/304e83a348de498d709bfc4fd11b0220.jpg', N'INGCO là một thương hiệu chuyên sản xuất các công cụ , dụng cụ, máy cầm tay theo tiêu chuẩn Châu Âu, Mục tiêu phát triển của thương hiệu là mang tới cho người tiêu dùng những máy móc và đồ nghề giá cạnh tranh, chất lượng vượt trội.
INGCO VIỆT NAM là nhà phân phối và bảo hành chính hãng tại Việt Nam.
Thông số kỹ thuật:- Điện thế: 220-240V~50-60Hz- Công suất: 750W- Tốc độ không tải: 12000rpm, - Đường kính đĩa mài: 100mm, cốt mài: M10.- Kèm theo 1 tay cầm phụ, đóng gói trong hộp màu.. TL: 2.6 kg- Sản phẩm bảo hành: 6 tháng.
Cám ơn quý khách hàng đã sử dụng sản phẩm chính hãng được phân phối bởi INGCO Việt Nam. Mọi hổ trợ, vui lòng liên hệ hotline: 0777.424.777
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (175, N'Miếng Tấm Pát Pad Thép Vuông Sửa Bản Lề Tủ Cửa Gỗ Lỗ Vít Door Hinge Repair Kit', N'9.000 ₫', N'image/08b2c23f6570a4d2f478edb42f121868.jpg', N'Thông tin sản phẩm:
- Chất liệu thép dày 0.7 mm, kích thước 9*9cm
- Lắp đặt dễ dàng
- Lắp cánh và lắp tủ đều được
- Kích thước vừa hầu hết các loại bản lề giảm chấn hiện nay. Quý khách vui lòng xem trước kích thước sản phẩm
 
 
 
Công dụng:
- Sửa cánh bản lề cửa bị mục hỏng nhanh chóng mà không cần phải thay cửa tủ mới
- Che phủ khu vực bị hỏng thẩm mỹ và đẹp mắt
 
 
 
Hướng dẫn sử dụng
Xác định vị trí lỗ thép tương ứng vs bản lề
Bắt vít vào 4 góc tấm thép
 
 
 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (176, N'Keo chà ron gạch cao cấp, keo dán mạch gạch siêu bám dính chống thấm nước dung tích 280ml - màu trắng', N'36.499 ₫', N'image/cd91cfe0f33f58974ed7348ca3ef4627.png', N'Keo chà ron gạch cao cấp, keo dán mạch gạch siêu bám dính chống thấm nước dung tích 280ml - màu trắngHiện tượng các đường ron nhỏ trên sàn bị tróc ra sau một thời gian ngắn đi vào sử dụng là một hiện tượng khá phổ biến và thường thấy ở bất cứ công trình nào. Bên cạnh đó, hiện nay xu hướng sử dụng gạch lớn như đá hoa cương, đá cẩm thạch,… là khá phổ biến. Với những loại gạch/đá này, phải ốp lát rất sát với nhau sao cho không thấy các mối nối, do đó các đường ron sẽ trở nên rất nhỏ.Kết hợp hai vấn đề trên, nếu không sử dụng đúng loại keo chà ron/ dán mạch có những tính năng chuyên dụng thông thường thì công trình thi công sẽ dễ xảy ra những sự cố ảnh hưởng đến chất lượng và tính thẩm mỹ của công trình. Keo chà ron gạch, keo dán mạch gạch siêu bám dính chống thấm nước của chúng tôi tự tin là sản phẩm có thể giải quyết hết tất cả các vấn đề trên.Là sản phẩm chà ron thế hệ mới, keo chà ron gạch, keo dán mạch gạch sẽ giải quyết tận gốc các vấn đề nhiễm bẩn, nấm mốc hay bong tróc trên ron sàn gạch


Ưu điểm :Siêu bám dínhChống thấm tuyệt đốiKhông rêu mốc, không ố đen, sạch sẽ, giữ nguyên màu sắc sau nhiều năm.Không rạn nứt, co ngót, bong táchKhông làm ố gạch, loang màu gạchThi công dễ dàng, dễ sử dụngBề mặt bóng mịn rất dễ dàng vệ sinhSản phẩm thân thiện với môi trường

Thông tin sản phẩm :Tên sản phẩm : Keo chà ron gạch cao cấp, keo dán mạch gạch siêu bám dính chống thấm nước dung tích 280ml - màu trắngDung tích : 280mlMàu sắc : trắngCông dụng : Sản phẩm được dùng để chà ron gạch, dán mạch gạch, sơn lại những khe nứt ở bồn rửa bát, bếp ga âm bàn.,Thích hợp sử dụng nhà tắm (bồn tắm, phòng vệ sinh, bồn rửa tay, gạch ốp lát, gạch hành lang), nhà bếp, 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (177, N'Thang nhôm rút gọn SUMIKA SK440 - Chiều cao tối đa 4.4m, chiều dài rút gọn 0.92m', N'1.685.000 ₫', N'image/0abc74a5542f0b0a22d78dbff4eb2a90.jpg', N'Thang Nhôm Rút Gọn Sumika SK440 được thiết kế thông minh với kiểu rút gọn, bạn có thể sử dụng ở nhiều độ cao khác nhau bằng cách kéo lên, rút xuống linh hoạt. Sản phẩm được sử dụng rộng rãi trong gia đình, trang trí nội thất, dùng trong nhà và ngoài trời. Đặc biệt còn được ứng dụng nhiều trong ngành bưu điện, điện lực, truyền hình cáp, Có thể phục vụ cho nhiều mục đích sử dụng khác nhau với chiều cao hợp lý của mình.
 

 
Sản phẩm được làm bằng chất liệu nhôm dày với độ dày 1.2 - 1.5 mm, chống móp méo, tránh tác động, chịu được lực cao. Chống lại sự oxy hoá khi tiếp xúc với môi trường bên ngoài và chịu được nhiệt khi dùng ở ngoài trời.
Đặc biệt, mỗi bậc thang được trang bị chốt khoá nhựa, cố định, chắc chắn, bậc thang đủ chắc giúp người dùng leo lên xuống thoải mái. Hơn nữa, chân than có đế cao su chống trơn trượt, đảm bảo an toàn cho người sử dụng và chống trầy sàn nhà bạn, giúp người sử dụng an tâm hơn.
 

 
Thang Nhôm Rút Gọn Sumika đươc thiết kế với số bậc thang là 15, trọng lượng nhẹ có thể xách tay dễ dàng cùng với thao tác sử dụng đơn giản: Mở rộng, rút ra theo từng bậc, dễ vận hành và sử dụng. Kích thước nhỏ gọn, thuận tiện để cất giữ trong không gian nhỏ. Ngoài ra sản phẩm có khóa gấp tự động với mức tải trọng lên đến 300kg đã đạt được tiêu chuẩn châu Âu EN131, đảm bảo an toàn cho bạn.
 

 
Thang nhôm rút gọn SUMIKA Model: SK440- Kích thước: 50x10x94cm- Chiều cao tối đa: 4.4m- Chiều dài rút gọn: 0.92m- Trọng lượng 12,3 kg- Số bậc: 15 bậc- Khoảng cách bậc: 30cm- Độ dày nhôm: 1,2-1,5 mm- Tải trọng 300kg, tiêu chuẩn EN131
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (178, N'Keo dán siêu dính X2000 (50g) dán gỗ, sắt, sứ, kim loại đa năng', N'23.999 ₫', N'image/b98d2798a6ed7a4b6dfca64bc458e640.jpg', N'1.Tính năng ưu việtKeo X2000 là loại keo dán sắt – keo dán kim loại chuyên dụng với thành phần chính là a-xyannoacrylic axit. Đây là một thành phần đơn, có độ nhớt thấp và trong suốt. Với khả năng gắn kết tuyệt vời, X200 có thể gắn kết các bề mặt kim loại hay sắt của các chất liệu khác nhau. Biên độ chịu nhiệt rộng từ – 50 °C đến 80 °C. Khả năng chống chịu ngoại lực cao. Không thấm nước và chống hóa chất. Miễn nhiễm với các loại dung môi, axit và kiềm. Keo dán sắt tạo thành gắn kết chắc chắn giữa các bề mặt sắt, kim loại.
Trên thị trường hiện nay có nhiều loại keo dán sắt hay keo dán kim loại. Tuy nhiên, chỉ có những loại chất lượng mới có thể khiến các bề mặt kim loại liền nhau hoàn toàn. Keo X2000 có dạng loãng nên rất dễ sử dụng. Keo không bị đông cứng ở nhiệt độ thường (dưới 28°C) nên thời huạn sử dụng rất lâu.

 
2. Lưu ý khi sử dụngLưu ý đầu tiên là vệ sinh sạch sẽ bề mặt dán. Hãy làm sạch và làm khô bề mặt để gắn kết. Việc vệ sinh này cũng giúp bạn có thể sử dụng keo dán sắt – keo dán kim loại tiết kiệm và hiệu quả hơn.
Lưu ý thứ hai là hãy sử dụng một lượng nhỏ vừa đủ cho một bề mặt thôi. Hãy sử dụng tiết kiệm để có hiệu quả tốt nhất nhé !
Lưu ý thứ ba là tránh tiếp xúc với da. Nếu dính vào da, hãy ngâm nước ấm hoặc xà phòng, không dùng khan giấy.
Lưu ý thứ tư là nên dùng nơi thoáng khí.
Keo dán sắt – Keo dán kim loại

 
3. Ứng dụngKeo dán sắt – Keo dán kim loại X2000 có nhiều công dụng khác. Nó có khả năng gắn dính hầu như tất cả mọi loại vật liệu như :
Nhôm với sắtSắt với gỗSắt với nhựaNhựa với gỗGỗ với gỗBê tôngNgoài ra, nó có thể dán trám các vết nứt hay lấp kin các rò rỉ, rổ bề mặt chỉ bằng một vài giọt keo. Khả năng chống chịu cao. Vết rạn nứt được keo X2000 nối liền có thời hạn lâu dài vĩnh viễn cho các máy móc, đồ gia dụng, dụng cụ cầm tay và các động cơ. Keo dán sắt được sứng dụng nhiều trong sửa chữa ở các công trình dân dụng hay nhà công nghiệp. Vì vậy, nó được phân phối rộng rãi ở các cửa hàng đại lý khác nhau.
 





Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (179, N'Máy hàn điện tử, máy hàn mini GGG420, máy hàn que 2,5 -Bộ phụ kiện đầy đủ dây hàn + dây mát+ kèm kẹp, mo hàn', N'758.000 ₫', N'image/2a6cff7d65bd9b9c8cd32c42c3677a57.jpg', N'Cách lắp dây: dây màu nào lắp với chân máy máy màu đó
Hàn que 2.5: Chỉnh dòng 360-370
Được thiết kế ứng dụng công nghệ tiết kiệm tiên tiến Inverter, Máy hàn que điện tử GGG có khả năng tiết kiệm điện lên đến 50% – 60% so với máy hàn que truyền thống, có thể hàn được tốt cửa sắt, Inox, vật dụng gia đình, công nghiệp, xây dự
Máy hàn que điện tử có thiết kế thông minh, nhỏ gọn giúp việc sử dụng và di chuyển một cách linh hoạt và an toàn. 
 Máy được thiết kế với dòng điện lưu 120A, có thể làm việc được với các que hàn kích thước 1,6-2,5mm.
Máy Có chế độ bảo vệ quá nhiệt, quá tải với nguồn điện không ổn định. 
Đồng hồ hiển thị dòng hàn bằng kỹ thuật số tăng hiệu suất làm việc và thời gian hàn không giới hạn. Cọc cắm được thiết kế lớn hơn so với những loại máy hàn cũ giúp nguồn điện đầu ra được mạnh và ổn định hơn khi làm việc.
Vỏ máy được sơn bằng tĩnh điện, giúp cho máy có độ bền cao hơn, chịu được ở môi trường khắc nghiệt, tăng khả năng chống chọi với oxi hóa trong thời gian dài. 
Bộ phụ kiện đi kèm máy VÔ CÙNG HẤP DẪN:
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (180, N'Máy vặn vít dùng pin Bosch go gen 2 Mới', N'971.000 ₫', N'image/29a3cc0f246fad6edb706aa688c601adb7.jpg', N'Bạn mất quá nhiều thời gian để chọn được loại vít phù hợp để vặn ốc của các thiết bị máy móc, kệ treo thường,… nhưng vẫn không thực sự hiệu quả và tốn thêm chi phí mua các loại vít với đầu vít khác nhau. Đã đến lúc phải sở hữu Máy vặn vít dùng pin Bosch go gen 2 với đầy đủ các dụng cụ đáp ứng đủ nhu cầu của bạn. 
 
THÔNG SỐ KỸ THUẬT
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (181, N'Bút thử nước TDS, dụng cụ đo TDS, máy đo độ cứng của nước - Hàng chính hãng', N'150.000 ₫', N'image/65dabeca667b93081d3b439dde36206d.png', N'Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (182, N'Máy Phun Khử Khuẩn Nano K5 Pro Tia UV, Máy Xịt Khử Khuẩn Cầm Tay, Máy Diệt Khuẩn Nano Siêu Tiện Lợi', N'59.000 ₫', N'image/84fc9b40c17847ef850660ad05535cd1.png', N'Nhựa cao cấp

Để nơi khô mát

HƯỚNG DẨN SỬ DỤNG
- Rót dung dịch cồn y tế vào bình chứa
- Xoay bình chứa để treo bình vào thân súng
- Bật công tắc khởi động
- Điều chỉnh tốc độ phun


Máy Phun Khử Khuẩn Nano K5 Pro Tia UV, Máy Xịt Khử Khuẩn Cầm Tay, Máy Diệt Khuẩn Nano Siêu Tiện Lợi

 
️1. THÔNG TIN CHUNG
- Hàng có sẳn
- Hàng được bao bọc kỹ, đảm bảo khi vận chuyển
- Chất liệu cao cấp
- Sản phẩm rất nhẹ, bền, tiện lợi.
----------------------------------------------------
️2. THÔNG TIN SẢN PHẨM
Tên sản phẩm: Máy tiệt trùng phun tia UV khử khuẩn
Model sản phẩm: K5 Pro
Phạm vi: 200-300cm
Công suất định mức: 10W
Dung lượng pin  : 2000mah
Thời gian sạc: 2-4 giờ
Cổng sạc; USB
Thời gian sử dụng: 3-8giờ
Dung tích bình nước: 360ml
----------------------------------------------------
️3. SẢN PHẨM ĐƯỢC DÙNG KHI
- Khử khuẩn khi nhận hàng, vật liệu thông dụng
- Khử khuẩn tay cầm cửa
- Khử khuẩn thang máy
- Khử khuẩn nội thất xe hơi
- Khử khuẩn tay, chân khi hoạt động nơi công cộng
- Khử khuẩn vật dụng trong gia đình, công ty
----------------------------------------------------
️4. CAM KẾT CỦA SHOP
- Sản phẩm y ảnh 100.
- Đóng gói cẩn thận, bảo vệ sản phẩm nguyên vẹn trong quá trình vận chuyển
- Giao hàng nhanh chóng.
- Đươc đổi trả 1 đổi 1 hoàn toàn miễn phí nếu sản phẩm khi nhận hàng bị vỡ - hỏng – không giống hình ảnh.
- Hỗ trợ giải quyết đơn hàng trong thời gian sớm nhất với phương án tốt nhất để khách hàng luôn cảm thấy hài lòng và yên tâm khi mua sắm
️_️_️ XIN CHÂN THÀNH CẢM ƠN VÌ BẠN ĐÃ LỰA CHỌN CHÚNG TÔI ️_️_️
 


THÔNG TIN SẢN PHẨM
Tên sản phẩm: Máy tiệt trùng phun tia UV khử khuẩn
Model sản phẩm: K5 Pro
Phạm vi: 200-300cm
Công suất định mức: 10W
Dung lượng pin  : 2000mah
Thời gian sạc: 2-4 giờ
Cổng sạc; USB
Thời gian sử dụng: 3-8giờ
Dung tích bình nước: 360ml

Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (183, N'Bộ Dụng Cụ Tua Vít Đa Năng Nhiều Món Có Từ Tính 111 in 1 Dùng Tháo Lắp, Tháo Mở Và Sửa Chữa Điện Thoại Di Động, Máy Tính, PC/ Laptop, Máy Tính Bảng', N'175.999 ₫', N'image/d3a2ae5f3b6ad38c8072385398071a15.jpg', N'Bộ Dụng Cụ Tua Vít Đa Năng Nhiều Món Có Từ Tính 111 in 1 Dùng Tháo Lắp, Tháo Mở Và Sửa Chữa Điện Thoại Di Động, Máy Tính, PC/ Laptop, Máy Tính Bảng
 

Trọn 111 trong 1 món với 98 đầu tua-vít các loại và 13 món khác
Chất liệu cao cấp, gia công độ chính xác cao
Giúp tháo lắp, tháo mở các thiết bị điện tử (máy tính, điện thoại, laptop,) một cách dễ dàng
Tất cả đầu tua-vít có từ tính
Thiết kế hộp nhựa ABS chất lượng chia từng ngăn sắp xếp gọn gàng
Hộp thiết kế nhỏ gọn, dễ dàng mang theo khi cần
Thích hợp sửa chữa cho hầu hết điện thoại di động, máy tính, máy chơi game, máy tính bảng, đồng hồ, kính,  trên thị trường
Kích thước hộp: 16x8x4cm





Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (184, N'Nhiệt ẩm kế Bamboo Life Nhiệt kế điện tử đo nhiệt độ phòng Ẩm kế điện tử đo độ ẩm phòng ngủ thông minh có đèn nhỏ gọn chính xác hàng chính hãng', N'189.000 ₫', N'image/e4cba1d459d2270b26fac6e0f8e9e3e2.jpg', N'Nhiệt ẩm kế Bamboo Life Nhiệt kế điện tử đo nhiệt độ phòng Ẩm kế điện tử đo độ ẩm phòng ngủ thông minh có đèn nhỏ gọn chính xác hàng chính hãng

Nhiệt độ và độ ẩm là 2 yếu tố ảnh hưởng rất lớn để giấc ngủ của bé. Nhiệt độ trên điều hòa sẽ không phản ánh được chính xác nhiệt độ trong phòng vì còn phụ thuộc vào nhiều yếu tố: nhiêt độ bên ngoài, diện tích phòng, vị trí bé nằm. Vì vậy cần có nhiệt ẩm kế để biết chính xác nhiệt độ trong phòng của bé.


Nhiệt ẩm kế có đèn sáng trong 7giây đến 10 giây giúp có thể xem được nhiệt độ trong đêm. 



 
️ Chức năng:
Đo nhiệt độ
Đo độ ẩm
Đồng hồ
️ Thông số kỹ thuật:
Màu sắc: Trắng.
Nhiệt độ đo trong khoảng -50 độ C - 70 độ C, sai số +- 1 độ C.
Kích thước 85*70 mm , kích thước màn: 40*60 mm
Đơn vị hiển thị 0.1 độ C.
Độ ẩm đo trong khoảng 10%RH - 90%RH, sai số +-5%RH
Đơn vị hiển thị 1%.
Sử dụng pin AAA (2 viên). Tặng kèm 2 pin khi mua máy
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (185, N'Găng tay bảo hộ lao động Jogger Superpro - Bao tay lao động chống dầu nhớt, trơn trượt, độ linh hoạt cao - Chính hãng', N'11.000 ₫', N'image/dedfc8e84f2572dd64897faae8eb442e.jpeg', N'GĂNG TAY CHỐNG DẦU JOGGER SUPERPRO 2121 - GĂNG TAY BẢO HỘ LAO ĐỘNG ĐA NĂNG
Được nhập khẩu và phân phối chính thức bởi Xsafe
------
 CẤU TẠO SẢN PHẨM:
- Đảm bảo sự linh hoạt khi thao tác cả với các chi tiết, vật dụng nhỏ. Và khả năng kháng dầu.
 ỨNG DỤNG GĂNG TAY BẢO HỘ JOGGER SUPERPRO 2121
- Superpro là găng tay bảo hộ chống dầu hoàn hảo để tăng hiệu suất làm việc khi thao tác với các chi tiết có dầu,
dính nhớt.
- EN 388:2003
- Chống hao mòn: 4/4
- Chống cắt: 1/5
- Chống rách: 2/4
- Chống đâm xuyên: 1/4
 CHI TIẾT GĂNG TAY BẢO HỘ JOGGER SUPERPRO 2121
- Model: Superpro
- Có thể giặt rửa bình thường (không sử dụng chất tẩy rửa mạnh).
- Bảo quản tránh sương, môi trường băng giá và ánh nắng mặt trời.
 THÔNG TIN CHUNG
THƯƠNG HIỆU Safety Jogger
NHÀ PHÂN PHỐI: Bảo Hộ Xsafe
 TẠI SAO NÊN MUA GĂNG TAY CHỐNG DẦU JOGGER CONSTRUCTO TẠI BẢO HỘ XSAFE ?
- Giá luôn tốt nhất
- Bảo hành chính hãng
-------
[Giải Pháp Bảo Hộ Toàn Diện Cho Doanh Nghiệp Cá Nhân]
* Add: 40/64 Lê Đức Thọ, P7, Q.Gò Vấp, HCM
* 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (186, N'Bộ dụng cụ di chuyển đồ vật nặng trong nhà thông minh KIOTOOL tải trọng 600kg chuyên dụng di chuyển don nhà - Màu ngầu nhiên', N'285.000 ₫', N'image/04882ddcfbdd34fcd2fbb0a4e9c321a3.jpg', N'Dụng cụ di chuyển đồ vật nặng trong nhà thông minh KIOTOOL tải trọng 600kg chuyên dụng di chuyển don nhà - Màu ngầu nhiên
Tải trọng 600kg di chuyển tủ giường ngay cả két sắt một cách dễ dành dù chỉ cần 1 ngườiVới thiết kế 3 bánh xoay linh động mỗi chânDễ dàng di chuyển đồ vật cồng kềnh, nặng mà không khó khăn hay mất nhiều sứcThiết kế thông minh, đơn giản và dễ sử dụngChế tạo từ hợp kim thép và nhựa ABS cao cấp, chịu lực tốtGiảm thời gian và tăng năng suất lao động hiệu quảChỉ cần 1 người cũng có thể chuyển đồ nặng
 









 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (187, N'Máy vặn vít dùng pin Bosch go gen 2 Mới', N'971.000 ₫', N'image/29a3cc0f246fad6edb706aa688c601adb7.jpg', N'Bạn mất quá nhiều thời gian để chọn được loại vít phù hợp để vặn ốc của các thiết bị máy móc, kệ treo thường,… nhưng vẫn không thực sự hiệu quả và tốn thêm chi phí mua các loại vít với đầu vít khác nhau. Đã đến lúc phải sở hữu Máy vặn vít dùng pin Bosch go gen 2 với đầy đủ các dụng cụ đáp ứng đủ nhu cầu của bạn. 
 
THÔNG SỐ KỸ THUẬT
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (188, N'Bộ dụng cụ nâng và di chuyển đồ thông minh, Dụng cụ di chuyển đồ đạc, Dụng cụ hỗ trợ di chuyển vật nặng', N'145.000 ₫', N'image/45f61952cef51f1f2b4c5c04e6c10b96.png', N'BỘ DỤNG CỤ NÂNG VÀ DI CHUYỂN ĐỒ THÔNG MINH
Hỗ trợ di chuyển vật dụng nặng: tủ lạnh, két sắt, tủ, giường,ết kiệm thời gian, nhân lực, tăng năng suất lao động. Giảm các nguy cơ chấn thương, tai nạn nghề nghiệp không đáng có.
CÁC TIỆN ÍCH MANG LẠI:
- Dễ dàng sử dụng xung quanh nhà, sắp xếp lại toàn bộ ngôi nhà hay chỉ đơn giản là điều chỉnh vị trí của một vài đồ vật.
- Là dụng cụ hỗ trợ không thể thiếu giúp giảm các nguy cơ chấn thương, tai nạn nghề nghiệp không đáng có khi khiêng nặng quá sức trong quá trình di chuyển, bê đồ vật
- Bộ sản phẩm bao gồm một tay nâng và hệ 4 con lăn. Tay nâng được làm từ chất liệu thép siêu cứng và siêu bền. Con lăn với các bánh xe được làm từ nhựa ABS chịu lực cao, có khả năng xoay 360 độ giúp bạn dễ dàng di chuyển vật dụng đến đúng vị trí mình mong muố
- Dùng để di chuyển vật dụng nặng: tủ lạnh, két sắt, tủ, giường,
- Tiết kiệm thời gian, nhân lực, tăng năng suất lao động.
- Chất liệu chế tạo tay nâng bằng hợp kim thép cao cấp, con lăn bánh xe làm từ nhựa ABS chịu lực tốt.
- Con lăn bánh xe xoay 360°, giúp dễ dàng di chuyển đồ.
- Tải trọng di chuyển tối đa mỗi còn lăn lên đến 150kg, Tổng tải trọng di chuyển là 600kg.
Thông tin sản phẩm:
Một bộ sản phẩm gồm: 1 tay nâng và 4 bánh xe chât liệu nhựa ABS và thép chất lượng cao.


Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (189, N'Ê tô kẹp bàn mini', N'32.000 ₫', N'image/84f9bdaec22ee433d5e7ec2a9dba71ab.jpg', N'Khi bạn sửa chữa những đồ vật nhỏ mà cần cố định nó để thao tác trở lên dễ dàng thì chiếc ê tô kẹp bàn mini này chính là một trợ thủ đắc lực không thể thiếu. Đặc biệt cho những bạn nào đam mê sửa chữa mà bị mất một cánh tay hoặc 1 tay bị đau...
Kích thước tổng thể: 93*83mm
Độ mở kẹp bàn tối đa: 35mm
Độ mở tối đa của ê tô: 30mm    
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (190, N'Thang nhôm rút gọn SUMIKA SK320 - Chiều cao tối đa 3.2m, chiều dài rút gọn 0.78m, hợp kim nhôm cao cấp, khóa chốt chắc chắn, đế cao su chống trượt, nhỏ gọn, di chuyển tiện lợi', N'1.180.000 ₫', N'image/393ea3255d13079d1942a23fd35ff5fc.jpg', N'- Đặc điểm nổi bật và chức năng ưu Việt của chiếc thang rút nhôm này là gì? Liệu thang nhôm có đảm bảo an toàn kĩ thuật khi sử dụng? Liệu thang nhôm có chắc chắn và bền bỉ hơn các dòng thang gỗ, tre hay tất cả các vật liệu khác? Thang rút nhôm có dễ sử dụng không? Dưới đây là một số thông tin về thang nhôm Sumika SK320 giúp khách hàng hiểu hơn trước khi lựa chọn cho mình một chiếc thang nhôm phù hợp có thể sử dụng được trong cuộc sống và công việc.

 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (191, N'Máy Phun Khử Khuẩn Nano K5 Pro Tia UV, Máy Xịt Khử Khuẩn Cầm Tay, Máy Diệt Khuẩn Nano Siêu Tiện Lợi', N'59.000 ₫', N'image/84fc9b40c17847ef850660ad05535cd1.png', N'Nhựa cao cấp

Để nơi khô mát

HƯỚNG DẨN SỬ DỤNG
- Rót dung dịch cồn y tế vào bình chứa
- Xoay bình chứa để treo bình vào thân súng
- Bật công tắc khởi động
- Điều chỉnh tốc độ phun


Máy Phun Khử Khuẩn Nano K5 Pro Tia UV, Máy Xịt Khử Khuẩn Cầm Tay, Máy Diệt Khuẩn Nano Siêu Tiện Lợi

 
️1. THÔNG TIN CHUNG
- Hàng có sẳn
- Hàng được bao bọc kỹ, đảm bảo khi vận chuyển
- Chất liệu cao cấp
- Sản phẩm rất nhẹ, bền, tiện lợi.
----------------------------------------------------
️2. THÔNG TIN SẢN PHẨM
Tên sản phẩm: Máy tiệt trùng phun tia UV khử khuẩn
Model sản phẩm: K5 Pro
Phạm vi: 200-300cm
Công suất định mức: 10W
Dung lượng pin  : 2000mah
Thời gian sạc: 2-4 giờ
Cổng sạc; USB
Thời gian sử dụng: 3-8giờ
Dung tích bình nước: 360ml
----------------------------------------------------
️3. SẢN PHẨM ĐƯỢC DÙNG KHI
- Khử khuẩn khi nhận hàng, vật liệu thông dụng
- Khử khuẩn tay cầm cửa
- Khử khuẩn thang máy
- Khử khuẩn nội thất xe hơi
- Khử khuẩn tay, chân khi hoạt động nơi công cộng
- Khử khuẩn vật dụng trong gia đình, công ty
----------------------------------------------------
️4. CAM KẾT CỦA SHOP
- Sản phẩm y ảnh 100.
- Đóng gói cẩn thận, bảo vệ sản phẩm nguyên vẹn trong quá trình vận chuyển
- Giao hàng nhanh chóng.
- Đươc đổi trả 1 đổi 1 hoàn toàn miễn phí nếu sản phẩm khi nhận hàng bị vỡ - hỏng – không giống hình ảnh.
- Hỗ trợ giải quyết đơn hàng trong thời gian sớm nhất với phương án tốt nhất để khách hàng luôn cảm thấy hài lòng và yên tâm khi mua sắm
️_️_️ XIN CHÂN THÀNH CẢM ƠN VÌ BẠN ĐÃ LỰA CHỌN CHÚNG TÔI ️_️_️
 


THÔNG TIN SẢN PHẨM
Tên sản phẩm: Máy tiệt trùng phun tia UV khử khuẩn
Model sản phẩm: K5 Pro
Phạm vi: 200-300cm
Công suất định mức: 10W
Dung lượng pin  : 2000mah
Thời gian sạc: 2-4 giờ
Cổng sạc; USB
Thời gian sử dụng: 3-8giờ
Dung tích bình nước: 360ml

Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (192, N'Khung máy cắt gắn máy mài cầm tay tiện lợi an toàn cứng cáp chuyên dụng cho ae chế đồ DIY chuyên nghiệp', N'325.000 ₫', N'image/28373a57f501cd0bde844ee1fed68a17.jpg', N'ĐẾ MÁY CẮT BÀN DÙNG CHO CÁC LOẠI MÁY CẮT MÀI CẦM TAY•Thích hợp cho máy mài với kích thước đĩa từ Ø 100 mm đến Ø 150 mm.- Với sự hỗ trợ của đế máy cắt bàn này, các đường cắt thép cắt, kim loại, ống,… vv trở nên đẹp hơn- Đối với việc sử dụng chung cho hầu hết các máy mài cắt góc cầm tay trên thị trường.• Thông số kỹ thuật:- Được đúc bằng hợp Kim chịu lực- Có lò xo đẩy mạnh mẽ- Có thiết bị kẹp điều chỉnh- Hỗ trợ dùng cho tất cả các loại máy mài, máy cắt góc cầm tay trên thị trường- Có bảo vệ chống tia lửa- Kích thước đế máy:200 × 240 mm- Dùng được cho các loại máy cắt góc có kích thước đá dưới 125mmBộ khung gắn máy mài máy cắt cầm tay sẽ biến máy cắt,máy mài cầm tay thành máy cắt, mày bàn để cắt sắt và cắt gỗ, máy mài bàn chắc chắn, chính xác , an toàn.Cắt góc tùy chỉnh Mang đi làm rất tiện Lắp được máy mài góc cỡ lưỡi 100, 110, 125 , 150 với nhiều loại lưỡi cắt, lưỡi mài sắt, gạch, gỗ tùy chếGiá rẻ hơn nhiều so với việc phải mua thêm cả 1 cái máy cắt bàn cồng kềnh






Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (193, N'Máy khoan bắn vít cầm tay  dùng nguồn điện trực tiếp', N'269.000 ₫', N'image/05c83c13f302a6e4b766d34825eec72c.jpg', N'Máy khoan bắn vít cầm tay dùng nguồn điện trực tiếp 
 
 

 

Máy thích hợp sử dụng cho nhiều công việc từ những việc gia đình như khoan tường treo tranh, giá sách, bắt tất kê, khoan gỗ,đến những công việc ngoài công trường hoặc xưởng chế tạo như khoan bê tông mỏng, khoan kim loại, làm nhôm kính…
 
 

 
Công suất: 880WKhả năng khoan thép/ gỗ: 10/ 20mmTốc độ không tải: 0-3.000v/pĐầu cặp: dùng mũi từ 0.8mm đến 10mmChức năng : Đảo chiềuNguồn điện : 220vBộ sản phẩm gồm : 1 máy khoan + 1 hộp giấy





 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (194, N'Máy vặn vít dùng pin Bosch go gen 2 Mới', N'971.000 ₫', N'image/29a3cc0f246fad6edb706aa688c601adb7.jpg', N'Bạn mất quá nhiều thời gian để chọn được loại vít phù hợp để vặn ốc của các thiết bị máy móc, kệ treo thường,… nhưng vẫn không thực sự hiệu quả và tốn thêm chi phí mua các loại vít với đầu vít khác nhau. Đã đến lúc phải sở hữu Máy vặn vít dùng pin Bosch go gen 2 với đầy đủ các dụng cụ đáp ứng đủ nhu cầu của bạn. 
 
THÔNG SỐ KỸ THUẬT
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (195, N'Thang nhôm rút gọn SUMIKA SK320 - Chiều cao tối đa 3.2m, chiều dài rút gọn 0.78m, hợp kim nhôm cao cấp, khóa chốt chắc chắn, đế cao su chống trượt, nhỏ gọn, di chuyển tiện lợi', N'1.180.000 ₫', N'image/393ea3255d13079d1942a23fd35ff5fc.jpg', N'- Đặc điểm nổi bật và chức năng ưu Việt của chiếc thang rút nhôm này là gì? Liệu thang nhôm có đảm bảo an toàn kĩ thuật khi sử dụng? Liệu thang nhôm có chắc chắn và bền bỉ hơn các dòng thang gỗ, tre hay tất cả các vật liệu khác? Thang rút nhôm có dễ sử dụng không? Dưới đây là một số thông tin về thang nhôm Sumika SK320 giúp khách hàng hiểu hơn trước khi lựa chọn cho mình một chiếc thang nhôm phù hợp có thể sử dụng được trong cuộc sống và công việc.

 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (196, N'Keo dán giày, gỗ, nhựa đa năng siêu dính 3M Scotch 3M-3M-AD113', N'24.000 ₫', N'image/4442b3f581cb226ee1ec4c4a182846a5.jpg', N'Tránh ánh nắng trực tiếp, đậy nắp sau khi sử dụng để bảo quản sản phẩm được lâu.
Sử dụng đơn giản như keo dán sắt thông thường, bề mặt cần dán cần sạch và khô.
18cm x 12xm x 4cm
Nhờ những đặc tính siêu dính, siêu chắc, khô nhanh nên Keo dán giày, gỗ, nhựa đa năng siêu dính 3M Scotch AD113 thường dùng dán đồ thể thao (giày, dép), dụng cụ thể thao và vật dụng gia đình, Với đặc tính trên Keo dán giày, gỗ, nhựa đa năng siêu dính 3M Scotch AD113 có thể sử dụng được cho các bề mặt khó dính như gỗ, kim loại, gốm sứ, cao su,…Thông tin sản phẩm


Tránh ánh nắng trực tiếp, đậy nắp sau khi sử dụng để bảo quản sản phẩm được lâu.
Sử dụng đơn giản như keo dán sắt thông thường, bề mặt cần dán cần sạch và khô.
Lưu ý: tùy theo đợt nhập hàng mà bao bì sản phẩm sẽ có sự thay đổi
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (197, N'Đồng Hồ Đo Điện Vạn Năng Ampe Kìm + Bút Thử Điện Cảm Ứng Đa Chức Năng CTFAST An Toàn Tiện Dụng', N'155.000 ₫', N'image/161434b2764fc67dd748af07d107574d.jpg', N'Nhựa ABS cách điện
Bảo quản nơi thoáng mát
Đọc kỹ hướng dẫn sử dụng .
Do dòng tải AC, đo Diode và thông mạch, đo điện áp DC, đo điện áp AC, đo điện trở
Đồng Hồ Đo Điện Vạn Năng Ampe Kìm + Bút Thử Điện Cảm Ứng Đa Chức Năng CTFAST An Toàn Tiện Dụng :  Là Bộ Sản Phẩm Đo Điện Dân Dụng hoàn hảo trong tủ sửa dụng cụ điện của gia đình bạn .Cặp đôi sản phẩm là cánh tay đắc lực cho các bạn khi sửa chữa , thăm dò, đo lường các thiết bị điện trong nhà một cạch an toàn hiệu quả , nhanh chóng.

THÔNG TIN SẢN PHẨM :
1.Đồng Hồ Đo Điện Vạn Năng Ampe Kìm:

- Chức năng:



Hướng dẫn sử dụng:

2.Bút Thử Điện Cảm Ứng Đa Chức Năng CTFAST




 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (198, N'Bộ Bặn Vít Đa Năng Bosch 46 món - Giao màu ngẫu nhiên', N'448.000 ₫', N'image/5cd7bdacd92295496f87caba6c4b9900.jpg', N'Thông tin sản phẩm
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (199, N'Bộ Dụng Cụ Sửa Chữa Đa Năng KIOTOOL 46 chi tiết - Bộ dụng cụ vặn bu long ốc vít sửa chữa xe máy', N'185.000 ₫', N'image/2b46fc92b97f4c77351aa26962474203.jpg', N'Bộ dụng cụ  KIOTOOL 46 chi tiết phù hợp với công việc sửa chữa trong gia đình
Chất liệu: thép không gỉ cao cấp, chắc chắn.
Mở ốc từ 4-14mm
Mở vít 2 cạnh, 4 cạnh, 6 cạnh các loại
Cờ lê đảo chiều, tay cầm tô vít, tay nối dài, dây nối dài giúp làm việc ở những góc hẹp
Hộp đựng sản phẩm bằng nhựa cứng gọn gàng, tiện dụng, tránh thất lạc phụ kiện
Kích thước hộp: 24*13*4cm.
Khối lượng: khoảng 1.5kg.
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (200, N'Bộ Dụng Cụ Sửa Chữa Đa Năng KIOTOOL 46 chi tiết - Bộ dụng cụ vặn bu long ốc vít sửa chữa xe máy', N'185.000 ₫', N'image/2b46fc92b97f4c77351aa26962474203.jpg', N'Bộ dụng cụ  KIOTOOL 46 chi tiết phù hợp với công việc sửa chữa trong gia đình
Chất liệu: thép không gỉ cao cấp, chắc chắn.
Mở ốc từ 4-14mm
Mở vít 2 cạnh, 4 cạnh, 6 cạnh các loại
Cờ lê đảo chiều, tay cầm tô vít, tay nối dài, dây nối dài giúp làm việc ở những góc hẹp
Hộp đựng sản phẩm bằng nhựa cứng gọn gàng, tiện dụng, tránh thất lạc phụ kiện
Kích thước hộp: 24*13*4cm.
Khối lượng: khoảng 1.5kg.
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (201, N'Thang nhôm rút gọn SUMIKA SK320 - Chiều cao tối đa 3.2m, chiều dài rút gọn 0.78m, hợp kim nhôm cao cấp, khóa chốt chắc chắn, đế cao su chống trượt, nhỏ gọn, di chuyển tiện lợi', N'1.180.000 ₫', N'image/393ea3255d13079d1942a23fd35ff5fc.jpg', N'- Đặc điểm nổi bật và chức năng ưu Việt của chiếc thang rút nhôm này là gì? Liệu thang nhôm có đảm bảo an toàn kĩ thuật khi sử dụng? Liệu thang nhôm có chắc chắn và bền bỉ hơn các dòng thang gỗ, tre hay tất cả các vật liệu khác? Thang rút nhôm có dễ sử dụng không? Dưới đây là một số thông tin về thang nhôm Sumika SK320 giúp khách hàng hiểu hơn trước khi lựa chọn cho mình một chiếc thang nhôm phù hợp có thể sử dụng được trong cuộc sống và công việc.

 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (202, N'Nhiệt ẩm kế Bamboo Life Nhiệt kế điện tử đo nhiệt độ phòng Ẩm kế điện tử đo độ ẩm phòng ngủ thông minh có đèn nhỏ gọn chính xác hàng chính hãng', N'189.000 ₫', N'image/e4cba1d459d2270b26fac6e0f8e9e3e2.jpg', N'Nhiệt ẩm kế Bamboo Life Nhiệt kế điện tử đo nhiệt độ phòng Ẩm kế điện tử đo độ ẩm phòng ngủ thông minh có đèn nhỏ gọn chính xác hàng chính hãng

Nhiệt độ và độ ẩm là 2 yếu tố ảnh hưởng rất lớn để giấc ngủ của bé. Nhiệt độ trên điều hòa sẽ không phản ánh được chính xác nhiệt độ trong phòng vì còn phụ thuộc vào nhiều yếu tố: nhiêt độ bên ngoài, diện tích phòng, vị trí bé nằm. Vì vậy cần có nhiệt ẩm kế để biết chính xác nhiệt độ trong phòng của bé.


Nhiệt ẩm kế có đèn sáng trong 7giây đến 10 giây giúp có thể xem được nhiệt độ trong đêm. 



 
️ Chức năng:
Đo nhiệt độ
Đo độ ẩm
Đồng hồ
️ Thông số kỹ thuật:
Màu sắc: Trắng.
Nhiệt độ đo trong khoảng -50 độ C - 70 độ C, sai số +- 1 độ C.
Kích thước 85*70 mm , kích thước màn: 40*60 mm
Đơn vị hiển thị 0.1 độ C.
Độ ẩm đo trong khoảng 10%RH - 90%RH, sai số +-5%RH
Đơn vị hiển thị 1%.
Sử dụng pin AAA (2 viên). Tặng kèm 2 pin khi mua máy
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (203, N'Dụng Cụ Lấy Dấu, Định Vị Điểm Khoan - Chống Trượt', N'28.999 ₫', N'image/0f2ef6a088a1d037f7232f5c4233725e.jpg', N'Dụng cụ đục lỗ, định vị điểm khoan là dụng cụ cầm tay giúp bạn dễ dàng đánh dấu trên các vật liệu sắt, gỗ, nhựa  với lực đẩy của lò xo cùng đầu mũi nhọn.
Thiết bị định vị được làm bằng ĐỒNG NGUYÊN CHẤT cùng lớp mạ màu vàng đẹp mắt, tránh việc gỉ cũng như đảm bảo độ bền của dụng cụ đục lỗ.
Việc sử dụng thiết bị đánh dấu điểm khoan là vô cùng đơn giản. Bạn chỉ cần xác định điểm cần đánh dấu. Sau đó, để đầu nhọn của thiết bị vào vị trí cần đánh dấu. 
Dùng tay ấn thiết bị định vị xuống và nhấc lên.
Kết quả: chúng ta có điểm đánh dấu mà không tốn nhiều sức.

Kích thước của dụng cụ đục lỗ
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
GO
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (204, N'Keo dán giày, gỗ, nhựa đa năng siêu dính 3M Scotch 3M-3M-AD113', N'24.000 ₫', N'image/4442b3f581cb226ee1ec4c4a182846a5.jpg', N'Tránh ánh nắng trực tiếp, đậy nắp sau khi sử dụng để bảo quản sản phẩm được lâu.
Sử dụng đơn giản như keo dán sắt thông thường, bề mặt cần dán cần sạch và khô.
18cm x 12xm x 4cm
Nhờ những đặc tính siêu dính, siêu chắc, khô nhanh nên Keo dán giày, gỗ, nhựa đa năng siêu dính 3M Scotch AD113 thường dùng dán đồ thể thao (giày, dép), dụng cụ thể thao và vật dụng gia đình, Với đặc tính trên Keo dán giày, gỗ, nhựa đa năng siêu dính 3M Scotch AD113 có thể sử dụng được cho các bề mặt khó dính như gỗ, kim loại, gốm sứ, cao su,…Thông tin sản phẩm


Tránh ánh nắng trực tiếp, đậy nắp sau khi sử dụng để bảo quản sản phẩm được lâu.
Sử dụng đơn giản như keo dán sắt thông thường, bề mặt cần dán cần sạch và khô.
Lưu ý: tùy theo đợt nhập hàng mà bao bì sản phẩm sẽ có sự thay đổi
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (205, N'Dây chằng hàng tăng đơ (dây cảo) bản 25mm dài 3 - 5m tải trọng 500-800kg', N'50.000 ₫', N'image/ccb69be66020983c521de76bc8d5ca3e.jpg', N'Dây chằng hàng tăng đơ (dây cảo) bản 25mm dài 3 - 5m tải trọng 500-800kg - capthepgiasi
Công Dụng:
- Dây được thiết kế với trọng lượng vô cùng nhẹ nên rất dễ cầm nắm và bảo quản.
- Với công dụng chằng, buộc hàng hóa, phương tiện cố định và vững chắc nhất, dây chằng hàng (tăng đơ vải) có độ linh hoạt tốt giúp vận hành an toàn và dễ dàng phù hợp cho các sản phẩm.
Độ dài: Từ 3 mét đến 12 mét
Chuyên cung cấp Sỉ - Lẻ: Dây Chằng Hàng ( Tăng Dây, Tăng Đơ Vải), Cáp Vải Cẩu Hàng ( Dây Bẹ ) đủ size, đủ kích cỡ.
CÔNG TY TNHH CÁP THÉP NAM LONG CHÂU
Website: - 
ĐC: Số 684 Quốc lộ 1A, Phường Thạnh Lộc, Quận 12, TP. HCM
Trân Trọng!
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (206, N'Túi vệ sinh máy lạnh TD01, Áo vệ sinh máy lạnh tại nhà', N'120.000 ₫', N'image/2842fb5deedb2b945dba0fa8974580a5.jpg', N'Vải dù tổ ong chống thấm
CÁCH SỬ DỤNG:
 
      Áo vệ sinh máy lạnh TD01 là mẫu thiết kế cải tiến nhất của nhà sản xuất Thuận Dung được thiết kế và sản xuất kể từ năm 2013, chuyên dùng cho thợ điện lạnh với độ bền cao, tiện lợi nhất với miệng áo có thun co dãn, và thiết kế luồn dây treo xung quanh máy lạnh.
     Trên thị trường hiện có rất nhiều Shop bán áo vệ sinh có nguồn gốc khác nhau, cần phân biệt sản phẩm bán bởi Thuận Dung và các sản phẩm khác như sau:

- Có tem sản phẩm từ nhà sản xuất Thuận Dung với mã sản phẩm là TD01, những sản phẩm không có tem này đều là hàng nhái không được sản xuất bởi Thuận Dung.
- Chất liệu: Vải dù tổ ong chống thấm, độ bền cao.
- Màu: Xanh đen (có màu xanh rêu nhưng chưa bán trên TIKI)
- Chiều rộng miệng túi: 1.8 mét, sử dụng đa năng cho tất cả các dòng máy lạnh dân dụng từ 1HP đến 3HP
- Ống xả : 2.5m tính từ phần đuôi áo, rất dài để tiện cho việc xả nước ở mọi độ cao gắn máy lạnh thông dụng.
- Trọng lượng: 600gr nhẹ hơn các loại vải khác giúp thao tác thuận tiện, không chì nặng vào máy khi xịt nước, không thấm vào vải, và cực kỳ mau khô sau khi sử dụng và giặt rữa giúp đảm bảo độ bền sử dụng lâu dài. 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (207, N'Mỏ hàn thiếc 220V 60W điều chỉnh nhiệt độ kèm phụ kiện - CK10', N'119.000 ₫', N'image/192d136b376198f08d975cb356394549.jpg', N'Kim loại, khác
Dây đồng phủ TPE
hộp
1




Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (208, N'Nhiệt ẩm kế Bamboo Life Nhiệt kế điện tử đo nhiệt độ phòng Ẩm kế điện tử đo độ ẩm phòng ngủ thông minh có đèn nhỏ gọn chính xác hàng chính hãng', N'189.000 ₫', N'image/e4cba1d459d2270b26fac6e0f8e9e3e2.jpg', N'Nhiệt ẩm kế Bamboo Life Nhiệt kế điện tử đo nhiệt độ phòng Ẩm kế điện tử đo độ ẩm phòng ngủ thông minh có đèn nhỏ gọn chính xác hàng chính hãng

Nhiệt độ và độ ẩm là 2 yếu tố ảnh hưởng rất lớn để giấc ngủ của bé. Nhiệt độ trên điều hòa sẽ không phản ánh được chính xác nhiệt độ trong phòng vì còn phụ thuộc vào nhiều yếu tố: nhiêt độ bên ngoài, diện tích phòng, vị trí bé nằm. Vì vậy cần có nhiệt ẩm kế để biết chính xác nhiệt độ trong phòng của bé.


Nhiệt ẩm kế có đèn sáng trong 7giây đến 10 giây giúp có thể xem được nhiệt độ trong đêm. 



 
️ Chức năng:
Đo nhiệt độ
Đo độ ẩm
Đồng hồ
️ Thông số kỹ thuật:
Màu sắc: Trắng.
Nhiệt độ đo trong khoảng -50 độ C - 70 độ C, sai số +- 1 độ C.
Kích thước 85*70 mm , kích thước màn: 40*60 mm
Đơn vị hiển thị 0.1 độ C.
Độ ẩm đo trong khoảng 10%RH - 90%RH, sai số +-5%RH
Đơn vị hiển thị 1%.
Sử dụng pin AAA (2 viên). Tặng kèm 2 pin khi mua máy
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (209, N'Bộ Dụng Cụ Sửa Chữa Đa Năng KIOTOOL 46 chi tiết - Bộ dụng cụ vặn bu long ốc vít sửa chữa xe máy', N'185.000 ₫', N'image/2b46fc92b97f4c77351aa26962474203.jpg', N'Bộ dụng cụ  KIOTOOL 46 chi tiết phù hợp với công việc sửa chữa trong gia đình
Chất liệu: thép không gỉ cao cấp, chắc chắn.
Mở ốc từ 4-14mm
Mở vít 2 cạnh, 4 cạnh, 6 cạnh các loại
Cờ lê đảo chiều, tay cầm tô vít, tay nối dài, dây nối dài giúp làm việc ở những góc hẹp
Hộp đựng sản phẩm bằng nhựa cứng gọn gàng, tiện dụng, tránh thất lạc phụ kiện
Kích thước hộp: 24*13*4cm.
Khối lượng: khoảng 1.5kg.
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (210, N'Mỏ hàn thiếc 220V 60W điều chỉnh nhiệt độ kèm phụ kiện - CK10', N'119.000 ₫', N'image/192d136b376198f08d975cb356394549.jpg', N'Kim loại, khác
Dây đồng phủ TPE
hộp
1




Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (211, N'Khoan pin 21v Máy khoan bắt vít 21v', N'395.000 ₫', N'image/a90c117e7186a732539699e903bfc93b.jpg', N'UY TÍN- CHẤT LƯỢNG
CAM KẾT HỖ TRỢ ĐỔI TRẢ BẢO HÀNH TỐT NHẤT

KHOAN PIN HITACHI 21V ( Bộ sản phẩm gồm thân máy + 1 pin sạc và tặng 4 mũi khoan )

                                                           THÔNG SỐ KỸ THUẬT
- Điện thế pin: 21V - Loại Pin: Max Lithiium-ion 
- Lực siết/mở vít : Cứng (30Nm); Mềm (20Nm) 
- Dung lượng pin: 3 Ah 
- Kích thước sản phẩm: 25x 15x 8 cm 
- Trọng lượng cả hộp: 1.4 kg ( hộp carton ) 
- Tốc độ không tải: Cao (0 - 1.550 vòng/phút); Thấp (0 - 550 vòng/phút) 
- Sản xuất : Theo Dây chuyền JANPAN

PIN SIÊU TRÂU DÙNG ĐƯỢC 4 - 5 TIẾNG

BỘ SẢN PHẨM ĐẦY ĐỦ BAO GỒM THÂN MÁY, SẠC, PIN
VÀ TĂNG 2 MŨI BẮT VÍT

CÁC CHỨC NĂNG NỔI BẬT CỦA MÁY: CÓ ĐÈN LED  SIÊU SÁNG
25 CẤP ĐỘ SIẾT, CHỨC NĂNG ĐẢO CHIỀU, 2 TỐC ĐỘ

MÁY CÓ THỂ DỄ DÀNG XUYÊN QUA TƯỜNG, GỖ, SẮT
VÀ BẮT VÍT MỘT CÁCH NHANH GỌN

BẢO HÀNH 1 NĂM KHI MUA MÁY TẠI CỬA HÀNG
CÒN CHẦN CHỪ GÌ MÀ KHÔNG MUA NGAY CHIẾC
Khoan pin 21V VỀ SỬ DỤNG
SHOP CAM KẾT
Cam kết tất cả sản phẩm bên ngoài giống như trong ảnh 
Cam kết về chất lượng và dịch vụ bán hàng
Cung cấp các sản phẩm theo đúng tiêu chuẩn với chất lượng tốt nhất
Đáp ứng mọi yêu cầu của khách hàng trong thời gian ngắn nhất
Đảm bảo về số lượng và đúng chủng loại khách đặt
Tư vấn miễn phí 24/24 cho quý khách hàng về các sản phẩm của chúng tôi, bất cứ thắc mắc gì trước và sau khi mua sản phẩm
CHÚC QUÝ KHÁCH THAM QUAN VÀ MUA SẮM VUI VẺ!!
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (212, N'Bộ Dụng Cụ Tua Vít Đa Năng Nhiều Món Có Từ Tính 111 in 1 Dùng Tháo Lắp, Tháo Mở Và Sửa Chữa Điện Thoại Di Động, Máy Tính, PC/ Laptop, Máy Tính Bảng', N'175.999 ₫', N'image/d3a2ae5f3b6ad38c8072385398071a15.jpg', N'Bộ Dụng Cụ Tua Vít Đa Năng Nhiều Món Có Từ Tính 111 in 1 Dùng Tháo Lắp, Tháo Mở Và Sửa Chữa Điện Thoại Di Động, Máy Tính, PC/ Laptop, Máy Tính Bảng
 

Trọn 111 trong 1 món với 98 đầu tua-vít các loại và 13 món khác
Chất liệu cao cấp, gia công độ chính xác cao
Giúp tháo lắp, tháo mở các thiết bị điện tử (máy tính, điện thoại, laptop,) một cách dễ dàng
Tất cả đầu tua-vít có từ tính
Thiết kế hộp nhựa ABS chất lượng chia từng ngăn sắp xếp gọn gàng
Hộp thiết kế nhỏ gọn, dễ dàng mang theo khi cần
Thích hợp sửa chữa cho hầu hết điện thoại di động, máy tính, máy chơi game, máy tính bảng, đồng hồ, kính,  trên thị trường
Kích thước hộp: 16x8x4cm





Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (213, N'Bộ dụng cụ đa năng 108 món của Bosch 2607002788', N'1.523.000 ₫', N'image/62aad7d39da288e5580b1677f27959b341.jpg', N'Bộ dụng cụ đa năng 108 món của Bosch 2607002788 với nhiều món khác nhau giúp cho công việc sửa chữa lắp đặt máy móc trong gia đình của bạn trở nên dễ dàng hơn rất nhiều, đảm bảo mở được tất cả các linh kiện. 108 món phụ kiện được xếp trong hộp rất tiện dụng và khoa học, chỉ cần một thao tác đơn giản, bạn sẽ chọn được ngay món phụ kiện cần sử dụng. Bộ dụng cụ chắc chắn sẽ là dụng cụ hỗ trợ đắc lực phục vụ các công việc của bạn được nhanh chóng và hiệu quả hơn rất nhiều.
THÔNG SỐ KỸ THUẬT
Bộ được đựng trong hộp nhựa bao gồm:
- Kìm điện Bosch = 1 cái- Kìm nhọn Bosch = 1 cái- Mỏ lết Bosch = 1 cái- Đèn pin chiếu sáng = 1 cái- Bút thử điện = 1 cái- Búa nhổ đinh Bosch = 1 cái- Cưa sắt cầm tay có lưỡi cưa Bosch = 1 cái- Băng keo điện màu đen = 1 cuộn- Thước kéo thép Bosch 3m = 1 cái- Cần lục giác chữ L: 1.5, 2, 2.5, 3, 4, 5, 5.5, 6mm = 8 cái- Tuốc nơ vít cầm tay có từ = 1 cái- Bộ đầu tuốc nơ vít: PH1, PH2, PH2, PH3, S6, S7, H5, H6, T15, T20 = 10 cái- Đầu chuyển từ lục giác ngoài 1/4" ra lục giác trong 4mm = 1 cái- Bộ đầu tuốc nơ vít lụgia1c ngoài 4mm: Dẹp 1.5, 2. Sao 0.8, 0.8, 6mm. Bake 00, 000 = 8 cái- Đầu chuyển từ lục giác ngoài 1/4" ra đầu vuông 1/4": 5, 6, 7, 8, 9, 10 = 7 cái- Mũi khoan bê tông đầu trụ: 5, 6, 8mm = 3 mũi- Tắc kê nhựa 5, 6, 8mm = 30 cái- Vít sắt bắt tắc kê nhựa 3, 4, 5mm = 30 cái
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (214, N'Găng tay lao động chống cắt 3M Cấp độ 1 - Găng tay bảo hộ chống đâm xuyên tiêu chuẩn EN388:4131 - Sản phẩm chính hãng', N'32.000 ₫', N'image/be7de3c53a72447a6e50a8df90d2c6eb.jpeg', N'Sản phẩm được phân phối chính hãng bới Bảo Hộ Xsafe
--------
- Vân chuyển hàng hóa trong kho
- Làm vườn
Những tính năng ưu việt giúp bảo vệ tốt bàn tay của người sử dụng:
- Mật độ vải cao kết hợp với sợi chỉ nhỏ nên độ ôm tay rất tốt giúp người sử dụng có cảm xác tiếp xúc chính xác.
- Lòng bàn tay phủ PU tạo độ bám khi cầm nắm.
- Sợi găng tay cấu tạo chính từ sợi Nylon giúp thoát khí.
- Độ bền cao, có thể giặt và tái sử dụng.
- Găng tay 3M chống cắt chủ yếu được sử dụng trong các thao tác máy móc có chi tiết sắt bén.
Thương hiệu:3M
Sản xuất:Việt Nam
Chất liệu: Nylon, PU
Một số lưu ý cho người dùng:
- Chống mài mòn: 4/5
- Chống cắt: 1/5
- Chống xé rách: 3/5
- Chống đ-â-m xuyên: 1/5
Xin cảm ơn!
TẠI SAO NÊN MUA GĂNG TAY CHỐNG CẮT 3M LEVEL 1 TẠI BẢO HỘ XSAFE ?
- Nhà Phân phối chính thứ của các thương hiệu bảo hộ hàng đầu: 3M, Ansell, J
- Bảo hành chính hãng và đổi trả sản phẩm với bất kỳ lỗi nào từ NSX
-------------------
[Giải Pháp Bảo Hộ Toàn Diện Cho Doanh Nghiệp Cá Nhân]
* Add: 20 đường số 1, KDC CityLand ParkHills, Phường 10, Quận Gò Vấp, 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (215, N'Máy Phun Khử Khuẩn Nano K5 Pro Tia UV, Máy Xịt Khử Khuẩn Cầm Tay, Máy Diệt Khuẩn Nano Siêu Tiện Lợi', N'59.000 ₫', N'image/84fc9b40c17847ef850660ad05535cd1.png', N'Nhựa cao cấp

Để nơi khô mát

HƯỚNG DẨN SỬ DỤNG
- Rót dung dịch cồn y tế vào bình chứa
- Xoay bình chứa để treo bình vào thân súng
- Bật công tắc khởi động
- Điều chỉnh tốc độ phun


Máy Phun Khử Khuẩn Nano K5 Pro Tia UV, Máy Xịt Khử Khuẩn Cầm Tay, Máy Diệt Khuẩn Nano Siêu Tiện Lợi

 
️1. THÔNG TIN CHUNG
- Hàng có sẳn
- Hàng được bao bọc kỹ, đảm bảo khi vận chuyển
- Chất liệu cao cấp
- Sản phẩm rất nhẹ, bền, tiện lợi.
----------------------------------------------------
️2. THÔNG TIN SẢN PHẨM
Tên sản phẩm: Máy tiệt trùng phun tia UV khử khuẩn
Model sản phẩm: K5 Pro
Phạm vi: 200-300cm
Công suất định mức: 10W
Dung lượng pin  : 2000mah
Thời gian sạc: 2-4 giờ
Cổng sạc; USB
Thời gian sử dụng: 3-8giờ
Dung tích bình nước: 360ml
----------------------------------------------------
️3. SẢN PHẨM ĐƯỢC DÙNG KHI
- Khử khuẩn khi nhận hàng, vật liệu thông dụng
- Khử khuẩn tay cầm cửa
- Khử khuẩn thang máy
- Khử khuẩn nội thất xe hơi
- Khử khuẩn tay, chân khi hoạt động nơi công cộng
- Khử khuẩn vật dụng trong gia đình, công ty
----------------------------------------------------
️4. CAM KẾT CỦA SHOP
- Sản phẩm y ảnh 100.
- Đóng gói cẩn thận, bảo vệ sản phẩm nguyên vẹn trong quá trình vận chuyển
- Giao hàng nhanh chóng.
- Đươc đổi trả 1 đổi 1 hoàn toàn miễn phí nếu sản phẩm khi nhận hàng bị vỡ - hỏng – không giống hình ảnh.
- Hỗ trợ giải quyết đơn hàng trong thời gian sớm nhất với phương án tốt nhất để khách hàng luôn cảm thấy hài lòng và yên tâm khi mua sắm
️_️_️ XIN CHÂN THÀNH CẢM ƠN VÌ BẠN ĐÃ LỰA CHỌN CHÚNG TÔI ️_️_️
 


THÔNG TIN SẢN PHẨM
Tên sản phẩm: Máy tiệt trùng phun tia UV khử khuẩn
Model sản phẩm: K5 Pro
Phạm vi: 200-300cm
Công suất định mức: 10W
Dung lượng pin  : 2000mah
Thời gian sạc: 2-4 giờ
Cổng sạc; USB
Thời gian sử dụng: 3-8giờ
Dung tích bình nước: 360ml

Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (216, N'Bộ Máy Khoan Bắt Vít Không Dây Dùng Pin 24V Kachi MK247 – Đi Kèm 1 Pin - hàng chính hãng', N'768.000 ₫', N'image/5ebcb709dbd46d2dda5c14622f35293b.png', N'dùng pin
Nơi khô ráo
Lắp pin khi sử dụng
Máy khỏe với 2 nấc điều chỉnh tốc độ làm việc. Có chức năng khoan, bắt vít, bắt ốc chống trượt nhiều cấp độ. Hỗ trợ công việc một cách hiệu quả. Máy khoan Kachi MK247 khoan mạnh mẽ với tốc độ thấp 0-400 vòng/phút, và mức cao là 0-1450 vòng/phút.
Pin: 24V Lithium-ION
Mô men xoắn cực đại: 40 N.m
Tốc độ không tải thấp/cao: 0-400/0-1450 vòng/phút
1 hộp
Tốc độ không tải thấp/cao: 0-400/0-1450 vòng/phút
Bộ máy khoan bắt vít không dây dùng Pin 24V Kachi MK247 là một model khoan mới nhất năm nay đến từ thương hiệu Kachi. Bộ máy khoan không dây, dùng pin 24V – đi kèm một pin phụ, giúp khách hàng có thể sử dụng liên tục mà không mất thời gian chờ sạc. Máy có thiết kế nhỏ gọn, với bộ phụ kiện chuyển đổi khoan giúp khoan tường, khoan sắt, gỗ nhanh chóng. Sản phẩm đi kèm vali đựng tiện lợi.
Bộ khoan dùng pin Kachi MK247 được thiết kế nhỏ gọn và vận dụng bằng pin sẽ cho phép bạn sử dụng linh hoạt và tiện lợi hơn. Trọng lượng máy khoan nhẹ chỉ với 1,1kg (bao gồm cả pin) và các phụ kiện đi kèm hơn 2kg giúp thao tác dễ dàng ở mọi ngóc ngách, đặc biệt với những mũi khoan ở chiều cao quá đầu.

- Đảo chiều trái phải.
 - Điều chỉnh tốc độ
 - Khoan tường
 - Khoan sắt
- Bắn vít và rất nhiều ứng dụng
Máy khoan này sử dụng rất phù hợp cho gia đình hoặc thi công công trình nhỏ. Tiện lợi khi các bạn làm việc ở các vị trí khó khăn: bắn vít tường, khoan trần, thi công mành rèm, bóng điện, các vị trí không thể kéo dây điện tới.

Máy khoan Kachi MK247 đi kèm 2 viên pin 24V Lithium/ION cùng sạc. Pin đi kèm có độ bền cao, có thể sử dụng trong một khoản thời gian dài mà không cần sạc liên tục. Ngoài ra Máy được trang bị công nghệ sạc nhanh giúp cho bạn tiết kiệm thời gian chờ,không bị gián đoạn trong công việc.

 
Hơn nữa,  bắt vít không dây dùng Pin 24V Kachi MK247 được trang bị hệ thống đèn báo và đèn LED để bạn có thể nhìn rõ vị trí cần bắn vít hoặc khoan. Đây là một điểm khá nổi bật mà máy được trang bị.

 
Máy khỏe với 2 nấc điều chỉnh tốc độ làm việc. Có chức năng khoan, bắt vít, bắt ốc chống trượt nhiều cấp độ. Hỗ trợ công việc một cách hiệu quả. Máy khoan Kachi MK247 khoan mạnh mẽ với tốc độ thấp 0-400 vòng/phút, và mức cao là 0-1450 vòng/phút.
 
Thương hiệu: Kachi
Model: MK247
Chức năng: khoan tường, khoan gỗ, khoan kim loại…
Pin: 24V Lithium-ION
Mô men xoắn cực đại: 40 N
Tốc độ không tải thấp/cao: 0-400/0-1450 vòng/phút
Kích thước hộp nhựa: 28.7 x 8.4 x 25.1cm
Khối lượng: 2.3kg
Xuất xứ thương hiệu: Việt Nam
Sản xuất tại: Trung Quốc
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (217, N'Set 328 Ống Gen Co Nhiệt Cách Điện Bọc Dây Điện Xe Hơi, Xe Máy, Máy Tính Nhiều Kích Cỡ', N'30.999 ₫', N'image/552fcb3b7924ddec16d49e1da895c8e1.jpg', N'Qúy khách vui lòng xem kỹ mô tả và kích thước trước khi đặt hàng dùm Shop nhé!
Bọc ống cách điện cáp có thể cách điện cáp và dây điện chống lại nhiệt độ cực cao trong máy bay, tàu thuyền và xe quân đội.
Ống co nhiệt polyolefin cung cấp một rào cản giữa cáp và sựăn mòn.
Ống co nhiệt có thể cải thiện giao diện của cáp trong mod máy tính hoặc ô tô và xe máy tùy chỉnh.
Nó được sử dụng rộng rãi trong kết nối dây, bảo vệ và cách điện của dây nối, đầu dây, điện cảm và các thành phần điện tử.
Kích thước:
Đường kính: 1.0mm, 2.0mm, 3.0mm, 4.0mm, 6.0mm, 8.0mm, 10.0mm, 14.0mm.
120 ống :1,0 x 40mm (vàng+đen+đỏ+xanh lục)
60 ống:2.0 x 40mm (vàng+đen+đỏ+xanh dương) 
40 ống: 3.0 x 40mm (vàng+ đen+đỏ+xanh lục)
 32 ống: 4.0 x 40mm (vàng +đe+đỏ+xanh dương)
24 ống: 6.0 x 40mm (vàng+đen+đỏ+xanh lục)
 20 ống: 10 x 80mm (vàng+đen+đỏ+, xanh dương)
16 ống:12 x 80mm (vàng+đen+ đỏ+ xanh dương)
16 ống: 14,0 x 80mm (vàng+ đen+đỏ+ xanh)', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (218, N'Găng tay lao động chống cắt 3M Cấp độ 1 - Găng tay bảo hộ chống đâm xuyên tiêu chuẩn EN388:4131 - Sản phẩm chính hãng', N'32.000 ₫', N'image/be7de3c53a72447a6e50a8df90d2c6eb.jpeg', N'Sản phẩm được phân phối chính hãng bới Bảo Hộ Xsafe
--------
- Vân chuyển hàng hóa trong kho
- Làm vườn
Những tính năng ưu việt giúp bảo vệ tốt bàn tay của người sử dụng:
- Mật độ vải cao kết hợp với sợi chỉ nhỏ nên độ ôm tay rất tốt giúp người sử dụng có cảm xác tiếp xúc chính xác.
- Lòng bàn tay phủ PU tạo độ bám khi cầm nắm.
- Sợi găng tay cấu tạo chính từ sợi Nylon giúp thoát khí.
- Độ bền cao, có thể giặt và tái sử dụng.
- Găng tay 3M chống cắt chủ yếu được sử dụng trong các thao tác máy móc có chi tiết sắt bén.
Thương hiệu:3M
Sản xuất:Việt Nam
Chất liệu: Nylon, PU
Một số lưu ý cho người dùng:
- Chống mài mòn: 4/5
- Chống cắt: 1/5
- Chống xé rách: 3/5
- Chống đ-â-m xuyên: 1/5
Xin cảm ơn!
TẠI SAO NÊN MUA GĂNG TAY CHỐNG CẮT 3M LEVEL 1 TẠI BẢO HỘ XSAFE ?
- Nhà Phân phối chính thứ của các thương hiệu bảo hộ hàng đầu: 3M, Ansell, J
- Bảo hành chính hãng và đổi trả sản phẩm với bất kỳ lỗi nào từ NSX
-------------------
[Giải Pháp Bảo Hộ Toàn Diện Cho Doanh Nghiệp Cá Nhân]
* Add: 20 đường số 1, KDC CityLand ParkHills, Phường 10, Quận Gò Vấp, 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (219, N'Keo Dán Giày, Dây Nịt Đa Năng Selleys Kwik Grip (50ml)', N'33.000 ₫', N'image/d1bde64b3a4ac8a23805c26ed6cac4c4.jpg', N'Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (220, N'Bộ dụng cụ đa năng 108 món của Bosch 2607002788', N'1.523.000 ₫', N'image/62aad7d39da288e5580b1677f27959b341.jpg', N'Bộ dụng cụ đa năng 108 món của Bosch 2607002788 với nhiều món khác nhau giúp cho công việc sửa chữa lắp đặt máy móc trong gia đình của bạn trở nên dễ dàng hơn rất nhiều, đảm bảo mở được tất cả các linh kiện. 108 món phụ kiện được xếp trong hộp rất tiện dụng và khoa học, chỉ cần một thao tác đơn giản, bạn sẽ chọn được ngay món phụ kiện cần sử dụng. Bộ dụng cụ chắc chắn sẽ là dụng cụ hỗ trợ đắc lực phục vụ các công việc của bạn được nhanh chóng và hiệu quả hơn rất nhiều.
THÔNG SỐ KỸ THUẬT
Bộ được đựng trong hộp nhựa bao gồm:
- Kìm điện Bosch = 1 cái- Kìm nhọn Bosch = 1 cái- Mỏ lết Bosch = 1 cái- Đèn pin chiếu sáng = 1 cái- Bút thử điện = 1 cái- Búa nhổ đinh Bosch = 1 cái- Cưa sắt cầm tay có lưỡi cưa Bosch = 1 cái- Băng keo điện màu đen = 1 cuộn- Thước kéo thép Bosch 3m = 1 cái- Cần lục giác chữ L: 1.5, 2, 2.5, 3, 4, 5, 5.5, 6mm = 8 cái- Tuốc nơ vít cầm tay có từ = 1 cái- Bộ đầu tuốc nơ vít: PH1, PH2, PH2, PH3, S6, S7, H5, H6, T15, T20 = 10 cái- Đầu chuyển từ lục giác ngoài 1/4" ra lục giác trong 4mm = 1 cái- Bộ đầu tuốc nơ vít lụgia1c ngoài 4mm: Dẹp 1.5, 2. Sao 0.8, 0.8, 6mm. Bake 00, 000 = 8 cái- Đầu chuyển từ lục giác ngoài 1/4" ra đầu vuông 1/4": 5, 6, 7, 8, 9, 10 = 7 cái- Mũi khoan bê tông đầu trụ: 5, 6, 8mm = 3 mũi- Tắc kê nhựa 5, 6, 8mm = 30 cái- Vít sắt bắt tắc kê nhựa 3, 4, 5mm = 30 cái
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (221, N'Thang nhôm rút gọn SUMIKA SK440 - Chiều cao tối đa 4.4m, chiều dài rút gọn 0.92m', N'1.685.000 ₫', N'image/0abc74a5542f0b0a22d78dbff4eb2a90.jpg', N'Thang Nhôm Rút Gọn Sumika SK440 được thiết kế thông minh với kiểu rút gọn, bạn có thể sử dụng ở nhiều độ cao khác nhau bằng cách kéo lên, rút xuống linh hoạt. Sản phẩm được sử dụng rộng rãi trong gia đình, trang trí nội thất, dùng trong nhà và ngoài trời. Đặc biệt còn được ứng dụng nhiều trong ngành bưu điện, điện lực, truyền hình cáp, Có thể phục vụ cho nhiều mục đích sử dụng khác nhau với chiều cao hợp lý của mình.
 

 
Sản phẩm được làm bằng chất liệu nhôm dày với độ dày 1.2 - 1.5 mm, chống móp méo, tránh tác động, chịu được lực cao. Chống lại sự oxy hoá khi tiếp xúc với môi trường bên ngoài và chịu được nhiệt khi dùng ở ngoài trời.
Đặc biệt, mỗi bậc thang được trang bị chốt khoá nhựa, cố định, chắc chắn, bậc thang đủ chắc giúp người dùng leo lên xuống thoải mái. Hơn nữa, chân than có đế cao su chống trơn trượt, đảm bảo an toàn cho người sử dụng và chống trầy sàn nhà bạn, giúp người sử dụng an tâm hơn.
 

 
Thang Nhôm Rút Gọn Sumika đươc thiết kế với số bậc thang là 15, trọng lượng nhẹ có thể xách tay dễ dàng cùng với thao tác sử dụng đơn giản: Mở rộng, rút ra theo từng bậc, dễ vận hành và sử dụng. Kích thước nhỏ gọn, thuận tiện để cất giữ trong không gian nhỏ. Ngoài ra sản phẩm có khóa gấp tự động với mức tải trọng lên đến 300kg đã đạt được tiêu chuẩn châu Âu EN131, đảm bảo an toàn cho bạn.
 

 
Thang nhôm rút gọn SUMIKA Model: SK440- Kích thước: 50x10x94cm- Chiều cao tối đa: 4.4m- Chiều dài rút gọn: 0.92m- Trọng lượng 12,3 kg- Số bậc: 15 bậc- Khoảng cách bậc: 30cm- Độ dày nhôm: 1,2-1,5 mm- Tải trọng 300kg, tiêu chuẩn EN131
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (222, N'Khung máy cắt gắn máy mài cầm tay tiện lợi an toàn cứng cáp chuyên dụng cho ae chế đồ DIY chuyên nghiệp', N'325.000 ₫', N'image/28373a57f501cd0bde844ee1fed68a17.jpg', N'ĐẾ MÁY CẮT BÀN DÙNG CHO CÁC LOẠI MÁY CẮT MÀI CẦM TAY•Thích hợp cho máy mài với kích thước đĩa từ Ø 100 mm đến Ø 150 mm.- Với sự hỗ trợ của đế máy cắt bàn này, các đường cắt thép cắt, kim loại, ống,… vv trở nên đẹp hơn- Đối với việc sử dụng chung cho hầu hết các máy mài cắt góc cầm tay trên thị trường.• Thông số kỹ thuật:- Được đúc bằng hợp Kim chịu lực- Có lò xo đẩy mạnh mẽ- Có thiết bị kẹp điều chỉnh- Hỗ trợ dùng cho tất cả các loại máy mài, máy cắt góc cầm tay trên thị trường- Có bảo vệ chống tia lửa- Kích thước đế máy:200 × 240 mm- Dùng được cho các loại máy cắt góc có kích thước đá dưới 125mmBộ khung gắn máy mài máy cắt cầm tay sẽ biến máy cắt,máy mài cầm tay thành máy cắt, mày bàn để cắt sắt và cắt gỗ, máy mài bàn chắc chắn, chính xác , an toàn.Cắt góc tùy chỉnh Mang đi làm rất tiện Lắp được máy mài góc cỡ lưỡi 100, 110, 125 , 150 với nhiều loại lưỡi cắt, lưỡi mài sắt, gạch, gỗ tùy chếGiá rẻ hơn nhiều so với việc phải mua thêm cả 1 cái máy cắt bàn cồng kềnh






Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (223, N'Găng tay bảo hộ lao động Jogger Superpro - Bao tay lao động chống dầu nhớt, trơn trượt, độ linh hoạt cao - Chính hãng', N'11.000 ₫', N'image/dedfc8e84f2572dd64897faae8eb442e.jpeg', N'GĂNG TAY CHỐNG DẦU JOGGER SUPERPRO 2121 - GĂNG TAY BẢO HỘ LAO ĐỘNG ĐA NĂNG
Được nhập khẩu và phân phối chính thức bởi Xsafe
------
 CẤU TẠO SẢN PHẨM:
- Đảm bảo sự linh hoạt khi thao tác cả với các chi tiết, vật dụng nhỏ. Và khả năng kháng dầu.
 ỨNG DỤNG GĂNG TAY BẢO HỘ JOGGER SUPERPRO 2121
- Superpro là găng tay bảo hộ chống dầu hoàn hảo để tăng hiệu suất làm việc khi thao tác với các chi tiết có dầu,
dính nhớt.
- EN 388:2003
- Chống hao mòn: 4/4
- Chống cắt: 1/5
- Chống rách: 2/4
- Chống đâm xuyên: 1/4
 CHI TIẾT GĂNG TAY BẢO HỘ JOGGER SUPERPRO 2121
- Model: Superpro
- Có thể giặt rửa bình thường (không sử dụng chất tẩy rửa mạnh).
- Bảo quản tránh sương, môi trường băng giá và ánh nắng mặt trời.
 THÔNG TIN CHUNG
THƯƠNG HIỆU Safety Jogger
NHÀ PHÂN PHỐI: Bảo Hộ Xsafe
 TẠI SAO NÊN MUA GĂNG TAY CHỐNG DẦU JOGGER CONSTRUCTO TẠI BẢO HỘ XSAFE ?
- Giá luôn tốt nhất
- Bảo hành chính hãng
-------
[Giải Pháp Bảo Hộ Toàn Diện Cho Doanh Nghiệp Cá Nhân]
* Add: 40/64 Lê Đức Thọ, P7, Q.Gò Vấp, HCM
* 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
INSERT [dbo].[products] ([id], [title], [price], [link], [description], [status]) VALUES (224, N'Thang ghế 3 bậc kết hợp xe đẩy hàng Kachi MK183', N'820.000 ₫', N'image/6cbf20d0e9a173481017f70b291aec31.jpg', N'Khung thép, bậc nhôm

Thùng carton 48× 7.5 ×118cm

Thang nhôm đa năng kết hợp xe đẩu hàng Kachi MK-183 được tích hợp 2 trong 1 sản phẩm. Thang được thiết kế giống với các sản phẩm thang nhôm ghế thông thường với phần tay cầm và mặt bậc rộng rãi. 


 
Thang nhôm kết hợp xe đẩy hàng đa năng Kachi MK-183 là công cụ hỗ trợ tuyệt vời cho nhiều mục đích sử dụng với thiết kế thông minh đầy sáng tạo với sự kết hợp hoàn hảo của chiếc thang nhôm tiện dụng cho các công việc tầm cao và xe đẩy hỗ trợ vận chuyển hàng hóa. Đa chức năng cho nhiều mục đích sử dụng khác nhau giúp người dùng có thể thoải mái xử lý công việc và đạt được các kết quả cao nhất một cách dễ dàng.

 
Khung của Thang nhôm kết hợp xe đẩy hàng đa năng Kachi MK-183 làm từ chất liệu thép định hình, vừng chắc. Cùng các bậc thang nhôm nhám bám chắc chân.
Chiều cao sử dụng của thang nhôm kết hợp xe đẩy Kachi MK-183 là 74cm (chiều cao tính từ mặt đất lên đến mặt bậc trên cùng) bao gồm 3 bậc thang. Khi đứng trên bậc trên dùng tựa đầu gối vào phần tay cầm của thang sẽ tạo cảm giác chắc chắn cho người sử dụng. Đặc biệt an toàn đối với phụ nữ và người cao tuổi.

Mặt bậc được thiết kế dạng nhám giúp bạn yên tâm không sợ trượt chân khi đứng trên thang. Chân thang đằng trước có gắn hai bánh xe đây là bánh xe khi sử dụng với chức năng xe đẩy hàng.
Thang có thiết kế giá đỡ có thể gấp gọn linh hoạt cho việc đẩy hàng hóa, cùng bánh xe có thể gấp gọn tiện dụng, không chiếm diện tích.


 
Để sử dụng chức năng đẩy hàng: bạn chỉ cần gấp gọn bậc thang và kéo phần giá đỡ ra là có thể sử dụng được thành dạng xe đẩy. Phần tay cầm của thang cũng biến thành phần tay kéo cho xe đẩy hàng. Khi cần di chuyển hàng hóa bạn sẽ đặt hàng hóa lên mặt sàn và di chuyển như những chiếc xe đẩy hàng thông thường với tải trọng xe đẩy là 60kg. Phù hợp với mục đích sử dụng cho gia đình.
Tải trọng thang lên đến 120kg, làm việc trên sản phẩm thoải mái mà không lo xảy ra bất kỳ vấn đề nào đáng lo. Tải trọng xe đẩy đạt 60kg vận chuyển được nhiều hàng hóa hơn.
Bạn có thể gấp gọn thang lại sau khi sử dụng nhằm tiết kiệm không gian
THÔNG SỐ SẢN PHẨMModel: MK-183
Chất liệu chính: Khung thép, bậc nhôm
Chiều rộng mỗi bậc thang: 8cm
Khối lượng (N.w): 7.2kg
Khối lượng (G.w): 8.2kg
Kích thước sản phẩm: 67× 47.5 ×106.5cm
Kích thước đóng thùng: 48× 7.5 ×118cm
Xuất xứ thương hiệu: Việt Nam
Sản xuất tại: Trung Quốc
Hình ảnh thực tế: 


Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'true')
SET IDENTITY_INSERT [dbo].[products] OFF
GO
INSERT [dbo].[users] ([username], [password], [enabled]) VALUES (N'susan', N'{bcrypt}$2a$10$EMR2JAVb5uLSw8GcSYPtY..wr.SETDYTM3svtA4yJ8toTgTA7cvlK', 1)
GO
ALTER TABLE [dbo].[authorities]  WITH CHECK ADD  CONSTRAINT [FK_authorities_users] FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[authorities] CHECK CONSTRAINT [FK_authorities_users]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_order_customers] FOREIGN KEY([id_kh])
REFERENCES [dbo].[customers] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_order_customers]
GO
ALTER TABLE [dbo].[cart_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_order] FOREIGN KEY([id_order])
REFERENCES [dbo].[cart] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[cart_detail] CHECK CONSTRAINT [FK_order_detail_order]
GO
ALTER TABLE [dbo].[cart_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_products] FOREIGN KEY([id_product])
REFERENCES [dbo].[products] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[cart_detail] CHECK CONSTRAINT [FK_order_detail_products]
GO
ALTER TABLE [dbo].[customers]  WITH CHECK ADD  CONSTRAINT [FK_customers_users] FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[customers] CHECK CONSTRAINT [FK_customers_users]
GO
USE [master]
GO
ALTER DATABASE [data_Sua_nha] SET  READ_WRITE 
GO
