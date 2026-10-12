unit uMainIM2YMImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  Db, OracleData, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, Oracle,
  CMCurrencyEdit, DBCtrls, ExtCtrls;

type
  TfrmIM2YMMain = class(TForm)
    ODSIMs: TOracleDataSet;
    ODSIMsNUMBEROFCREDIT: TStringField;
    ODSYMs: TOracleDataSet;
    StringField1: TStringField;
    ims: TDataSource;
    yms: TDataSource;
    ODSIMsID: TFloatField;
    ODSYMsID: TFloatField;
    cm_im2ym: TOraclePackage;
    ODSYMsNAME: TStringField;
    ODSIMsNAME: TStringField;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    Label4: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    edAmt: TCMCurrencyEdit;
    Button1: TButton;
    Button2: TButton;
    lb1: TLabel;
    lb2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBLookupComboboxEh2CloseUp(Sender: TObject; Accept: Boolean);
    procedure DBLookupComboboxEh3CloseUp(Sender: TObject; Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIM2YMMain: TfrmIM2YMMain;

procedure InitPlugin(S : String); export;

implementation

{$R *.DFM}

uses CommonDecls,cmoracleapidatamoduleimpl;

procedure InitPlugin(S : String); export;
begin
  frmIM2YMMain.ShowModal;
end;

exports
  InitPlugin;

procedure TfrmIM2YMMain.Button1Click(Sender: TObject);
begin
  if MessageDlg('ям€лиййатлар апарылсын?',mtInformation,[mbyes, mbno],0)=idno then exit;
  try
    cm_im2ym.CallProcedure('convertim2ym',
    [ODSIMsID.Value, ODSYMsID.Value, edAMt.Value]
    );
    LogInformation('ям€лиййатлар апарылды');
  except
    LogError('ям€лиййатлар апарылmaды');
  end;
end;

procedure TfrmIM2YMMain.FormCreate(Sender: TObject);
begin
  ODSIMs.Open;
  ODSYMs.Open;
end;

procedure TfrmIM2YMMain.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmIM2YMMain.DBLookupComboboxEh2CloseUp(Sender: TObject;
  Accept: Boolean);
begin
  lb1.Caption := ODSIMsNAME.AsString;
end;

procedure TfrmIM2YMMain.DBLookupComboboxEh3CloseUp(Sender: TObject;
  Accept: Boolean);
begin
  lb2.Caption := ODSYMsNAME.AsString;
end;

initialization
  frmIM2YMMain := TfrmIM2YMMain.Create(CommonApplication);

end.
