CREATE TABLE [DataSetSynch].[SYNCH_DESTINATION_DATABASE_NAME]
(
[DESTINATION_DATABASE_NAME_PK_ID] [bigint] NOT NULL IDENTITY(1, 1),
[MIG_SITE_NAME] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_SYNCH_DESTINATION_DATABASE_NAME_MIG_SITE_NAME] DEFAULT (''),
[DATABASE_NAME] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_DATE_CREATED] [datetime] NULL,
[ETL_DATE_UPDATED] [datetime] NULL,
[ETL_DESTINATION_SERVER_FK_ID] [bigint] NULL,
[ETL_PK_ID] AS ([DESTINATION_DATABASE_NAME_PK_ID]) PERSISTED NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [DataSetSynch].[SYNCH_DESTINATION_DATABASE_NAME] ADD CONSTRAINT [DESTINATION_DATABASE_NAME_PK_ID] PRIMARY KEY CLUSTERED  ([DESTINATION_DATABASE_NAME_PK_ID]) ON [PRIMARY]
GO
