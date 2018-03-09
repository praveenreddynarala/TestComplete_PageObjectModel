//USEUNIT Browser
//USEUNIT DefineCSNP
//USEUNIT ExportImport
//USEUNIT iXAdmin
//USEUNIT iXConnect
//USEUNIT iXHome
//USEUNIT LgxDetail
//USEUNIT TestConfig
//USEUNIT TestData

function verifyUserProfileRole(browser){
  //Switch module to admin
  var homePage = new iXHome.HomePage(browser.getPage(TestConfig.PageUrls.homePageUrl));
  homePage.switchModule(iXHome.Modules.Admin);
  
  var adminPage = new iXAdminPage(browser, browser.getPage(TestConfig.PageUrls.adminPageUrl));
  adminPage.waitForPageReady();
  
  adminPage.openProfile(TestData.iXTool.VerifyUserRoleData.profileName);
  adminPage.openApplicationRoles(TestData.iXTool.VerifyUserRoleData.applicationName);
  var roleInfo = adminPage.findRoleInfo(TestData.iXTool.VerifyUserRoleData.roleId, TestData.iXTool.VerifyUserRoleData.roleName);

  aqObject.CompareProperty(roleInfo.roleId, cmpEqual, TestData.iXTool.VerifyUserRoleData.roleId, true, 3);
  aqObject.CompareProperty(roleInfo.roleName, cmpEqual, TestData.iXTool.VerifyUserRoleData.roleName, true, 3);
}

function newCSNP(browser){  
  var homePage = new iXHome.HomePage(browser.getPage(TestConfig.PageUrls.homePageUrl, Common.defaultDelay));
  homePage.switchModule(iXHome.Modules.iXConnect);
  
  var iXConnectPage = new iXConnect.iXConnectPage(browser, browser.getPage(TestConfig.PageUrls.iXConnectPageUrl, Common.defaultDelay));
  iXConnectPage.newNumberPlan();
  
  var defineCsnpPage = new DefineCSNP.DefineCSNPPage(browser.getPage(TestConfig.PageUrls.defineCSNPTypeUrl, Common.defaultDelay));
  defineCsnpPage.selectGroupingofReferenceDestination();
  
  var lgxDetailPage = new LgxDetail.LgxDetailPage(browser, browser.getPage(TestConfig.PageUrls.lgxDetailPageUrl, Common.defaultDelay));
  lgxDetailPage.step1(TestData.iXTool.CreateCSNP.Step1);
  lgxDetailPage.step2(TestData.iXTool.CreateCSNP.Step2);
  lgxDetailPage.step3(TestData.iXTool.CreateCSNP.Step3);
  lgxDetailPage.step4(TestData.iXTool.CreateCSNP.Step4);
  lgxDetailPage.submitCsnp();
}

function exportCSNP(browser){
  var homePage = new iXHome.HomePage(browser.getPage(TestConfig.PageUrls.homePageUrl, Common.defaultDelay));
  homePage.switchModule(iXHome.Modules.iXConnect);
  
  var iXConnectPage = new iXConnect.iXConnectPage(browser, browser.getPage(TestConfig.PageUrls.iXConnectPageUrl, Common.defaultDelay)); 
  iXConnectPage.navigateToExportCSNP(TestData.iXTool.ExportImportCSNP);
  var exportImportPage = new ExportImport.ExportImportPage(browser, browser.getPage(TestConfig.PageUrls.exportImportPageUrl,Common.defaultDelay));
  exportImportPage.exportCustomerSpecificNumberPlan();
}

function importCSNPWithValidDetails(browser){
  var homePage = new iXHome.HomePage(browser.getPage(TestConfig.PageUrls.homePageUrl, Common.defaultDelay));
  homePage.switchModule(iXHome.Modules.iXConnect);
  
  var iXConnectPage = new iXConnect.iXConnectPage(browser, browser.getPage(TestConfig.PageUrls.iXConnectPageUrl, Common.defaultDelay)); 
  iXConnectPage.navigateToExportCSNP(TestData.iXTool.ExportImportCSNP);
  var exportImportPage = new ExportImport.ExportImportPage(browser,browser.getPage(TestConfig.PageUrls.exportImportPageUrl,Common.defaultDelay));
  var result = exportImportPage.importCustomerSpecificNumberPlan(TestData.iXTool.ExportImportCSNP.Import.ValidFilePath);
  aqObject.CompareProperty(result, cmpEqual, TestData.iXTool.ExportImportCSNP.Import.MsgSuccess, true, 3);
}

function importCSNPWithInvalidDetails(browser){
  var iXConnectPage = new iXConnect.iXConnectPage(browser, browser.getPage(TestConfig.PageUrls.iXConnectPageUrl, Common.defaultDelay)); 
  iXConnectPage.navigateToExportCSNP(TestData.iXTool.ExportImportCSNP);
  var exportImportPage = new ExportImport.ExportImportPage(browser, browser.getPage(TestConfig.PageUrls.exportImportPageUrl,Common.defaultDelay));
  var result = exportImportPage.importCustomerSpecificNumberPlan(TestData.iXTool.ExportImportCSNP.Import.InValidFilePath);
  aqObject.CompareProperty(result, cmpEqual, TestData.iXTool.ExportImportCSNP.Import.MsgWrongFormat, true, 3);
}