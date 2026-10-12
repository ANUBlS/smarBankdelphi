unit bsdkdll;

interface

const
  BSDK_RESULT_BASE           = 0;
  BSDK_ERROR_INVALID_LICENSE = BSDK_RESULT_BASE - 12;

const
  BSDK_LICENSE_TYPE_FUTRONIC      = $00000001;
  BSDK_LICENSE_TYPE_SENTINEL      = $00000002;
  BSDK_LICENSE_TYPE_HARDWARE      = $00000004;
  BSDK_LICENSE_TYPE_SENTINEL_SHK  = $00000008;
  BSDK_LICENSE_TYPE_ALL           = $000000FF;

const
  Bsdk_Device_Type_Any                = $0000;
  Bsdk_Device_Type_Scanner_Any        = $0100;
  Bsdk_Device_Type_Scanner_Umatch     = $0101;
  Bsdk_Device_Type_Scanner_Upek       = $0102;
  Bsdk_Device_Type_Scanner_CrossMatch = $0103;

  function Bsdk_Destroy_Object(pObject : pointer): integer; stdcall; external 'bsdk6x.dll'
  //Function IDenium_Destroy_Object(pObject : pointer): integer; stdcall; external 'IDenium_SDK.dll'




  function Bsdk_License_Create(tLicenseTypes : integer): integer; stdcall; external 'bsdk6x.dll'
  //function IDenium_License_Create(tLicenseTypes : integer): integer; stdcall; external 'IDenium_SDK.dll'

  function Bsdk_License_Close(): Integer; stdcall; external 'bsdk6x.dll'
  //  function IDenium_License_Close(): Integer; stdcall; external 'IDenium_SDK.dll'

  function Bsdk_DeviceList_Create(var pDeviceList : pointer; tDeviceType: integer): integer; stdcall; external 'bsdk6x.dll'
    //function IDenium_DeviceList_Create(var pDeviceList : pointer; tDeviceType: integer): integer; stdcall; external 'IDenium_SDK.dll'


  function Bsdk_DeviceList_GetSize(pDeviceList : pointer): integer; stdcall; external 'bsdk6x.dll'
    // function IDenium_DeviceList_GetSize(pDeviceList : pointer): integer; stdcall; external 'IDenium_SDK.dll'

  function Bsdk_DeviceList_GetDeviceDescriptor(pDeviceList : pointer; iDeviceListIndex: integer): pointer; stdcall; external 'bsdk6x.dll'
    //function IDenium_DeviceList_GetDeviceDescriptor(pDeviceList : pointer; iDeviceListIndex: integer): pointer; stdcall; external 'IDenium_SDK.dll'


  function Bsdk_Scanner_Create(var pScanner : pointer; pDeviceDescriptorPtr: pointer): integer; stdcall; external 'bsdk6x.dll'

  function Bsdk_Scanner_AcquireImage(pScanner : pointer; var pImage: pointer): integer; stdcall; external 'bsdk6x.dll'

  function Bsdk_Image_Create(var pImage : pointer): integer; stdcall; external 'bsdk6x.dll'
  function Bsdk_Image_GetExpressQuality(pImage : pointer; speed : integer): integer; stdcall; external 'bsdk6x.dll'
  function Bsdk_Image_GetWSQSize(pImage : pointer; bitrate : single): integer; stdcall; external 'bsdk6x.dll'
  function Bsdk_Image_SaveToWSQ(pImage : pointer; bitrate : single; pWsqData : pointer; var size : integer): integer; stdcall; external 'bsdk6x.dll'
  function Bsdk_Image_LoadFromWSQ(pImage : pointer; pWsqData : pointer; var size : integer): integer; stdcall; external 'bsdk6x.dll'

  function Bsdk_ImageSet_Create(var pImageSet : pointer): Integer; stdcall; external 'bsdk6x.dll'
  function Bsdk_ImageSet_AddImage(pImageSet : pointer; pImage : pointer; iFinger : integer): integer; stdcall; external 'bsdk6x.dll'
  procedure Bsdk_ImageSet_Clear(pImageSet : pointer); stdcall; external 'bsdk6x.dll'

  function Bsdk_ImageProcessor_Create(var pProcessor : pointer; mathType: integer): integer; stdcall; external 'bsdk6x.dll'
  function Bsdk_ImageProcessor_CreateTemplateFromImageSet(pProcessor : pointer; pImageSet: pointer; var pTemplate : pointer): integer; stdcall; external 'bsdk6x.dll'

  function Bsdk_Template_Create(var pTemplate : pointer; mathType: integer): integer; stdcall; external 'bsdk6x.dll'
  function Bsdk_Template_Load(pTemplate : pointer; pStreamPos : pointer; tStreamSize : integer; var pTransfered : integer): integer; stdcall; external 'bsdk6x.dll'
  function Bsdk_Template_GetSize(pTemplate : pointer) : integer; stdcall; external 'bsdk6x.dll'
  function Bsdk_Template_Save(pTemplate : pointer; pStreamPos : pointer; tStreamSize : integer; var pTransfered : integer): integer; stdcall; external 'bsdk6x.dll'
  function Bsdk_Template_GetFingerCount(pTemplate : pointer): integer; stdcall; external 'bsdk6x.dll'
  function Bsdk_Template_GetFinger(pTemplate : pointer; i : integer): pointer; stdcall; external 'bsdk6x.dll'
  function Bsdk_Template_AddTemplate(pDstTemplate : pointer; pSrcTemplate : pointer; dopcode : integer): integer; stdcall; external 'bsdk6x.dll'
  function Bsdk_Template_DeleteFinger(pTemplate : pointer; index : integer): integer; stdcall; external 'bsdk6x.dll'

  function Bsdk_Finger_GetIndex(pFinger : pointer): integer; stdcall; external 'bsdk6x.dll'

  function Bsdk_TemplateSet_Create(var pTemplateSet : pointer; mathType: integer): integer; stdcall; external 'bsdk6x.dll'
  function Bsdk_TemplateSet_Add(pTemplateSet : pointer; templ: pointer; id : integer; number : string): integer; stdcall; external 'bsdk6x.dll'

  function Bsdk_IdentifyInfo_GetScore(pInfo : pointer): integer; stdcall; external 'bsdk6x.dll'
  function Bsdk_IdentifyInfo_GetId(pInfo : pointer): integer; stdcall; external 'bsdk6x.dll'
  function Bsdk_IdentifyInfo_GetNumber(pInfo : pointer): pchar; stdcall; external 'bsdk6x.dll'

  function Bsdk_IdentifyInfoSet_GetSize(pInfoSet : pointer): integer; stdcall; external 'bsdk6x.dll'
  function Bsdk_IdentifyInfoSet_GetItem(pInfoSet : pointer; index : integer): pointer; stdcall; external 'bsdk6x.dll'

  function Bsdk_Matcher_Create(var pMatcher : pointer; mathType: integer; threadCount : integer): integer; stdcall; external 'bsdk6x.dll'
  function Bsdk_Matcher_Compare(pMatcher : pointer; pTemplate1: pointer; pTemplate2 : pointer; var score : integer): integer; stdcall; external 'bsdk6x.dll'
  function Bsdk_Matcher_Identify(pMatcher : pointer; pTemplate : pointer; pTemplateSet : pointer; minScore : integer; var pInfoSet : pointer): integer; stdcall; external 'bsdk6x.dll'

  function Bsdk_Image_Save(pImage: Pointer; pBmpFile: Pointer; bmpFileSize: Integer; var pTransfered: Integer): Integer; stdcall; external 'bsdk6x.dll';

  procedure CheckResult(result : integer);

implementation

uses SysUtils;

  procedure CheckResult(result : Integer);
  begin
      if (result <> BSDK_RESULT_BASE) then begin
          if  (result =  BSDK_ERROR_INVALID_LICENSE) then
              raise Exception.Create('No BSDK License');

          raise Exception.Create('BSDK Exception! Error: ' + intToStr(result));
      end;
  end;

end.
