unit mainImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  Buttons, StdCtrls, CMCurrencyEdit, Mask, DBCtrls, ExtCtrls, Db,
  OracleData, ComCtrls, Oracle, Grids, DBGridEh, ToolWin, ImgList,
  ActnList,  CMExcelExport, DBGridEhGrouping, GridsEh;

type
  TMainforum = class(TForm)
    CMExcelExport1: TCMExcelExport;
    ImageList1: TImageList;
    Panel4: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    DBGridEh1: TDBGridEh;
    StatusBar1: TStatusBar;
    DataSource1: TDataSource;
    OracleDataSet1: TOracleDataSet;
    OracleDataSet1ID: TFloatField;
    OracleDataSet1CREDITID: TFloatField;
    OracleDataSet1DAT: TDateTimeField;
    OracleDataSet1AMOUNT: TFloatField;
    OracleDataSet1TRID: TFloatField;
    ToolButton4: TToolButton;
    OracleDataSet1stat: TWideStringField;
    OracleDataSet1STATUS: TFloatField;
    OracleDataSet1TEXT: TWideStringField;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormCreate(Sender: TObject);

    procedure SpeedButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure OracleDataSet1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Mainforum: TMainforum;
  dd:integer;
 procedure InitPlugin(s:string);export;
implementation
 uses   CommonDecls ,sboapiDataModuleImpl,addimpl, DueIntFormImpl;
{$R *.DFM}
var
  RefreshAfterClose : Boolean;
procedure InitPlugin(s:string);export;

var Crd_id ,
    Cust_id ,
    Curr_id ,
    Br_id ,
    Cat_id : Integer;
    Crd_num ,
    Val_name : string;

begin
    Crd_id := Get_SelectedCrdID;

      with AddForm.OracleDataSet1 do
      begin
         if Active then Close;
         SetVariable('crid',Crd_id);
           Open;
      Cust_id := FieldByName('Boorowerid').AsInteger;
      Curr_id := FieldByName('currency').AsInteger;
      Br_id := FieldByName('branchid').AsInteger;
      Cat_id := FieldByName('customertype').AsInteger;
       end;

       with AddForm.InterestInfo do
      begin
         if Active then Close;
         SetVariable('Crdid',Crd_id);;
         Open;
         dd := FieldByName('d').asinteger;
      end;

   if dd=2  then   begin
  AddForm.Label1.caption:='Bk faiz hesabı';
  AddForm.Label2.caption:='Bk faiz gəlir hesabı';
           with  AddForm.OutIntIncomeAccounts do
      begin
         if Active then Close;
         SetVariable('CurrID',Curr_id);
         SetVariable('BrID',br_id);
         SetVariable('CatID',Cat_id);
         Open;
     AddForm.DBEdit2.DataSource:=AddForm.OutIntIncomeDatSrc ;
     AddForm.DBEdit2.DataField:='ACC_NO';
      end;
        with AddForm.OutInterestsAccounts do
      begin
         if Active then Close;
         SetVariable('CrdID',Crd_id);
         Open;
      AddForm.DBEdit1.DataSource:=AddForm.OutInterestsDatSrc ;
      AddForm.DBEdit1.DataField:='ACC_NO';
      end;
   end else
 begin
   with AddForm.InterestsAccounts do
      begin
         if Active then Close;
         SetVariable('CurrID',Curr_id);
         SetVariable('BrID',br_id);
         SetVariable('CatID',Cat_id);
         Open;
      AddForm.DBEdit2.DataSource:=AddForm.IntAccDatSrc ;
      AddForm.DBEdit2.DataField:='ACC_NO';
      DueIntForm.DBEdit2.DataSource:=AddForm.IntAccDatSrc ;
      DueIntForm.DBEdit2.DataField:='ACC_NO';
      end;
     with AddForm.CustIntAccounts do
      begin
         if Active then Close;
         SetVariable('CrdID',Crd_id);
         Open;
     AddForm.DBEdit1.DataSource:=AddForm.CustIntAccDatSrc ;
     AddForm.DBEdit1.DataField:='ACC_NO';
       end;
   with AddForm.CustDIntAccounts do
      begin
         if Active then Close;
         SetVariable('CrdID',Crd_id);
         Open;
     DueIntForm.DBEdit1.DataSource:=AddForm.CustDIntAccDatSrc ;
     DueIntForm.DBEdit1.DataField:='ACC_NO';
       end;
  end;
   Mainforum.ShowModal;
end;
exports
     InitPlugin;


procedure TMainforum.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=false
end;

procedure TMainforum.FormCreate(Sender: TObject);
begin
  addform :=  Taddform.Create(Self);
   DueIntForm:=TDueIntForm.Create(self);
 
//DateTimePicker1.DateTime:=sysdat.fieldbyname('tek_dat').asdatetime;
end;
 procedure TMainforum.SpeedButton3Click(Sender: TObject);
begin
close;
end;

procedure TMainforum.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if RefreshAfterClose then
    SafeRefresh(True,rmLocateAfterRefresh);
end;

procedure TMainforum.ToolButton7Click(Sender: TObject);
begin
close
end;

procedure TMainforum.ToolButton1Click(Sender: TObject);
begin
RefreshAfterClose:=true ;
addform.showmodal;
end;

procedure TMainforum.ToolButton3Click(Sender: TObject);
resourcestring
  rsConfirmTrancheDelete = '!Əminsiniz?';
  
var
  TrancheID : Integer;
begin

  if MessageDlg(
       rsConfirmTrancheDelete,
       mtConfirmation,
       [mbYes,mbNo],
       0) <> mrYes
     then   Exit;
     
  with addform do
  begin
    TrancheID := Mainforum.OracleDataSet1.FieldByName('ID').AsInteger;
    with OraclePackage1 do
    CallProcedure('Delete_laz',[
      'p_ID',TrancheID,
      'p_stopcalc' ,dd
    ]);
  //   showmessage(inttostr(TrancheID)) ;
    Mainforum.OracleDataSet1.Refresh;

    RefreshAfterClose := True;
  end;



end;

procedure TMainforum.FormShow(Sender: TObject);
begin
 with OracleDataSet1 do
      begin
         if Active then Close;
         SetVariable('crid',Get_SelectedCrdID);
         Open;
  // OBSMainForm.CusiIntacc.KeyValue :=  FieldByName('ID').AsInteger;
      end;
end;

procedure TMainforum.OracleDataSet1CalcFields(DataSet: TDataSet);
begin
if OracleDataSet1STATUS.AsInteger=1 then
OracleDataSet1stat.AsString:='Faiz' ;
if OracleDataSet1STATUS.AsInteger=2 then
OracleDataSet1stat.AsString:='Gec faiz'

end;

procedure TMainforum.ToolButton4Click(Sender: TObject);
begin

DueIntForm.ShowModal

end;

initialization
 Mainforum := TMainforum.Create(CommonApplication);
end.
