unit CableManAddEditImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, OracleData, ComCtrls, ExtCtrls, Buttons;

type
  TfrmAbonAddEdit = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    edName: TEdit;
    edReg: TDateTimePicker;
    edDocType: TDBLookupComboBox;
    edDoc: TEdit;
    edAddr: TEdit;
    edPhon: TEdit;
    edWPhon: TEdit;
    edAccRoof: TCheckBox;
    edSignal: TCheckBox;
    edReciever: TEdit;
    edEngTime: TDateTimePicker;
    edEngineer: TDBLookupComboBox;
    edDone: TDateTimePicker;
    edVAT: TCheckBox;
    edStatus: TDBLookupComboBox;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    edMobPhone: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    ChBoxForeigner: TCheckBox;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbonAddEdit: TfrmAbonAddEdit;

implementation

uses CableManDataModuleImpl;

{$R *.DFM}

procedure TfrmAbonAddEdit.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  with DataModCable do begin
    for i:=0 to componentcount-1 do
      if (components[i] is toracledataset )and (components[i].tag=2 )then
        (components[i] as toracledataset).open;
  end;
end;

end.
