var HostName = "hqqa80vm31";
var Http = "https";
var BaseUrl = Http + "://" + HostName + "/";

var PageUrls = {
  startUrl: BaseUrl + "iXHome",
  homePageUrl: BaseUrl + "iXHome*",
  adminPageUrl: BaseUrl + "iXAdmin/lgx_Engine/lgx_Frame.aspx*",
  iXConnectPageUrl: BaseUrl + "iXConnect/lgx_Engine/lgx_Frame.aspx*",
  iXControlPageUrl: BaseUrl + "iXControl/lgx_Engine/lgx_Frame.aspx*",
  iXBillPageUrl: BaseUrl + "iXBill/lgx_Engine/lgx_Frame.aspx*",
  iXAlertPageUrl: BaseUrl + "ixAlert/lgx_Engine/lgx_Frame.aspx*",
  defineCSNPTypeUrl: BaseUrl + "iXConnect/_Scripts/DefineCSNPType.aspx*",
  lgxDetailPageUrl: BaseUrl + "IXCONNECT/lgx_Engine/lgx_Detail.aspx*",
  newCsnpWizardUrl: BaseUrl + "IXCONNECT/lgx_Engine/lgx_Detail.aspx?Action=Update",
  createNewCsnpStepUrl: BaseUrl + "IXCONNECT/lgx_Engine/lgx_Detail.aspx?*Title=Create a new Customer Specific Number Plan*",
  selectSourceNumberPlan: BaseUrl + "IXCONNECT/lgx_Engine/lgx_Detail.aspx?*Title=Select a Source Number Plan*",
  csnpWizardStep3Url: BaseUrl + "iXConnect/_Scripts/CSNPWizard_Step3.aspx*",
  addServiceToCountryUrl: BaseUrl + "IXCONNECT/lgx_Engine/lgx_Detail.aspx*Title=Add Services to Countries*",
  pgRatingUrl: BaseUrl + "IXCONNECT/lgx_Engine/lgx_Detail.aspx*Action=Update&Title=Select Rating Method*",
  pgRatingUrl1:BaseUrl + "IXCONNECT/lgx_Engine/lgx_Detail.aspx?Action=Update",
  detailPopupUrl: BaseUrl + "IXCONNECT/lgx_Engine/lgx_Detail.aspx?Action=Insert&lgx_WindowID=DetailPopup*",
  fLookupUrl: BaseUrl + "IXCONNECT/lgx_Engine/lgx_List.aspx*lgx_WindowID=fLookup*",
  exportImportPageUrl: BaseUrl + "iXConnect/_Scripts/ExportImportBlendingRules.aspx*"
};

var Credential = {
  userName: 'etg\mahmudul.hasan',
  password: 'Enosis123'
};

var TestDataPath = {
  Excel: 'D:\\Mahmudul\\Telarix\\Sources\\TestData.xls'
};