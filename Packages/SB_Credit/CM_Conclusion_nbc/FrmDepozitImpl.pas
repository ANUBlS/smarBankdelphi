unit FrmDepozitImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, XDBGrids, StdCtrls, XFSCtrls, ExtCtrls, Buttons;

type
  TFrmDepozit = class(TForm)
    XFPanel1: TXFPanel;
    XFLabel1: TXFLabel;
    XFSpeedButton1: TXFSpeedButton;
    Edit1: TEdit;
    XFSpeedButton2: TXFSpeedButton;
    XFSpeedButton3: TXFSpeedButton;
    XDBGrid1: TXDBGrid;
    Memo1: TMemo;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure XFSpeedButton2Click(Sender: TObject);
    procedure XDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TXColumn; State: TGridDrawState);
    procedure XFSpeedButton1Click(Sender: TObject);
    procedure XFSpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDepozit: TFrmDepozit;

implementation

{$R *.dfm}
 uses DataModuleConclusion,ConclusionMainUnitImpl;
procedure TFrmDepozit.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=false
end;

procedure TFrmDepozit.XDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TXColumn; State: TGridDrawState);
//Var Style   : Integer;
begin

 //xdbGrid1.DefaultDrawColumnCell (Rect, DataCol, Column, State);
{ рисуется колонка, в которую мы хотим поместить TCheckBox }
//IF  Column.Title.Caption=''
//Then begin
// IF  XDBGrid1.DataSource.DataSet.FieldByName('CREDITID').IsNull  then
//     XDBGrid1.Canvas.Brush.Color:=clAqua;
 //    XDBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
 //  Then Style :=DFCS_BUTTONCHECK
 //  Else Style := DFCS_CHECKED ;
  //DrawFrameControl(TXDBGrid(Sender).Canvas.Handle,
 // Rect, DFC_BUTTON, Style);
//end;
end;

procedure TFrmDepozit.XFSpeedButton1Click(Sender: TObject);
begin
with DataModuleConcl do
begin
 DepozitDSet.close;
if Edit1.Text<>'' then
  DepozitDSet.SQL[28] :='and cont.customerid in('+inttostr(ConclusionForm.DBLookupComboboxEh19.KeyValue)+','+ Edit1.Text+')'

 else
  DepozitDSet.SQL[28] :='';
  DepozitDSet.open;
  memo1.Text:= DepozitDSet.SQL.Text;
end;
end;

procedure TFrmDepozit.XFSpeedButton2Click(Sender: TObject);
var
count,i :integer;
s:string;
num :string;
kredqaliq,qaliq :real;

begin
kredqaliq:=0;
with XDBGrid1 do
   for I := SelectedRows.Count - 1 downto 0 do
  begin
  //  if SelectedColumn.CheckBox then begin
     DataSource.DataSet.GotoBookmark(Pointer(SelectedRows[I]));
   with DataModuleConcl.Depozitqaliq do
   begin
     if Active then DataModuleConcl.Depozitqaliq.Close;
     SetVariable('id',XDBGrid1.DataSource.DataSet.FieldByName('id').AsInteger);
     open;
     if RecCount>0 then
       kredqaliq:=FieldByName('rest').AsFloat;
   end;
     s:=s+(DataSource.DataSet.FieldByName('id').AsString)+',';
     num:= num +(DataSource.DataSet.FieldByName('contractno').AsString)+',';
     qaliq:=qaliq+XDBGrid1.DataSource.DataSet.FieldByName('ekfacticaldebt').AsFloat-kredqaliq;
 //   end;
   end;
     if num='' then
     begin
        ShowMessage('Heç bir depozit seçməmisiniz!');
        exit;
     end;
       if qaliq<ConclusionForm.DBNumberEditEh1.Value then
        begin
          ShowMessage('Qeyd olunmuş depozit və ya depozitlərin qalıq məbləği kreditin məbləğindən azdır!');
          exit;
        end;

         s:=Copy(s,0,LENGTH(s)-1) ;
         num:=Copy(num,0,LENGTH(num)-1) ;
      if MessageDlg(num+' bu nömrəli depozitlər kreditin girovu kimi qəbul olunacaq əminsinizmi!',
      mtConfirmation, [mbYes, mbNo], 0) = mrNO then  Exit;
   DataModuleConcl.CreditPropsDEPOZITIDS.AsString:=s;
   DataModuleConcl.DepAccSet.Close   ;
   DataModuleConcl.DepAccSet.sql[9]:= 'and cont.id in( '+s +')'    ;
   DataModuleConcl.DepAccSet.open   ;
   FrmDepozit.close;
end;

procedure TFrmDepozit.XFSpeedButton3Click(Sender: TObject);
begin
close;
end;

end.
