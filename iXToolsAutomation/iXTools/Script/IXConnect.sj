//USEUNIT Page
//USEUNIT PageElements

var iXConnectPage = function(browser, page){
  Page.PageBase.call(this, page);
  this.browser = browser;
}

iXConnectPage.prototype = new Page.PageBase();
iXConnectPage.prototype.constructor = iXConnectPage;

iXConnectPage.prototype.newNumberPlan = function(){
  try{
    //sometime destination menu items is not available right away. 
    this.waitForFrameReady();
  
    var topDestinationMenu = this.findElementById(PageElements.ixConnectElements.ByIds.topDestinationMenu, 30000);
    topDestinationMenu.Click();
    this.browser.getDestinationNumberPlanPopupItemLink().Click();

    this.waitForFrameReady();
  
    var btnNewCSNP = this.findElementById(PageElements.ixConnectElements.ByIds.btnNewCSNP);
    btnNewCSNP.Click();
  }
  catch (ex){
    Log.Error(ex.description);
  }
};

iXConnectPage.prototype.navigateToExportCSNP = function(inputData){
  try{
    this.waitForFrameReady();
  
    var topDestinationMenu = this.findElementById(PageElements.ixConnectElements.ByIds.topDestinationMenu, 30000);
    topDestinationMenu.Click();
    this.browser.getDestinationNumberPlanPopupItemLink().Click();
  
    this.waitForFrameReady();
  
    var txtLetters = this.findElementById(PageElements.ixConnectElements.ByIds.txtLetters);
    txtLetters.SetText("");
    txtLetters.Keys(inputData.SearchKey);
    txtLetters.Keys("[Enter]");
    var npFirstRow = this.findElementById(PageElements.ixConnectElements.ByIds.npFirstRow);
    npFirstRow.Click();
    var btnExportImport = this.findElementById(PageElements.ixConnectElements.ByIds.btnExportImport);
    btnExportImport.Click();
  }
  catch (ex){
    Log.Error(ex.description);
  }
};

iXConnectPage.prototype.navigateToHomePage = function(){
  try{
    var menuHome = this.findElementById(PageElements.ixConnectElements.ByIds.topHomeMenu);
    menuHome.Click();
  }
  catch (ex){
    Log.Error(ex.description);
  }
}