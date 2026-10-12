unit frmAddEditClpImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ActnList, StdCtrls, Mask, DBCtrlsEh, DBLookupEh,db;

type
  TfrmAddEditClp = class(TForm)
    Panel1: TPanel;
    buttonclose: TButton;
    ButtonCancel: TButton;
    ButtonApply: TButton;
    ActionList1: TActionList;
    ActionInsert: TAction;
    ActionCancel: TAction;
    ActionExit: TAction;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    DBEditEh3: TDBEditEh;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    DBEditEh4: TDBEditEh;
    Label7: TLabel;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ActionInsertExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEditEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBEditEh4KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditClp: TfrmAddEditClp;
  var OperationType :String;
implementation

{$R *.DFM}
uses dmLoanPipeLineReportImpl;

procedure TfrmAddEditClp.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := false;
end;

procedure TfrmAddEditClp.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(Key) = VK_ESCAPE then close
end;

procedure TfrmAddEditClp.ActionInsertExecute(Sender: TObject);
begin
   with dmLoanPipeLineReport,CrdPipeLines do begin
        Post;
        refresh;
        if  OperationType = 'insert' then insert;
        if  OperationType = 'edit' then frmAddEditClp.close;
   end;

end;

procedure TfrmAddEditClp.ActionCancelExecute(Sender: TObject);
begin
   with dmLoanPipeLineReport,CrdPipeLines do
   begin
        Cancel;
        RefreshRecord;
        insert;
   end;
end;

procedure TfrmAddEditClp.ActionExitExecute(Sender: TObject);
begin
   close
end;

procedure TfrmAddEditClp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 with dmLoanPipeLineReport, CrdPipeLines do
  if State in [dsInsert, dsEdit] then
  begin
   Cancel;
   RefreshRecord; 
  end;

end;

procedure TfrmAddEditClp.DBEditEh1KeyPress(Sender: TObject; var Key: Char);
begin


  if ORD(Key) = VK_RETURN then
  if Sender is TWinControl then
  with Sender as TWinControl do   begin
    SelectNext(Sender as TWinControl ,True ,True);
   Key := #0;
  end;

end;

procedure TfrmAddEditClp.DBEditEh4KeyPress(Sender: TObject; var Key: Char);
begin
    if (ord(key)>= 97) and (ord(key)<=122) then
    key:=#0;
    DBEditEh1KeyPress(sender,key);
end;

end.
