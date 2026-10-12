unit CableManServAddEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, CurrencyEdit, OracleData, ComCtrls, Buttons;

type
  TfrmServAddEdit = class(TForm)
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Button1: TButton;
    Button2: TButton;
    Label4: TLabel;
    cbMeth: TComboBox;
    Label5: TLabel;
    tpTime: TDateTimePicker;
    CBoxFrmAnthrAcc: TDBLookupComboBox;
    ChBoxFrmAnthrAcc: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ChBoxFrmAnthrAccClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmServAddEdit: TfrmServAddEdit;

implementation

uses CableManDataModuleImpl;

{$R *.DFM}

procedure TfrmServAddEdit.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  with DataModCable do begin
    for i:=0 to componentcount-1 do
      if (components[i] is toracledataset )and (components[i].tag=2 )then
        (components[i] as toracledataset).open;
  end;

  ChBoxFrmAnthrAcc.Checked :=false;
  CBoxFrmAnthrAcc.Enabled :=false;
end;

procedure TfrmServAddEdit.ChBoxFrmAnthrAccClick(Sender: TObject);
begin
  if ChBoxFrmAnthrAcc.Checked then begin
   CBoxFrmAnthrAcc.Enabled := true;
  end {if ChBoxFrmAnthrAcc.Checked}
  else begin
   CBoxFrmAnthrAcc.Enabled := false;
  end; {else if ChBoxFrmAnthrAcc.Checked}
end;

end.
