//USEUNIT Browser
//USEUNIT CarrierDestBlocking
//USEUNIT iXAdmin
//USEUNIT iXAlert
//USEUNIT iXConnect
//USEUNIT iXControl
//USEUNIT iXHome
//USEUNIT TestConfig
//USEUNIT TestData

function VerifyNewConfigForCarrierDesitnationBlocking(browser){
  var homePage = new iXHome.HomePage(browser.getPage(TestConfig.PageUrls.homePageUrl, Common.defaultDelay));
  homePage.switchModule(iXHome.Modules.Admin);
  var adminPage = new iXAdminPage(browser, browser.getPage(TestConfig.PageUrls.adminPageUrl));
  adminPage.waitForPageReady();
  adminPage.newConfigForCarrierDesitnationBlocking(TestData.iXTool.CarrierDestinationBlock.appName);
  adminPage.updateConfigParameterValue("0");
  adminPage.navigateToHomePage();
  homePage.switchModule(iXHome.Modules.iXConnect);
  var carrierDestBlocking = new CarrierDestBlocking.carrierDestBlocking(browser, browser.getPage(TestConfig.PageUrls.iXConnectPageUrl, Common.defaultDelay));
  var status = carrierDestBlocking.verifyCarrierDestinationBlocking(0);
  aqObject.CompareProperty(status, cmpEqual, TestData.iXTool.CarrierDestinationBlock.msgDisabled, true, 3);
  var iXConnectPage = new iXConnect.iXConnectPage(browser, browser.getPage(TestConfig.PageUrls.iXConnectPageUrl, Common.defaultDelay));
  iXConnectPage.navigateToHomePage();
  
  homePage.switchModule(iXHome.Modules.Admin);
  adminPage.newConfigForCarrierDesitnationBlocking(TestData.iXTool.CarrierDestinationBlock.appName);
  adminPage.updateConfigParameterValue("1");
  adminPage.navigateToHomePage();
  homePage.switchModule(iXHome.Modules.iXConnect);
  status = carrierDestBlocking.verifyCarrierDestinationBlocking(1);
  aqObject.CompareProperty(status, cmpEqual, TestData.iXTool.CarrierDestinationBlock.titleDestinationCarrier, true, 3);
  iXConnectPage.navigateToHomePage(); 
}

function VerifyRolesForDesitnationBlocking(browser){ 
  var homePage = new iXHome.HomePage(browser.getPage(TestConfig.PageUrls.homePageUrl, Common.defaultDelay));
  homePage.switchModule(iXHome.Modules.Admin);
  var adminPage = new iXAdminPage(browser, browser.getPage(TestConfig.PageUrls.adminPageUrl));
  adminPage.waitForPageReady();
  
  adminPage.openProfile(TestData.iXTool.VerifyUserRoleData.profileName);
  adminPage.openApplicationRoles(TestData.iXTool.VerifyUserRoleData.applicationName);
  var role1 = adminPage.findRoleInfo(TestData.iXTool.CarrierDestinationBlock.role1Id, TestData.iXTool.CarrierDestinationBlock.role1Name);
  var role2 = adminPage.findRoleInfo(TestData.iXTool.CarrierDestinationBlock.role2Id, TestData.iXTool.CarrierDestinationBlock.role2Name);
  aqObject.CompareProperty(role1.roleId, cmpEqual, TestData.iXTool.CarrierDestinationBlock.role1Id, true, 3);
  aqObject.CompareProperty(role1.roleName, cmpEqual, TestData.iXTool.CarrierDestinationBlock.role1Name, true, 3);
  aqObject.CompareProperty(role2.roleId, cmpEqual, TestData.iXTool.CarrierDestinationBlock.role2Id, true, 3);
  aqObject.CompareProperty(role2.roleName, cmpEqual, TestData.iXTool.CarrierDestinationBlock.role2Name, true, 3);
  adminPage.navigateToHomePage();
}

function VerifySubmenu_CarrierDestinationBlocking(browser){
  var homePage = new iXHome.HomePage(browser.getPage(TestConfig.PageUrls.homePageUrl, Common.defaultDelay));
  homePage.switchModule(iXHome.Modules.iXConnect);
  var carrierDestBlocking = new CarrierDestBlocking.carrierDestBlocking(browser, browser.getPage(TestConfig.PageUrls.iXConnectPageUrl, Common.defaultDelay));
  var tabs = carrierDestBlocking.CarrierDestBlockPageContent();
  aqObject.CompareProperty(tabs.tab1, cmpEqual, TestData.iXTool.CarrierDestinationBlock.tab1, true, 3);
  aqObject.CompareProperty(tabs.tab2, cmpEqual, TestData.iXTool.CarrierDestinationBlock.tab2, true, 3);
}

