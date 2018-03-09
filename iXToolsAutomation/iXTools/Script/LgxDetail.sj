//USEUNIT Common
//USEUNIT Page
//USEUNIT CsnpWizardStep3
//USEUNIT PageElements
//USEUNIT TestConfig

var postBackDelay = 10000;

var LgxDetailPage = function(browser, page){
  Page.PageBase.call(this, page);
  this.browser = browser;
};

LgxDetailPage.prototype = new Page.PageBase();
LgxDetailPage.prototype.constructor = LgxDetailPage;

LgxDetailPage.prototype.discardExistingSession = function(){
  var btnNew 
  , sessionExistsLabel = this.findElementById(PageElements.LgxDetailElements.ByIds.lblSessionExists);
  
  if(sessionExistsLabel.Exists){
    if(aqString.Find(sessionExistsLabel.contentText, "Session Already Exists.") != -1){
      // click on new
      btnNew = this.findElementById(PageElements.ixConnectElements.ByIds.btnNew);
      btnNew.Click();
      this.page.Alert.Button("OK").Click();
    }
  }
};

LgxDetailPage.prototype.step1 = function(inputData){
  var linkStp1NewNP = this.findElementById(PageElements.LgxDetailElements.ByIds.linkStp1NewNP);
  linkStp1NewNP.Click();
  
  this.waitForPageReady();
  
  this.page = this.browser.getPage(TestConfig.PageUrls.createNewCsnpStepUrl);
  
  //Todo: move id
  var txtNumberPlan = this.findElementById(PageElements.LgxDetailElements.ByIds.txtNumberPlan)
    , txtNumberPlanAbb = this.findElementById(PageElements.LgxDetailElements.ByIds.txtNumberPlanAbb)
    , ddlUseDestOtherName = this.findElementById(PageElements.LgxDetailElements.ByIds.ddlUseDestOtherName)
    , ddlRestrictCSNPEdit = this.findElementById(PageElements.LgxDetailElements.ByIds.ddlRestrictCSNPEdit)
    , txtFixedBlendingSecurityMarkup = this.findElementById(PageElements.LgxDetailElements.ByIds.txtFixedBlendingSecurityMarkup)
    , txtMinMaxBlendSecurityMarkup = this.findElementById(PageElements.LgxDetailElements.ByIds.txtMinMaxBlendSecurityMarkup)
    , btnSave = this.findElementById(PageElements.LgxDetailElements.ByIds.btnSave);
    
  txtNumberPlan.Keys(inputData.NumberPlan + aqConvert.DateTimeToFormatStr(aqDateTime.Now(), "%y%m%d%H%M%S"));
  txtNumberPlanAbb.Keys(inputData.NumberPlanAbb);
  ddlUseDestOtherName.focus();
  ddlUseDestOtherName.ClickItem(inputData.DestOtherName);
  
  ddlRestrictCSNPEdit.focus();
  ddlRestrictCSNPEdit.ClickItem(inputData.RestrictCSNP);

  txtFixedBlendingSecurityMarkup.SetText("");
  txtFixedBlendingSecurityMarkup.Keys(inputData.FixedBlendingSecurity);

  txtMinMaxBlendSecurityMarkup.SetText("");
  txtMinMaxBlendSecurityMarkup.Keys(inputData.MinMaxBlendSecurity);

  //Click on Next button
  btnSave.Click();
  this.page.Alert.Button("OK").Click();
  
  // set the page back to step wizard
  this.page = this.browser.getPage(TestConfig.PageUrls.newCsnpWizardUrl);
  this.waitForFrameReady(this.page);
};

LgxDetailPage.prototype.step2 = function(inputData){
  var linkStep2SelSrc = this.findElementById(PageElements.LgxDetailElements.ByIds.linkStep2SelSrc);
  linkStep2SelSrc.Click();

  this.page = this.browser.getPage(TestConfig.PageUrls.selectSourceNumberPlan, 30000);
  
  var dtSelectDate = this.findElementById(PageElements.LgxDetailElements.ByIds.dtSelectDate)
    , btnSaveStep2 = this.findElementById(PageElements.LgxDetailElements.ByIds.btnSaveStep2);
    
  dtSelectDate.SetText("");
  dtSelectDate.Keys(inputData.selectDate);

  btnSaveStep2.Click();

  this.page.Alert.Button("OK").Click();
  this.waitForPageReady();
    
  //Todo: Need to remove this delay (it requires time for postback and meanwhile code finds the old page :))
  aqUtils.Delay(postBackDelay);

  // set the page back to step wizard
  this.page = this.browser.getPage(TestConfig.PageUrls.newCsnpWizardUrl);
  this.waitForFrameReady(this.page);
};

