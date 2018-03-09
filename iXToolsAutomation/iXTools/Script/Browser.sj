var defaultPageWaitTime = 15000;

var Browser = function(name){
  this.browserName = name;
};

Browser.prototype = {
  constructor: Browser,
    
  launchApplication: function(url){
    if(this.browserName === "iexplore"){
      if(Sys.WaitProcess("iexplore").Exists){
        Sys.Process("iexplore").Close();
      }
      if(Sys.WaitProcess("iexplore").Exists){
        Sys.Process("iexplore").Terminate();
      } 
      Browsers.Item(btIExplorer).Run(url);
      Sys.Process(this.browserName).BrowserWindow(0).Maximize();
    }
  },
  
  startApplication: function(url){
    if(this.browserName === "iexplore"){
      Browsers.Item(btIExplorer).Run(url);
    }
    Sys.Process(this.browserName).BrowserWindow(0).Maximize();
  },
  
  getPage: function(url, waitTime){
    if(!waitTime){
      waitTime = defaultPageWaitTime;
    }
    return Sys.Browser(this.browserName).WaitPage(url, waitTime);
  },
  
  getLoginPasswordTextBox: function(){
    return Sys.Process(this.browserName).Window("#32770", "Windows Security").UIAObject("Windows_Security").Window("CtrlNotifySink", "", 7).Window("Edit", "", 1).MSAAObject("editable_text_Password");
  },
  
  getLoginSubmitButton: function(){
    return Sys.Process(this.browserName).Window("#32770", "Windows Security").UIAObject("Windows_Security").Window("CtrlNotifySink", "", 3).Window("Button", "OK", 1).MSAAObject("btn_OK");
  },
  
  getAlertPopupLink: function(){
    return Sys.Process(this.browserName).PagePopup(0).MSAAObject("pane").MSAAObject("editable_text_Alerts");
  },
  
  getLeaveThisPageDialog: function(){
    return Sys.Process(this.browserName).Window("#32770", "Windows Internet Explorer").UIAObject("Windows_Internet_Explorer").Window("CtrlNotifySink", "", 7).Window("Button", "&Leave this page", 1).MSAAObject("btn_Leave_this_page");
  },
  
  getSaveButtonForDownload: function(){
    return Sys.Browser(this.browserName).BrowserWindow(1).Window("Frame Notification Bar", "", 1).Window("DirectUIHWND", "", 1).MSAAObject("split_button_Save");
  },
  
  getCloseDownloadNotificationWindow: function(){
    return Sys.Browser(this.browserName).BrowserWindow(1).Window("Frame Notification Bar", "", 1).Window("DirectUIHWND", "", 1).MSAAObject("tb_Notification").MSAAObject("btn_Close");
  },
  
  getOpenFileDialog: function(filePath){
    return Sys.Browser(this.browserName).Window("#32770", "Choose File to Upload", 1).OpenFile(filePath);
  },
  
  getPageByIndex: function(url, index){
    return Sys.Browser(this.browserName).Page(url, index);
  },
  
  getAdminProfilePopupItemLink: function(){
    return Sys.Browser(this.browserName).PagePopup(0).Panel(0).Panel(5).TextNode(0);
  },
  getAdminConfigManagementItemLink: function(){
    return Sys.Browser(this.browserName).PagePopup(0).Panel(0).Panel(0).TextNode(0);
  },
  
  getDestinationNumberPlanPopupItemLink: function(){
    return Sys.Browser(this.browserName).PagePopup(0).Panel(0).Panel(6).TextNode(0);
  },
  
  getDestinationCarrierDestBlockingItemLink: function(){
    return Sys.Browser(this.browserName).PagePopup(0).Panel(0).Panel(14).TextNode(0);
  },
  
  getRegisterBusinessAlertsItem: function(){
    return Sys.Browser(this.browserName).PagePopup(0).Panel(0).Panel(4).TextNode(0);
  },
  
  getRegisterNotificationItem: function(){
    return Sys.Browser(this.browserName).PagePopup(0).Panel(0).Panel(12).TextNode(0);
  },
  
  getOperationStatementItemLink: function(){
    return Sys.Browser(this.browserName).PagePopup(0).Panel(0).Panel(0).TextNode(0);
  },
  getOperationAdjustmentFolderItemLink: function(){
    return Sys.Browser(this.browserName).PagePopup(0).Panel(0).Panel(1).TextNode(0);
  },
  getConfirmationMesage: function(){
    return Sys.Process(this.browserName).Window("#32770", "Message from webpage").Window("Button", "OK", 1).MSAAObject("btn_OK");
  },
  getCarrierDestBlockingAlert: function(){
    return Sys.Process(this.browserName).Window("#32770", "Message from webpage" ).Window("Static", "Carrier Destination Blocking is disabled", 2).MSAAObject("text_Carrier_Destination_Blocking_is_disabled");
  }
}