function VerifyWorkOrdersTab(browser){
  var carrierDestBlocking = new CarrierDestBlocking.carrierDestBlocking(browser, browser.getPage(TestConfig.PageUrls.iXConnectPageUrl, Common.defaultDelay));
  var status = carrierDestBlocking.WorkOrderTabFilters();
  aqObject.CompareProperty(status[0], cmpEqual, true, true, 3);
  aqObject.CompareProperty(status[1], cmpEqual, true, true, 3);
  aqObject.CompareProperty(status[2], cmpEqual, true, true, 3);
  aqObject.CompareProperty(status[3], cmpEqual, true, true, 3);
  aqObject.CompareProperty(status[4], cmpEqual, true, true, 3);
  aqObject.CompareProperty(status[5], cmpEqual, true, true, 3);
  aqObject.CompareProperty(status[6], cmpEqual, true, true, 3);
  aqObject.CompareProperty(status[7], cmpEqual, true, true, 3);
}

function VerifyWorkOrderGrid(browser){
  var carrierDestBlocking = new CarrierDestBlocking.carrierDestBlocking(browser, browser.getPage(TestConfig.PageUrls.iXConnectPageUrl, Common.defaultDelay));
  var columns = carrierDestBlocking.WorkOrderTabGrid();
  aqObject.CompareProperty(columns[3], cmpEqual, TestData.iXTool.CarrierDestinationBlock.gridWorkOrder.col3, true, 3);  
  aqObject.CompareProperty(columns[4], cmpEqual, TestData.iXTool.CarrierDestinationBlock.gridWorkOrder.col4, true, 3);
  aqObject.CompareProperty(columns[5], cmpEqual, TestData.iXTool.CarrierDestinationBlock.gridWorkOrder.col5, true, 3);
  aqObject.CompareProperty(columns[6], cmpEqual, TestData.iXTool.CarrierDestinationBlock.gridWorkOrder.col6, true, 3);
  aqObject.CompareProperty(columns[7], cmpEqual, TestData.iXTool.CarrierDestinationBlock.gridWorkOrder.col7, true, 3);
  aqObject.CompareProperty(columns[8], cmpEqual, TestData.iXTool.CarrierDestinationBlock.gridWorkOrder.col8, true, 3);
  aqObject.CompareProperty(columns[9], cmpEqual, TestData.iXTool.CarrierDestinationBlock.gridWorkOrder.col9, true, 3);
}

function VerifyCreateNewWorkOrder(browser){
  var carrierDestBlocking = new CarrierDestBlocking.carrierDestBlocking(browser, browser.getPage(TestConfig.PageUrls.iXConnectPageUrl, Common.defaultDelay));
  var msg = carrierDestBlocking.createNewWorkOrder(TestData.iXTool.CarrierDestinationBlock);
  aqObject.CompareProperty(msg, cmpEqual, TestData.iXTool.CarrierDestinationBlock.msgCreateWO, true, 3);
}

function VerifyWorkOrderValidation_1(browser){
  var carrierDestBlocking = new CarrierDestBlocking.carrierDestBlocking(browser, browser.getPage(TestConfig.PageUrls.iXConnectPageUrl, Common.defaultDelay));
  var result = carrierDestBlocking.createNewWorkOrderValidation(TestData.iXTool.CarrierDestinationBlock);
  aqObject.CheckProperty(result, "wItemList", cmpNotContains, TestData.iXTool.CarrierDestinationBlock.newWorkOrderDest);
}

function VerifyWorkOrderValidation_2(browser){
  var carrierDestBlocking = new CarrierDestBlocking.carrierDestBlocking(browser, browser.getPage(TestConfig.PageUrls.iXConnectPageUrl, Common.defaultDelay));
  var result = carrierDestBlocking.createNewWorkOrderValidationPass(TestData.iXTool.CarrierDestinationBlock);
  aqObject.CheckProperty(result, "wItemList", cmpNotContains, TestData.iXTool.CarrierDestinationBlock.newWorkOrderDest);
}

function VerifySearchWorkOrder(browser){
  var carrierDestBlocking = new CarrierDestBlocking.carrierDestBlocking(browser, browser.getPage(TestConfig.PageUrls.iXConnectPageUrl, Common.defaultDelay));
  var result = carrierDestBlocking.searchWorkOrder(TestData.iXTool.CarrierDestinationBlock);
  aqObject.CompareProperty(result[5], cmpEqual, TestData.iXTool.CarrierDestinationBlock.paramSearchWorkOrder, true, 3);
  aqObject.CompareProperty(result[6], cmpEqual, TestData.iXTool.CarrierDestinationBlock.paramSearchWorkOrderStatus, true, 3);
}

