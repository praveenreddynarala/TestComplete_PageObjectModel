var HomePageElements = {
  ByIds :{
    iXAdminLink: "rAdmin_iXAdmin",
    iXConnectLink: "rConnect_iXConnect_iXConnect",
    iXBillLink: "rBill_iXBill",
	  iXAlertLink: "mPreferences",
    iXControlLink: "rControl_iXControl_iXControl"
  },
  ByNames: {
  }
};

var iXControlElements = {
  ByIds :{
    topMenuRegister: "C1_mtRegister",
    ddlItem: "rObject_ObjectID",
    recentHourlyAlert: "t1_TC41_Registry",
    reqBusAlertLink: "ItemTransition_Transition1",
    btnExecute: "Save"
  }
};

var iXAlertElements = {
  ByIds :{
    topHomeMenu: "mtHome",
    ddlBaseAlert: "rAlert_AlertID",
    alertItem: "_lrAssigned2_lrAlert1_tAU_cAlert_iAlert",
    divMyAlert: "_lrAssigned1_lrAlert_tAUPaging",
    ddlSeverityMode: "rSeverity_SeverityID",
    ddlPeriod: "rSamplingPeriod_SamplingPeriodID",
    ddlNotifyMethod: "NotificationMethodID_List1",
    btnSave: "btnSave",
    btnCancel: "btnCancel"
  }
};

var AdminPageElements = {
  ByIds :{
    topHomeMenu: "mHomeLabel",
    topAdminMenu: "mAdminLabel",
    topConfigMenu: "mConfigLabel",
    ddlScope: "rScope_Scope",
    btnGo: "lgxGoButton",
    tblMRFConfig: "MRFConfig",
    //configVariable: "CarrierDestinationBlocking",
    configVariable: "MRFConfig_CconfigName8_ConfigParamName",
    configParamValue: "MRFConfig_cConfigParamValue8_ConfigParamValue",
    btnSaveConfig: "Save",
    ddlStatus: "rStatus_ActiveStatusID",
    tbProfileTree: "tbProfileTree",
    tabRole: "rTab_tabRole",
    ddlApplication: "rStatus_ApplicationID",
    tblProfileRole: "MRFProfileRole"
  }
};

var ixConnectElements = {
  ByIds :{
    topHomeMenu: "C2_mHome",
    topDestinationMenu: "C2_mDestination",    
    btnNewCSNP: "btnNEWCSNP",
    //Export Import CSNP Page elements 
    txtLetters: "R1_ATOZ",
    npFirstRow: "_lNumberPlanType1_lNumberPlan1_NumPTable_cNumberPlan_NP",
    btnExportImport: "ExportImport",
    pageExportImport: "*ExportImportBlendingRules.aspx*"
  }
};

var ExportImportElements = {
  ByIds :{
    ddlAction: "ddlAction",
    ddlService: "ddlService",
    btnExpImp: "imgbtnExIm",
    btnUpload: "uploadFile",
    btnCancel: "imgbtnCancel",
    lblMessage: "lblMessage"
  }
};

var DefineCsnpElements = {
  ByIds :{
    ddlCSNPType: "ddCSNPTypeFilter",
    btnNext: "btnNext"
  }
};

