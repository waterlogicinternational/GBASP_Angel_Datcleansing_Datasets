SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [Dataset].[Customer_Header_ex_Filtered]
AS
SELECT Dataset.Customer_Header_DcEx.ID, Dataset.Customer_Header_DcEx.MIG_SITE_NAME, Dataset.Customer_Header_DcEx.MIG_COMMENT, Dataset.Customer_Header_DcEx.MIG_CREATED_DATE, 
                  Dataset.Customer_Header_DcEx.CUSTOMER_ID, Dataset.Customer_Header_DcEx.NAME, Dataset.Customer_Header_DcEx.PAY_TERM_ID, Dataset.Customer_Header_DcEx.CREDIT_LIMIT, 
                  Dataset.Customer_Header_DcEx.INVOICE_CUSTOMER, Dataset.Customer_Header_DcEx.INVOICE_SORT_DB, Dataset.Customer_Header_DcEx.EMAIL_ORDER_CONF_DB, Dataset.Customer_Header_DcEx.EMAIL_INVOICE_DB, 
                  Dataset.Customer_Header_DcEx.CRM_ACCOUNT_TYPE, Dataset.Customer_Header_DcEx.PAYMENT_METHOD, Dataset.Customer_Header_DcEx.PAY_ADDR_DESCRIPTION, Dataset.Customer_Header_DcEx.PAY_ADDR_ACCOUNT, 
                  Dataset.Customer_Header_DcEx.PAY_ADDR_SORT_CODE, Dataset.Customer_Header_DcEx.PAY_ADDR_ACC_NAME, Dataset.Customer_Header_DcEx.NX_PAY_ADDR_BUILD_SOC_REF, 
                  Dataset.Customer_Header_DcEx.NX_PAY_ADDR_TRANS_CODE, Dataset.Customer_Header_DcEx.NX_PAY_ADDR_OUR_REF, Dataset.Customer_Header_DcEx.CREDIT_ANALYST, 
                  Dataset.Customer_Header_DcEx.ACQUIRED_FROM_COMP, Dataset.Customer_Header_DcEx.ASSOCIATION_NO, Dataset.Customer_Header_DcEx.NX_CREDIT_BLOCK, Dataset.Customer_Header_DcEx.NX_MAIN_REP, 
                  Dataset.Customer_Header_DcEx.NX_INVOICE_FEE, Dataset.Customer_Header_DcEx.NX_PRINT_TAX_CODE_TEXT, Dataset.Customer_Header_DcEx.NX_CYCLE_PERIOD, Dataset.Customer_Header_DcEx.NX_ORDER_CONF_FLAG_DB, 
                  Dataset.Customer_Header_DcEx.NX_PACK_LIST_FLAG_DB, Dataset.Customer_Header_DcEx.NX_CATEGORY_DB, Dataset.Customer_Header_DcEx.NX_SUMMARIZED_SOURCE_LINES_DB, 
                  Dataset.Customer_Header_DcEx.NX_PRINT_AMOUNTS_INCL_TAX_DB, Dataset.Customer_Header_DcEx.NX_CREDIT_CONTROL_GROUP_ID, Dataset.Customer_Header_DcEx.NX_CUST_PRICE_GROUP_ID, 
                  Dataset.Customer_Header_DcEx.NX_GROUP_ID, Dataset.Customer_Header_DcEx.NX_TAX_CODE, Dataset.Customer_Header_DcEx.NX_CUST_GRP, Dataset.Customer_Header_DcEx.NX_MARKET_CODE, 
                  Dataset.Customer_Header_DcEx.NX_ORDER_TYPE, Dataset.Customer_Header_DcEx.NX_IDENTITY_TYPE_DB, Dataset.Customer_Header_DcEx.NX_PAY_OUTPUT_MEDIA_DB, 
                  Dataset.Customer_Header_DcEx.NX_DEFAULT_PAYMENT_METHOD, Dataset.Customer_Header_DcEx.NX_ACTIVE_TRIAL_DB, Dataset.Customer_Header_DcEx.NX_CCA_FLAG_DB, 
                  Dataset.Customer_Header_DcEx.NX_BLANKET_PURCHASE_ORDER, Dataset.Customer_Header_DcEx.NX_PO_EXPIRY_DATE, Dataset.Customer_Header_DcEx.NX_PO_EXPIRY_VALUE, 
                  Dataset.Customer_Header_DcEx.NX_PO_VALUE_USED, Dataset.Customer_Header_DcEx.NX_MESSAGE_GROUP, Dataset.Customer_Header_DcEx.NX_ALLOWED_OVERDUE_AMOUNT, 
                  Dataset.Customer_Header_DcEx.NX_ALLOWED_OVERDUE_DAYS, Dataset.Customer_Header_DcEx.NX_CREDIT_RELATIONSHIP_EXIST, Dataset.Customer_Header_DcEx.NX_CREDIT_RELATIONSHIP_TYPE_DB, 
                  Dataset.Customer_Header_DcEx.NX_PARENT_COMPANY, Dataset.Customer_Header_DcEx.NX_PARENT_CUSTOMER_ID, Dataset.Customer_Header_DcEx.NX_CUST_ORDER_INVOICING_DB, 
                  Dataset.Customer_Header_DcEx.NX_CUST_ORDER_INV_TYPE_DB, Dataset.Customer_Header_DcEx.NX_CONSOLIDATION_DAY_DB, Dataset.Customer_Header_DcEx.NX_SAGE_CODE, 
                  Dataset.Customer_Header_DcEx.NX_OLD_CUST_REF1, Dataset.Customer_Header_DcEx.NX_OLD_CUST_REF2, Dataset.Customer_Header_DcEx.NX_BOOK_IN_DB, Dataset.Customer_Header_DcEx.NX_NO_LIMIT_DB, 
                  Dataset.Customer_Header_DcEx.NX_ON_SITE_RA_DB, Dataset.Customer_Header_DcEx.NX_PURCHASE_ORDER_REQ_DB, Dataset.Customer_Header_DcEx.NX_SHORT_TERM_DB, Dataset.Customer_Header_DcEx.NX_COST_CODE, 
                  Dataset.Customer_Header_DcEx.NX_BR_ORDER_TYPE, Dataset.Customer_Header_DcEx.NX_BR_BLOCKED_DD, Dataset.Customer_Header_DcEx.NX_BR_CONSOLIDATION, Dataset.Customer_Header_DcEx.NX_LEGAL_ENTITY_DB, 
                  Dataset.Customer_Header_DcEx.NX_IMPORT_ACCOUNT, Dataset.Customer_Header_DcEx.NX_ACCOUNT_GROUP, Dataset.Customer_Header_DcEx.NX_CUST_GROUP, Dataset.Customer_Header_DcEx.NX_CURRENCY, 
                  Dataset.Customer_Header_DcEx.NX_REMINDER_TEMPLATE
