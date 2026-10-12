unit CorrectorDataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData,Variants, Oracle;

type
  TCorrectorDataMod = class(TDataModule)
    CorrectData: TOracleDataSet;
    DSCorrectData: TDataSource;
    CorrectDataNUM: TWideStringField;
    CorrectDataNAME: TWideStringField;
    CorrectDataREST: TFloatField;
    CorrectDataINTERESTREST: TFloatField;
    CorrectDataDUEREST: TFloatField;
    CorrectDataDUEINTERESTREST: TFloatField;
    CorrectDataGIVENAMOUNT: TFloatField;
    CorrectDataOBLIGATION: TFloatField;
    CorrectDataPENALTYREST: TFloatField;
    OracPakec: TOraclePackage;
    CorrectDataCREDITID: TFloatField;
    ods_user: TOracleDataSet;
    ods_userUID: TFloatField;
    procedure CorrectDataBeforePost(DataSet: TDataSet);
    procedure CorrectDataBeforeEdit(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    FOldPenaltyRest: Double;
    FOldREST: Double;
    FOldINTERESTREST: Double;
    FOldDUEREST: Double;
    FOldDUEINTERESTREST: Double;
  public
    { Public declarations }
  end;

var
  CorrectorDataMod: TCorrectorDataMod;

implementation

{$R *.DFM}

uses
  sboapiDataModuleImpl;

procedure TCorrectorDataMod.CorrectDataBeforeEdit(DataSet: TDataSet);
begin
FOldPenaltyRest := DataSet.FieldByName('PENALTYREST').AsFloat;
FOldREST := DataSet.FieldByName('rest').AsFloat;
FOldINTERESTREST := DataSet.FieldByName('INTERESTREST').AsFloat;
FOldDUEREST := DataSet.FieldByName('DUEREST').AsFloat;
FOldDUEINTERESTREST:= DataSet.FieldByName('DUEINTERESTREST').AsFloat;
end;

procedure TCorrectorDataMod.CorrectDataBeforePost(DataSet: TDataSet);
var
 NewVal,NewVal1,NewVal2,NewVal3,NewVal4: Double;
  CreditID: Integer;
  UserID: Integer;

begin


  NewVal :=  DataSet.FieldByName('rest').AsFloat;
  NewVal1 := DataSet.FieldByName('INTERESTREST').AsFloat;
  NewVal2 := DataSet.FieldByName('DUEREST').AsFloat;
  NewVal3 := DataSet.FieldByName('DUEINTERESTREST').AsFloat;
  NewVal4 := DataSet.FieldByName('PENALTYREST').AsFloat;


  CreditID := DataSet.FieldByName('CREDITID').AsInteger;
  UserID   :=ods_userUID.AsInteger;


   if  FOldREST <>NewVal then
     begin
    CorrectorDataMod.OracPakec.CallProcedure('cm_history_audit',
      [
        CreditID,
        UserID,
        FOldREST,
        NewVal,
        'Esas'
      ]
    );
   end;

   if  FOldINTERESTREST <>NewVal1 then
     begin
    CorrectorDataMod.OracPakec.CallProcedure('cm_history_audit',
      [
        CreditID,
        UserID,
        FOldINTERESTREST,
        NewVal1,
        'Fazi'
      ]
    );
   end;

    if  FOldDUEREST <>NewVal2 then
     begin
    CorrectorDataMod.OracPakec.CallProcedure('cm_history_audit',
      [
        CreditID,
        UserID,
        FOldDUEREST,
        NewVal2,
        'Gecikmis Esas'
      ]
    );
   end;

   if  FOldDUEINTERESTREST <>NewVal3 then
     begin
    CorrectorDataMod.OracPakec.CallProcedure('cm_history_audit',
      [
        CreditID,
        UserID,
        FOldDUEINTERESTREST,
        NewVal3,
        'Gecikmis Fazi'
      ]
    );
   end;

    if  FOldPenaltyRest <>NewVal4 then
     begin
    CorrectorDataMod.OracPakec.CallProcedure('cm_history_audit',
      [
        CreditID,
        UserID,
        FOldPenaltyRest,
        NewVal4,
        'Penya'
      ]
    );
   end;


end;

procedure TCorrectorDataMod.DataModuleCreate(Sender: TObject);
begin
ods_user.Open;

end;

procedure TCorrectorDataMod.DataModuleDestroy(Sender: TObject);
begin
ods_user.Close;
end;

end.