var LgxDetailElements = {
  ByIds :{
    lblSessionExists: "rGetConfirmation_lblConf",
    btnNew: "rButtons_New",
    btnCopyFrom: "rButtons_Copy",
    //Elements of Step 1 of CSNP Wizard
    pageCSNPWiz: "*Action=Update*",
    linkStp1NewNP: "rStep1_lblNewNP",
    txtNumberPlan: "rNumberPlan_NumberPlan",
    txtNumberPlanAbb: "rNumberPlanAbbrv_NumberPlanAbbrv",
    ddlUseDestOtherName: "rUseDestinationOtherName_UseDestinationOtherName",
    ddlRestrictCSNPEdit: "rRestrictedCSNPEdit_Restricted",
    txtFixedBlendingSecurityMarkup: "rFixedBlendingSecurityMarkup_FixedSecurityMarkup",
    txtMinMaxBlendSecurityMarkup: "rMinMaxBlendingSecurityMarkup_MinMaxSecuirtyMarkup",
    btnSave: "rButtons_Save",
    //Elements of Step 2 of CSNP Wizard
    linkStep2SelSrc: "rStep2_lblSourceNP",
    dtSelectDate: "rDateSelect_SelectDate",
    btnSaveStep2: "rButtons_Save",
    linkStep3Mapping: "rStep3_lblNewMapping",
    //Elements of Step 4 of CSNP Wizard
    linkStep4: "rStep4_lblNewMapping",
    urlStep4: "*Action=Update&Title=Add Services to Countries*",
    cbService: "gAtt_cCheck1_CheckBox",
    btnSaveStep4: "btnSave",
    urlPgRating: "*Action=Update&Title=Select Rating Method*",
    btnAddRow: "btnAddRow",
    ddlRatCountry: "rCountry_rCountryID",
    ddlCustDest: "rCountry_CustomerDestinationID",
    ddlService: "rService_rServiceID",
    btnRatMethod: "rRatingMethod_imgRatingMethod",
    linkCertError: "overridelink",
    assignMethod: "tLookup_cLookup8_Lookup",
    btnSave2Step4: "btnSave",
    btnStep4Next: "btnSave",
    btnStep4Submit: "rButtons_Submit",
    pageMissingRef: "*lgx_Frame.aspx?lgx_WindowID=DetailPopup*",
    btnCancel: "cancel",
    pageBlendingFrame: "*BlendingFrameSet.aspx*"
  }
};

var CsnpWizardStep3Elements = {
  ByIds :{
    //Elements of Step 3 of CSNP Wizard
    btnAddNewRow: "AddNewRow",
    ddlCountry: "csdGrid_ctl03_country",
    txtDestination: "csdGrid_ctl03_Destination",
    txtDestAbbrv: "csdGrid_ctl03_DestAbbrv",
    ddlCallType: "csdGrid_ctl03_CallType",
    ddlCallChar: "csdGrid_ctl03_CallChar",
    ddlPrimaryBlendingType: "csdGrid_ctl03_PrimaryBlendingType",
    ddlSecondaryBlendingType: "csdGrid_ctl03_SecondaryBlendingType",
    txtMinBlendingPercentage: "csdGrid_ctl03_MinBlendingPercentage",
    txtMaxBlendingPercentage: "csdGrid_ctl03_MaxBlendingPercentage",
    txtEndDate: "csdGrid_ctl03_EndDate",
    btnEdit:"csdGrid_ctl03_EditButton",
    tblSrcDest: "SourceDestinationID",
    ddlSrcDestID1: "SourceDestinationID_List1",
    ddlSrcDestID2: "SourceDestinationID_List2",
    ddlSrcDestID3: "SourceDestinationID_List3",
    ddlSrcDestID4: "SourceDestinationID_List4",
    btnAddToList: "next_gif",
    btnNextStep: "rButtons_Next",
    btnSubmit: "rButtons_Submit",
    btnNext: "btnNext",
    btnFinalSubmit: "rButtons_Submit"
  }
};

var CarrierDestBlock = {
  ByIds: {
    txtCarriers: "Carriers",
    txtWorkOrderType: "WorkOrderType",
    txtWorkOrder_taglist: "WorkOrder_taglist",
    WorkOrder_listbox: "WorkOrder_listbox",
    txtWorkOrderBeginDate: "WorkOrderBeginDate",
    txtWorkOrderEndDate: "WorkOrderEndDate",
    txtworkflowStatus: "workflowStatus",
    workflowStatus_listbox: "workflowStatus_listbox",
    txtCountry: "Country",
    txtRoutingDestination: "RoutingDestination",
    titleCarrierDestBlock: "page-title",
    tabCarrierBlocking: "CarrierBlockingTabStrip",
  	btnCreateWorkOrder: "CreateWorkOrder",
    btnCancelNewWorkOrder: "btnCancelNewWorkOrder",
  	txtNewWorkOrderCarriers: "newWorkOrderCarriers",
    NewWorkOrderCarrierList: "newWorkOrderCarriers_listbox",
    ddlWorkOrderType: "newWorkOrderWorkOrderType",
  	ddlWorkOrderType_listbox: "newWorkOrderWorkOrderType_listbox",
  	listFrom_destinationMS: "from_destinationMS",
  	btnSaveNewWorkOrder: "btnSaveNewWorkOrder",
  	btnMoveDest_destinationMS: "btnMoveDest_destinationMS",
    messagingPopup: "messagingPopup",
    btnMsgOk: "btnOk",
  	btnSearchCarrierBlocking: "searchCarrierBlocking",
  	btnExportToExcelWorkOrders: "btnExportToExcelWorkOrders",
  	divCarrierBlockingWorkOrdersGrd: "CarrierBlockingWorkOrdersGrd",
  	divBlockedDestinations: "BlockedDestinations",
  	colStatusID_listbox: "StatusID_listbox",
    btnExportToExcelBlockedDestinations: "btnExportToExcelBlockedDestinations",
    topHomeMenu: "C2_mHome"
  },
  ByText :{
    tabWorkOrders: "Work Orders",
    tabBlockedDestinations: "Blocked Destinations"
  }
};

