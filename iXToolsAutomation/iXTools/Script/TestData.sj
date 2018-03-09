var iXTool = {
  iXAdmin:{
    UserStatus: 'Active'
  },
  VerifyUserRoleData: {
    profileName: 'Developers Only',
    applicationName: 'iXConnect',
    roleId: '1158',
    roleName: 'iXConnect - Number Plan - New CSNP Button'
  },
  CarrierDestinationBlock: {
    appName: 'iXConnect',
    msgDisabled: 'Carrier Destination Blocking is disabled',
    titleDestinationCarrier: 'Carrier Destination Blocking',
    role1Id: '1177',
    role1Name: 'iXConnect - Carrier Destination Blocking',
    role2Id: '1178',
    role2Name: 'iXConnect - Carrier Destination Blocking Viewer',
    tab1: 'Work Orders',
    tab2: 'Blocked Destinations',
  	newWorkOrderCarrier: 'Armenia-PTT',
  	newWorkOrderTypeBlock: 'Block',
  	newWorkOrderTypeUnBlock: 'UnBlock',
  	newWorkOrderDest: 'Afghanistan - O',
    paramSearchWorkOrder: 'ARM001Block1/5/2016001',
    paramSearchWorkOrderStatus: 'Pending',
  	gridWorkOrder: {
      col0: '',
      col1: '',
      col2: '',
  		col3: 'Carrier',
  		col4: 'Work Order Type',
  		col5: 'Work Order',
  		col6: 'Status',
  		col7: 'Created Date',
  		col8: 'Modified Date',
  		col9: 'Modified By'
  	},
    gridBlockedDestinations: {
      col0: 'Carrier',
      col1: 'Country',
      col2: 'Destination',
  		col3: 'Destination Category',
  		col4: 'Destination Group',      
  		col5: 'Begin Date',
  		col6: 'End Date',
  		col7: 'Blocked Work Order',
  		col8: 'UnBlocked Work Order'
  	},
    msgCreateWO: 'New Work Order saved successfully\nOK',
    msgExportWOSuccess: 'Work Order exported successfully\nOK',
    msgExportNoData: 'There is no data to Export\nOK',
    baseAlert: 'Carrier Destination Blocking Work Order Status Alert',
    severity: 'Moderate',
    period: 'Today',
    notifyMethod: {
      method1: 'EmailPrimary',
      method2: 'User Interface'
    },
    hourlyBusinessAlert: 'Hourly Business Alerts',
    hourlyAlertNotification: 'Hourly Alert Notification'
    
  },
	CreateCSNP:{
		Step1:{
			NumberPlan:'ENS_NP_',
			NumberPlanAbb:'Profile_Name_02',
			DestOtherName:'Yes',
			RestrictCSNP:'Yes',
			FixedBlendingSecurity:20,
			MinMaxBlendSecurity:80
		},
		Step2:{
      selectDate:'10/29/2015'
    },
		Step3:{
			Country:'Bangladesh',
			Destination:'Test',
			DestinationAb:'TE',
			CallType:'Fixed',
			CallChar:'Regular',
			PrimaryBlending:'Traffic Blending',
			SecondaryBlending:'Min/Max Blending',
			MinBlendingPercentage:'25',
			MaxBlendingPercentage:'75',
			EndDate:'12/29/2015',
			SrcDestID1:'Bangladesh - O',
			SrcDestID2:'Bangladesh Chittagong Fixed',
			SrcDestID3:'Bangladesh Dhaka Fixed',
			SrcDestID4:'Bangladesh Fixed'
		},
		Step4:{
			RatingCountry:'Bangladesh',
			CustomerDestination:'Test',
			Service:'IDDD'
    }
	},
  ExportImportCSNP: {
    SearchKey:'ENS',
    Export: {
      
    },
    Import: {
      ValidFilePath: 'D:\\Mahmudul\\Telarix\\Sources\\ENS_NP_121_IDDD.xls.xls',
      InValidFilePath: 'D:\\Mahmudul\\Telarix\\Sources\\ENS_NP_121_IDDD_invalid.xls',
      MsgWrongFormat: 'The file could not be uploaded as following error(s) occured: This file\'s format is not supported or you don\'t specify a correct format.',
      MsgSuccess: 'The file has been successfully uploaded.'
    }
  },
  Statement: {
    SearchStatement: {
      AccountName: '%',
      StatementStatus: 'Traffic Closed',
      FromDate: '02/01/2015',
      CompAccStmnt: 'Mar 1 2015 -1 - Month'
    },
    SearchAdjustment: {
      AccountName: '%',
      FromDate: '01/01/2015'
    },
    AddAdjustment: {
      ChargeName: 'Adjustment Jan 1 2015 -1 - Month',
      BeginDate: '1/1/2015',
      EndDate: '1/31/2015',
      ChargeCategory: 'Test', 
      AccountingCode: '1234', 
      Currency: '69',
      AdjustmentAmount: '1010',
      TaxTemplate: '10%Tax'
    },
    AdjustmentFolder: {
      FolderName: 'ENS_AdjFol',
      FinancialCharges: '',
      msgAdjFolderStatusSaved: 'Adjustment Folder infomation is successfully saved.' 
    }
  }
};
