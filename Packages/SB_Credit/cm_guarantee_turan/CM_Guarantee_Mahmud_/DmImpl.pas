Unit DmImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, nlsDialogs,
  Db, OracleData, Oracle;

type
  TGurDm = class(TDataModule)
    MainDSrc: TDataSource;
    Pledges: TOracleDataSet;
    DataSrcPledges: TDataSource;
    pledgsortsDatSrc: TDataSource;
    pledgsorts: TOracleDataSet;
    pledgsortsID: TFloatField;
    pledgsortsNAME: TWideStringField;
    Guarante: TOraclePackage;
    CompanyDSet: TOracleDataSet;
    CompanySrc: TDataSource;
    OracleQuery1: TOracleQuery;
    maxid: TOracleDataSet;
    maxidMID: TFloatField;
    BaliSrc: TDataSource;
    BAliDSet: TOracleDataSet;
    BAliDSetCREDITID: TFloatField;
    BAliDSetCARDID: TFloatField;
    BAliDSetGUARANTORNAME: TWideStringField;
    BAliDSetGUARANTORID: TWideStringField;
    BAliDSetGUARANTORSALARY: TWideStringField;
    BAliDSetZAMINWORK1: TWideStringField;
    BAliDSetZAMINADRES1: TWideStringField;
    BAliDSetZAMINTEL1: TWideStringField;
    BAliDSetZMPASPYER1: TWideStringField;
    BAliDSetZMPASPDAT1: TDateTimeField;
    BAliDSetZMTELMOB1: TWideStringField;
    Credit: TOracleDataSet;
    CreditCREDITID: TFloatField;
    InsSrc: TDataSource;
    MainDSet_: TOracleDataSet;
    OracleDataSet1: TOracleDataSet;
    MainDSet_CREDITID: TFloatField;
    MainDSet_PLEDGEID: TFloatField;
    MainDSet_PLEDGENAME: TWideStringField;
    MainDSet_HOLDERNAME: TWideStringField;
    MainDSet_HOLDERADDRESS: TWideStringField;
    MainDSet_ANYINFOTODISTING: TWideStringField;
    MainDSet_REGISTRYNO: TWideStringField;
    MainDSet_REGISTRYAGENCY: TWideStringField;
    MainDSet_REGISTRYDATE: TDateTimeField;
    MainDSet_PLEDGEINUSE: TFloatField;
    MainDSet_PLEDGEINSURANT: TFloatField;
    MainDSet_INSURANCEAGENCY: TFloatField;
    MainDSet_INSURANCEAMOUNT: TFloatField;
    MainDSet_INSURANCEDATE: TDateTimeField;
    MainDSet_PLEDGEPRICETORPAQHA: TFloatField;
    MainDSet_PLEDGEPRICEEVKV: TFloatField;
    MainDSet_INSURANCERIGHT: TFloatField;
    MainDSet_INSURANCEID: TWideStringField;
    MainDSet_PLEDGEID_P: TFloatField;
    MainDSet_GQNAME: TWideStringField;
    MainDSet_GQPASPNUM: TWideStringField;
    MainDSet_GQPASPYER: TWideStringField;
    MainDSet_GQPASPDATE: TDateTimeField;
    MainDSet_GQADRESS: TWideStringField;
    MainDSet_REYSTER: TWideStringField;
    MainDSet_SERYAMH: TWideStringField;
    MainDSet_GQTEL: TWideStringField;
    MainDSet_PLEDGEPRICE: TFloatField;
    MainDSet_PLEDGSORTS: TFloatField;
    MainDSet_COMPANY: TFloatField;
    MainDSet_COMPANYDAT: TDateTimeField;
    MainDSet_COMPANYEXPERT: TWideStringField;
    MainDSet_CARDID: TFloatField;
    DataSrcOUTCollatralAccs: TDataSource;
    OUTCollatralAccs: TOracleDataSet;
    MainDSet_OUTCOLLATERALACCID: TFloatField;
    MainDSet_DECASTATUS: TFloatField;
    DSetPLd: TOracleDataSet;
    PledgesID: TFloatField;
    PledgesTYPECODE: TWideStringField;
    PledgesDESCRIPTION: TWideStringField;
    PledgesNEEDPLACEOUT: TFloatField;
    PledgesTEMID: TFloatField;
    PledgesPURCODE: TWideStringField;
    PledgesOUTBAL_CIN: TWideStringField;
    VillagesDataSet: TOracleDataSet;
    DistrictsDataSet: TOracleDataSet;
    DistrictsDataSetID: TFloatField;
    DistrictsDataSetNAME: TWideStringField;
    DistrictsDataSetNAME_ENG: TWideStringField;
    DistrictsDataSrc: TDataSource;
    VillagesDataSrc: TDataSource;
    MainDSet_BRANCE: TFloatField;
    MainDSet_ID: TFloatField;
    MainDSet_CUSTID: TFloatField;
    MainDSet_DAT: TDateTimeField;
    MainDSet_TESVIRI: TWideStringField;
    MainDSet_GQTELWORK: TWideStringField;
    MainDSet_GQTELHOME: TWideStringField;
    MainDSet_GQTELMOB: TWideStringField;
    MainDSet_GQVILLAGE: TFloatField;
    MainDSet_GQCITY: TFloatField;
    MainDSet_NUMBEROFGUR: TWideStringField;
    GurSrc: TDataSource;
    GurOracleData: TOracleDataSet;
    pledgsortsPLDID: TFloatField;
    pledgsortsHESABKOD: TWideStringField;
    pledgsortsOUTBAL_CIN: TWideStringField;
    MainDSet: TOracleDataSet;
    MainDSetCREDITID: TFloatField;
    MainDSetPLEDGEID: TFloatField;
    MainDSetPLEDGENAME: TWideStringField;
    MainDSetHOLDERNAME: TWideStringField;
    MainDSetHOLDERADDRESS: TWideStringField;
    MainDSetANYINFOTODISTING: TWideStringField;
    MainDSetREGISTRYNO: TWideStringField;
    MainDSetREGISTRYAGENCY: TWideStringField;
    MainDSetREGISTRYDATE: TDateTimeField;
    MainDSetPLEDGEINUSE: TFloatField;
    MainDSetPLEDGEINSURANT: TFloatField;
    MainDSetINSURANCEAGENCY: TFloatField;
    MainDSetINSURANCEAMOUNT: TFloatField;
    MainDSetINSURANCEDATE: TDateTimeField;
    MainDSetPLEDGEPRICETORPAQHA: TFloatField;
    MainDSetPLEDGEPRICEEVKV: TFloatField;
    MainDSetINSURANCERIGHT: TFloatField;
    MainDSetINSURANCEID: TWideStringField;
    MainDSetPLEDGEID_P: TFloatField;
    MainDSetGQNAME: TWideStringField;
    MainDSetGQPASPNUM: TWideStringField;
    MainDSetGQPASPYER: TWideStringField;
    MainDSetGQPASPDATE: TDateTimeField;
    MainDSetGQADRESS: TWideStringField;
    MainDSetREYSTER: TWideStringField;
    MainDSetSERYAMH: TWideStringField;
    MainDSetGQTEL: TWideStringField;
    MainDSetPLEDGEPRICE: TFloatField;
    MainDSetPLEDGSORTS: TFloatField;
    MainDSetCOMPANY: TFloatField;
    MainDSetCOMPANYDAT: TDateTimeField;
    MainDSetCOMPANYEXPERT: TWideStringField;
    MainDSetCARDID: TFloatField;
    MainDSetOUTCOLLATERALACCID: TFloatField;
    MainDSetDECASTATUS: TFloatField;
    MainDSetUSERID: TFloatField;
    MainDSetOUTSTATUS: TFloatField;
    MainDSetTRID: TFloatField;
    MainDSetBRANCE: TFloatField;
    MainDSetID: TFloatField;
    MainDSetCUSTID: TFloatField;
    MainDSetDAT: TDateTimeField;
    MainDSetTESVIRI: TWideStringField;
    MainDSetGQTELWORK: TWideStringField;
    MainDSetGQTELHOME: TWideStringField;
    MainDSetGQTELMOB: TWideStringField;
    MainDSetGQVILLAGE: TFloatField;
    MainDSetGQCITY: TFloatField;
    MainDSetNUMBEROFGUR: TWideStringField;
    procedure oracMainDSet1AfterOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure BAliDSetAfterOpen(DataSet: TDataSet);
    procedure MainDSet_AfterOpen(DataSet: TDataSet);
    procedure MainDSet_AfterScroll(DataSet: TDataSet);
    procedure MainDSet_CalcFields(DataSet: TDataSet);
    procedure MainDSetAfterOpen(DataSet: TDataSet);
    procedure MainDSetAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GurDm: TGurDm;

