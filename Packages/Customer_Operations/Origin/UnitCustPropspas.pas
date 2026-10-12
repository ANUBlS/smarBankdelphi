unit UnitCustPropspas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, DBCtrls, ExtCtrls, StdCtrls, Mask, ComCtrls;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCustProps: TFrmCustProps;

implementation

{$R *.DFM}

end.