FROM     Dataset.Customer_Header_DcEx LEFT OUTER JOIN
                  Dataset.Customer_Filter_Override ON Dataset.Customer_Header_DcEx.MIG_SITE_NAME = Dataset.Customer_Filter_Override.MIG_SITE_NAME AND 
                  Dataset.Customer_Header_DcEx.CUSTOMER_ID = Dataset.Customer_Filter_Override.CUSTOMER_ID
WHERE  (Dataset.Filter_Customer(Dataset.Customer_Header_DcEx.MIG_SITE_NAME, 'ex', ISNULL(Dataset.Customer_Filter_Override.isAlwaysIncluded, 0), ISNULL(Dataset.Customer_Filter_Override.IsAlwaysExcluded, 0), 
                  ISNULL(Dataset.Customer_Filter_Override.IsOnSubSetList, 0), Dataset.Customer_Header_DcEx.CUSTOMER_ID, Dataset.Customer_Header_DcEx.NAME, Dataset.Customer_Header_DcEx.CRM_ACCOUNT_TYPE) > 0)
GO
EXEC sp_addextendedproperty N'MS_Description', N'Currently just pass through Customer_Header_ex data but can be developed to reshape data from another database and present as if it came from Customer_Header_ex', 'SCHEMA', N'Dataset', 'VIEW', N'Customer_Header_ex_Filtered', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[37] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 8
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Customer_Header_DcEx (Dataset)"
            Begin Extent = 
               Top = 9
               Left = 688
               Bottom = 454
               Right = 1300
            End
            DisplayFlags = 280
            TopColumn = 68
         End
         Begin Table = "Customer_Filter_Override (Dataset)"
            Begin Extent = 
               Top = 9
               Left = 363
               Bottom = 398
               Right = 631
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 4728
         Alias = 900
         Table = 2808
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'Dataset', 'VIEW', N'Customer_Header_ex_Filtered', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'Dataset', 'VIEW', N'Customer_Header_ex_Filtered', NULL, NULL
GO
