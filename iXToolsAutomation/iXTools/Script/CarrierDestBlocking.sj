//USEUNIT Page
//USEUNIT PageElements

var carrierDestBlocking = function(browser, page){
  Page.PageBase.call(this, page);
  this.browser = browser;
}

carrierDestBlocking.prototype = new Page.PageBase();
carrierDestBlocking.prototype.constructor = carrierDestBlocking;

carrierDestBlocking.prototype.navigateCarrierDestinationBlocking = function(){
  try{
    this.waitForFrameReady();
    var topDestinationMenu = this.findElementById(PageElements.ixConnectElements.ByIds.topDestinationMenu, 30000);
    topDestinationMenu.Click();
    this.browser.getDestinationCarrierDestBlockingItemLink().Click();
  }
  catch (ex){
    Log.Error(ex.description);
  }
};

carrierDestBlocking.prototype.verifyCarrierDestinationBlocking = function(carrierDestParamValue){ 
  try{
    this.waitForFrameReady();
    var result;
    this.navigateCarrierDestinationBlocking();
    this.waitForFrameReady();
    if(carrierDestParamValue===0)
    {
      var alert = this.browser.getCarrierDestBlockingAlert();
      result = alert.AName;
      this.page.Alert.Button("OK").Click();
    }
    else
    {
      var titleCarrierDestBlock = this.findElementById(PageElements.CarrierDestBlock.ByIds.titleCarrierDestBlock)
      result = titleCarrierDestBlock.contentText;
    }
    return result;
  }
  catch (ex){
    Log.Error(ex.description);
  }
};

carrierDestBlocking.prototype.CarrierDestBlockPageContent = function(){
  try{
    this.waitForFrameReady();
    this.navigateCarrierDestinationBlocking();

     var tabCarrierBlocking = this.findElementById(PageElements.CarrierDestBlock.ByIds.tabCarrierBlocking,30000)
      , tabWorkOrder = Common.FindChildElementByText(tabCarrierBlocking, PageElements.CarrierDestBlock.ByText.tabWorkOrders)
      , tabBlockedDest = Common.FindChildElementByText(tabCarrierBlocking, PageElements.CarrierDestBlock.ByText.tabBlockedDestinations);
    return {
      tab1: tabWorkOrder.contentText,
      tab2: tabBlockedDest.contentText
    };
  }
  catch (ex){
    Log.Error(ex.description);
  }
};

carrierDestBlocking.prototype.WorkOrderTabFilters = function(){
  try{
    this.navigateCarrierDestinationBlocking();	
    this.waitForFrameReady();
    var txtCarriers = this.findElementByProperty("aria-owns", "Carriers_taglist*", "input");
    var txtWorkOrderType =  this.findElementByProperty("aria-owns", "WorkOrderType_taglist*", "input");
    var txtWorkOrder_taglist =  this.findElementByProperty("aria-owns", "WorkOrder_taglist*", "input");
    var txtWorkOrderBeginDate =  this.findElementByProperty("aria-owns", "WorkOrderBeginDate_dateview*", "input");
    var txtWorkOrderEndDate =  this.findElementByProperty("aria-owns", "WorkOrderEndDate_dateview*", "input");
    var txtworkflowStatus =  this.findElementByProperty("aria-owns", "workflowStatus_taglist*", "input");
    var txtCountry =  this.findElementByProperty("aria-owns", "Country_taglist*", "input");
    var txtRoutingDestination =  this.findElementByProperty("aria-owns", "RoutingDestination_taglist*", "input");
    var result = new Array();
    result.push(txtCarriers.Exists);
    result.push(txtWorkOrderType.Exists);
    result.push(txtWorkOrder_taglist.Exists);
    result.push(txtWorkOrderBeginDate.Exists);
    result.push(txtWorkOrderEndDate.Exists);
    result.push(txtworkflowStatus.Exists);
    result.push(txtCountry.Exists);
    result.push(txtRoutingDestination.Exists);
    return result;
  }
  catch (ex){
    Log.Error(ex.description);
  }
};

carrierDestBlocking.prototype.WorkOrderTabGrid = function(){
  try{ 
    this.navigateCarrierDestinationBlocking();	
    this.waitForFrameReady();
    var gridWorkOrder = this.findElementById(PageElements.CarrierDestBlock.ByIds.divCarrierBlockingWorkOrdersGrd)
    var workOrderGridHeader = Common.ReadTable(gridWorkOrder,"thead");
    //return header array
    return workOrderGridHeader;
  }
  catch (ex){
    Log.Error(ex.description);
  }
};

