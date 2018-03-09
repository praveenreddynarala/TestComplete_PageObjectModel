//USEUNIT Browser
//USEUNIT CustomerSpecificNumberPlan

function Create_CSNP(){
  var browser = new Browser.Browser("iexplore");
  Common.runApplicaion(browser);
  CustomerSpecificNumberPlan.verifyUserProfileRole(browser);
  Common.runApplicaion(browser);  
  CustomerSpecificNumberPlan.newCSNP(browser);
}

function Export_CSNP(){
  var browser = new Browser.Browser("iexplore");
  Common.runApplicaion(browser);
  CustomerSpecificNumberPlan.exportCSNP(browser);  
}

function Import_CSNP(){
  var browser = new Browser.Browser("iexplore");
  Common.runApplicaion(browser);
  CustomerSpecificNumberPlan.importCSNPWithValidDetails(browser);
  CustomerSpecificNumberPlan.importCSNPWithInvalidDetails(browser);
}
