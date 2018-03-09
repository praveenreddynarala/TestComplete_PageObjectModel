//USEUNIT Browser
//USEUNIT CarrierDestinationBlock
//USEUNIT Common

function CarrierDesitnationBlockingTest(){
  var browser = new Browser.Browser("iexplore");
    Common.runApplicaion(browser);
  CarrierDestinationBlock.VerifyNewConfigForCarrierDesitnationBlocking(browser); 
  CarrierDestinationBlock.VerifyRolesForDesitnationBlocking(browser); 
  CarrierDestinationBlock.VerifySubmenu_CarrierDestinationBlocking(browser);
  CarrierDestinationBlock.VerifyWorkOrdersTab(browser);
  CarrierDestinationBlock.VerifyWorkOrderGrid(browser);
  CarrierDestinationBlock.VerifyCreateNewWorkOrder(browser);
  CarrierDestinationBlock.VerifyWorkOrderValidation_1(browser);
  CarrierDestinationBlock.VerifyWorkOrderValidation_2(browser);
  CarrierDestinationBlock.VerifySearchWorkOrder(browser);
  //CarrierDestinationBlock.VerifyExportWorkOrder(browser);
  CarrierDestinationBlock.VerifyBlockedDestinationTab(browser);
  CarrierDestinationBlock.VerifyBlockedDestinationGrid(browser);
  CarrierDestinationBlock.VerifyBlockedDestinationExport(browser);
  CarrierDestinationBlock.VerifyBlockWorkflow(browser);
  CarrierDestinationBlock.VerifyAlert(browser);
}