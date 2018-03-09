//USEUNIT Page
//USEUNIT Common
//USEUNIT PageElements

var iXControlPage = function(browser, page){
  Page.PageBase.call(this, page);
  this.browser = browser;
};

iXControlPage.prototype = new Page.PageBase();
iXControlPage.prototype.constructor = iXControlPage;

iXControlPage.prototype.requestForAlert = function(inputData){
  try{
    this.waitForFrameReady();
  
    var topMenuRegister = this.findElementById(PageElements.iXControlElements.ByIds.topMenuRegister, 30000);
    topMenuRegister.Click();
    this.browser.getRegisterBusinessAlertsItem().Click();
  
    this.waitForFrameReady();
    var ddlItem = this.findElementById(PageElements.iXControlElements.ByIds.ddlItem);
    ddlItem.ClickItem(inputData.hourlyBusinessAlert);
    ddlItem.Keys("[Enter]");
    this.waitForFrameReady();
    var recentHourlyAlert = this.findElementById(PageElements.iXControlElements.ByIds.recentHourlyAlert);
    recentHourlyAlert.focus();
    recentHourlyAlert.Click();
  
    var reqBusAlertLink = this.findElementById(PageElements.iXControlElements.ByIds.reqBusAlertLink);
    reqBusAlertLink.Click();
  
    var btnExecute = this.findElementById(PageElements.iXControlElements.ByIds.btnExecute);
    btnExecute.Click();
  
    this.waitForFrameReady();
    this.page.Alert.Button("OK").Click();
  }
  catch (ex){
    Log.Error(ex.description);
  }    
};

iXControlPage.prototype.requestForNotification = function(inputData){
  try{
    this.waitForFrameReady();
  
    var topMenuRegister = this.findElementById(PageElements.iXControlElements.ByIds.topMenuRegister);
    topMenuRegister.Click();
    this.browser.getRegisterNotificationItem().Click();
  
    this.waitForFrameReady();
    var ddlItem = this.findElementById(PageElements.iXControlElements.ByIds.ddlItem);
    ddlItem.ClickItem(inputData.hourlyAlertNotification);
    ddlItem.Keys("[Enter]");
    this.waitForFrameReady();
    var recentHourlyAlert = this.findElementById(PageElements.iXControlElements.ByIds.recentHourlyAlert);
    recentHourlyAlert.focus();
    recentHourlyAlert.Click();
  
    var reqBusAlertLink = this.findElementById(PageElements.iXControlElements.ByIds.reqBusAlertLink);
    reqBusAlertLink.Click();
  
    var btnExecute = this.findElementById(PageElements.iXControlElements.ByIds.btnExecute);
    btnExecute.Click();
  
    this.waitForFrameReady();
    this.page.Alert.Button("OK").Click();
  }
  catch (ex){
    Log.Error(ex.description);
  }   
};