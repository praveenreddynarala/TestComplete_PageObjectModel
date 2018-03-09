//USEUNIT Page
//USEUNIT Common
//USEUNIT PageElements
//USEUNIT TestData

var iXAdminPage = function(browser, page){
  Page.PageBase.call(this, page);
  this.browser = browser;
};

iXAdminPage.prototype = new Page.PageBase();
iXAdminPage.prototype.constructor = iXAdminPage;
  
iXAdminPage.prototype.openProfile = function(roleName){
  try{
    // Click the admin->profile link
    var adminLink = this.findElementById(PageElements.AdminPageElements.ByIds.topAdminMenu);
    adminLink.Click();
  
    var profileLink = this.browser.getAdminProfilePopupItemLink();
    profileLink.Click();
  
    // wait for the page
    this.waitForPageReady();
  
    //
    var ddlStatus = this.findElementById(PageElements.AdminPageElements.ByIds.ddlStatus);
    ddlStatus.ClickItem(TestData.iXTool.iXAdmin.UserStatus);
    ddlStatus.Keys("[Enter]");
  
    // Wait for profile list frame to be ready
    // TODO: probably we can wait for particular frame
    this.waitForFrameReady(30000);
  
    var tbProfileTree = this.findElementById(PageElements.AdminPageElements.ByIds.tbProfileTree, 30000);
    var profile = Common.FindChildElementByText(tbProfileTree, roleName);
    this.waitForFrameReady(30000);
    profile.focus();
    profile.Click();
  
    // Wait for profile frame to be ready
    this.waitForFrameReady(30000);
  }
  catch (ex){
    Log.Error(ex.description);
  }
};

iXAdminPage.prototype.openApplicationRoles = function(appName){
  try{
    var tabRole = this.findElementById(PageElements.AdminPageElements.ByIds.tabRole);
    tabRole.Click();
    this.waitForFrameReady(30000);
    var ddlApplication = this.findElementById(PageElements.AdminPageElements.ByIds.ddlApplication);
    ddlApplication.ClickItem(appName);
    ddlApplication.Keys("[Enter]");
    this.waitForFrameReady();
  }
  catch (ex){
    Log.Error(ex.description);
  }
};

iXAdminPage.prototype.findRoleInfo = function(roleId, roleName){
  try{
    var tblProfileRole = this.findElementById(PageElements.AdminPageElements.ByIds.tblProfileRole)
      , roleIdElm = Common.FindChildElementByText(tblProfileRole, roleId)
      , roleNameElm = Common.FindChildElementByText(tblProfileRole, roleName);
    
    return {
      roleId: roleIdElm.contentText,
      roleName: roleNameElm.contentText
    };
  }
  catch (ex){
    Log.Error(ex.description);
  }
};

iXAdminPage.prototype.newConfigForCarrierDesitnationBlocking = function(appName){
  try{
    var configLink = this.findElementById(PageElements.AdminPageElements.ByIds.topConfigMenu);
    configLink.Click();
    this.browser.getAdminConfigManagementItemLink().Click();
    this.waitForFrameReady(30000);
    var ddlScope = this.findElementById(PageElements.AdminPageElements.ByIds.ddlScope);
    ddlScope.ClickItem(appName);
    ddlScope.Keys("[Enter]");
  
    var configVariable = this.findElementById(PageElements.AdminPageElements.ByIds.configVariable);
    return configVariable.contentText;
  
    var configParamValue = this.findElementById(PageElements.AdminPageElements.ByIds.configParamValue);
    configParamValue.contentText;  
  }
  catch (ex){
    Log.Error(ex.description);
  }
};

iXAdminPage.prototype.updateConfigParameterValue = function(value){
  try{
    var configParamValue = this.findElementById(PageElements.AdminPageElements.ByIds.configParamValue);
    configParamValue.SetText("");
    configParamValue.Keys(value);
    var btnSaveConfig = this.findElementById(PageElements.AdminPageElements.ByIds.btnSaveConfig);
    btnSaveConfig.Click();
    this.page.Alert.Button("OK").Click();
  }
  catch (ex){
    Log.Error(ex.description);
  }
}

iXAdminPage.prototype.navigateToHomePage = function(){
  try{
    var menuHome = this.findElementById(PageElements.AdminPageElements.ByIds.topHomeMenu);
    menuHome.Click();
    }
  catch (ex){
    Log.Error(ex.description);
  }
}

