//USEUNIT Page
//USEUNIT PageElements

var DefineCSNPPage = function(page){
  Page.PageBase.call(this, page);
};

DefineCSNPPage.prototype = new Page.PageBase();
DefineCSNPPage.prototype.constructor = DefineCSNPPage;

DefineCSNPPage.prototype.selectGroupingofReferenceDestination = function(){
  var ddlCSNPType = this.findElementById(PageElements.DefineCsnpElements.ByIds.ddlCSNPType);
  ddlCSNPType.ClickItem("Grouping of Reference*");

  var btnNext = this.findElementById(PageElements.DefineCsnpElements.ByIds.btnNext);
  btnNext.Click();
};