implementation

uses GuaranteImpl,sboapiDataModuleImpl;

{$R *.DFM}


procedure TGurDm.BAliDSetAfterOpen(DataSet: TDataSet);
var index: integer;
begin
   with DataSet, FrmGuarante.Panel do
begin
    Tabs.Clear;
    for Index := 0 to RecordCount-1 do
      Tabs.Add(Format('Zamin ¹%d ', [Index]));
    if recordcount=0 then tabs.Add ((Format('Zamin ¹%d ', [0]))) ;
    First;
  end;


end;

procedure TGurDm.DataModuleCreate(Sender: TObject);
begin
   Pledges.Open;
   pledgsorts.Open ;
   CompanyDSet.Open;
  OracleDataSet1.Open ;
  DistrictsDataSet.open;
  VillagesDataSet.Open;
  GurOracleData.Open;
  end;

procedure TGurDm.DataModuleDestroy(Sender: TObject);
begin
  Pledges.close;
  pledgsorts.Close ;
  CompanyDSet.CloseAll;
  OracleDataSet1.CloseAll;
  DistrictsDataSet.CloseAll;
  VillagesDataSet.CloseAll;
  GurOracleData.CloseAll;
end;

procedure TGurDm.oracMainDSet1AfterOpen(DataSet: TDataSet);
var index: integer;
begin
   with DataSet, FrmGuarante.Panel2 do
