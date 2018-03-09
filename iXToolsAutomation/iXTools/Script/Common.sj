//USEUNIT TestConfig

var defaultDelay = 15000;

/**
 * This method checks opens the application and navigate to home page of iXtool.
 * @param {object} browser object.
 */
 
function runApplicaion(browser){
  try{
    //browser.startApplication(TestConfig.PageUrls.startUrl);
    browser.launchApplication(TestConfig.PageUrls.startUrl);
    var page = browser.getPage(TestConfig.PageUrls.homePageUrl);
  
    //override cert error.
    var obj = page.NativeWebObject.Find("id", "overridelink");
    if(obj.Exists){
      obj.Click();
    }
    browser.getLoginPasswordTextBox().Keys("Enosis123");
    
    browser.getLoginSubmitButton().Click();
    // Wait for page to be ready.
    page.Wait();
  }
  catch (ex){
    Log.Error(ex.description);
  }  
}

/**
 * Read Test Data from an Excel File
 * @param {string} filePath - Excel File Path
 */
function ReadDataFromExcel(filePath){
  var Excel = Sys.OleObject("Excel.Application");
  Excel.Workbooks.Open(filePath);
  var RowCount = Excel.ActiveSheet.UsedRange.Rows.Count;
  var ColumnCount = Excel.ActiveSheet.UsedRange.Columns.Count;
  var data = {};
    
  for (var i = 1; i <= RowCount; i++)
  {
  var s;
    var index = VarToString(Excel.Cells(i, 1));
    var value = VarToString(Excel.Cells(i, 2)); 
    data[index] = value;
//    for (var j = 1; j <= ColumnCount; j++)
//    {
//      s += (VarToString(Excel.Cells(i, j)) + "\r\n");
//    }
    //Log.Message("Row: " + i, s);
  }
  return data;
  Excel.Quit();
}
 
/**
 * Finds a DOM element from a page by its property, value and tag.  
 * @param {object} page -  The page where the element is searched.
 * @param {string} property - DOM elements property.
 * @param {string} value - DOM elements value. 
 * @param {string} tag - DOM elements tag.
 * @param {number} delay - Maximum time to find an element (optional).
 * @returns {object} Element object.
 */
 
function FindElementByProperty(page, property, value, tag, delay){
  var element = null
  , timeElapsed = 0;
  // If delay is not provided then it will use default delay.
  try{ 
    if(!delay){
      delay = defaultDelay; // Default delay is configurable from the top.
    }
    // Wait 100 MS then look for an element until the element exists or delay time is reached.  
    do{
      aqUtils.Delay(100);
      element = page.NativeWebObject.Find(property, value, tag);
      timeElapsed = timeElapsed + 100;
    } while (!element.Exists && timeElapsed < delay)
     
    return element;
  }
  catch (ex){
    Log.Error(ex.description);
  }
}

/**
 * Finds an DOM element from a page by its ID.  
 * @param {object} page -  The page where the element is searched.
 * @param {string} id - DOM elements ID.
 * @param {number} delay - Maximum time to find an element (optional).
 * @return {object} Element object.
 */
 
function FindElementById(page, id, delay){
  var element = null
  , timeElapsed = 0;
  try{
    // If delay is not provided then it will use default delay. 
    if(!delay){
      delay = defaultDelay;
    }
    // Wait 100 MS then look for an element until the element exists or delay time is reached.
    do{
      aqUtils.Delay(100);
      element = page.NativeWebObject.Find("id", id);
      timeElapsed = timeElapsed + 100;
    } while (!element.Exists && timeElapsed < delay)
    
    return element;
  }
  catch (ex){
    Log.Error(ex.description);
  }
}

/**
 * Wait until the loading spinner is visible.  
 * @param {object} page -  The page where the element is searched.
 * @param {string} id - DOM elements ID.
 * @param {number} delay - Maximum time to find an element (optional).
 * @return {object} Element object.
 */
function WaitForLoadingSpiiner(page, id, delay){
  var element = null
  , timeElapsed = 0;
  try{
    // If delay is not provided then it will use default delay. 
    if(!delay){
      delay = defaultDelay;
    }
    // Wait 100 MS then look for an element until the element exists or delay time is reached.
    do{
      aqUtils.Delay(100);
      element = page.NativeWebObject.Find("id", id);
      timeElapsed = timeElapsed + 100;
    } while (element.Visible && timeElapsed < delay)    
    return element;
  }
  catch (ex){
    Log.Error(ex.description);
  }
}

/**
 * Find Element by its text.  
 * @param {object} parent -  The parent of the element is searched.
 * @param {string} text - Content text of the element.
 * @param {number} Maximum time to find an element (optional).
 * @return {object} Element object
 */
 
function FindChildElementByText(parent, text, delay){
  var element = null
  , timeElapsed = 0;
  try{
    // If delay is not provided then it will use default delay.
    if(!delay){
      delay = defaultDelay;
    }
    // Wait 100 MS then look for an element until the element exists or delay time is reached.
    do{
      aqUtils.Delay(100);
      element = parent.FindChild("contentText", text, 10);
      timeElapsed = timeElapsed + 100;
    } while (!element.Exists && !element.Visible && timeElapsed < delay)  
    return element;
  }
  catch (ex){
    Log.Error(ex.description);
  }
}

/**
 * Read a HTML table data from a page.  
 * @param {object} parent -  The parent of the element is searched.
 * @param {string} tagName - specifify the expected table content (thead of tbody).
 * @return {string array} Array of string
 */

function ReadTable(parent, tagName)
{
  try{
    var table = parent.FindChild("tagName", tagName, 10);
    var items = new Array();
    if (table.Exists){
      // Goes through the rows and cells of the table
      for (var i = 0; i < table.rows.length; i++){
        for (var j = 0; j < table.rows.item(i).cells.length; j++){
  		    items.push(table.rows.item(i).cells.item(j).innerText);
  	    }
      }
    }
    else
      Log.Warning("The table was not found");
    return items;
  }
  catch (ex){
    Log.Error(ex.description);
  }
}


/**
 * Wait for all frames are ready to perform operation.  
 * @param {object} page -  The page where the element is searched.
 * @param {number} Maximum time to find an element (optional).
 */
function WaitForFrameReady(page, delay){
  if(!delay){
    delay = defaultDelay;
  }
  try{  
    var frames = page.FindAllChildren("ObjectType", "Frame", 5, true);
    frames = (new VBArray(frames)).toArray();
    var stopTime = GetTickCount() + delay;
    while (GetTickCount() < stopTime){
      if (frames.length > 0)
      {
        var waitFrame = false;
        for (var i = 0; i < frames.length; i++)
        {
          var frame = frames[i];
          if (frame.Exists && (frame.contentDocument.readyState != "complete"))
          {
            waitFrame = true;
            break;
          }
        }
        if (! waitFrame)
          break;
        aqUtils.Delay(100);
      }
    }
  }
  catch (ex){
    Log.Error(ex.description);
  }
}