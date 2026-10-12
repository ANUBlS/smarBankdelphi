unit uMsgSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Grids, DBGrids, StdCtrls, ExtCtrls, DBCtrls, Oracle;

type
  TfrmMsgSettings = class(TForm)
    Messages: TDataSource;
    ODSMessages: TOracleDataSet;
    ODSMessagesID: TFloatField;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Users: TDataSource;
    ODSUsers: TOracleDataSet;
    ODSUsersID: TFloatField;
    ODSUsersCTIME: TDateTimeField;
    SB_MSG: TOraclePackage;
    ODSMessagesNAME: TWideStringField;
    ODSMessagesMSG: TWideStringField;
    ODSMessagesUSNAME: TWideStringField;
    ODSUsersNAME: TWideStringField;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMsgSettings: TfrmMsgSettings;

implementation
uses sboapiDataModuleImpl, uMsgAddEdit,SBTranslateProc;
{$R *.DFM}

procedure TfrmMsgSettings.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);

end;

procedure TfrmMsgSettings.FormShow(Sender: TObject);
begin
  ODSMessages.Close;
  ODSMessages.Open;
  ODSUsers.Close;
  ODSUsers.Open;
end;

procedure TfrmMsgSettings.Button1Click(Sender: TObject);
begin
  if not assigned(frmMsgAddEdit) then
    frmMsgAddEdit := TfrmMsgAddEdit.Create(Self);
  with frmMsgAddEdit, ODSMessages do begin
    Insert;
    ShowModal;
  end;
end;

procedure TfrmMsgSettings.Button2Click(Sender: TObject);
begin
  if not assigned(frmMsgAddEdit) then
    frmMsgAddEdit := TfrmMsgAddEdit.Create(Self);
  with frmMsgAddEdit, ODSMessages do begin
    Edit;
    ShowModal;
  end;
end;

procedure TfrmMsgSettings.Button3Click(Sender: TObject);
begin
  SB_MSG.CallProcedure('deletemsgtype',[ODSMessagesID.AsVariant]);
  
  ODSMessages.Close;
  ODSMessages.Open;
end;

end.
