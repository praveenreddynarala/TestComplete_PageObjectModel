//USEUNIT Page
//USEUNIT PageElements
//USEUNIT Common

var adjustmentStatementName;

var iXBillPage = function(browser, page){
  Page.PageBase.call(this, page);
  this.browser = browser;
}

iXBillPage.prototype = new Page.PageBase();
iXBillPage.prototype.constructor = iXBillPage;

iXBillPage.prototype.searchStatement = function(inputData){
  try{
    this.waitForFrameReady();
  
    var topOperationMenu = this.findElementById(PageElements.ixBillPageElements.ByIds.topOperationMenu, 30000);
    topOperationMenu.Click();
    this.browser.getOperationStatementItemLink().Click();
    this.waitForFrameReady();
    var iXtoolAccName = this.findElementById(PageElements.ixBillPageElements.ByIds.iXtoolAccName);
    iXtoolAccName.SetText("");
    iXtoolAccName.Keys(inputData.AccountName);
    var fromDate = this.findElementById(PageElements.ixBillPageElements.ByIds.txtFromDate);
    fromDate.SetText("");
    fromDate.Keys(inputData.FromDate);
    iXtoolAccName.Keys("[Enter]");
  }
  catch (ex){
    Log.Error(ex.description);
  }
};

iXBillPage.prototype.accessRegularStatement = function(inputData){
  try{
    this.searchStatement(inputData.SearchStatement);
    this.waitForFrameReady();
    var lnkCompany = this.findElementById(PageElements.ixBillPageElements.ByIds.lnkCompany);
    lnkCompany.Click();
    var lnkCompAccount = this.findElementById(PageElements.ixBillPageElements.ByIds.lnkCompAcc);
    lnkCompAccount.Click();
    var lnkCompAccBillAcc = this.findElementById(PageElements.ixBillPageElements.ByIds.lnkCompAccBillAcc);
    lnkCompAccBillAcc.Click();
    var lnkCompAccBillAccStmnt = this.findElementById(PageElements.ixBillPageElements.ByIds.lnkCompAccBillAccStmnt);
    lnkCompAccBillAccStmnt.Click();
//    var divComAccBillAccStmnt = this.findElementById(PageElements.ixBillPageElements.ByIds.divComAccBillAccStmnt);
//    var linkCompAccBillAcStmnt = Common.FindChildElementByText(divComAccBillAccStmnt, inputData.CompAccStmnt);
//    linkCompAccBillAcStmnt.Click();
    //var loadingSpinner = this.findElementById(PageElements.ixBillPageElements.ByIds.loadingSpinner);
    //this.waitForLoadingSpiiner(loadingSpinner);
    var tabAdjustment = this.findElementById(PageElements.ixBillPageElements.ByIds.tabAdjustment);
    tabAdjustment.Click();
  }
  catch (ex){
    Log.Error(ex.description);
  }
};

iXBillPage.prototype.createAdjustmentStatement = function(inputData){
  try{
    this.waitForFrameReady();
    this.waitForLoadingSpiiner(loadingSpinner);
    var btnAddAdjustmentStatement = this.findElementById(PageElements.ixBillPageElements.ByIds.btnAddAdjustmentStatement);
    btnAddAdjustmentStatement.Click();
    var adjustmentStatement = this.findElementById(PageElements.ixBillPageElements.ByIds.adjustmentStatementName);
    adjustmentStatementName = adjustmentStatement.contentText;
    var loadingSpinner = this.findElementById(PageElements.ixBillPageElements.ByIds.loadingSpinner);
    this.waitForLoadingSpiiner(loadingSpinner);
    var tblAdjustmentStatement = this.findElementById(PageElements.ixBillPageElements.ByIds.tblAdjustmentStatement);
    var rows = tblAdjustmentStatement.RowCount;
    var InfoIconId = PageElements.ixBillPageElements.ByIds.AdjStmtInfoicon + (rows - 2);
    var AdjStmtInfoicon = this.findElementById(InfoIconId);
    AdjStmtInfoicon.Click();
    this.waitForLoadingSpiiner(loadingSpinner);
    var btnAddFinanceStatement = this.findElementById(PageElements.ixBillPageElements.ByIds.btnAddFinanceStatement);
  	btnAddFinanceStatement.Click();
  
    var txtChargeName = this.findElementById(PageElements.ixBillPageElements.ByIds.txtChargeName);
    txtChargeName.SetText("");
    txtChargeName.Keys(inputData.AddAdjustment.ChargeName);
    var txtBeginDate = this.findElementById(PageElements.ixBillPageElements.ByIds.txtBeginDate);
    txtBeginDate.SetText("");
    txtBeginDate.Keys(inputData.AddAdjustment.BeginDate);
  
    var txtEndDate = this.findElementById(PageElements.ixBillPageElements.ByIds.txtEndDate);
    txtEndDate.SetText("");
    txtEndDate.Keys(inputData.AddAdjustment.EndDate);
  
    var ddlchargeCategory = this.findElementById(PageElements.ixBillPageElements.ByIds.ddlchargeCategory);
    ddlchargeCategory.focus();
    ddlchargeCategory.ClickItem(inputData.AddAdjustment.ChargeCategory);
  
    var ddlAccountingCode = this.findElementById(PageElements.ixBillPageElements.ByIds.ddlAccountingCode);
    ddlAccountingCode.focus();
    ddlAccountingCode.ClickItem(inputData.AddAdjustment.AccountingCode);
  
    var ddlCurrency = this.findElementById(PageElements.ixBillPageElements.ByIds.ddlCurrency);
    ddlCurrency.focus();
    ddlCurrency.ClickItem(inputData.AddAdjustment.Currency);
  
    var txtAdjustAmount = this.findElementById(PageElements.ixBillPageElements.ByIds.txtAdjustAmount);
    txtAdjustAmount.SetText("");
    txtAdjustAmount.Keys(inputData.AddAdjustment.AdjustmentAmount);
  
    var txtTaxTemplate = this.findElementById(PageElements.ixBillPageElements.ByIds.txtTaxTemplate);
    txtTaxTemplate.focus();
    txtTaxTemplate.ClickItem(1);
  
    var btnSaveAdjustment = this.findElementById(PageElements.ixBillPageElements.ByIds.btnSaveAdjustment);
    btnSaveAdjustment.Click();
    this.waitForLoadingSpiiner(loadingSpinner);
  }
  catch (ex){
    Log.Error(ex.description);
  }
};

