unit ScheduleDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TScheduleDataModule = class(TDataModule)
    sbdm_customers: TOracleDataSet;
    sbdm_dscustomers: TDataSource;
    sbdm_customersID: TIntegerField;
    sbdm_customersOP_ID: TFloatField;
    sbdm_customersOPEN_DAT: TDateTimeField;
    sbdm_customersCLOSE_DAT: TDateTimeField;
    sbdm_customersNEREZIDENT: TFloatField;
    sbdm_customersPRINAD_KOD: TFloatField;
    sbdm_customersNAME: Twidestringfield;
    sbdm_customersSHORT_NAME: Twidestringfield;
    sbdm_customersGROUP_KLIE: TFloatField;
    sbdm_customersVID_SOB: TFloatField;
    sbdm_customersORG_SOB: TFloatField;
    sbdm_customersSFERA_DEY: TFloatField;
    sbdm_customersOTRASL: TFloatField;
    sbdm_customersNALOG_KOD: TFloatField;
    sbdm_customersKOD_OKPRO: Twidestringfield;
    sbdm_customersINN: Twidestringfield;
    sbdm_customersDAT_NAL: TDateTimeField;
    sbdm_customersDAT_USTAV: TDateTimeField;
    sbdm_customersBIK: TFloatField;
    sbdm_customersOTV_LICO: Twidestringfield;
    sbdm_customersOTV_PASSPORT: Twidestringfield;
    sbdm_customersOTV_ISSUED: Twidestringfield;
    sbdm_customersOTV_ISDATE: TDateTimeField;
    sbdm_customersOLD_INN: TFloatField;
    sbdm_customersCUST_TYPE: TIntegerField;
    sbdm_customersID_1: TFloatField;
    sbdm_customersTYPE: TFloatField;
    sbdm_customersOPENDATE: TDateTimeField;
    sbdm_customersCLOSEDATE: TDateTimeField;
    sbdm_customersAMOUNT: TFloatField;
    sbdm_customersCONTRACTNO: Twidestringfield;
    sbdm_customersCONTRACTTYPE: TIntegerField;
    sbdm_customersPLEDGETYPE: TFloatField;
    sbdm_customersRELIABILITYID: TIntegerField;
    sbdm_customersCLIENTTYPE: TFloatField;
    sbdm_customersPLEDGEPRICE: TFloatField;
    sbdm_customersSID: TFloatField;
    sbdm_customersOVERDUERELIABILITYID: TFloatField;
    sbdm_customersPERSONALTYPE: TFloatField;
    sbdm_customersCURRENCY: TFloatField;
    sbdm_customersBRANCHID: TFloatField;
    sbdm_customersCUSTOMERID: TFloatField;
    sbdm_customersFIRSTINTERESTPAYDAT: TDateTimeField;
    sbdm_customersPERIODID: TFloatField;
    OracleDataSet1: TOracleDataSet;
    DataSource1: TDataSource;
    OracleDataSet2: TOracleDataSet;
    DataSource2: TDataSource;
    OracleDataSet2SeqNo: TIntegerField;
    OracleDataSet2ID: TFloatField;
    OracleDataSet2ID2: TFloatField;
    OracleDataSet2HDATE: TDateTimeField;
    OracleDataSet2INTEREST: TFloatField;
    OracleDataSet2IPINTEREST: TFloatField;
    Sbcm_date: TOraclePackage;
    sbcm_percent_converting: TOraclePackage;
    SBCM_PAYMENT_SCHEDULE1: TOraclePackage;
    OracleDataSet3: TOracleDataSet;
    OracleDataSet3ID: TFloatField;
    OracleDataSet3TYPE: TFloatField;
    OracleDataSet3OPENDATE: TDateTimeField;
    OracleDataSet3CLOSEDATE: TDateTimeField;
    OracleDataSet3AMOUNT: TFloatField;
    OracleDataSet3CONTRACTNO: Twidestringfield;
    OracleDataSet3CONTRACTTYPE: TIntegerField;
    OracleDataSet3PLEDGETYPE: TFloatField;
    OracleDataSet3RELIABILITYID: TIntegerField;
    OracleDataSet3CLIENTTYPE: TFloatField;
    OracleDataSet3PLEDGEPRICE: TFloatField;
    OracleDataSet3SID: TFloatField;
    OracleDataSet3OVERDUERELIABILITYID: TFloatField;
    OracleDataSet3PERSONALTYPE: TFloatField;
    OracleDataSet3CURRENCY: TFloatField;
    OracleDataSet3BRANCHID: TFloatField;
    OracleDataSet3CUSTOMERID: TFloatField;
    OracleDataSet3FIRSTINTERESTPAYDAT: TDateTimeField;
    OracleDataSet3PERIODID: TFloatField;
    OracleDataSet3ID_1: TFloatField;
    OracleDataSet3TYPE2: Twidestringfield;
    OracleDataSet3ADDITIONALTYPE: Twidestringfield;
    OracleDataSet3WITHDRAWTYPE: Twidestringfield;
    OracleDataSet3DATEINTERVAL: TIntegerField;
    procedure OracleDataSet2SeqNoGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
   
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ScheduleDataModule: TScheduleDataModule;

implementation
uses sboapiDataModuleImpl;


{$R *.DFM}

procedure TScheduleDataModule.OracleDataSet2SeqNoGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := IntToStr(Sender.DataSet.RecNo); 
end;

end.
