//USEUNIT Browser
//USEUNIT iXBill
//USEUNIT iXHome
//USEUNIT TestConfig
//USEUNIT TestData
//USEUNIT Common

var folderName;
var excelData;

function verifyAccessRegularStatement(browser){ 
  excelData = Common.ReadDataFromExcel(TestConfig.TestDataPath.Excel);
  var testData = {
    SearchStatement: {
      AccountName: excelData.AccountName,
      StatementStatus: excelData.StatementStatus,
      FromDate: excelData.FromDate
    }
  }
  var homePage = new iXHome.HomePage(browser.getPage(TestConfig.PageUrls.homePageUrl, Common.defaultDelay));
  homePage.switchModule(iXHome.Modules.iXBill);
    
  var iXBillPage = new iXBill.iXBillPage(browser, browser.getPage(TestConfig.PageUrls.iXBillPageUrl, Common.defaultDelay));
  iXBillPage.accessRegularStatement(testData);
}

function verifyCreateAdjustmentStatement(browser){
  var testData = {
    AddAdjustment: {
      ChargeName: excelData.ChargeName,
      BeginDate: excelData.BeginDate,
      EndDate: excelData.EndDate,
      ChargeCategory: excelData.ChargeCategory, 
      AccountingCode: excelData.AccountingCode, 
      Currency: excelData.Currency,
      AdjustmentAmount: excelData.AdjustmentAmount,
      TaxTemplate: excelData.TaxTemplate
    }
  }
  var iXBillPage = new iXBill.iXBillPage(browser, browser.getPage(TestConfig.PageUrls.iXBillPageUrl, Common.defaultDelay));
  iXBillPage.createAdjustmentStatement(testData);
}

function verifyOpenTheAdjustmentStatement(browser){
  var testData = {
    SearchAdjustment: {
      AccountName: excelData.AccountName,
      StatementStatus: excelData.StatementStatus,
      FromDate: excelData.FromDate
    }
  }
  var iXBillPage = new iXBill.iXBillPage(browser, browser.getPage(TestConfig.PageUrls.iXBillPageUrl, Common.defaultDelay));
  iXBillPage.openAdjustmentStatement(testData);
}

function verifyCreateAdjustmentFolder(browser){
  var iXBillPage = new iXBill.iXBillPage(browser, browser.getPage(TestConfig.PageUrls.iXBillPageUrl, Common.defaultDelay));
  folderName = iXBillPage.createAdjustmentFolder(excelData);
}

function verifyOpenAdjustmentFolder(browser){
  var iXBillPage = new iXBill.iXBillPage(browser, browser.getPage(TestConfig.PageUrls.iXBillPageUrl, Common.defaultDelay));
  iXBillPage.openAdjustmentFolder(folderName);
}

function verifyChangeAdjustmentFolderStatusUnderApproval(browser){
  var iXBillPage = new iXBill.iXBillPage(browser, browser.getPage(TestConfig.PageUrls.iXBillPageUrl, Common.defaultDelay));
  var result = iXBillPage.changeAdjustmentFolderStatus("Under Approval");
  aqObject.CompareProperty(result, cmpEqual, excelData.msgAdjFolderStatusSaved, true, 3);
}

function verifyChangeAdjustmentFolderStatusApproved(browser){
  var iXBillPage = new iXBill.iXBillPage(browser, browser.getPage(TestConfig.PageUrls.iXBillPageUrl, Common.defaultDelay));
  var result = iXBillPage.changeAdjustmentFolderStatus("Approved");
  aqObject.CompareProperty(result, cmpEqual, excelData.msgAdjFolderStatusSaved, true, 3);
}