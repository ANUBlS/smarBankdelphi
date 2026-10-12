unit UnitForeignCurrency;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, CMCurrencyEdit, DBCtrls;

type
  TFormForeignCurrency = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBLCBAccount: TDBLookupComboBox;
    Label1: TLabel;
    Panel3: TPanel;
    CmCurForeginEdit: TCMCurrencyEdit;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Panel4: TPanel;
    DBLCBCountry: TDBLookupComboBox;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormForeignCurrency: TFormForeignCurrency;

implementation
uses UnitPaymentsCredit,ExpressDecls, ExpDataModuleUnit;

{$R *.dfm}

procedure TFormForeignCurrency.Button1Click(Sender: TObject);
begin
  if DBLCBAccount.Text='' then begin
                                      ShowMessage('Hesabın adı sahəsi seçilməyib!');
                                      exit;
                                    end;
  if CmCurForeginEdit.text='0.00' then begin
                                       ShowMessage('Məbləğ sahəsi doldurulmayıb!');
                                       exit;
                                     end;

  ExpressVariables.doc_country:=DBLCBCountry.KeyValue;
  ExpressVariables.Fc_accid:=DBLCBAccount.KeyValue;
  ExpressVariables.Fc_amount:=CmCurForeginEdit.Value;
  Close;
end;

procedure TFormForeignCurrency.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormForeignCurrency.FormShow(Sender: TObject);
begin
  WIth FormPaymentsCredit do
  begin
    ODSAccNo.Close;
    ODSAccNo.Open;
    ODSCountry.Close;
    ODSCountry.Open;
    if FForm=0 then
    begin
      DBLCBCountry.KeyValue:=-1;
      DBLCBAccount.KeyValue:=-1;
      CmCurForeginEdit.Text:='0.00';
    end
    else
    begin
      DBLCBCountry.KeyValue:=ExpDataModule.ExpBatchsDataSetCOUNTRYID.AsInteger;
      DBLCBAccount.KeyValue:=ExpDataModule.ExpBatchsDataSetDEBETACCID.AsInteger;
      CmCurForeginEdit.Text:=ExpDataModule.ExpBatchsDataSetCOMISSIONAMOUNT.AsString;
    end;
  end;
end;

end.
