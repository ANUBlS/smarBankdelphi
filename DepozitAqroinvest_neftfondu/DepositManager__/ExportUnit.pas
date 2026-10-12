unit ExportUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, CheckLst, ExcelExporter;

type
   TExportedFieldsInfo = (efiName,efiDescription);
   TExportedFields = array[TExportedFieldsInfo] of String;

const
   ExportedFieldsCount = 9;
   FieldsInfo : array [0..ExportedFieldsCount - 1] of TExportedFields = (
                                                   ('ContractNo','ћцгавил€нин нюмр€си')
                                                  ,('OpenDate','јчылма тарихи')
                                                  ,('CloseDate','Ѕаьланма тарихи')
                                                  ,('Amount','ћ€бл€ь')
                                                  ,('ContractCurrency','¬алйутасы')
                                                  ,('ContractAccNo','——уда ўесабынын нюмр€си')
                                                  ,('ContractAccName','——уда ўесабынын ады')
                                                  ,('FacticalDebt','ясас Ѕорж')
                                                  ,('FacticalInterestDebt','ясас Ѕорж цзр€ %')
                                                  );

type
  TFrmExport = class(TForm)
    BtnExport: TButton;
    BtnCancel: TButton;
    GroupBox1: TGroupBox;
    CLBExportList: TCheckListBox;
    CreditsExporter: TExcelExporter;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure BtnExportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmExport: TFrmExport;

implementation

uses DepositDataModuleUnit;
   

{$R *.DFM}

procedure TFrmExport.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if  Key = #27  then
    Close;
end;

procedure TFrmExport.FormCreate(Sender: TObject);
var
  i : 0..ExportedFieldsCount - 1;
begin
  with  CLBExportList.Items  do
  begin
    Clear;
    for i := 0  to  ExportedFieldsCount - 1  do
    begin
      Add(FieldsInfo[i][efiDescription]);
    end;
  end;
  for i := 0 to  ExportedFieldsCount - 1  do
   CLBExportList.Checked[i] := True;
end;

procedure TFrmExport.BtnExportClick(Sender: TObject);
var
   i : 0..ExportedFieldsCount - 1;
begin
  with  CLBExportList,CreditsExporter do
  begin
    ExportList.Clear;
    for i := 0 to ExportedFieldsCount - 1 do
    if  Checked[i]  then
      ExportList.Add(UpperCase(FieldsInfo[i][efiName]));
    Report;
  end;
end;

end.
