//USEUNIT Page
//USEUNIT PageElements

var Modules = {
  Admin: "Admin",
  iXConnect: "iXConnect",
  iXBill: "iXBill",
  iXControl: "iXControl"
};

var HomePage = function(page){
  Page.PageBase.call(this, page);
};

HomePage.prototype = new Page.PageBase();
HomePage.prototype.constructor = HomePage;

HomePage.prototype.switchModule = function(moduleName){
  try{
    if(moduleName === Modules.Admin){     
      var adminLink = this.findElementById(PageElements.HomePageElements.ByIds.iXAdminLink);
      adminLink.Click();
    }
    else if(moduleName === Modules.iXConnect){
      var iXConnectLink = this.findElementById(PageElements.HomePageElements.ByIds.iXConnectLink);
      iXConnectLink.Click();
    }
    else if(moduleName === Modules.iXBill){
      var iXBillLink = this.findElementById(PageElements.HomePageElements.ByIds.iXBillLink);
      iXBillLink.Click();
    }
    else if(moduleName === Modules.iXControl){
      var iXControlLink = this.findElementById(PageElements.HomePageElements.ByIds.iXControlLink);
      iXControlLink.Click();
    }
  }
  catch (ex){
    Log.Error(ex.description);
  }
};

HomePage.prototype.switchToAlert = function(browser){
  try{
    var iXAlertLink = this.findElementById(PageElements.HomePageElements.ByIds.iXAlertLink);
    iXAlertLink.Click();
    browser.getAlertPopupLink().Click();
  }
  catch (ex){
    Log.Error(ex.description);
  }
}