var ixBillPageElements = {
	ByIds :{
		iXtoolAccName: "riXToolsAccountLetters_ToolsLetters",
		ddlStateMentStatus: "rStatementStatus_StatusID",
    txtFromDate: "rFromDate_From",
		lnkCompany: "IMG_lCompany1",
		lnkCompAcc: "IMG_lCompany1_lToolsAcct1",
		lnkCompAccBillAcc: "IMG_lCompany1_lToolsAcct1_lBillAccount1",
		lnkCompAccBillAccStmnt: "_lCompany1_lToolsAcct1_lBillAccount1__lStmt1__lblStmt",
    divComAccBillAccStmnt: "lgx_ListDiv1",
    adjustmentStatementName: "AdjustmentStatementsGrid_col_3",
    divAdjStatement: "DIV_lCompany1_lToolsAcct1",
    lnkCompAccBillAdjStmnt: "_lCompany1_lToolsAcct1_lBillAccount1__lStmt2__lblStmt",
		loadingSpinner: "animation",
		tabAdjustment: "rTab_lblAdjustments",
		btnAddAdjustmentStatement: "btnAddFinancialAdjustment",
    tblAdjustmentStatement: "AdjustmentStatementsGrid",
		AdjStmtInfoicon: "AdjustmentStatementsGrid_AdjustmentStatementInfo_",
		btnAddFinanceStatement: "AddRow_AdjustmentStatementsGrid_Row_0_*",
		txtChargeName: "AdjustmentStatementsGrid_Row_*ChargeName_NewRow_0*",
		txtBeginDate: "AdjustmentStatementsGrid_Row_*BeginDate_NewRow_0*",
		txtEndDate: "AdjustmentStatementsGrid_Row_*EndDate_NewRow_0*",
		ddlchargeCategory: "AdjustmentStatementsGrid_Row_*ChargeCategoryId_NewRow_0",
		ddlAccountingCode: "AdjustmentStatementsGrid_Row_*AccountingCodeId_NewRow_0",
		ddlCurrency: "AdjustmentStatementsGrid_Row_*CurrencyId_NewRow_0",
		txtAdjustAmount: "AdjustmentStatementsGrid_Row_*AdjustmentAmount_NewRow_0",
		txtTaxTemplate: "AdjustmentStatementsGrid_Row_*TaxTemplateId_NewRow_0",
		btnSaveAdjustment: "SaveCRUDSet_AdjustmentStatementsGrid_Row_*",
    msgAddStateMentSuccess: "1 record(s) were added",
		tabCharge: "rTab_lblCharges",
		btnGo: "ApplyFilters",
		ddlAdjustmentFolder: "AdjustmentFolderList",
		txtNewAdjustmentFolderName: "NewAdjustmentFolderName",
    btnSaveAdjustmentFolder: "SaveCRUDSet_StatementChargeGrid",
		msgAdjustDeleted: "Adjustment Charge(s) were deleted",
		lblInfoContainer: "infoContainer",
		topOperationMenu: "C1_mOperation",
		btnCreateNewAdjFolder: "ctl00_PageContent_btnNew",
		txtBillAccountName: "ctl00_PageContent_tbxBillingAccountLetters",
		txtAdjFolderName: "ctl00_PageContent_tbxAdjustmentFolderLetters",
		btnFindAdjFolder: "ctl00_PageContent_btnGo",
    tblAdjFolderGrid: "ctl00_PageContent_grdAdjustmentFolder",
		lnkAdjFolder: "ctl00_PageContent_grdAdjustmentFolder_ctl02_AFID",
		ddlAdjFolderStatus: "Status",
		btnSaveAdjFolderStatus: "SummarySaveButton"
	}
};