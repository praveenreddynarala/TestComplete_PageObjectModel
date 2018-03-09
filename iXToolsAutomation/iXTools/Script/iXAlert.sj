//USEUNIT Page
//USEUNIT Common
//USEUNIT PageElements

var iXAlertPage = function(browser, page){
  Page.PageBase.call(this, page);
  this.browser = browser;
};

iXAlertPage.prototype = new Page.PageBase();
iXAlertPage.prototype.constructor = iXAlertPage;

iXAlertPage.prototype.subscribeToCarrierDestinationBlocking = function(inputData){
  try{
    var ddlBaseAlert = this.findElementById(PageElements.iXAlertElements.ByIds.ddlBaseAlert, 30000);
    ddlBaseAlert.ClickItem(inputData.baseAlert);
    ddlBaseAlert.Keys("[Enter]");
    var alertItem = this.findElementById(PageElements.iXAlertElements.ByIds.alertItem);
    alertItem.Click();
  
    var ddlSeverityMode = this.findElementById(PageElements.iXAlertElements.ByIds.ddlSeverityMode);
    ddlSeverityMode.ClickItem(inputData.severity);
  
    var ddlPeriod = this.findElementById(PageElements.iXAlertElements.ByIds.ddlPeriod);
    ddlPeriod.ClickItem(inputData.period);
  
    var ddlNotifyMethod = this.findElementById(PageElements.iXAlertElements.ByIds.ddlNotifyMethod);
    ddlNotifyMethod.DblClickItem(inputData.notifyMethod.method1);
    ddlNotifyMethod.DblClickItem(inputData.notifyMethod.method2);
    var btnSave = this.findElementById(PageElements.iXAlertElements.ByIds.btnSave);
    btnSave.Click();
    this.waitForFrameReady();
    var alertMessage = this.page.Alert.Message;
    if(alertMessage === 'Duplicate User Alert Name'){
      this.page.Alert.Button("OK").Click();
      var btnCancel = this.findElementById(PageElements.iXAlertElements.ByIds.btnCancel);
      btnCancel.Click();
      this.browser.getLeaveThisPageDialog().Click();
    }
    else
      this.page.Alert.Button("OK").Click();
  }
  catch (ex){
    Log.Error(ex.description);
  }
};

iXAlertPage.prototype.navigateToHomePage = function(){
  try{
    var menuHome = this.findElementById(PageElements.iXAlertElements.ByIds.topHomeMenu);
    menuHome.Click();
  }
  catch (ex){
    Log.Error(ex.description);
  }
}