//USEUNIT Browser
//USEUNIT MovingAdjustmentCharges
//USEUNIT Common

function MovingAdjustmentChargesTest()
{
  var browser = new Browser.Browser("iexplore");
  Common.runApplicaion(browser);
  MovingAdjustmentCharges.verifyAccessRegularStatement(browser);
  MovingAdjustmentCharges.verifyCreateAdjustmentStatement(browser);
  MovingAdjustmentCharges.verifyOpenTheAdjustmentStatement(browser);
  MovingAdjustmentCharges.verifyCreateAdjustmentFolder(browser);
  MovingAdjustmentCharges.verifyOpenAdjustmentFolder(browser);
  MovingAdjustmentCharges.verifyChangeAdjustmentFolderStatusUnderApproval(browser);
  MovingAdjustmentCharges.verifyChangeAdjustmentFolderStatusApproved(browser);
}
