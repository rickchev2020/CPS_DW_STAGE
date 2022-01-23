CREATE TABLE [dbo].[RostersIncomingSchoolCongregationRelationships]
(
[SCHLID_TYPE] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SCHL_ID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SCHL_REL_TYPE] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CONGID_TYPE] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CONG_ID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SourceModifiedDate] [date] NULL,
[DwSourceName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertDate] [datetime] NOT NULL,
[DwInsertUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateDate] [datetime] NOT NULL,
[DwUpdateUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
