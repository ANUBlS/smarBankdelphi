unit UnitCustProps;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, DBCtrls, ExtCtrls, StdCtrls, Mask, ComCtrls, SBCustomer, Db;

type
  TFrmCustProps = class(TForm)
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Bevel1: TBevel;
    Label6: TLabel;
    Label8: TLabel;
    OpenDateEdit: TDateTimePicker;
    OkButton: TButton;
    CancelButton: TButton;
    NameEdit: TDBEdit;
    RelationCB: TDBLookupComboBox;
    GroupCB: TDBLookupComboBox;
    EstateTypeCB: TDBLookupComboBox;
    OrganizationTypeCB: TDBLookupComboBox;
    ActionAreaCB: TDBLookupComboBox;
    BranchCB: TDBLookupComboBox;
    ClientClosedCB: TCheckBox;
    ClientClosedPanel: TPanel;
    CloseDateEdit: TDateTimePicker;
    IsNotResidentCB: TDBCheckBox;
    OKPOCodeEdit: TDBEdit;
    TazAreaCB: TDBLookupComboBox;
    TaxIDEdit: TDBEdit;
    BankIDEdit: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Button1: TButton;
    ActionList1: TActionList;
    InfoView: TAction;
    IpInfoView: TAction;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ClientClosedCBClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FCustomerParams: TCustomer;
    FClientClosed: Boolean;
    FChanged: Boolean;
    procedure SetCustomerParams(Customer: TCustomer);
    property CustomerParams: TCustomer read FCustomerParams write SetCustomerParams;
    procedure SetClientClosed(Value: Boolean);
  public
    { Public declarations }
    procedure Reset;
    function New: Boolean;
    procedure Edit(ID: Integer);
    property ClientClosed: Boolean read FClientClosed write SetClientClosed;
  end;

var
  FrmCustProps: TFrmCustProps;

implementation

{$R *.DFM}

uses CO_datamod_impl, OracleData, SBCore;

function TFrmCustProps.New: Boolean;
begin
  Reset;
  CO_DataMod.Customers.Insert;
  InfoView.Visible := False;
  ShowModal;
  Result := FChanged; 
end;

procedure TFrmCustProps.Edit(ID: Integer);
var
  Customer: TCustomer;
begin
  Reset;
  CO_DataMod.Customers.Edit;
  Sb_GetCustomer(ID, Customer);
  CustomerParams := Customer;
  InfoView.Visible := True;
  ShowModal;
end;

procedure TFrmCustProps.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCustProps.OkButtonClick(Sender: TObject);
begin
 with CO_DataMod.Customers do
  begin
    FChanged := True;
    FieldByName('OPEN_DAT').AsDateTime := OpenDateEdit.DateTime;
    Post;      
    ApplyUpdates([aaInsert, aaUpdate]);
    CommitUpdates;      
  end;
  Close;
end;

procedure TFrmCustProps.Reset;
begin
  FChanged := False;
  OpenDateEdit.DateTime := Sb_GetSystemDate();
  ClientClosed := False;
end;

procedure TFrmCustProps.SetCustomerParams(Customer: TCustomer);
begin
  FCustomerParams := Customer;

  with CustomerParams do
  begin
    OpenDateEdit.DateTime := OpenDate;
    CloseDateEdit.DateTime := CloseDate;
    ClientClosed := CloseDate <> NullDate;

    CO_DataMod.Relation.DataSet.Locate('ID', RelationID, []);
  end;
end;

procedure TFrmCustProps.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with CO_DataMod.Customers do
    if State = dsInsert then
    begin
      Cancel;
      CancelUpdates;
    end;
end;

procedure TFrmCustProps.SetClientClosed(Value: Boolean);
begin
  FClientClosed := Value;
//  ClientClosedPanel.Visible := Value;
  CloseDateEdit.Enabled := Value;
  ClientClosedCB.Checked := Value;
end;

procedure TFrmCustProps.ClientClosedCBClick(Sender: TObject);
begin
  ClientClosed := (Sender as TCheckBox).Checked;
end;

procedure TFrmCustProps.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_RETURN then
    SelectNext(ActiveControl, True, True);
end;

procedure TFrmCustProps.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_ESCAPE then
    Close;
end;

end.
