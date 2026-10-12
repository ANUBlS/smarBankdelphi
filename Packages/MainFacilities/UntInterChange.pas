 unit UntInterChange;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids,db, ExtCtrls, Buttons, ComCtrls;

type
  TFrmInterChange = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Memo1: TMemo;
    GroupBox2: TGroupBox;
    Edit2: TEdit;
    GroupBox3: TGroupBox;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    ComboBox1: TComboBox;
    SpeedButton4: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DTPChange: TDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  RateID             : Array of integer;
  RateName           : Array of string;
  RateInventar       : Array of string;
  RateBalancePrice   : Array of integer;
  ChangedBalancePrice:integer;
  index              : Integer;
  AddChanged         : Boolean;
  CopyOff            : Boolean; 
  GroupID            : Integer;
  ChangedName        : String;
  sum                : Longint;
  end;

var
  FrmInterChange: TFrmInterChange;
implementation

uses MFDataModule, UntAddWares, UntMainFacilitiesImpl, UntRptMainF,
  UntDelWares;

{$R *.DFM}



procedure TFrmInterChange.FormCreate(Sender: TObject);
begin
 index:=0;
 sum:=0;
 Memo1.Lines.Clear;
 ComboBox1.Clear;
 With MainFDataModule.ViewGroup do
 begin
  Open;
  First;
  While not EOF do
   begin
    ComboBox1.Items.Add(FieldByName('Name').AsString);
    Next;
   end;
 end;
 with MainFDataModule.ODSInterChange do
  begin
   Open;
   SetLength(RateID,RecordCount);
   SetLength(RateName,RecordCount);
   SetLength(RateInventar,RecordCount);
   SetLength(RateBalancePrice,RecordCount);
  First;
 end;
end;


procedure TFrmInterChange.BitBtn2Click(Sender: TObject);
begin
 Close;
end;

procedure TFrmInterChange.DBGrid1CellClick(Column: TColumn);
var
   str:string;
Begin
if MessageDlg('Do you want to change this commodity?',mtConfirmation,mbYesNoCancel,0)=mrYes then
begin
 str:=MainFDataModule.ODSInterChange.FieldByName('name').AsString;
 Memo1.Lines.Add(str);
 CopyOff:=True;
 if not assigned(RateID)then
  begin
   SetLength(RateID,MainFDataModule.ODSInterChange.RecordCount);
   SetLength(RateName,MainFDataModule.ODSInterChange.RecordCount);
   SetLength(RateInventar,MainFDataModule.ODSInterChange.RecordCount);
   SetLength(RateBalancePrice,MainFDataModule.ODSInterChange.RecordCount);
   index:=0;
   RateID[index]:=MainFDataModule.ODSInterChange.FieldByName('ID').AsInteger;
   RateName[index]:=MainFDataModule.ODSInterChange.FieldByName('NAME').AsString;
   RateInventar[index]:=MainFDataModule.ODSInterChange.FieldByName('INVENTAR').AsString;
   RateBalancePrice[index]:=MainFDataModule.ODSInterChange.FieldByName('BALANCE_PRICE').AsInteger;
   FrmDelWares.ShowModal;
   sum:=sum+RateBalancePrice[index];
   Inc(index);
  end
 else
  begin
   RateID[index]:=MainFDataModule.ODSInterChange.FieldByName('ID').AsInteger;
   RateName[index]:=MainFDataModule.ODSInterChange.FieldByName('NAME').AsString;
   RateInventar[index]:=MainFDataModule.ODSInterChange.FieldByName('INVENTAR').AsString;
   RateBalancePrice[index]:=MainFDataModule.ODSInterChange.FieldByName('BALANCE_PRICE').AsInteger;
   sum:=sum+RateBalancePrice[index];
   Inc(index);
   FrmDelWares.ShowModal;
  end;
end;
End;

procedure TFrmInterChange.BitBtn1Click(Sender: TObject);
var
  i:integer;
