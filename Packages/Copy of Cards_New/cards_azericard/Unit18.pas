unit Unit18;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TDataMod_CARDS = class(TDataModule)
    ClientListSource: TDataSource;
    CUSTINFO: TOracleDataSet;
    CUSTINFOSOURCE: TDataSource;
    custaccount: TOracleDataSet;
    custaccountsorce: TDataSource;
    valuta: TOracleDataSet;
    valutasorce: TDataSource;
    messages: TOracleDataSet;
    messagsource: TDataSource;
    UMUMI1: TOracleDataSet;
    cliencards: TOracleDataSet;
    UMUMI: TOracleDataSet;
    apptypesource: TDataSource;
    apptype: TOracleDataSet;
    statuscard: TOracleDataSet;

    statuscardsource: TDataSource;
    clientcardssource: TDataSource;
    CARDTYPES: TOracleDataSet;
    CARDTYPESSOURCE: TDataSource;
    CARDSTYPE: TOracleDataSet;
    TYPESORCE: TDataSource;
    allclientcredits: TOracleDataSet;
    allclientcreditssource: TDataSource;
    allclientdepozits: TOracleDataSet;
    allclientdepozitssource: TDataSource;
    depozitsource: TDataSource;
    depozit: TOracleDataSet;
    CUSTOMERS: TOracleDataSet;
    CUSTOMERSSOURCE: TDataSource;
    allclientaccount: TOracleDataSet;
    allclientaccountsource: TDataSource;
    clienapp: TOracleDataSet;
    clientappsource: TDataSource;
    mushteriler: TOracleDataSet;
    accounts: TOracleDataSet;
    msource: TDataSource;
    hsource: TDataSource;
    valut: TOracleDataSet;
    vsource: TDataSource;
    hesab5: TOracleDataSet;
    sazlamalar: TOracleDataSet;
    balspr: TOracleDataSet;
    balspr1source: TDataSource;
    balanslar: TOracleDataSet;
    balanslarsource: TDataSource;
    tarix: TOracleDataSet;
    COMPANY: TOracleDataSet;
    companysource: TDataSource;
    mainpacket: TOraclePackage;
    cariqaliq: TOracleDataSet;
    carisource: TDataSource;
    referens: TOracleDataSet;
    urgent: TOracleDataSet;
    simple: TOracleDataSet;
    urgensource: TDataSource;
    simplesource: TDataSource;
    hesabat: TOracleDataSet;
    hesabatsource: TDataSource;
    filial: TOracleDataSet;
    filialsource: TDataSource;
    settings: TOracleDataSet;
    settingssource: TDataSource;
    accountsource: TDataSource;
    filialaccount: TOracleDataSet;
    filialaccountsource: TDataSource;
    domestic: TOracleDataSet;
    domesticsource: TDataSource;
    accountdomestic: TOracleDataSet;
    domesticaccountsource: TDataSource;
    accountbankomats: TOracleDataSet;
    accountbankomatsource: TDataSource;
    bankomats: TOracleDataSet;
    bankomatsource: TDataSource;
    editval: TOracleDataSet;
    CARDOPERATION: TOracleDataSet;
    CARDOPERATIONSOURCE: TDataSource;
    POSCOMISSION: TOracleDataSet;
    POSCOMISSIONSOURCE: TDataSource;
    cariqaliq2: TOracleDataSet;
    intfiles: TOracleDataSet;
    intfilessource: TDataSource;
    smsfiles: TOracleDataSet;
    smsfilessource: TDataSource;
    messages2: TOracleDataSet;
    message2source: TDataSource;
    smsfiles2: TOracleDataSet;
    smsfile2source: TDataSource;
    intfile2: TOracleDataSet;
    intfilessource2: TDataSource;
    rvisa: TOracleDataSet;
    rvisaSource: TDataSource;
    noprov: TOracleDataSet;
    noprovSource: TDataSource;
    dxxx: TOracleDataSet;
    dxxxSource: TDataSource;
    dxxx2: TOracleDataSet;
    dxxx2source: TDataSource;
    payment: TOracleDataSet;
    PaymentSource: TDataSource;
    filepayment: TOracleDataSet;
    balans: TOracleDataSet;
    BalanceSource: TDataSource;
    dfile: TOracleDataSet;
    dfilesource: TDataSource;
    dfile2: TOracleDataSet;
    dfile2source: TDataSource;
    sb_aca: TOraclePackage;
    kliring1: TOracleDataSet;
    kliring2: TOracleDataSet;
    kliring1source: TDataSource;
    kliring2source: TDataSource;
    excels: TOracleDataSet;
    excelsource: TDataSource;
    salarybase: TOracleDataSet;
    salarybasesource: TDataSource;
    salarybase2: TOracleDataSet;
    salarybase2source: TDataSource;
    findcredit: TOracleDataSet;
    hesabtap: TOracleDataSet;
    newcard: TOracleDataSet;
    DataSourcenewcard: TDataSource;
    closecard: TOracleDataSet;
    opencard: TOracleDataSet;
    closecardsource: TDataSource;
    opencardsource: TDataSource;
    reportesc: TOracleDataSet;
    reportdescsource: TDataSource;
    hesab1: TOracleDataSet;
    hesab2: TOracleDataSet;
    hesab1source: TDataSource;
    hesab2source: TDataSource;
    fkod: TOracleDataSet;
    FCUR: TOracleDataSet;
    fcardtype: TOracleDataSet;
    fmaincard: TOracleDataSet;
    client2: TOracleDataSet;
    cardnumber1: TOracleDataSet;
    cardnumber2: TOracleDataSet;
    cardnumber1source: TDataSource;
    cardnumber2source: TDataSource;
    YENICARD1: TOracleDataSet;
    YENICARD3: TOracleDataSet;
    yenicardsource: TDataSource;
    yenicard1source: TDataSource;
    YENICARD: TOracleDataSet;
    PROLONG: TOracleDataSet;
    PROLONG1: TOracleDataSet;
    prolongsource: TDataSource;
    prolong1source: TDataSource;
    closefind: TOracleDataSet;
    urgent2: TOracleDataSet;
    urgentsource2: TDataSource;
    simple2: TOracleDataSet;
    simplesource2: TDataSource;
    Clients: TOracleDataSet;
    hesab: TOracleDataSet;
    valut2: TOracleDataSet;
    acclose: TOracleDataSet;
    acclose2: TOracleDataSet;
    accclosesource: TDataSource;
    acclose2source: TDataSource;
    ClientsID: TFloatField;
    ClientsACCID: TFloatField;
    ClientsCARDHOLDER: TWideStringField;
    ClientsFNAME: TWideStringField;
    ClientsLNAME: TWideStringField;
    ClientsPASSPORT: TWideStringField;
    ClientsBIRTHDAY: TWideStringField;
    ClientsHOMEPHONE: TWideStringField;
    ClientsWORKPHONE: TWideStringField;
    ClientsCOUNTRY: TWideStringField;
    ClientsCITY: TWideStringField;
    ClientsADDRESS: TWideStringField;
    ClientsRESIDENT: TWideStringField;
    ClientsCARDNUMBER: TWideStringField;
    ClientsRBSNUMBER: TWideStringField;
    ClientsMAINCARD: TWideStringField;
    ClientsCURRENCY: TWideStringField;
    ClientsCARDTYPE: TWideStringField;
    ClientsCARDSTATUS: TWideStringField;
    ClientsCREDIT_LIM: TFloatField;
    ClientsDATEOPEN: TDateTimeField;
    ClientsEXPIRY: TDateTimeField;
    ClientsREFERENCE: TWideStringField;
    ClientsEMBOSSNAME: TWideStringField;
    ClientsCOMPANY: TWideStringField;
    ClientsDATECLOSE: TDateTimeField;
    ClientsSECURITY: TWideStringField;
    ClientsSEND: TIntegerField;
    ClientsCREATDATE: TIntegerField;
    ClientsFILE_NUM: TIntegerField;
    ClientsMESSTYPE: TIntegerField;
    ClientsWITHP: TWideStringField;
    ClientsURG: TWideStringField;
    ClientsOTHTYPE: TWideStringField;
    ClientsOTHMEMBER: TWideStringField;
    ClientsOTHASSCOD: TWideStringField;
    ClientsOTHIDEN: TWideStringField;
    ClientsOTHEXPRY: TWideStringField;
    ClientsFILENAME: TWideStringField;
    ClientsCON_BALAN: TWideStringField;
    ClientsBALAN_SIGN: TWideStringField;
    ClientsCARDREST: TFloatField;
    ClientsRBSNUMBER2: TWideStringField;
    ClientsACCID2: TFloatField;
    ClientsREFINTEGER: TWideStringField;
    ClientsLANG_CODE: TWideStringField;
    ClientsFILIAL: TFloatField;
    ClientsISSUED_BY: TWideStringField;
    ClientsDOC_SINCE: TWideStringField;
    ClientsCONTRACT_NUM: TWideStringField;
    ClientsKREDIT: TIntegerField;
    ClientsKLI_ID: TFloatField;
    ClientsOP_ID: TFloatField;
    ClientsTYPES: TWideStringField;
    ClientsTITUL: TWideStringField;
    ClientsSTATUS: TFloatField;
    ClientsDAT: TDateTimeField;
    ClientsNMOD_OPID: TFloatField;
    ClientsCRDAT: TDateTimeField;
    ClientsRBSCLOSE: TWideStringField;
    ClientsRBSCLOSEID: TFloatField;
    ClientsTRANDATE: TDateTimeField;
    ClientsFIL: TWideStringField;
    ClientsCREAT: TWideStringField;
    ClientsMODI: TWideStringField;
    ClientsOLD_ACC_NO: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure mushterilerAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataMod_CARDS: TDataMod_CARDS;

implementation

{$R *.DFM}

uses SboapiDataModuleImpl, newcard;

procedure TDataMod_CARDS.DataModuleCreate(Sender: TObject);
begin
Clients.Open;
custinfo.Open;
custaccount.Open;
valuta.Open;
messages.Open;
end;

procedure TDataMod_CARDS.mushterilerAfterScroll(DataSet: TDataSet);
var edit14: variant;
begin
  //if Customer_new.Edit14.Text<>'' then edit14 := (Customer_new.Edit14.Text)   else edit14:=null;
   //with hesab do begin
    //if not hesab then Open;
    //Filter :='AccKlID = '+P_Customers.FieldByName('ID').AsString;

       //DataMod_CARDS.hesab.Close;
       //DataMod_CARDS.hesab.SetVariable('CID', edit14);
       //DataMod_CARDS.hesab.SetVariable('p_AccNO', '%%');
       //ShowMessage(IntToStr(mushteriler.FieldByName('ID').AsInteger));
       //DataMod_CARDS.hesab.Open;

       //if not DataMod_CARDS.hesab.Active then DataMod_CARDS.hesab.Open else DataMod_CARDS.hesab.Refresh;
    //Filtered :=False;
    //Filtered :=True;
   //end;
end;

end.
