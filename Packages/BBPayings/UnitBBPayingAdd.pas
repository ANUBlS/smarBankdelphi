unit UnitBBPayingAdd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, ComCtrls;

type
  TFormBBPayingAdd = class(TForm)
    CBoxContractNum: TDBLookupComboBox;
    CBoxServiceType: TDBLookupComboBox;
    EditAmount: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BtnOK: TButton;
    BtnCancel: TButton;
    DBEditAbonentName: TDBEdit;
    CBoxMethod: TComboBox;
    Label4: TLabel;
    DTPicker: TDateTimePicker;
    Label5: TLabel;
    procedure BtnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBBPayingAdd: TFormBBPayingAdd;

implementation

uses UnitDataModBBPayings;

{$R *.DFM}

procedure TFormBBPayingAdd.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

end.