iXBillPage.prototype.openAdjustmentStatement = function(inputData){
  try{
    this.searchStatement(inputData.SearchAdjustment);
    this.waitForFrameReady();
    var lnkCompany = this.findElementById(PageElements.ixBillPageElements.ByIds.lnkCompany);
    lnkCompany.Click();
    var lnkCompAccount = this.findElementById(PageElements.ixBillPageElements.ByIds.lnkCompAcc);
    lnkCompAccount.Click();
    var lnkCompAccBillAcc = this.findElementById(PageElements.ixBillPageElements.ByIds.lnkCompAccBillAcc);
    lnkCompAccBillAcc.Click();
    var divAdjStatement = this.findElementById(PageElements.ixBillPageElements.ByIds.divAdjStatement);
    var lnkCompAccBillAdjStmnt = Common.FindChildElementByText(divAdjStatement,adjustmentStatementName);
    lnkCompAccBillAdjStmnt.Click();
    var tabCharge = this.findElementById(PageElements.ixBillPageElements.ByIds.tabCharge);
    tabCharge.Click();
    var loadingSpinner = this.findElementById(PageElements.ixBillPageElements.ByIds.loadingSpinner);
    this.waitForLoadingSpiiner(loadingSpinner);
    var btnGo = this.findElementById(PageElements.ixBillPageElements.ByIds.btnGo);
    btnGo.Click();
    this.waitForLoadingSpiiner(loadingSpinner);
  }
  catch (ex){
    Log.Error(ex.description);
  }
};

iXBillPage.prototype.createAdjustmentFolder = function(inputData){
  try{
    this.waitForFrameReady();
    var ddlAdjustmentFolder = this.findElementById(PageElements.ixBillPageElements.ByIds.ddlAdjustmentFolder);
    ddlAdjustmentFolder.ClickItem("<New Adjustment Folder>");
    var folderName = inputData.FolderName + aqConvert.DateTimeToFormatStr(aqDateTime.Now(), "%y%m%d%H%M%S");
    var txtNewAdjustmentFolderName = this.findElementById(PageElements.ixBillPageElements.ByIds.txtNewAdjustmentFolderName);
    txtNewAdjustmentFolderName.Keys(folderName);
    var btnSaveAdjustmentFolder = this.findElementById(PageElements.ixBillPageElements.ByIds.btnSaveAdjustmentFolder);
    btnSaveAdjustmentFolder.Click();
    return folderName;
  }
  catch (ex){
    Log.Error(ex.description);
  }
};

iXBillPage.prototype.openAdjustmentFolder = function(inputData){
  try{
    this.waitForFrameReady();
    var topOperationMenu = this.findElementById(PageElements.ixBillPageElements.ByIds.topOperationMenu, 30000);
    topOperationMenu.Click();
    this.browser.getOperationAdjustmentFolderItemLink().Click();
    var txtBillAccountName = this.findElementById(PageElements.ixBillPageElements.ByIds.txtBillAccountName);
    txtBillAccountName.SetText("");;
    txtBillAccountName.Keys("%");
    var txtAdjFolderName = this.findElementById(PageElements.ixBillPageElements.ByIds.txtAdjFolderName);
    txtAdjFolderName.SetText("");
    txtAdjFolderName.Keys(inputData);
    var btnFindAdjFolder = this.findElementById(PageElements.ixBillPageElements.ByIds.btnFindAdjFolder);
    btnFindAdjFolder.Click();
    this.waitForFrameReady();
    var lnkAdjFolder = this.findElementById(PageElements.ixBillPageElements.ByIds.lnkAdjFolder);
    lnkAdjFolder.Click();
    var ddlAdjFolderStatus = this.findElementById(PageElements.ixBillPageElements.ByIds.ddlAdjFolderStatus);
    return ddlAdjFolderStatus.contentText;
  }
  catch (ex){
    Log.Error(ex.description);
  }
};

iXBillPage.prototype.changeAdjustmentFolderStatus = function(status){
  try{
    this.waitForFrameReady();
    var ddlAdjFolderStatus = this.findElementById(PageElements.ixBillPageElements.ByIds.ddlAdjFolderStatus);
    ddlAdjFolderStatus.ClickItem(status);
    var btnSaveAdjFolderStatus = this.findElementById(PageElements.ixBillPageElements.ByIds.btnSaveAdjFolderStatus);
    btnSaveAdjFolderStatus.Click();
    this.browser.getConfirmationMesage().Click();
    var loadingSpinner = this.findElementById(PageElements.ixBillPageElements.ByIds.loadingSpinner);
    this.waitForLoadingSpiiner(loadingSpinner);
    var lblInfoContainer = this.findElementById(PageElements.ixBillPageElements.ByIds.lblInfoContainer);
    return lblInfoContainer.contentText;
  }
  catch (ex){
    Log.Error(ex.description);
  }  
};
