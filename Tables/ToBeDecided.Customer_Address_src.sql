CREATE TABLE [ToBeDecided].[Customer_Address_src]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[MIG_SITE_NAME] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CUSTOMER_ID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ADDRESS_ID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NAME] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ADDRESS1] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ADDRESS2] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ZIP_CODE] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CITY] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[COUNTY] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DELIVERY_TERMS] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SHIP_VIA_CODE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IN_CITY] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TAX_WITHHOLDING_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_Customer_Address_src_TAX_WITHHOLDING_DB] DEFAULT (''),
[TAX_ROUNDING_METHOD_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TAX_ROUNDING_LEVEL_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TAX_EXEMPT_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[INTRASTAT_EXEMPT_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[VAT_NO] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[OPENING_AM] [smalldatetime] NOT NULL,
[CLOSING_AM] [smalldatetime] NOT NULL,
[OPENING_PM] [smalldatetime] NOT NULL,
[CLOSING_PM] [smalldatetime] NOT NULL,
[MON_AM] [bit] NOT NULL,
[MON_PM] [bit] NOT NULL,
[TUE_AM] [bit] NOT NULL,
[TUE_PM] [bit] NOT NULL,
[WED_AM] [bit] NOT NULL,
[WED_PM] [bit] NOT NULL,
[THU_AM] [bit] NOT NULL,
[THU_PM] [bit] NOT NULL,
[FRI_AM] [bit] NOT NULL,
[FRI_PM] [bit] NOT NULL,
[SAT_AM] [bit] NOT NULL,
[SAT_PM] [bit] NOT NULL,
[SUN_AM] [bit] NOT NULL,
[SUN_PM] [bit] NOT NULL,
[STATE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SPECIAL_INS] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[WORK_ORDER_NOTES] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DEF_ADDRESS_DELIVERY] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DEF_ADDRESS_INVOICE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DEF_ADDRESS_PAY] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DEF_ADDRESS_HOME] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DEF_ADDRESS_PRIMARY] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DEF_ADDRESS_SECONDARY] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DEF_ADDRESS_VISIT] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [ToBeDecided].[Customer_Address_src] ADD CONSTRAINT [PK_Customer_Address_src] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO