//USEUNIT Page
//USEUNIT PageElements

var ExportImportPage = function(browser, page){
  Page.PageBase.call(this, page);
  this.browser = browser;
};

ExportImportPage.prototype = new Page.PageBase();
ExportImportPage.prototype.constructor = ExportImportPage;

ExportImportPage.prototype.exportCustomerSpecificNumberPlan = function(){
  this.waitForFrameReady();
  var ddlAction = this.findElementById(PageElements.ExportImportElements.ByIds.ddlAction);
  ddlAction.ClickItem("Export");
  var ddlService = this.findElementById(PageElements.ExportImportElements.ByIds.ddlService);
  ddlService.ClickItem("IDDD");
  var btnExpImp = this.findElementById(PageElements.ExportImportElements.ByIds.btnExpImp);
  btnExpImp.Click();
  //Clicking on Browser's Save button from Download notification window
  this.browser.getSaveButtonForDownload().Click(); 

  //Closing the notification window
  this.browser.getCloseDownloadNotificationWindow().Click();
  
  //Close ExportImportBlending window
  //var closeButton = this.findElementById(PageElements.ExportImportElements.ByIds.btnCancel);
  //closeButton.Click();
  
};

ExportImportPage.prototype.importCustomerSpecificNumberPlan = function(FilePath){
  var ddlAction = this.findElementById(PageElements.ExportImportElements.ByIds.ddlAction);
  ddlAction.ClickItem("Import");
  var ddlService = this.findElementById(PageElements.ExportImportElements.ByIds.ddlService);
  ddlService.ClickItem("IDDD");
  
  var btnUpload = this.findElementById(PageElements.ExportImportElements.ByIds.btnUpload);
  btnUpload.DblClick();
  
  this.browser.getOpenFileDialog(FilePath);
    
  var btnExpImp = this.findElementById(PageElements.ExportImportElements.ByIds.btnExpImp);
  //btnExpImp.Click();
  btnExpImp.Keys("[Enter]");
  
  //Return upload success or fail message  
  var lblMessage = this.findElementById(PageElements.ExportImportElements.ByIds.lblMessage, 60000);
  var result = lblMessage.contentText;
  
  //Close ExportImportBlending window
  var closeButton = this.findElementById(PageElements.ExportImportElements.ByIds.btnCancel);
  closeButton.Click();
  return result;
};