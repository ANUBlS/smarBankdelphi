unit UProceses;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Oracle;

type
  TfmProceses = class(TForm)
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    BitBtn2: TBitBtn;
    cbPolNum: TCheckBox;
    cbAccounts: TCheckBox;
    cbTransactions: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmProceses: TfmProceses;

implementation

uses UMKPolicyImpl;

{$R *.DFM}

procedure TfmProceses.BitBtn1Click(Sender: TObject);
begin
    with fmMKPolicy, ODSReport, OPMKKASCO do begin
      ODSReport.SetVariable('CID', CID);
      Open;
     try
        CallBooleanFunction('buildpolice', [CID,
                                            cbPolNum.Checked,
                                            cbAccounts.Checked,
                                            cbTransactions.Checked]);
      except
        on E : EOracleError do begin
           ShowMessage(E.Message);
           Abort;
        end;
      end;
      //MessageDlg('Emeliyyat kecirildi.', mtInformation, [mbOK], 0);
      Close;
    end;
    ModalResult := mrOk
end;

end.