function VerifyExportWorkOrder(browser){
  var carrierDestBlocking = new CarrierDestBlocking.carrierDestBlocking(browser, browser.getPage(TestConfig.PageUrls.iXConnectPageUrl, Common.defaultDelay));
  var result = carrierDestBlocking.exportWorkOrder(TestData.iXTool.CarrierDestinationBlock);
  aqObject.CompareProperty(result, cmpEqual, TestData.iXTool.CarrierDestinationBlock.msgExportWOSuccess, true, 3);
}

function VerifyBlockedDestinationTab(browser){
  var carrierDestBlocking = new CarrierDestBlocking.carrierDestBlocking(browser, browser.getPage(TestConfig.PageUrls.iXConnectPageUrl, Common.defaultDelay));
  var status = carrierDestBlocking.BlockedDestinationTabFilters();
  aqObject.CompareProperty(status[0], cmpEqual, true, true, 3);
  aqObject.CompareProperty(status[1], cmpEqual, true, true, 3);
  aqObject.CompareProperty(status[2], cmpEqual, true, true, 3);
  aqObject.CompareProperty(status[3], cmpEqual, true, true, 3);
  aqObject.CompareProperty(status[4], cmpEqual, true, true, 3);
}

function VerifyBlockedDestinationGrid(browser){
  var carrierDestBlocking = new CarrierDestBlocking.carrierDestBlocking(browser, browser.getPage(TestConfig.PageUrls.iXConnectPageUrl, Common.defaultDelay));
  var columns = carrierDestBlocking.BlockedDestinationTabGrid();
  aqObject.CompareProperty(columns[0], cmpEqual, TestData.iXTool.CarrierDestinationBlock.gridBlockedDestinations.col0, true, 3);  
  aqObject.CompareProperty(columns[1], cmpEqual, TestData.iXTool.CarrierDestinationBlock.gridBlockedDestinations.col1, true, 3);
  aqObject.CompareProperty(columns[2], cmpEqual, TestData.iXTool.CarrierDestinationBlock.gridBlockedDestinations.col2, true, 3);
  aqObject.CompareProperty(columns[3], cmpEqual, TestData.iXTool.CarrierDestinationBlock.gridBlockedDestinations.col3, true, 3);
  aqObject.CompareProperty(columns[4], cmpEqual, TestData.iXTool.CarrierDestinationBlock.gridBlockedDestinations.col4, true, 3);
  aqObject.CompareProperty(columns[5], cmpEqual, TestData.iXTool.CarrierDestinationBlock.gridBlockedDestinations.col5, true, 3);
  aqObject.CompareProperty(columns[6], cmpEqual, TestData.iXTool.CarrierDestinationBlock.gridBlockedDestinations.col6, true, 3);
  aqObject.CompareProperty(columns[7], cmpEqual, TestData.iXTool.CarrierDestinationBlock.gridBlockedDestinations.col7, true, 3);
  aqObject.CompareProperty(columns[8], cmpEqual, TestData.iXTool.CarrierDestinationBlock.gridBlockedDestinations.col8, true, 3);
}

function VerifyBlockedDestinationExport(browser){
  var carrierDestBlocking = new CarrierDestBlocking.carrierDestBlocking(browser, browser.getPage(TestConfig.PageUrls.iXConnectPageUrl, Common.defaultDelay));
  var status = carrierDestBlocking.BlockedDestinationExport();
  aqObject.CompareProperty(status, cmpEqual, TestData.iXTool.CarrierDestinationBlock.msgExportNoData, true, 3); 
}

function VerifyBlockWorkflow(browser){ 
  var carrierDestBlocking = new CarrierDestBlocking.carrierDestBlocking(browser, browser.getPage(TestConfig.PageUrls.iXConnectPageUrl, Common.defaultDelay));
  carrierDestBlocking.BlockWorkflow(TestData.iXTool.CarrierDestinationBlock);
  carrierDestBlocking.navigateToHomePage();
}

function VerifyAlert(browser){
  var homePage = new iXHome.HomePage(browser.getPage(TestConfig.PageUrls.homePageUrl, Common.defaultDelay));
  homePage.switchToAlert(browser);
  var alertPage = new iXAlertPage(browser, browser.getPage(TestConfig.PageUrls.iXAlertPageUrl));
  alertPage.subscribeToCarrierDestinationBlocking(TestData.iXTool.CarrierDestinationBlock);
  alertPage.navigateToHomePage();
  homePage.switchModule(iXHome.Modules.iXControl);
  var iXControl = new iXControlPage(browser, browser.getPage(TestConfig.PageUrls.iXControlPageUrl));
  iXControl.requestForAlert(TestData.iXTool.CarrierDestinationBlock);
  iXControl.requestForNotification(TestData.iXTool.CarrierDestinationBlock);
}