begin
    Tabs.Clear;
    for Index := 0 to RecordCount-1 do
      Tabs.Add(Format('Girov ¹%d ', [Index]));
    if recordcount=0 then tabs.Add ((Format('Girov  ¹%d ', [0]))) ;
    First;
  end;
end;

procedure TGurDm.MainDSetAfterOpen(DataSet: TDataSet);
var index: integer;
begin
with DataSet, FrmGuarante.Panel2 do
begin
    Tabs.Clear;
    for Index := 0 to RecordCount-1 do
  //  ShowMessage(tabs.);
      Tabs.Add(Format('Girov  ¹%d ', [Index]));
    if recordcount=0 then tabs.Add ((Format('Girov ¹%d ', [0]))) ;
    First;
  end;
end;

procedure TGurDm.MainDSetAfterScroll(DataSet: TDataSet);
begin
if MainDSet.fieldbyname('DECASTATUS').asinteger=1 then
 FrmGuarante.CheckBox1.Checked:=true
 else
  FrmGuarante.CheckBox1.Checked:=false;
  FrmGuarante.InUse_rg.ItemIndex:=MainDSet.FieldByName('PLEDGEINUSE').AsInteger;
end;

procedure TGurDm.MainDSet_AfterOpen(DataSet: TDataSet);
var index: integer;
begin
{   with DataSet, FrmGuarante.Panel2 do
begin
    Tabs.Clear;
    for Index := 0 to RecordCount-1 do
  //  ShowMessage(tabs.);
      Tabs.Add(Format('Girov  ¹%d ', [Index]));
    if recordcount=0 then tabs.Add ((Format('Girov ¹%d ', [0]))) ;
    First;
  end;    }
end;

procedure TGurDm.MainDSet_AfterScroll(DataSet: TDataSet);
begin
{//FrmGuarante.savechg;

if MainDSet.fieldbyname('DECASTATUS').asinteger=1 then
 FrmGuarante.CheckBox1.Checked:=true
 else
  FrmGuarante.CheckBox1.Checked:=false;
  FrmGuarante.InUse_rg.ItemIndex:=MainDSet.FieldByName('PLEDGEINUSE').AsInteger;   }
end;

procedure TGurDm.MainDSet_CalcFields(DataSet: TDataSet);
begin
// ShowMessage('asas1');
end;

end.