carrierDestBlocking.prototype.createNewWorkOrder = function(testData){
  try{
    this.navigateCarrierDestinationBlocking();	
    this.waitForFrameReady();
    var btnCreateWorkOrder = this.findElementById(PageElements.CarrierDestBlock.ByIds.btnCreateWorkOrder);
    btnCreateWorkOrder.Click();
    var txtNewWorkOrderCarriers = this.findElementById(PageElements.CarrierDestBlock.ByIds.txtNewWorkOrderCarriers);
    txtNewWorkOrderCarriers.Keys(testData.newWorkOrderCarrier);
    var NewWorkOrderCarrierList = this.findElementById(PageElements.CarrierDestBlock.ByIds.NewWorkOrderCarrierList);
    NewWorkOrderCarrierList.Click(); 
  
    var ddlWorkOrderType = this.findElementByProperty("aria-owns", "newWorkOrderWorkOrderType_listbox", "span");
    ddlWorkOrderType.Click();

    var ddlWorkOrderType_listbox = this.findElementById(PageElements.CarrierDestBlock.ByIds.ddlWorkOrderType_listbox);
    var newWorkOrderTypeBlock = Common.FindChildElementByText(ddlWorkOrderType_listbox, testData.newWorkOrderTypeBlock)
    newWorkOrderTypeBlock.Click();
    Delay(10000);
    var listFrom_destinationMS = this.findElementById(PageElements.CarrierDestBlock.ByIds.listFrom_destinationMS);
    //listFrom_destinationMS.ClickItem(testData.newWorkOrderDest);
    listFrom_destinationMS.ClickItem(5);
    var btnMoveDest_destinationMS = this.findElementById(PageElements.CarrierDestBlock.ByIds.btnMoveDest_destinationMS);
    btnMoveDest_destinationMS.click();
  
    var btnSaveNewWorkOrder = this.findElementById(PageElements.CarrierDestBlock.ByIds.btnSaveNewWorkOrder);
    btnSaveNewWorkOrder.Click();
  
    var messagingPopup = this.findElementById(PageElements.CarrierDestBlock.ByIds.messagingPopup);
    var msg = messagingPopup.contentText;
  
    var btnMsgOk = this.findElementById(PageElements.CarrierDestBlock.ByIds.btnMsgOk);
    btnMsgOk.Click();
  
    return msg;
  }
  catch (ex){
    Log.Error(ex.description);
  }
};

carrierDestBlocking.prototype.createNewWorkOrderValidation = function(testData){ 
  try{
    this.createNewWorkOrder(testData);
    var btnCreateWorkOrder = this.findElementById(PageElements.CarrierDestBlock.ByIds.btnCreateWorkOrder);
    btnCreateWorkOrder.Click();
    var txtNewWorkOrderCarriers = this.findElementById(PageElements.CarrierDestBlock.ByIds.txtNewWorkOrderCarriers);
    txtNewWorkOrderCarriers.Keys(testData.newWorkOrderCarrier);
    var NewWorkOrderCarrierList = this.findElementById(PageElements.CarrierDestBlock.ByIds.NewWorkOrderCarrierList);
    NewWorkOrderCarrierList.Click(); 
  
    var ddlWorkOrderType = this.findElementByProperty("aria-owns", "newWorkOrderWorkOrderType_listbox", "span");//.QuerySelector(CSSSelector);
    ddlWorkOrderType.Click();

    var ddlWorkOrderType_listbox = this.findElementById(PageElements.CarrierDestBlock.ByIds.ddlWorkOrderType_listbox);
    var newWorkOrderTypeBlock = Common.FindChildElementByText(ddlWorkOrderType_listbox, testData.newWorkOrderTypeBlock)
    newWorkOrderTypeBlock.Click();
    Delay(10000);
    var listFrom_destinationMS = this.findElementById(PageElements.CarrierDestBlock.ByIds.listFrom_destinationMS);
    var btnCancelNewWorkOrder = this.findElementById(PageElements.CarrierDestBlock.ByIds.btnCancelNewWorkOrder);
    btnCancelNewWorkOrder.Click();
    return listFrom_destinationMS;
  }
  catch (ex){
    Log.Error(ex.description);
  }  
};

