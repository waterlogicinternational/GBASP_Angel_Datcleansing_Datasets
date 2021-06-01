CREATE TABLE [Dataset].[Customer_Header_ovl]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[MIG_SITE_NAME] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CUSTOMER_ID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IsSuspect] [bit] NOT NULL CONSTRAINT [DF_Customer_Header_ovl_IsSuspect] DEFAULT ((0)),
[SRC_NAME] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_PAY_TERM_ID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_CREDIT_LIMIT] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_INVOICE_CUSTOMER] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_INVOICE_SORT_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_EMAIL_ORDER_CONF_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_EMAIL_INVOICE_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_CRM_ACCOUNT_TYPE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_PAYMENT_METHOD] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_PAY_ADDR_DESCRIPTION] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_PAY_ADDR_ACCOUNT] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_PAY_ADDR_SORT_CODE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_PAY_ADDR_ACC_NAME] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_PAY_ADDR_BUILD_SOC_REF] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_PAY_ADDR_TRANS_CODE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_PAY_ADDR_OUR_REF] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_CREDIT_ANALYST] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_ACQUIRED_FROM_COMP] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_ASSOCIATION_NO] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_CREDIT_BLOCK] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_MAIN_REP] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_INVOICE_FEE] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_PRINT_TAX_CODE_TEXT] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_CYCLE_PERIOD] [int] NOT NULL,
[SRC_ORDER_CONF_FLAG_DB] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_PACK_LIST_FLAG_DB] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_CATEGORY_DB] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_SUMMARIZED_SOURCE_LINES_DB] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_PRINT_AMOUNTS_INCL_TAX_DB] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_CREDIT_CONTROL_GROUP_ID] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_CUST_PRICE_GROUP_ID] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_GROUP_ID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_TAX_CODE] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_CUST_GRP] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_MARKET_CODE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_ORDER_TYPE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_IDENTITY_TYPE_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_PAY_OUTPUT_MEDIA_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_DEFAULT_PAYMENT_METHOD] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_ACTIVE_TRIAL_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_CCA_FLAG_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_BLANKET_PURCHASE_ORDER] [nvarchar] (99) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_PO_EXPIRY_DATE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_PO_EXPIRY_VALUE] [int] NOT NULL,
[SRC_PO_VALUE_USED] [int] NOT NULL,
[SRC_MESSAGE_GROUP] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_ALLOWED_OVERDUE_AMOUNT] [int] NOT NULL,
[SRC_ALLOWED_OVERDUE_DAYS] [int] NOT NULL,
[SRC_CREDIT_RELATIONSHIP_EXIST] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_CREDIT_RELATIONSHIP_TYPE_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_PARENT_COMPANY] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_PARENT_CUSTOMER_ID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_CUST_ORDER_INVOICING_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_CUST_ORDER_INV_TYPE_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_CONSOLIDATION_DAY_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_SAGE_CODE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_OLD_CUST_REF1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_OLD_CUST_REF2] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_BOOK_IN_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_NO_LIMIT_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_ON_SITE_RA_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_PURCHASE_ORDER_REQ_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_SHORT_TERM_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SRC_COST_CODE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NAME] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PAY_TERM_ID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CREDIT_LIMIT] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[INVOICE_CUSTOMER] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[INVOICE_SORT_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EMAIL_ORDER_CONF_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EMAIL_INVOICE_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRM_ACCOUNT_TYPE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PAYMENT_METHOD] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PAY_ADDR_DESCRIPTION] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PAY_ADDR_ACCOUNT] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PAY_ADDR_SORT_CODE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PAY_ADDR_ACC_NAME] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PAY_ADDR_BUILD_SOC_REF] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PAY_ADDR_TRANS_CODE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PAY_ADDR_OUR_REF] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CREDIT_ANALYST] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACQUIRED_FROM_COMP] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ASSOCIATION_NO] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CREDIT_BLOCK] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MAIN_REP] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[INVOICE_FEE] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PRINT_TAX_CODE_TEXT] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CYCLE_PERIOD] [int] NULL,
[ORDER_CONF_FLAG_DB] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PACK_LIST_FLAG_DB] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CATEGORY_DB] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SUMMARIZED_SOURCE_LINES_DB] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PRINT_AMOUNTS_INCL_TAX_DB] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CREDIT_CONTROL_GROUP_ID] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CUST_PRICE_GROUP_ID] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GROUP_ID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TAX_CODE] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CUST_GRP] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MARKET_CODE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ORDER_TYPE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IDENTITY_TYPE_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PAY_OUTPUT_MEDIA_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DEFAULT_PAYMENT_METHOD] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACTIVE_TRIAL_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CCA_FLAG_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BLANKET_PURCHASE_ORDER] [nvarchar] (99) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PO_EXPIRY_DATE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PO_EXPIRY_VALUE] [int] NULL,
[PO_VALUE_USED] [int] NULL,
[MESSAGE_GROUP] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ALLOWED_OVERDUE_AMOUNT] [int] NULL,
[ALLOWED_OVERDUE_DAYS] [int] NULL,
[CREDIT_RELATIONSHIP_EXIST] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CREDIT_RELATIONSHIP_TYPE_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PARENT_COMPANY] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PARENT_CUSTOMER_ID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CUST_ORDER_INVOICING_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CUST_ORDER_INV_TYPE_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CONSOLIDATION_DAY_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SAGE_CODE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OLD_CUST_REF1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OLD_CUST_REF2] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BOOK_IN_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NO_LIMIT_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ON_SITE_RA_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PURCHASE_ORDER_REQ_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SHORT_TERM_DB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COST_CODE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Dataset].[Customer_Header_ovl] ADD CONSTRAINT [PK_Customer_Header_ovl] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Customer_Header_ovl_Mig_Acc] ON [Dataset].[Customer_Header_ovl] ([MIG_SITE_NAME], [CUSTOMER_ID], [ID]) ON [PRIMARY]
GO