
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 01/30/2018 21:00:34
-- Generated from EDMX file: C:\Users\Jose Caiza\source\repos\WebApplication2\WebApplication2\Reservas.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Reservas];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'PosicionSet'
CREATE TABLE [dbo].[PosicionSet] (
    [IdPosicion] int IDENTITY(1,1) NOT NULL,
    [latitud] float  NOT NULL,
    [longitud] float  NOT NULL
);
GO

-- Creating table 'ReservaEcologicaSet'
CREATE TABLE [dbo].[ReservaEcologicaSet] (
    [IdReservaEcologica] int IDENTITY(1,1) NOT NULL,
    [nombreReservaEcologica] nvarchar(max)  NOT NULL,
    [ImagenReservaEcologica] nvarchar(max)  NOT NULL,
    [ProvinciaReservaEcologica] nvarchar(max)  NOT NULL,
    [DescripcionReservaEcologica] nvarchar(max)  NOT NULL,
    [SitioWebReservaEcologica] nvarchar(max)  NOT NULL,
    [Posicion_IdPosicion] int  NOT NULL
);
GO

-- Creating table 'AdministradorSet'
CREATE TABLE [dbo].[AdministradorSet] (
    [IdAdministrador] int IDENTITY(1,1) NOT NULL,
    [NombresAdministrador] nvarchar(max)  NOT NULL,
    [ApellidosAdministrador] nvarchar(max)  NOT NULL,
    [UsuarioAdministrador] nvarchar(max)  NOT NULL,
    [PasswordAdministrador] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [IdPosicion] in table 'PosicionSet'
ALTER TABLE [dbo].[PosicionSet]
ADD CONSTRAINT [PK_PosicionSet]
    PRIMARY KEY CLUSTERED ([IdPosicion] ASC);
GO

-- Creating primary key on [IdReservaEcologica] in table 'ReservaEcologicaSet'
ALTER TABLE [dbo].[ReservaEcologicaSet]
ADD CONSTRAINT [PK_ReservaEcologicaSet]
    PRIMARY KEY CLUSTERED ([IdReservaEcologica] ASC);
GO

-- Creating primary key on [IdAdministrador] in table 'AdministradorSet'
ALTER TABLE [dbo].[AdministradorSet]
ADD CONSTRAINT [PK_AdministradorSet]
    PRIMARY KEY CLUSTERED ([IdAdministrador] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Posicion_IdPosicion] in table 'ReservaEcologicaSet'
ALTER TABLE [dbo].[ReservaEcologicaSet]
ADD CONSTRAINT [FK_PosicionReservaEcologica]
    FOREIGN KEY ([Posicion_IdPosicion])
    REFERENCES [dbo].[PosicionSet]
        ([IdPosicion])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PosicionReservaEcologica'
CREATE INDEX [IX_FK_PosicionReservaEcologica]
ON [dbo].[ReservaEcologicaSet]
    ([Posicion_IdPosicion]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------