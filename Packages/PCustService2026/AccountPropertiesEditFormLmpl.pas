unit AccountPropertiesEditFormLmpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XFSCtrls, DBCtrls, Buttons, StdCtrls, Mask, DBCtrlsEh, DBLookupEh,
  ExtCtrls;

type
  TAccountPropertiesEditForm = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label_Symbols: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    SpeedButton1: TSpeedButton;
    Label15: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label1: TLabel;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    DBLookupComboboxEh4: TDBLookupComboboxEh;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Edit_AccName: TEdit;
    Button1: TButton;
    EditAccNo: TEdit;
    DBLookupComboboxEh5: TDBLookupComboboxEh;
    DBLookupComboboxEh6: TDBLookupComboboxEh;
    Edit1: TEdit;
    Edit6: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AccountPropertiesEditForm: TAccountPropertiesEditForm;

implementation

{$R *.dfm}

end.
