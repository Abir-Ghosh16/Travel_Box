USE [Travel_Box]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 9/28/2024 10:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[admin_id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[agency]    Script Date: 9/28/2024 10:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agency](
	[agency_id] [nvarchar](50) NOT NULL,
	[agency_name] [nvarchar](50) NOT NULL,
	[agency_email] [nvarchar](50) NOT NULL,
	[agency_phone_number] [nvarchar](50) NOT NULL,
	[agency_country] [nvarchar](50) NOT NULL,
	[agency_address] [nvarchar](50) NOT NULL,
	[agency_type] [nvarchar](50) NOT NULL,
	[agency_password] [nvarchar](50) NOT NULL,
	[join_date] [nvarchar](50) NOT NULL,
	[admin_id] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_agencies] PRIMARY KEY CLUSTERED 
(
	[agency_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[booking]    Script Date: 9/28/2024 10:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booking](
	[booking_id] [nvarchar](50) NOT NULL,
	[booking_date] [datetime] NOT NULL,
	[travel_date] [datetime] NOT NULL,
	[number_of_people] [int] NOT NULL,
	[total_price] [float] NOT NULL,
	[customer_email] [nvarchar](50) NOT NULL,
	[transection_number] [nvarchar](50) NOT NULL,
	[payment_method] [nvarchar](50) NOT NULL,
	[package_id] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_booking] PRIMARY KEY CLUSTERED 
(
	[booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[consultation_requests]    Script Date: 9/28/2024 10:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[consultation_requests](
	[request_id] [nvarchar](50) NOT NULL,
	[customer_name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[contact_number] [nvarchar](50) NOT NULL,
	[message] [nvarchar](max) NOT NULL,
	[package_id] [nvarchar](50) NOT NULL,
	[request_date] [datetime] NOT NULL,
	[agency_id] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_consultation_requests] PRIMARY KEY CLUSTERED 
(
	[request_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 9/28/2024 10:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[gender] [nvarchar](50) NOT NULL,
	[phone_number] [varchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[country] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[date_and_time] [datetime] NOT NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tour_packages]    Script Date: 9/28/2024 10:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tour_packages](
	[package_id] [nvarchar](50) NOT NULL,
	[package_name] [nvarchar](50) NOT NULL,
	[destination] [nvarchar](50) NOT NULL,
	[duration] [nvarchar](50) NOT NULL,
	[lowest_customer_capacity] [int] NOT NULL,
	[highest_customer_capacity] [int] NOT NULL,
	[price_per_person] [float] NOT NULL,
	[refund_stutus] [nvarchar](50) NOT NULL,
	[requirments] [nvarchar](max) NOT NULL,
	[overview] [nvarchar](max) NOT NULL,
	[details] [nvarchar](max) NOT NULL,
	[image_1] [image] NOT NULL,
	[image_2] [image] NOT NULL,
	[image_3] [image] NOT NULL,
	[image_4] [image] NOT NULL,
	[image_5] [image] NOT NULL,
	[agency_id] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_packages] PRIMARY KEY CLUSTERED 
(
	[package_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[agency]  WITH CHECK ADD  CONSTRAINT [FK_agencies_admin] FOREIGN KEY([admin_id])
REFERENCES [dbo].[admin] ([admin_id])
GO
ALTER TABLE [dbo].[agency] CHECK CONSTRAINT [FK_agencies_admin]
GO
ALTER TABLE [dbo].[booking]  WITH CHECK ADD  CONSTRAINT [FK_booking_customer] FOREIGN KEY([customer_email])
REFERENCES [dbo].[customer] ([email])
GO
ALTER TABLE [dbo].[booking] CHECK CONSTRAINT [FK_booking_customer]
GO
ALTER TABLE [dbo].[booking]  WITH CHECK ADD  CONSTRAINT [FK_booking_tour_packages] FOREIGN KEY([package_id])
REFERENCES [dbo].[tour_packages] ([package_id])
GO
ALTER TABLE [dbo].[booking] CHECK CONSTRAINT [FK_booking_tour_packages]
GO
ALTER TABLE [dbo].[consultation_requests]  WITH CHECK ADD  CONSTRAINT [FK_consultation_requests_agency] FOREIGN KEY([agency_id])
REFERENCES [dbo].[agency] ([agency_id])
GO
ALTER TABLE [dbo].[consultation_requests] CHECK CONSTRAINT [FK_consultation_requests_agency]
GO
ALTER TABLE [dbo].[consultation_requests]  WITH CHECK ADD  CONSTRAINT [FK_consultation_requests_customer] FOREIGN KEY([email])
REFERENCES [dbo].[customer] ([email])
GO
ALTER TABLE [dbo].[consultation_requests] CHECK CONSTRAINT [FK_consultation_requests_customer]
GO
ALTER TABLE [dbo].[consultation_requests]  WITH CHECK ADD  CONSTRAINT [FK_consultation_requests_tour_packages] FOREIGN KEY([package_id])
REFERENCES [dbo].[tour_packages] ([package_id])
GO
ALTER TABLE [dbo].[consultation_requests] CHECK CONSTRAINT [FK_consultation_requests_tour_packages]
GO
ALTER TABLE [dbo].[tour_packages]  WITH CHECK ADD  CONSTRAINT [FK_packages_agency] FOREIGN KEY([agency_id])
REFERENCES [dbo].[agency] ([agency_id])
GO
ALTER TABLE [dbo].[tour_packages] CHECK CONSTRAINT [FK_packages_agency]
GO
