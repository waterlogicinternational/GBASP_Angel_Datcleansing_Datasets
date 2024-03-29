CREATE TABLE [Dataset].[Customer_Header_ex]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[MIG_SITE_NAME] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MIG_COMMENT] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_Customer_Header_ex_MIG_COMMENT] DEFAULT (''),
[MIG_CREATED_DATE] [datetime] NOT NULL CONSTRAINT [DF_Customer_Header_ex_MIG_CREATED_DATE] DEFAULT (getdate()),
[CUSTOMER_ID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NAME] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PAY_TERM_ID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CREDIT_LIMIT] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[INVOICE_CUSTOMER] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[INVOICE_SORT_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EMAIL_ORDER_CONF_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EMAIL_INVOICE_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CRM_ACCOUNT_TYPE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PAYMENT_METHOD] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PAY_ADDR_DESCRIPTION] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PAY_ADDR_ACCOUNT] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PAY_ADDR_SORT_CODE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PAY_ADDR_ACC_NAME] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NX_PAY_ADDR_BUILD_SOC_REF] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NX_PAY_ADDR_TRANS_CODE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NX_PAY_ADDR_OUR_REF] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CREDIT_ANALYST] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ACQUIRED_FROM_COMP] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ASSOCIATION_NO] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NX_GROUP_ID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_TAX_CODE] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_CUST_GRP] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_MARKET_CODE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_ORDER_TYPE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_CREDIT_BLOCK] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_IDENTITY_TYPE_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_PAY_OUTPUT_MEDIA_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_DEFAULT_PAYMENT_METHOD] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_ACTIVE_TRIAL_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_MAIN_REP] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_CCA_FLAG_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_BLANKET_PURCHASE_ORDER] [nvarchar] (99) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_INVOICE_FEE] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_PO_EXPIRY_DATE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_PO_EXPIRY_VALUE] [int] NULL,
[NX_PO_VALUE_USED] [int] NULL,
[NX_MESSAGE_GROUP] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_ALLOWED_OVERDUE_AMOUNT] [int] NULL,
[NX_ALLOWED_OVERDUE_DAYS] [int] NULL,
[NX_CREDIT_RELATIONSHIP_EXIST] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_CREDIT_RELATIONSHIP_TYPE_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_PARENT_COMPANY] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_PARENT_CUSTOMER_ID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_CUST_ORDER_INVOICING_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_CUST_ORDER_INV_TYPE_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_CONSOLIDATION_DAY_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_SAGE_CODE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_OLD_CUST_REF1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_OLD_CUST_REF2] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_BOOK_IN_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_NO_LIMIT_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_ON_SITE_RA_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_PURCHASE_ORDER_REQ_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_SHORT_TERM_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_COST_CODE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_PRINT_TAX_CODE_TEXT] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_CYCLE_PERIOD] [int] NULL,
[NX_ORDER_CONF_FLAG_DB] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_PACK_LIST_FLAG_DB] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_CATEGORY_DB] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_SUMMARIZED_SOURCE_LINES_DB] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_PRINT_AMOUNTS_INCL_TAX_DB] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_CREDIT_CONTROL_GROUP_ID] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_CUST_PRICE_GROUP_ID] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_BR_ORDER_TYPE] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_BR_BLOCKED_DD] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_BR_CONSOLIDATION] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_LEGAL_ENTITY_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_IMPORT_ACCOUNT] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_Customer_Header_ex_NX_IMPORT_ACCOUNT] DEFAULT (''),
[NX_ACCOUNT_GROUP] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NX_CUST_GROUP] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_Customer_Header_ex_NX_CUST_GROUP] DEFAULT (''),
[NX_CURRENCY] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_Customer_Header_ex_NX_CURRENCY] DEFAULT (''),
[NX_REMINDER_TEMPLATE] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_Customer_Header_ex_NX_REMINDER_TEMPLATE] DEFAULT ('')
) ON [PRIMARY]
GO
ALTER TABLE [Dataset].[Customer_Header_ex] ADD CONSTRAINT [PK_Customer_Header_ex] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Customer_Header_ex] ON [Dataset].[Customer_Header_ex] ([MIG_SITE_NAME], [CUSTOMER_ID], [ID]) ON [PRIMARY]
GO
