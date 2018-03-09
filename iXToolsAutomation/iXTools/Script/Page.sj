//USEUNIT Common

var PageBase = function(page){
  this.page = page;
};

PageBase.prototype = {
  constructor: PageBase,
  
  waitForPageReady: function(delay){
    var start, end;
    if(!delay){
      delay = Common.defaultDelay;
    }
    this.page.Wait(delay);
  },
  
  findElementByProperty: function(property, value, tag, delay){
    return Common.FindElementByProperty(this.page, property, value, tag, delay)
  },
  
  findElementById: function(id, delay){
    return Common.FindElementById(this.page, id, delay);
  },
  
  waitForFrameReady: function(delay){
    Common.WaitForFrameReady(this.page, delay);
  },
  
  waitForLoadingSpiiner: function(id,delay){
    return Common.WaitForFrameReady(this.page,id,delay);
  }
};
