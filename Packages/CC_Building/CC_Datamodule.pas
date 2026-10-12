unit CC_Datamodule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;

type
  TCC_DataMod = class(TDataModule)
    CC_OP: TOraclePackage;
    CC_Company: TOracleDataSet;
    CC_Com_Data: TDataSource;
    CC_build_Data: TDataSource;
    CC_Flat: TOracleDataSet;
    CC_Flat_Data: TDataSource;
    CC_Buyer_Flat: TOracleDataSet;
    CC_Buyer_FlatData: TDataSource;
    CC_CompanyID: TIntegerField;
    CC_building: TOracleDataSet;
    CC_buildingID: TFloatField;
    CC_buildingCOMP_ID: TFloatField;
    CC_buildingFLOORS: TFloatField;
    CC_buildingENTRANCES: TFloatField;
    CC_buildingFLATS: TFloatField;
    CC_Buyer_FlatID: TFloatField;
    CC_Buyer_FlatBLD_ID: TFloatField;
    CC_Buyer_FlatFFLOOR: TFloatField;
    CC_Buyer_FlatROOMS: TFloatField;
    CC_Buyer_FlatAREA: TFloatField;
    CC_Buyer_FlatPRICE1: TFloatField;
    CC_Buyer_FlatPRICEGEN: TFloatField;
    CC_Buyer_FlatBUYER: TFloatField;
    CC_Buyer_FlatUSERID: TFloatField;
    CC_FlatID: TFloatField;
    CC_FlatBLD_ID: TFloatField;
    CC_FlatFFLOOR: TFloatField;
    CC_FlatROOMS: TFloatField;
    CC_FlatAREA: TFloatField;
    CC_FlatPRICE1: TFloatField;
    CC_FlatPRICEGEN: TFloatField;
    CC_FlatBUYER: TFloatField;
    CC_FlatUSERID: TFloatField;
    CC_FlatACCID: TFloatField;
    CC_CompanyCOMP_NAME: TWideStringField;
    CC_FlatFLATNUMBER: TWideStringField;
    CC_FlatENTRANCE: TWideStringField;
    CC_FlatCODE: TWideStringField;
    CC_buildingBLD_NAME: TWideStringField;
    CC_buildingADDRESS: TWideStringField;
    CC_Buyer_FlatCODE: TWideStringField;
    CC_Buyer_FlatFLATNUMBER: TWideStringField;
    CC_Buyer_FlatENTRANCE: TWideStringField;
    CC_Buyer_FlatBUYER_STATUS: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CC_DataMod: TCC_DataMod;

implementation

Uses sboapiDataModuleImpl; 
{$R *.DFM}

procedure TCC_DataMod.DataModuleCreate(Sender: TObject);
begin
  CC_building.Open;
  CC_Buyer_Flat.Open;
end;

end.
