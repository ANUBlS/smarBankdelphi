unit frmCustomerImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, StdCtrls, Buttons, DBCtrls, ExtCtrls, Mask, ComCtrls,
  DBCtrlsEh, DBLookupEh;

type
  TCustomer = record
    Name: ShortString;
    ShortName: ShortString;
    OpenDate: TDateTime;
    CloseDate: TDateTime;
    IsResident: Boolean;
    RelationID: Integer;
    GroupID: Integer;
    EstateType: Integer;
    OrganizationType: Integer;
    ActionArea: Integer;
    BranchID: Integer;
    TaxAreaID: Integer; 
    TaxIDString: ShortString;
    BankIDString: ShortString;
    OKPRO: ShortString;
    DATNAL : TDateTime;
    DATUSTAV : TDateTime;
  end;

type
  TfrmCustomer = class(TForm)
    NLSLCust: TNLSLocalizer;
    BitBtnOk: TBitBtn;
    BitBtnCancel: TBitBtn;
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
    ClientClosedCB: TCheckBox;
    ClientClosedPanel: TPanel;
    CloseDateEdit: TDateTimePicker;
    NameEdit: TEdit;
    ShortNameEdit: TEdit;
    OKPOCodeEdit: TEdit;
    TaxIDEdit: TEdit;
    BankIDEdit: TEdit;
    RelationCB: TDBLookupComboboxEh;
    GroupCB: TDBLookupComboboxEh;
    EstateTypeCB: TDBLookupComboboxEh;
    OrganizationTypeCB: TDBLookupComboboxEh;
    ActionAreaCB: TDBLookupComboboxEh;
    BranchCB: TDBLookupComboboxEh;
    TazAreaCB: TDBLookupComboboxEh;
    IsNotResidentCB: TCheckBox;
    DATNALEdit: TDateTimePicker;
    DATUSTAVEdit: TDateTimePicker;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BitBtnOkClick(Sender: TObject);
  private
    procedure add_Customer;
    procedure Apply;
  public
    CustomerID : Integer;
    CustomerName : String;
  end;

var
  frmCustomer: TfrmCustomer;
  Customer : TCustomer;

procedure InitPlugin(S:string);export;

implementation

{$R *.DFM}


uses CommonDecls,DatModCustmerImpl,systemstate;

procedure InitPlugin(S:string);export;
begin
   frmCustomer.ShowModal;
end;

exports
   InitPlugin;

procedure TfrmCustomer.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False
end;

procedure TfrmCustomer.FormKeyPress(Sender: TObject; var Key: Char);
begin
   If ord(Key) = VK_ESCAPE then close
end;

procedure TfrmCustomer.BitBtnCancelClick(Sender: TObject);
begin
  Close
end;

procedure TfrmCustomer.FormCreate(Sender: TObject);
begin
   DatModCustmer := TDatModCustmer.Create(Self);
end;

procedure TfrmCustomer.FormDestroy(Sender: TObject);
begin
   DatModCustmer.Free;
end;

procedure TfrmCustomer.NameEditKeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_RETURN then
     SelectNext(Sender as TWinControl ,True ,True);
//      Key := #0;

end;

procedure TfrmCustomer.FormShow(Sender: TObject);
begin
  NameEdit.SetFocus;
  OpenDateEdit.DateTime := Get_CurrentDate;
end;

procedure TfrmCustomer.add_Customer;
begin
    with DatModCustmer ,cm_credit,Customer do
      begin
       CustomerID := CallIntegerFunction('add_cm_customer',[
      'open_dat',Get_CurrentDate,
      'Name' ,Name,
      'CLOSE_DAT', CloseDate,
      'NEREZIDENT', Integer(IsResident),
      'PRINAD_KOD', RelationID,
      'SHORT_NAME', ShortName,
      'GROUP_KLIE', GroupID,
      'VID_SOB', EstateType,
      'ORG_SOB', OrganizationType,
      'SFERA_DEY', ActionArea,
      'OTRASL', BranchID,
      'NALOG_KOD', TaxAreaID,
      'INN', TaxIDString,
      'BIK', BankIDString,
      'KOD_OKPRO', OKPRO,
      'DAT_NAL', DATNAL,
      'DAT_USTAV', DATUSTAV
      ]);
     CustomerName :=  Name
    end;
end;

procedure TfrmCustomer.Apply;
begin
   with Customer do
   begin
      Name := NameEdit.Text;
      ShortName := ShortNameEdit.Text;
      OpenDate := OpenDateEdit.DateTime;
      CloseDate := CloseDateEdit.DateTime;
      IsResident := IsNotResidentCB.Checked;
      RelationID := RelationCB.ListSource.DataSet.FieldByName('ID').AsInteger;
      GroupID := GroupCB.ListSource.DataSet.FieldByName('ID').AsInteger;
      EstateType := EstateTypeCB.ListSource.DataSet.FieldByName('ID').AsInteger;
      OrganizationType := OrganizationTypeCB.ListSource.DataSet.FieldByName('ID').AsInteger;
      ActionArea := ActionAreaCB.ListSource.DataSet.FieldByName('ID').AsInteger;
      BranchID := BranchCB.ListSource.DataSet.FieldByName('ID').AsInteger;
      TaxAreaID := TazAreaCB.ListSource.DataSet.FieldByName('ID').AsInteger;
      TaxIDString := TaxIDEdit.Text;
      BankIDString := BankIDEdit.Text;
      OKPRO := OKPOCodeEdit.Text;
      DATNAL := DATNALEdit.DateTime;
      DATUSTAV := DATUSTAVEdit.DateTime;
   end;
end;

procedure TfrmCustomer.BitBtnOkClick(Sender: TObject);
begin
try
   Apply;
   add_Customer;
 except
 LogWarning('ּצרעÿנטםטם ÿכאגÿ והטכלÿסט לצלךצם מכלאהû')
end;
 Close;
end;

initialization
    frmCustomer := TfrmCustomer.Create(CommonApplication);
end.