carrierDestBlocking.prototype.createNewWorkOrderValidationPass = function(testData){
  try{ 
    var btnCreateWorkOrder = this.findElementById(PageElements.CarrierDestBlock.ByIds.btnCreateWorkOrder);
    btnCreateWorkOrder.Click();
    var txtNewWorkOrderCarriers = this.findElementById(PageElements.CarrierDestBlock.ByIds.txtNewWorkOrderCarriers);
    txtNewWorkOrderCarriers.Keys(testData.newWorkOrderCarrier);
    var NewWorkOrderCarrierList = this.findElementById(PageElements.CarrierDestBlock.ByIds.NewWorkOrderCarrierList);
    NewWorkOrderCarrierList.Click(); 
  
    var ddlWorkOrderType = this.findElementByProperty("aria-owns", "newWorkOrderWorkOrderType_listbox", "span");//.QuerySelector(CSSSelector);
    ddlWorkOrderType.Click();

    var ddlWorkOrderType_listbox = this.findElementById(PageElements.CarrierDestBlock.ByIds.ddlWorkOrderType_listbox);
    var newWorkOrderTypeBlock = Common.FindChildElementByText(ddlWorkOrderType_listbox, testData.newWorkOrderTypeUnBlock)
    newWorkOrderTypeBlock.Click();
    Delay(10000);
    var listFrom_destinationMS = this.findElementById(PageElements.CarrierDestBlock.ByIds.listFrom_destinationMS);
    var btnCancelNewWorkOrder = this.findElementById(PageElements.CarrierDestBlock.ByIds.btnCancelNewWorkOrder);
    btnCancelNewWorkOrder.Click();
    return listFrom_destinationMS;
  }
  catch (ex){
    Log.Error(ex.description);
  }
};

carrierDestBlocking.prototype.searchWorkOrder = function(testData){
  try{
    var txtWorkOrder = this.findElementByProperty("aria-owns", "WorkOrder_taglist*", "input");
    txtWorkOrder.Click();
    txtWorkOrder.Keys(testData.paramSearchWorkOrder);
    var WorkOrder_listbox = this.findElementById(PageElements.CarrierDestBlock.ByIds.WorkOrder_listbox);
    WorkOrder_listbox.Click();
  
    var divWorkflowStatus = this.findElementByProperty("aria-owns", "workflowStatus_taglist*", "input");
    divWorkflowStatus.Keys(testData.paramSearchWorkOrderStatus);
  
    var workflowStatus_listbox = this.findElementById(PageElements.CarrierDestBlock.ByIds.workflowStatus_listbox);
    workflowStatus_listbox.Click();
  
    var btnSearchCarrierBlocking = this.findElementById(PageElements.CarrierDestBlock.ByIds.btnSearchCarrierBlocking);
    btnSearchCarrierBlocking.Click();
  
    var gridWorkOrder = this.findElementById(PageElements.CarrierDestBlock.ByIds.divCarrierBlockingWorkOrdersGrd)
    var workOrderGridData = Common.ReadTable(gridWorkOrder,"table");
    return workOrderGridData;
  }
  catch (ex){
    Log.Error(ex.description);
  }
};

carrierDestBlocking.prototype.exportWorkOrder = function(testData){ 
  try{
    var btnExportToExcelWorkOrders = this.findElementById(PageElements.CarrierDestBlock.ByIds.btnExportToExcelWorkOrders);
    btnExportToExcelWorkOrders.Click();
  
    //var messagingPopup = this.findElementById(PageElements.CarrierDestBlock.ByIds.messagingPopup);
    var messagingPopup = this.findElementByProperty("class","messaging-popup-content","div");
    var msg = messagingPopup.contentText;
  
    var btnMsgOk = this.findElementById(PageElements.CarrierDestBlock.ByIds.btnMsgOk);
    btnMsgOk.Click();
  }
  catch (ex){
    Log.Error(ex.description);
  }
};

carrierDestBlocking.prototype.navigateBlockedDestinationTab = function(){ 
  try{
    this.waitForFrameReady();
    this.navigateCarrierDestinationBlocking();
    this.waitForFrameReady();
     var tabCarrierBlocking = this.findElementById(PageElements.CarrierDestBlock.ByIds.tabCarrierBlocking)
      , tabWorkOrder = Common.FindChildElementByText(tabCarrierBlocking, PageElements.CarrierDestBlock.ByText.tabWorkOrders)
      , tabBlockedDest = Common.FindChildElementByText(tabCarrierBlocking, PageElements.CarrierDestBlock.ByText.tabBlockedDestinations);
    tabBlockedDest.Click();
  }
  catch (ex){
    Log.Error(ex.description);
  }
};

