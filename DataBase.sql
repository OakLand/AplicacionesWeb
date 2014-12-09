USE [master]
GO

/****** Object:  Database [AplicacionesWebDB]    Script Date: 03/12/2014 07:06:40 p.m. ******/
CREATE DATABASE [AplicacionesWebDB]
GO

USE [AplicacionesWebDB]
GO

/****** Object:  Table [dbo].[Area]    Script Date: 03/12/2014 07:04:32 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Area](
	[Id] [int] IDENTITY (1, 1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Boleto](
	[Id] [int] IDENTITY (1, 1) NOT NULL,
	[Id_Persona] [int] NULL,
	[Id_Area] [int] NOT NULL,
	[Id_Seccion] [int] NOT NULL,
	[Fila] [int] NULL,
	[No_Asiento] [int] NULL,
	[Costo] [decimal](19, 2) NOT NULL,
	[Tipo] [int] NOT NULL,
	[Fecha_Reserva] [datetime] NULL,
	[Fecha_Pago] [datetime] NULL,
	[Id_Evento] [int] NOT NULL,
 CONSTRAINT [PK_Boleto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Categoria](
	[Id] [int] IDENTITY (1, 1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Categoria_Padre] [int] NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Empresa](
	[Logo] [image] NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Slogan] [varchar](50) NOT NULL,
	[Costo_Suscripcion] [decimal](19, 2) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

CREATE TABLE [dbo].[Evento](
	[Id] [int] IDENTITY (1, 1) NOT NULL,
	[Id_Persona] [int] NOT NULL,
	[Descripcion] [text] NOT NULL,
	[Ubicacion] [text] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora] [varchar](5) NOT NULL,
	[Categoria] [int] NOT NULL,
	[Reservar] [int] NOT NULL,
	[Tiempo_Reserva] [int] NULL,
 CONSTRAINT [PK_Evento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

CREATE TABLE [dbo].[Imagenes](
	[Id] [int] IDENTITY (1, 1) NOT NULL,
	[Id_Persona] [int] NOT NULL,
	[Imagen] [image] NOT NULL,
 CONSTRAINT [PK_Imagenes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

CREATE TABLE [dbo].[Pago_Promotor](
	[Id] [int] IDENTITY (1, 1) NOT NULL,
	[Id_Persona] [int] NOT NULL,
	[Pago] [decimal](19, 2) NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK_Pago_Promotor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Persona](
	[Id] [int] IDENTITY (1, 1) NOT NULL,
	[Id_User] [int] NULL,
	[Nombre] [varchar](128) NOT NULL,
	[Email] [varchar](60) NOT NULL,
	[Fotografia] [int] NULL,
	[Estado] [int] NOT NULL,
	[Tipo] [int] NOT NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Email_Persona] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY (1, 1) NOT NULL,
	[Id_Persona] [int] NULL,
	[User] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Preguntas](
	[Id] [int] IDENTITY (1, 1) NOT NULL,
	[Categoria] [int] NOT NULL,
	[Tema] [varchar](50) NOT NULL,
	[Pregunta] [text] NOT NULL,
	[Respuesta] [text] NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

CREATE TABLE [dbo].[Seccion](
	[Id] [int] IDENTITY (1, 1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Seccion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Solicitud](
	[Id] [int] IDENTITY (1, 1) NOT NULL,
	[Id_Persona] [int] NOT NULL,
	[Estado] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK_Solicitud] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IDPersona_Solicitud] UNIQUE NONCLUSTERED 
(
	[Id_Persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Solicitud_Categoria](
	[Id] [int] IDENTITY (1, 1) NOT NULL,
	[Id_Persona] [int] NOT NULL,
	[Categoria] [varchar](50) NOT NULL,
	[Comentarios] [text] NULL,
	[estado] [int] NOT NULL,
	[fecha] [datetime] NULL,
 CONSTRAINT [PK_Solicitud_Categoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO







ALTER TABLE [dbo].[Boleto]  WITH CHECK ADD  CONSTRAINT [FK_Boleto_Area] FOREIGN KEY([Id_Area])
REFERENCES [dbo].[Area] ([Id])
GO

ALTER TABLE [dbo].[Boleto] CHECK CONSTRAINT [FK_Boleto_Area]
GO

ALTER TABLE [dbo].[Boleto]  WITH CHECK ADD  CONSTRAINT [FK_Boleto_Evento] FOREIGN KEY([Id_Evento])
REFERENCES [dbo].[Evento] ([Id])
GO

ALTER TABLE [dbo].[Boleto] CHECK CONSTRAINT [FK_Boleto_Evento]
GO

ALTER TABLE [dbo].[Boleto]  WITH CHECK ADD  CONSTRAINT [FK_Boleto_Persona] FOREIGN KEY([Id_Persona])
REFERENCES [dbo].[Persona] ([Id])
GO

ALTER TABLE [dbo].[Boleto] CHECK CONSTRAINT [FK_Boleto_Persona]
GO

ALTER TABLE [dbo].[Boleto]  WITH CHECK ADD  CONSTRAINT [FK_Boleto_Seccion] FOREIGN KEY([Id_Seccion])
REFERENCES [dbo].[Seccion] ([Id])
GO

ALTER TABLE [dbo].[Boleto] CHECK CONSTRAINT [FK_Boleto_Seccion]
GO

ALTER TABLE [dbo].[Categoria]  WITH CHECK ADD  CONSTRAINT [FK_Categoria_Categoria] FOREIGN KEY([Categoria_Padre])
REFERENCES [dbo].[Categoria] ([Id])
GO

ALTER TABLE [dbo].[Categoria] CHECK CONSTRAINT [FK_Categoria_Categoria]
GO

ALTER TABLE [dbo].[Evento]  WITH CHECK ADD  CONSTRAINT [FK_Evento_Categoria] FOREIGN KEY([Categoria])
REFERENCES [dbo].[Categoria] ([Id])
GO

ALTER TABLE [dbo].[Evento] CHECK CONSTRAINT [FK_Evento_Categoria]
GO

ALTER TABLE [dbo].[Evento]  WITH CHECK ADD  CONSTRAINT [FK_Evento_Persona] FOREIGN KEY([Id_Persona])
REFERENCES [dbo].[Persona] ([Id])
GO

ALTER TABLE [dbo].[Evento] CHECK CONSTRAINT [FK_Evento_Persona]
GO

ALTER TABLE [dbo].[Imagenes]  WITH CHECK ADD  CONSTRAINT [FK_Imagenes_Persona] FOREIGN KEY([Id_Persona])
REFERENCES [dbo].[Persona] ([Id])
GO

ALTER TABLE [dbo].[Imagenes] CHECK CONSTRAINT [FK_Imagenes_Persona]
GO

ALTER TABLE [dbo].[Pago_Promotor]  WITH CHECK ADD  CONSTRAINT [FK_Pago_Promotor_Persona] FOREIGN KEY([Id_Persona])
REFERENCES [dbo].[Persona] ([Id])
GO

ALTER TABLE [dbo].[Pago_Promotor] CHECK CONSTRAINT [FK_Pago_Promotor_Persona]
GO

ALTER TABLE [dbo].[Persona] ADD  CONSTRAINT [DF_Persona_Estado]  DEFAULT ((1)) FOR [Estado]
GO

ALTER TABLE [dbo].[Persona] ADD  CONSTRAINT [DF_Persona_Tipo]  DEFAULT ((1)) FOR [Tipo]
GO

ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Categoria] FOREIGN KEY([Categoria])
REFERENCES [dbo].[Categoria] ([Id])
GO

ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Categoria]
GO

ALTER TABLE [dbo].[Solicitud]  WITH CHECK ADD  CONSTRAINT [FK_Solicitud_Persona] FOREIGN KEY([Id_Persona])
REFERENCES [dbo].[Persona] ([Id])
GO

ALTER TABLE [dbo].[Solicitud] CHECK CONSTRAINT [FK_Solicitud_Persona]
GO