//USEUNIT Page
//USEUNIT PageElements

var CsnpWizardStep3Page = function(browser, page){
  Page.PageBase.call(this, page);
  this.browser = browser;
}

CsnpWizardStep3Page.prototype = new Page.PageBase();
CsnpWizardStep3Page.prototype.constructor = CsnpWizardStep3Page;

CsnpWizardStep3Page.prototype.completeOperation = function(inputData){
  //Clicking on Add new Mapping
  var btnAddNewRow = this.findElementById(PageElements.CsnpWizardStep3Elements.ByIds.btnAddNewRow);
  btnAddNewRow.Click();
  this.waitForPageReady();
  
  var ddlCountry = this.findElementById(PageElements.CsnpWizardStep3Elements.ByIds.ddlCountry)
    , txtDestination = this.findElementById(PageElements.CsnpWizardStep3Elements.ByIds.txtDestination)
    , txtDestAbbrv = this.findElementById(PageElements.CsnpWizardStep3Elements.ByIds.txtDestAbbrv)
    , ddlCallType = this.findElementById(PageElements.CsnpWizardStep3Elements.ByIds.ddlCallType)
    , ddlCallChar = this.findElementById(PageElements.CsnpWizardStep3Elements.ByIds.ddlCallChar)
    , ddlPrimaryBlendingType = this.findElementById(PageElements.CsnpWizardStep3Elements.ByIds.ddlPrimaryBlendingType)
    , ddlSecondaryBlendingType = this.findElementById(PageElements.CsnpWizardStep3Elements.ByIds.ddlSecondaryBlendingType)
    , txtMinBlendingPercentage = this.findElementById(PageElements.CsnpWizardStep3Elements.ByIds.txtMinBlendingPercentage)
    , txtMaxBlendingPercentage = this.findElementById(PageElements.CsnpWizardStep3Elements.ByIds.txtMaxBlendingPercentage)
    , txtEndDate = this.findElementById(PageElements.CsnpWizardStep3Elements.ByIds.txtEndDate)
    , btnEdit = this.findElementById(PageElements.CsnpWizardStep3Elements.ByIds.btnEdit);

  //Select Country from Country dropdown 
  ddlCountry.ClickItem(inputData.Country);  
  //Enter Destination country
  txtDestination.SetText(inputData.Destination);
  //Enter Destination abbriviation
  txtDestAbbrv.SetText(inputData.DestinationAb);
  //Select Call Type
  ddlCallType.ClickItem(inputData.CallType);
  //Select Call Characteristics
  ddlCallChar.focus();
  ddlCallChar.ClickItem(inputData.CallChar);
  //Select primary Blending Type
  ddlPrimaryBlendingType.focus();
  ddlPrimaryBlendingType.ClickItem(inputData.PrimaryBlending);
  //Select Secondary Blending Type
  ddlSecondaryBlendingType.focus();
  ddlSecondaryBlendingType.ClickItem(inputData.SecondaryBlending);
  //Enter Minimum Blending Data
  txtMinBlendingPercentage.focus();
  txtMinBlendingPercentage.SetText(inputData.MinBlendingPercentage);
  //Enter Maximum Blending Data
  txtMaxBlendingPercentage.focus();
  txtMaxBlendingPercentage.SetText(inputData.MaxBlendingPercentage);
  //Enter End Date Data
  txtEndDate.focus();
  txtEndDate.SetText(inputData.EndDate);
  //Clicking on Edit button 
  btnEdit.HoverMouse();
  btnEdit.Click();
  
  this.waitForPageReady();
  
  //Selecting source destinations
  var ddlSrcDestID1 = this.findElementById(PageElements.CsnpWizardStep3Elements.ByIds.ddlSrcDestID1);
  ddlSrcDestID1.DblClickItem(inputData.SrcDestID1);
  ddlSrcDestID1.DblClickItem(inputData.SrcDestID2);
  ddlSrcDestID1.DblClickItem(inputData.SrcDestID3);
  ddlSrcDestID1.DblClickItem(inputData.SrcDestID4);

  //Moving to Next Step
  var btnNextStep = this.findElementById(PageElements.CsnpWizardStep3Elements.ByIds.btnNextStep);
  btnNextStep.Click();

  this.waitForPageReady();

  //Save the changes 
  var btnSubmit = this.findElementById(PageElements.CsnpWizardStep3Elements.ByIds.btnSubmit);
  btnSubmit.Click();
  this.page.Alert.Button("OK").Click();

  //Move to final step of selecting destination mapping 
  var btnNext = this.findElementById(PageElements.CsnpWizardStep3Elements.ByIds.btnNext);
  btnNext.Click();

  // Todo: remove this delay
  this.waitForPageReady();
  Delay(10000); 

  var btnFinalSubmit = this.findElementById(PageElements.CsnpWizardStep3Elements.ByIds.btnFinalSubmit);
  btnFinalSubmit.Click();
}