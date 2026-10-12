unit PercentSettingImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, Mask, DBCtrls, Db,
  OracleData, NLSLocalizer;

type
  TPercentSetting = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GridSetting: TDBGrid;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox3: TGroupBox;
    DBGrid3: TDBGrid;
    BitBtn1: TBitBtn;
    DepositTypes: TOracleDataSet;
    DepositTypesID: TFloatField;
    DepositTypesTYPE: TStringField;
    DepositTypesDatSrc: TDataSource;
    Valutes: TOracleDataSet;
    ValutesVAL_NAME: TStringField;
    ValutesVALU_NAME: TStringField;
    ValutesVALUTE: TIntegerField;
    ValutesDatSrc: TDataSource;
    DepositPerSetting: TOracleDataSet;
    DepositPerSettingID: TFloatField;
    DepositPerSettingDEPOSITID: TFloatField;
    DepositPerSettingCURRENCYID: TFloatField;
    DepositPerSettingINTERESTRATE: TFloatField;
    DepositPerSettingFIRSTAMOUNT: TFloatField;
    DepositPerSettingLASTAMOUNT: TFloatField;
    PerSettingDatSrc: TDataSource;
    NLSLocalizer1: TNLSLocalizer;
    DepositPerSettingDUEINTRATE: TFloatField;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure GridSettingKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure DepositTypesDatSrcDataChange(Sender: TObject; Field: TField);
    procedure GridSettingKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DepositPerSettingAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure WaitForOp;
  end;

var
  PercentSetting: TPercentSetting;
  procedure exportproc(S:String);export;

implementation

{$R *.DFM}
uses sboapiDataModuleImpl,CommonDeclsImpl;

procedure exportproc(S:String);export;
begin
   PercentSetting.ShowModal;
end;
exports
    exportproc;

procedure TPercentSetting.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False;
end;

procedure TPercentSetting.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(Key) = VK_ESCAPE then close;
end;

procedure TPercentSetting.GridSettingKeyPress(Sender: TObject; var Key: Char);
begin

   with DepositPerSetting do
   begin
   if UpdateStatus in [usInserted, usModified] then begin
     FieldByName('DepositID').AsInteger := DepositTypes.FieldByName('ID').AsInteger;
     FieldByName('CurrencyID').AsInteger := Valutes.FieldByName('Valute').AsInteger;
     end;
   end;
end;


procedure TPercentSetting.WaitForOp;
var P_DepositID,P_CurrencyID :Integer;
begin
      with DepositTypes do
           P_DepositID := FieldByName('ID').AsInteger;

      with Valutes do
           P_CurrencyID := FieldByName('Valute').AsInteger;

   with DepositPerSetting do
   begin
      close;
      setVariable('DepID',P_DepositID);
      setVariable('CurrID',P_CurrencyID);
      open;
   end;

end;


procedure TPercentSetting.FormShow(Sender: TObject);
begin
   DepositTypes.Open;
   Valutes.Open;
end;

procedure TPercentSetting.DepositTypesDatSrcDataChange(Sender: TObject;
  Field: TField);
begin
  WaitForOp;
end;

procedure TPercentSetting.GridSettingKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (key = VK_DELETE) and (GridSetting.DataSource.DataSet.RecordCount>0) then

      GridSetting.DataSource.DataSet.Delete;

end;

procedure TPercentSetting.DepositPerSettingAfterPost(DataSet: TDataSet);
begin
  DepositPerSetting.Refresh;
end;

initialization
   PercentSetting := TPercentSetting.Create(CommonApplication)

end.
