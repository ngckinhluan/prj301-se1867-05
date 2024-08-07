USE [master]
GO
/****** Object:  Database [FlightBooking]    Script Date: 10/26/2023 2:12:41 PM ******/
CREATE DATABASE [FlightBooking]
GO
ALTER DATABASE [FlightBooking] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FlightBooking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FlightBooking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FlightBooking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FlightBooking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FlightBooking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FlightBooking] SET ARITHABORT OFF 
GO
ALTER DATABASE [FlightBooking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FlightBooking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FlightBooking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FlightBooking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FlightBooking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FlightBooking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FlightBooking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FlightBooking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FlightBooking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FlightBooking] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FlightBooking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FlightBooking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FlightBooking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FlightBooking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FlightBooking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FlightBooking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FlightBooking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FlightBooking] SET RECOVERY FULL 
GO
ALTER DATABASE [FlightBooking] SET  MULTI_USER 
GO
ALTER DATABASE [FlightBooking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FlightBooking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FlightBooking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FlightBooking] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FlightBooking] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FlightBooking] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FlightBooking', N'ON'
GO
ALTER DATABASE [FlightBooking] SET QUERY_STORE = ON
GO
ALTER DATABASE [FlightBooking] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FlightBooking]
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 10/26/2023 2:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[seats] [int] NULL,
	[departureTime] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[destination] [varchar](100) NULL,
	[arrivalTime] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ticket]    Script Date: 10/26/2023 2:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](100) NULL,
	[FlightId] [int] NULL,
	[seatNumber] [int] NULL,
	[bookedDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/26/2023 2:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[username] [varchar](100) NOT NULL,
	[dob] [date] NULL,
	[email] [varchar](320) NULL,
	[full_name] [varchar](100) NULL,
	[gender] [int] NULL,
	[password] [varchar](100) NULL,
	[role] [int] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 
GO
SET IDENTITY_INSERT [dbo].[Flight] ON 

INSERT [dbo].[Flight] ([id], [seats], [departureTime], [source], [destination], [arrivalTime]) VALUES (1, 45, N'08:30 AM', N'Hanoi', N'Ho Chi Minh City', N'03:30 PM')
INSERT [dbo].[Flight] ([id], [seats], [departureTime], [source], [destination], [arrivalTime]) VALUES (2, 30, N'10:00 AM', N'Hanoi', N'Da Nang', N'04:30 PM')
INSERT [dbo].[Flight] ([id], [seats], [departureTime], [source], [destination], [arrivalTime]) VALUES (3, 40, N'09:00 AM', N'Hanoi', N'Nha Trang', N'05:00 PM')
INSERT INTO [dbo].[Flight] ([id], [seats], [departureTime], [source], [destination], [arrivalTime]) 
VALUES 
(4, 50, '07:00', 'Da Nang', 'Hanoi', '09:30'),
(5, 55, '08:00', 'Nha Trang', 'Da Nang', '10:45'),
(6, 60, '09:30', 'Ho Chi Minh City', 'Hanoi', '12:00'),
(7, 45, '11:00', 'Hanoi', 'Ho Chi Minh City', '13:30'),
(8, 30, '12:00', 'Hanoi', 'Da Nang', '14:30'),
(9, 40, '13:00', 'Hanoi', 'Nha Trang', '15:00'),
(10, 50, '14:00', 'Da Nang', 'Hanoi', '16:30'),
(11, 55, '15:00', 'Nha Trang', 'Da Nang', '17:45'),
(12, 60, '16:30', 'Ho Chi Minh City', 'Hanoi', '19:00'),
(13, 45, '18:00', 'Hanoi', 'Ho Chi Minh City', '20:30'),
(14, 50, '07:15', 'Hanoi', 'Phu Quoc', '09:45'),
(15, 60, '08:20', 'Phu Quoc', 'Hanoi', '10:50'),
(16, 55, '09:25', 'Ho Chi Minh City', 'Da Nang', '11:55'),
(17, 45, '10:30', 'Da Nang', 'Ho Chi Minh City', '12:00'),
(18, 65, '11:35', 'Hanoi', 'Can Tho', '14:05'),
(19, 70, '12:40', 'Can Tho', 'Hanoi', '15:10'),
(20, 75, '13:45', 'Hanoi', 'Da Nang', '15:15'),
(21, 80, '14:50', 'Da Nang', 'Hanoi', '16:20'),
(22, 85, '15:55', 'Ho Chi Minh City', 'Phu Quoc', '17:25'),
(23, 90, '16:00', 'Phu Quoc', 'Ho Chi Minh City', '17:30'),
(24, 95, '17:05', 'Hanoi', 'Nha Trang', '19:35'),
(25, 100, '18:10', 'Nha Trang', 'Hanoi', '20:40'),
(26, 55, '19:15', 'Da Nang', 'Phu Quoc', '21:45'),
(27, 60, '20:20', 'Phu Quoc', 'Da Nang', '22:50'),
(28, 65, '05:25', 'Hanoi', 'Ho Chi Minh City', '07:55'),
(29, 70, '06:30', 'Ho Chi Minh City', 'Hanoi', '08:00'),
(30, 75, '07:35', 'Hanoi', 'Da Nang', '09:05'),
(31, 80, '08:40', 'Da Nang', 'Hanoi', '10:10'),
(32, 85, '09:45', 'Ho Chi Minh City', 'Nha Trang', '11:15'),
(33, 90, '10:50', 'Nha Trang', 'Ho Chi Minh City', '12:20'),
(34, 95, '11:55', 'Hanoi', 'Can Tho', '14:25'),
(35, 100, '13:00', 'Can Tho', 'Hanoi', '15:30'),
(36, 55, '14:05', 'Hanoi', 'Phu Quoc', '16:35'),
(37, 60, '15:10', 'Phu Quoc', 'Hanoi', '17:40'),
(38, 65, '16:15', 'Da Nang', 'Ho Chi Minh City', '17:45'),
(39, 70, '17:20', 'Ho Chi Minh City', 'Da Nang', '18:50'),
(40, 75, '18:25', 'Hanoi', 'Da Nang', '19:55'),
(41, 80, '19:30', 'Da Nang', 'Hanoi', '20:00'),
(42, 85, '20:35', 'Ho Chi Minh City', 'Phu Quoc', '22:05'),
(43, 90, '21:40', 'Phu Quoc', 'Ho Chi Minh City', '23:10'),
(44, 50, '07:30', 'Hanoi', 'Phu Quoc', '10:00'),
(45, 60, '08:45', 'Phu Quoc', 'Hanoi', '11:15'),
(46, 55, '09:50', 'Ho Chi Minh City', 'Da Nang', '11:20'),
(47, 45, '10:55', 'Da Nang', 'Ho Chi Minh City', '12:25'),
(48, 65, '12:00', 'Hanoi', 'Can Tho', '14:30'),
(49, 70, '13:05', 'Can Tho', 'Hanoi', '15:35'),
(50, 75, '14:10', 'Hanoi', 'Da Nang', '15:40'),
(51, 80, '15:15', 'Da Nang', 'Hanoi', '16:45'),
(52, 85, '16:20', 'Ho Chi Minh City', 'Phu Quoc', '17:50'),
(53, 90, '17:25', 'Phu Quoc', 'Ho Chi Minh City', '18:55'),
(54, 95, '18:30', 'Hanoi', 'Nha Trang', '20:00'),
(55, 100, '19:35', 'Nha Trang', 'Hanoi', '21:05'),
(56, 55, '20:40', 'Da Nang', 'Phu Quoc', '22:10'),
(57, 60, '21:45', 'Phu Quoc', 'Da Nang', '23:15'),
(58, 65, '05:30', 'Hanoi', 'Ho Chi Minh City', '07:00'),
(59, 70, '06:35', 'Ho Chi Minh City', 'Hanoi', '08:05'),
(60, 75, '07:40', 'Hanoi', 'Da Nang', '09:10'),
(61, 80, '08:45', 'Da Nang', 'Hanoi', '10:15'),
(62, 85, '09:50', 'Ho Chi Minh City', 'Nha Trang', '11:20'),
(63, 90, '10:55', 'Nha Trang', 'Ho Chi Minh City', '12:25'),
(64, 95, '12:00', 'Hanoi', 'Can Tho', '14:30'),
(65, 100, '13:05', 'Can Tho', 'Hanoi', '15:35'),
(66, 55, '14:10', 'Hanoi', 'Phu Quoc', '16:40'),
(67, 60, '15:15', 'Phu Quoc', 'Hanoi', '17:45'),
(68, 65, '16:20', 'Da Nang', 'Ho Chi Minh City', '17:50'),
(69, 70, '17:25', 'Ho Chi Minh City', 'Da Nang', '18:55'),
(70, 75, '18:30', 'Hanoi', 'Da Nang', '20:00'),
(71, 80, '19:35', 'Da Nang', 'Hanoi', '21:05'),
(72, 85, '20:40', 'Ho Chi Minh City', 'Phu Quoc', '22:10'),
(73, 90, '21:45', 'Phu Quoc', 'Ho Chi Minh City', '23:15'),
(74, 50, '06:00', 'Hanoi', 'Da Nang', '07:30'),
(75, 55, '06:30', 'Da Nang', 'Hanoi', '08:00'),
(76, 60, '07:00', 'Hanoi', 'Nha Trang', '08:45'),
(77, 65, '07:30', 'Nha Trang', 'Hanoi', '09:15'),
(78, 70, '08:00', 'Hanoi', 'Ho Chi Minh City', '09:45'),
(79, 75, '08:30', 'Ho Chi Minh City', 'Hanoi', '10:15'),
(80, 80, '09:00', 'Hanoi', 'Phu Quoc', '10:50'),
(81, 85, '09:30', 'Phu Quoc', 'Hanoi', '11:20'),
(82, 90, '10:00', 'Hanoi', 'Da Nang', '11:45'),
(83, 95, '10:30', 'Da Nang', 'Hanoi', '12:15'),
(84, 100, '11:00', 'Hanoi', 'Nha Trang', '12:45'),
(85, 105, '11:30', 'Nha Trang', 'Hanoi', '13:15'),
(86, 110, '12:00', 'Hanoi', 'Ho Chi Minh City', '13:45'),
(87, 115, '12:30', 'Ho Chi Minh City', 'Hanoi', '14:15'),
(88, 120, '13:00', 'Hanoi', 'Phu Quoc', '14:50'),
(89, 125, '13:30', 'Phu Quoc', 'Hanoi', '15:20'),
(90, 130, '14:00', 'Hanoi', 'Da Nang', '15:45'),
(91, 135, '14:30', 'Da Nang', 'Hanoi', '16:15'),
(92, 140, '15:00', 'Hanoi', 'Nha Trang', '16:45'),
(93, 145, '15:30', 'Nha Trang', 'Hanoi', '17:15'),
(94, 150, '16:00', 'Hanoi', 'Ho Chi Minh City', '17:45'),
(95, 155, '16:30', 'Ho Chi Minh City', 'Hanoi', '18:15'),
(96, 160, '17:00', 'Hanoi', 'Phu Quoc', '18:50'),
(97, 165, '17:30', 'Phu Quoc', 'Hanoi', '19:20'),
(98, 170, '18:00', 'Hanoi', 'Da Nang', '19:45'),
(99, 175, '18:30', 'Da Nang', 'Hanoi', '20:15'),
(100, 180, '19:00', 'Hanoi', 'Nha Trang', '20:45'),
(101, 185, '19:30', 'Nha Trang', 'Hanoi', '21:15'),
(102, 190, '20:00', 'Hanoi', 'Ho Chi Minh City', '21:45'),
(103, 195, '20:30', 'Ho Chi Minh City', 'Hanoi', '22:15');



SET IDENTITY_INSERT [dbo].[Flight] OFF
GO
SET IDENTITY_INSERT [dbo].[ticket] ON 

INSERT [dbo].[ticket] ([id], [username], [FlightId], [seatNumber], [bookedDate]) VALUES (7, N'Aline', 1, 1, CAST(N'2023-10-26' AS Date))
INSERT [dbo].[ticket] ([id], [username], [FlightId], [seatNumber], [bookedDate]) VALUES (8, N'Branden', 1, 2, CAST(N'2023-10-26' AS Date))
INSERT [dbo].[ticket] ([id], [username], [FlightId], [seatNumber], [bookedDate]) VALUES (9, N'Chiquita', 2, 1, CAST(N'2023-10-26' AS Date))
INSERT [dbo].[ticket] ([id], [username], [FlightId], [seatNumber], [bookedDate]) VALUES (10, N'Christian', 2, 2, CAST(N'2023-10-26' AS Date))
INSERT [dbo].[ticket] ([id], [username], [FlightId], [seatNumber], [bookedDate]) VALUES (11, N'Clio', 3, 1, CAST(N'2023-10-26' AS Date))



SET IDENTITY_INSERT [dbo].[ticket] OFF
GO
INSERT [dbo].[Users] ([username], [dob], [email], [full_name], [gender], [password], [role], [status]) VALUES (N'admin', CAST(N'2023-05-26' AS Date), N'malesuada@hotmail.net', N'Castor', 0, N'21232f297a57a5a743894a0e4a801fc3', 0,  1)
INSERT [dbo].[Users] ([username], [dob], [email], [full_name], [gender], [password], [role],  [status]) VALUES (N'Aline', CAST(N'2023-07-19' AS Date), N'phasellus.dolor@yahoo.org', N'Kadeem', 0, N'202cb962ac59075b964b07152d234b70', 0, 1)
INSERT [dbo].[Users] ([username], [dob], [email], [full_name], [gender], [password], [role],  [status]) VALUES (N'Branden', CAST(N'2023-08-15' AS Date), N'consequat.purus@google.com', N'Yuli', 0, N'202cb962ac59075b964b07152d234b70', 0, 1)
INSERT [dbo].[Users] ([username], [dob], [email], [full_name], [gender], [password], [role], [status]) VALUES (N'Chiquita', CAST(N'2023-04-29' AS Date), N'tellus.justo.sit@google.com', N'Ulysses', 1, N'202cb962ac59075b964b07152d234b70', 0, 1)
INSERT [dbo].[Users] ([username], [dob], [email], [full_name], [gender], [password], [role],  [status]) VALUES (N'Christian', CAST(N'2023-05-26' AS Date), N'eu.erat@google.net', N'Damian', 0, N'202cb962ac59075b964b07152d234b70', 0, 1)
INSERT [dbo].[Users] ([username], [dob], [email], [full_name], [gender], [password], [role],  [status]) VALUES (N'Clio', CAST(N'2023-08-17' AS Date), N'fusce@icloud.com', N'Elvis Nam', 0, N'e10adc3949ba59abbe56e057f20f883e', 0, 1)


GO
ALTER TABLE [dbo].[ticket] ADD  DEFAULT (getdate()) FOR [bookedDate]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [role]
GO

ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD FOREIGN KEY([FlightId])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD FOREIGN KEY([FlightId])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Users] ([username])
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Users] ([username])
GO
USE [master]
GO
ALTER DATABASE [FlightBooking] SET  READ_WRITE 
GO
