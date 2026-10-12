unit CodeAccountimpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Buttons, CMExcelExport;

type
  TCodeAccountFrm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBGrid2: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ExcelExport: TCMExcelExport;
    Panel1: TPanel;
    EditACC_NO: TEdit;
    Label1: TLabel;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure EditACC_NOExit(Sender: TObject);
    procedure EditACC_NOKeyPress(Sender: TObject; var Key: Char);
  private
   procedure ActnSearchExecute(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CodeAccountFrm: TCodeAccountFrm;

implementation

{$R *.dfm}
 uses DmBudcetImpl , BalanceImpl, SettingCodeImpl,OracleData;
procedure TCodeAccountFrm.BitBtn1Click(Sender: TObject);
begin
    if not Assigned(SettingCodeFrm) then
      SettingCodeFrm:= TSettingCodeFrm.Create(application);
  SettingCodeFrm.ShowModal ;
end;

procedure TCodeAccountFrm.BitBtn2Click(Sender: TObject);
begin
if MessageDlg('Silinməsinə !'#13' Əminsinizmi?',
    mtWarning, [mbYes, mbCancel], 0)= mrYes then
DmBudcet.DataSource5.DataSet.Delete;
end;

procedure TCodeAccountFrm.BitBtn3Click(Sender: TObject);
begin
with DmBudcet.CodeExcelSet do
begin
if Active then  close   ;
open;
   with ExcelExport do
   begin
     Connect;
      ExportDataset(DmBudcet.CodeExcelSet ,'Maddələrə bağlı hesablar',True,True);

     Disconnect;
   end;
end;

end;

procedure TCodeAccountFrm.BitBtn4Click(Sender: TObject);
begin
close
end;
procedure TCodeAccountFrm.ActnSearchExecute(Sender: TObject);
var
  SearchField : string;
  SearchOptions : TSearchRecordOptions;
begin
  SearchOptions := [srIgnoreCase ,srPartialMatch];

  with Sender as TEdit  do
  begin
    SearchField := copy(Name,5,length(Name));
    DBGrid1.SelectedRows.Clear;
    with  TOracleDataSet(DBGrid1.DataSource.DataSet) do
    if  not SearchRecord(
                  SearchField
                 ,Text
                 ,SearchOptions + [srFromCurrent , srForward ]
                 ) then
    if MessageDlg(
              'Axtarış sona çatıb.'+#13+'əvvəldən başlamaq istəyirsinizmi?'
             ,mtInformation
             ,[mbNo , mbYes]
             ,0
             ) = mrYes  then
    if  not SearchRecord(
                 SearchField
                ,Text
                ,SearchOptions + [ srFromBeginning ]
                )  then
    MessageDlg('Yazı tapılmadı!',mtInformation,[mbOK],0);
  end;
   end;

procedure TCodeAccountFrm.EditACC_NOExit(Sender: TObject);
begin
(Sender as TEdit).Text := '';
end;

procedure TCodeAccountFrm.EditACC_NOKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = VK_RETURN
  then  ActnSearchExecute(Sender)
end;

procedure TCodeAccountFrm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=false
end;

procedure TCodeAccountFrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_ESCAPE then
    Close ;
end;

end.