begin
if MessageDlg('CHANGE?',mtConfirmation,mbYesNoCancel,0)=mrYes then
MainFacilities.PushKey:=1;
AddChanged:=True;
FrmAddWares.ShowModal;
MainFDataModule.ODSWaresID.Open;
for i:=0 to index-1 do
 MainFDataModule.OPViewWares.CallProcedure('delete_wares',[RateID[i]]);// Copy off commodity
MainFDataModule.ViewWares.Refresh;
MainFDataModule.ODSInterChange.Refresh;
SetLength(RateID,0);
SetLength(RateName,0);
SetLength(RateInventar,0);
Memo1.Lines.Clear;
MainFDataModule.ODSWaresID.Close;
end;

procedure TFrmInterChange.FormActivate(Sender: TObject);
begin
 sum:=0;
 MainFDataModule.ODSInterChange.Refresh;
 DTPChange.DateTime:=now; 
end;

procedure TFrmInterChange.ComboBox1Change(Sender: TObject);
begin
with MainFDataModule.ODSTakeGroupID do
begin
Close;
SetVariable('Gname',ComboBox1.Text);
Open;
GroupID:=FieldByName('ID').AsInteger;
end;
end;

procedure TFrmInterChange.SpeedButton1Click(Sender: TObject);
var
  i,j:integer;
  D:TDateTime;
  TakenID,TakenName,TakenInventar:string;
begin
if MessageDlg('CHANGE?',mtConfirmation,mbYesNoCancel,0)=mrYes then
Begin
 if Edit1.Text='' then
     Edit1.Text:='0'
 else
     sum:=sum+StrToInt(Edit1.Text);

 if Edit3.Text='' then
     Edit3.Text:='0'
 else
     sum:=sum-StrToInt(Edit3.Text);
 AddChanged:=True;
 if ComboBox1.Text='' then
  begin
   ShowMessage('Show the group!');
   Abort;
  end;
 D:=Trunc(DTPChange.DateTime);
 MainFacilities.PushKey:=1;
 ChangedName:=Edit2.Text;
 FrmAddWares.ShowModal;
 MainFDataModule.ODSWaresID.Open;
 TakenID:=MainFDataModule.ODSWaresID.FieldByName('ID').AsString;
 TakenName:=MainFDataModule.ODSWaresID.FieldByName('Name').AsString;
 TakenInventar:=MainFDataModule.ODSWaresID.FieldByName('Inventar').AsString;
 For i:=0 to index-1 do
 begin
  MainFDataModule.OPViewWares.CallProcedure('add_interchange',[RateID[i],RateName[i],RateInventar[i],StrToInt(Edit1.Text),
                                                              TakenID,TakenName,TakenInventar,StrToInt(Edit3.Text),D]);
  MainFDataModule.OPViewWares.CallProcedure('delete_wares',[RateID[i]]);// Copy off commodity
 end;
 MainFDataModule.ViewWares.Refresh;
 MainFDataModule.ODSInterChange.Refresh;
 SetLength(RateID,0);
 SetLength(RateName,0);
 SetLength(RateInventar,0);
 SetLength(RateBalancePrice,0);
 Memo1.Lines.Clear;
 MainFDataModule.ODSChangeArchive.Refresh;
 MainFDataModule.ODSWaresID.Close;
 for j:=0 to ComponentCount-1 do
  if(Components[j] is TEdit) then
     (Components[j] as TEdit).Text:='';
  sum:=0;
  Close;
end;
end;

procedure TFrmInterChange.SpeedButton4Click(Sender: TObject);
begin
 SetLength(RateID,0);
 SetLength(RateName,0);
 SetLength(RateInventar,0);
 SetLength(RateBalancePrice,0);
 Memo1.Lines.Clear;
 Close;
end;

procedure TFrmInterChange.SpeedButton7Click(Sender: TObject);
begin
MainFDataModule.ODSChangeArchive.Refresh;
//RptMainFacilities.Preview;
end;

end.


