unit mainImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, CMCurrencyEdit, Mask, DBCtrls, ExtCtrls, Db,
  OracleData, ComCtrls, Oracle;

type
  TMainforum = class(TForm)
    Panel2: TPanel;
    Image1: TImage;
    Label2: TLabel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    CMCurrencyEdit1: TCMCurrencyEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    InterestsAccounts: TOracleDataSet;
    IntAccDatSrc: TDataSource;
    CustIntAccounts: TOracleDataSet;
    CustIntAccDatSrc: TDataSource;
    OracleDataSet1: TOracleDataSet;
    OraclePackage1: TOraclePackage;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Mainforum: TMainforum;
 procedure InitPlugin(s:string);export;
implementation
 uses   CommonDecls ,CMOracleAPIDataModuleImpl;
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
    IntStopDate :TDateTime;
begin
    Crd_id := Get_SelectedCrdID;
     with Mainforum.OracleDataSet1 do
      begin
         if Active then Close;
         SetVariable('crid',Crd_id);
           Open;
      Cust_id := FieldByName('Boorowerid').AsInteger;
      Curr_id := FieldByName('currency').AsInteger;
      Br_id := FieldByName('branchid').AsInteger;
      Cat_id := FieldByName('customertype').AsInteger;
       end;
   with Mainforum.InterestsAccounts do
      begin
         if Active then Close;
         SetVariable('CurrID',Curr_id);
         SetVariable('BrID',br_id);
         SetVariable('CatID',Cat_id);
         Open;
      end;
     with Mainforum.CustIntAccounts do
      begin
         if Active then Close;
         SetVariable('CrdID',Crd_id);
         Open;
  // OBSMainForm.CusiIntacc.KeyValue :=  FieldByName('ID').AsInteger;
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

//DateTimePicker1.DateTime:=sysdat.fieldbyname('tek_dat').asdatetime;
end;

procedure TMainforum.SpeedButton1Click(Sender: TObject);
resourcestring
  rsTransactionsWillProcessed = 'Фаизлярин Б.К-да отуздурмаг ...';
var
  CommitTr : Boolean;
begin

OraclePackage1.CallProcedure('AdditionTrance',[
     'p_ID' ,Get_SelectedCrdID ,
     'p_ammount' ,CMCurrencyEdit1.value,
     'p_debidid' ,CustIntAccounts.fieldbyname('id').asinteger,
     'p_creditid',InterestsAccounts.fieldbyname('id').asinteger,
     'p_status',0]);

  try

    CommitTr := TrDelayed_Show(Self,rsTransactionsWillProcessed);

    Update;


    OraclePackage1.CallProcedure('CommitTr',[
       'DefCommit' , CommitTr
    ]);

  except


    OraclePackage1.CallProcedure('CommitTr',[
       'DefCommit' , False
    ]);

    raise;
   end;
   close
end;

procedure TMainforum.SpeedButton2Click(Sender: TObject);
resourcestring
  rsTransactionsWillProcessed = 'Фаиз  ...';
var
  CommitTr : Boolean;
begin

OraclePackage1.CallProcedure('AdditionTrance',[
     'p_ID' ,Get_SelectedCrdID ,
     'p_ammount' ,CMCurrencyEdit1.value,
     'p_debidid' ,CustIntAccounts.fieldbyname('id').asinteger,
     'p_creditid',InterestsAccounts.fieldbyname('id').asinteger,
     'p_status',1]);

  try

    CommitTr := TrDelayed_Show(Self,rsTransactionsWillProcessed);

    Update;


    OraclePackage1.CallProcedure('CommitTr',[
       'DefCommit' , CommitTr
    ]);

  except


    OraclePackage1.CallProcedure('CommitTr',[
       'DefCommit' , False
    ]);
    raise;
  end;
  close
end;

procedure TMainforum.SpeedButton3Click(Sender: TObject);
begin
close;
end;

procedure TMainforum.FormClose(Sender: TObject; var Action: TCloseAction);
begin
CMCurrencyEdit1.Value:=0;
  if RefreshAfterClose then
    SafeRefresh(True,rmLocateAfterRefresh);
end;

initialization
 Mainforum := TMainforum.Create(CommonApplication);
end.
