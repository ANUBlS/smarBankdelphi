unit CableContractsAddEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, CurrencyEdit, ComCtrls, OracleData, Buttons;

type
  TfrmContractAddEdit = class(TForm)
    lbcontract_num: TLabel;
    lbcard_num: TLabel;
    lbinst_date: TLabel;
    lbinst_place: TLabel;
    lbserie: TLabel;
    lbworks_num: TLabel;
    lbreceiver_num: TLabel;
    lbcable_length: TLabel;
    lbamount: TLabel;
    lbcurr_code: TLabel;
    lbdiscount: TLabel;
    lbeng_id: TLabel;
    lbpack_num: TLabel;
    Label1: TLabel;
    edcontract_num: TEdit;
    edcard_num: TEdit;
    edinst_date: TDateTimePicker;
    edinst_place: TComboBox;
    edserie: TEdit;
    edworks_num: TEdit;
    edreceiver_num: TEdit;
    edcable_length: TEdit;
    edamount: TCurrencyEdit;
    edcurr_code: TDBLookupComboBox;
    eddiscount: TEdit;
    edeng_id: TDBLookupComboBox;
    edpack_num: TDBLookupComboBox;
    Button1: TButton;
    Button2: TButton;
    edAcc_ID: TDBLookupComboBox;
    Abonent: TLabel;
    edabn_id: TDBLookupComboBox;
    edCalcAg: TCheckBox;
    Label2: TLabel;
    edDiscDesc: TEdit;
    Label3: TLabel;
    edexp_date: TDateTimePicker;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure edpack_numCloseUp(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContractAddEdit: TfrmContractAddEdit;

implementation

uses DataModCableContr, CableContAccsImpl;

{$R *.DFM}

procedure TfrmContractAddEdit.FormCreate(Sender: TObject);
var
 i: Integer;
begin
  for i:=0 to DataModC.componentcount-1 do
    if (DataModC.components[i] is toracledataset )and (DataModC.components[i].tag=2 )then begin
      (DataModC.components[i] as toracledataset).open;
    end;
end;

procedure TfrmContractAddEdit.edpack_numCloseUp(Sender: TObject);
begin      
  edamount.value := (Sender as TDBLookupComboBox).ListSource.DataSet.Fields[2].AsCurrency+
  (Sender as TDBLookupComboBox).ListSource.DataSet.Fields[4].AsCurrency;
end;

procedure TfrmContractAddEdit.SpeedButton1Click(Sender: TObject);
var
  AcID: Integer;
begin
  if not assigned(frmAcc) then
    frmAcc := TfrmAcc.Create(Self);
  with DataModC, frmAcc do begin
    if ShowModal=1 then begin
      AcID :=
      CABLE.CallIntegerFunction('open_account', [AccNoEdit.Text,
                                                 odsAbonents.Fields[1].AsString,
                                                 odsValutes.Fields[0].AsInteger]);
      odsAccs.Close;
      odsAccs.Open;
      odsAccs.Locate('ID', AcID,[]);
      edAcc_ID.KeyValue := AcID;
    end;
  end;
end;

end.
