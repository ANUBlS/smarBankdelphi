unit CMOracleAPIDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;

type
  TCMDataModule = class(TDataModule)
    CMSession: TOracleSession;
    CMLogon: TOracleLogon;
    DSBankDate: TOracleDataSet;
    Branch: TOracleDataSet;
    procedure DataModuleCreate(Sender: TObject);
  private
    FCurrentDate : TDateTime;
    FPrevDate : TDateTime;
    FBranchID : Integer;
    procedure Get_Defaults;
    { Private declarations }
  public
    function  TryToConnect(UserName ,Password ,Database : String) : Boolean;
    procedure Disconnect;
    property CurrentDate : TDateTime read FCurrentDate;
    property PrevDate : TDateTime read FPrevDate;
    property BranchID : Integer read FBranchID;
    { Public declarations }
  end;

var
  CMDataModule: TCMDataModule;

implementation

{$R *.DFM}

function TCMDataModule.TryToConnect(UserName ,Password ,Database : String) : Boolean;
begin
  with CMLogon,Session do
  begin
   LogonUsername := UserName;
   LogonDatabase := Database;
   LogonPassword := Password;
   Execute;
   Result := Connected;
   if Result then Get_Defaults;
  end;
end;

procedure TCMDataModule.Disconnect;
begin
  with CMSession do
  if Connected then
    LogOff;
end;

procedure TCMDataModule.Get_Defaults;
begin
  // Getting Current and Prev Bank Date
  with DSBankDate do
  begin
    Open;
    FCurrentDate := FieldByName('TEK_DAT').AsDateTime;
    FPrevDate := FieldByName('PRED_DAT').AsDateTime;
    CloseAll;    
  end;
  // Getting Branch ID 
  with Branch do
  begin
    Open;
    FBranchID := FieldByName('KOD_FIL').AsInteger;
    CloseAll;
  end;
end;

procedure TCMDataModule.DataModuleCreate(Sender: TObject);
begin
  FBranchID := 0;
end;

initialization
  CMDataModule := TCMDataModule.Create(nil);

finalization
  CMDataModule.Free

end.
