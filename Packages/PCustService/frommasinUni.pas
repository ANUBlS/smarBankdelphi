unit frommasinUni;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, DB, OracleData;

type
  TFormMasin = class(TForm)
    ods_masin: TOracleDataSet;
    DBGridEh1: TDBGridEh;
    dsrc_masin: TDataSource;
    ods_masinKLI_ID: TFloatField;
    ods_masinNAME: TWideStringField;
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMasin: TFormMasin;

implementation

uses PCustServiceFormImpl1;

{$R *.dfm}

procedure TFormMasin.DBGridEh1DblClick(Sender: TObject);
begin
   PCustServiceForm.editid.Text:=ods_masin.FieldByName('kli_id').AsString;
   close;
end;

end.