LgxDetailPage.prototype.step3 = function(inputData){
  var linkStep3Mapping = this.findElementById(PageElements.LgxDetailElements.ByIds.linkStep3Mapping);
  linkStep3Mapping.Click();

  //Setting Step3 Wizard to current page
  var wizStep3Page = new CsnpWizardStep3.CsnpWizardStep3Page(this.browser, this.browser.getPage(TestConfig.PageUrls.csnpWizardStep3Url, 30000));
  wizStep3Page.completeOperation(inputData); 
  
  //Todo: remove this delay
  aqUtils.Delay(postBackDelay);
  
  // set the page back to step wizard
  this.page = this.browser.getPage(TestConfig.PageUrls.newCsnpWizardUrl);
  this.waitForFrameReady(this.page);

};

LgxDetailPage.prototype.step4 = function(inputData){
  //Clicking on Step4 link from Create CSNP Wizard
  var linkStep4 = this.findElementById(PageElements.LgxDetailElements.ByIds.linkStep4);
  linkStep4.Click();
    
  this.page = this.browser.getPage(TestConfig.PageUrls.addServiceToCountryUrl);
    
  var cbService = this.findElementById(PageElements.LgxDetailElements.ByIds.cbService)
    , btnSaveStep4 = this.findElementById(PageElements.LgxDetailElements.ByIds.btnSaveStep4);
  
  //Select service type check box
  cbService.ClickChecked(true);
  //Save Service selection
  btnSaveStep4.Click();

  //Setting current page to Select Rating page
  this.page = this.browser.getPage(TestConfig.PageUrls.pgRatingUrl);
  //Clicking on add row button
  var btnAddRow = this.findElementById(PageElements.LgxDetailElements.ByIds.btnAddRow);
  btnAddRow.Click();

  //Select Rating Country 
  this.page = this.browser.getPage(TestConfig.PageUrls.detailPopupUrl);
  var ddlRatCountry = this.findElementById(PageElements.LgxDetailElements.ByIds.ddlRatCountry);
  ddlRatCountry.focus();
  ddlRatCountry.ClickItem(inputData.RatingCountry);

  //Select rating customer destination 
  var ddlCustDest = this.findElementById(PageElements.LgxDetailElements.ByIds.ddlCustDest);
  ddlCustDest.focus();
  ddlCustDest.ClickItem(inputData.CustomerDestination);

  //Select Service for rating
  var ddlService = this.findElementById(PageElements.LgxDetailElements.ByIds.ddlService);
  ddlService.focus();
  ddlService.ClickItem(inputData.Service);
  
  //Click on Select rating Method button.
  var btnRatMethod = this.findElementById(PageElements.LgxDetailElements.ByIds.btnRatMethod);
  btnRatMethod.Click();

  //Check if the page shows certificate error and if shows then Click Continute 
  this.page = this.browser.getPage(TestConfig.PageUrls.fLookupUrl);
    
  var certErrorLink = this.findElementById(PageElements.LgxDetailElements.ByIds.linkCertError);
  if(certErrorLink.Exists)
    certErrorLink.Click();
 
  //Selecting a rating method
  this.waitForPageReady();
  var assignMethod = this.findElementById(PageElements.LgxDetailElements.ByIds.assignMethod);
  assignMethod.Click();

  //Saving the changes
  this.page = this.browser.getPage("*lgx_Detail.aspx?Action=Insert&lgx_WindowID=DetailPopup*");
  btnSave2Step4 = this.findElementById(PageElements.LgxDetailElements.ByIds.btnSave2Step4);
  btnSave2Step4.Click();
  this.page.Alert.Button("OK").Click();
  
  //Clicking on the Next Step button   
  this.page = this.browser.getPageByIndex(TestConfig.PageUrls.pgRatingUrl1, 1);
  var btnNext = this.findElementById(PageElements.LgxDetailElements.ByIds.btnStep4Next);
  btnNext.Click();

  //Todo: remove this delay
  aqUtils.Delay(postBackDelay);

  // set the page back to step wizard
  this.page = this.browser.getPage(TestConfig.PageUrls.newCsnpWizardUrl);
  this.waitForFrameReady(this.page);
};

LgxDetailPage.prototype.submitCsnp = function(inputData){
  //Saving Steps 4 changes 
  var btnStep4Submit = this.findElementById(PageElements.LgxDetailElements.ByIds.btnStep4Submit);
  btnStep4Submit.Click();

  //Check if Missing Reference page exists or not if exists then close. 
  var missingRefPage = this.browser.getPage(PageElements.LgxDetailElements.ByIds.pageMissingRef, 60000);
  
  if(missingRefPage.Exists){
    var btnCancel = Common.FindElementById(missingRefPage, PageElements.LgxDetailElements.ByIds.btnCancel);
    btnCancel.Click();
  }
  
  //Todo: remove this delay
  aqUtils.Delay(postBackDelay);
  this.page.Alert.Button("OK").Click();
  //Delay(10000);
  
  //var page = this.browser.getPage(PageElements.LgxDetailElements.ByIds.pageBlendingFrame, 60000);
  //page.Close();
};