carrierDestBlocking.prototype.BlockedDestinationTabFilters = function(){
  try{  
    this.navigateBlockedDestinationTab();
    var txtBlockedDestCarriers = this.findElementByProperty("aria-owns", "BlockedDestCarriers_taglist*", "input");
    var txtBlockedDestCountry =  this.findElementByProperty("aria-owns", "BlockedDestCountry_taglist*", "input");
    var txtBlockedDestCat =  this.findElementByProperty("aria-owns", "BlockedDestCat_taglist*", "input");
    var txtBlockedDestGroup =  this.findElementByProperty("aria-owns", "BlockedDestGroup_taglist*", "input");
    var txtBlockedDestSelectDate =  this.findElementByProperty("aria-owns", "BlockedDestSelectDate_dateview*", "input");
    var result = new Array();
    result.push(txtBlockedDestCarriers.Exists);
    result.push(txtBlockedDestCarriers.Exists);
    result.push(txtBlockedDestCat.Exists);
    result.push(txtBlockedDestGroup.Exists);
    result.push(txtBlockedDestSelectDate.Exists);
    return result;
  }
  catch (ex){
    Log.Error(ex.description);
  }
};
  
carrierDestBlocking.prototype.BlockedDestinationTabGrid = function(){
  try{ 
    this.navigateBlockedDestinationTab();
    var divBlockedDestinations = this.findElementById(PageElements.CarrierDestBlock.ByIds.divBlockedDestinations)
    var workOrderGridHeader = Common.ReadTable(divBlockedDestinations,"thead");
    //return header array
    return workOrderGridHeader;
  }
  catch (ex){
    Log.Error(ex.description);
  }
};

carrierDestBlocking.prototype.BlockedDestinationExport = function(){
  try{
    this.navigateBlockedDestinationTab();
    var btnExportToExcelBlockedDestinations = this.findElementById(PageElements.CarrierDestBlock.ByIds.btnExportToExcelBlockedDestinations);
    btnExportToExcelBlockedDestinations.Click();
  
    var messagingPopup = this.findElementById(PageElements.CarrierDestBlock.ByIds.messagingPopup);
    //var messagingPopup = this.findElementByProperty("class", "messaging-popup-content", "div", 3000);
    var msg = messagingPopup.contentText;
  
    var btnMsgOk = this.findElementById(PageElements.CarrierDestBlock.ByIds.btnMsgOk);
    btnMsgOk.Click();
  
    return msg;
  }
  catch (ex){
    Log.Error(ex.description);
  }
};

carrierDestBlocking.prototype.BlockWorkflow = function(testData){ 
  try{
    this.waitForFrameReady();
    this.navigateCarrierDestinationBlocking();
    var txtWorkOrder = this.findElementByProperty("aria-owns", "WorkOrder_taglist*", "input");
    txtWorkOrder.Click();
    txtWorkOrder.Keys(testData.paramSearchWorkOrder);
    var WorkOrder_listbox = this.findElementById(PageElements.CarrierDestBlock.ByIds.WorkOrder_listbox);
    WorkOrder_listbox.Click();
  
    var divWorkflowStatus = this.findElementByProperty("aria-owns", "workflowStatus_taglist*", "input");
    divWorkflowStatus.Keys(testData.paramSearchWorkOrderStatus);
  
    var workflowStatus_listbox = this.findElementById(PageElements.CarrierDestBlock.ByIds.workflowStatus_listbox);
    workflowStatus_listbox.Click();
  
    var btnSearchCarrierBlocking = this.findElementById(PageElements.CarrierDestBlock.ByIds.btnSearchCarrierBlocking);
    btnSearchCarrierBlocking.Click();
  
    var divWorkOrdersGrd = this.findElementById(PageElements.CarrierDestBlock.ByIds.divCarrierBlockingWorkOrdersGrd);
    var StatusID_listbox = Common.FindChildElementByText(divWorkOrdersGrd, "Pending*");
    StatusID_listbox.Click();
  
    var colStatusID_listbox = this.findElementById(PageElements.CarrierDestBlock.ByIds.colStatusID_listbox);
  
    var itemApprove = Common.FindChildElementByText(colStatusID_listbox, "Approved")
    itemApprove.Click();
  
    var divWorkOrdersGrd = this.findElementById(PageElements.CarrierDestBlock.ByIds.divCarrierBlockingWorkOrdersGrd);
    var btnSaveChanges = Common.FindChildElementByText(divWorkOrdersGrd, "Save changes");
    btnSaveChanges.Click();
    var btnMsgOk = this.findElementById(PageElements.CarrierDestBlock.ByIds.btnMsgOk);
    btnMsgOk.Click();
  }
  catch (ex){
    Log.Error(ex.description);
  }
};

carrierDestBlocking.prototype.navigateToHomePage = function(){
  try{
    var menuHome = this.findElementById(PageElements.CarrierDestBlock.ByIds.topHomeMenu);
    menuHome.Click();
  }
  catch (ex){
    Log.Error(ex.description);
  }
}