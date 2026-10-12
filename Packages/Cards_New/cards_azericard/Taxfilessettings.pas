unit Taxfilessettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, SearchEdit, DBCtrls, Buttons, ExtCtrls, Grids, DBGrids;

type
  TRbsTaxFileAccsett = class(TForm)
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    filialcombo: TDBLookupComboBox;
    Label11: TLabel;
    Label2: TLabel;
    Searchtax1: TSearchEdit;
    Searchtax10: TSearchEdit;
    Label3: TLabel;
    Searchtax18: TSearchEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    valutecombo: TDBLookupComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure valutecomboCloseUp(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RbsTaxFileAccsett: TRbsTaxFileAccsett;

implementation

uses Unit18;

{$R *.dfm}

procedure TRbsTaxFileAccsett.BitBtn1Click(Sender: TObject);
begin

DataMod_CARDS.mainpacket.CallProcedure('rbs_tax_acc_settings',[filialcombo.KeyValue,
                                                          valutecombo.KeyValue,
                                                          Searchtax1.Text,
                                                          Searchtax10.Text,
                                                          Searchtax18.Text]);

dBGrid1.DataSource.DataSet.Close;
dBGrid1.DataSource.DataSet.open;
end;

procedure TRbsTaxFileAccsett.BitBtn2Click(Sender: TObject);
begin
if MessageDlg('Seçilmiş sətir silinsin?',mtinformation,[mbyes,mbno],0)=mryes then

//DataMod_CARDS.mainpacket.CallProcedure('deletefilial',[DataMod_CARDS.filialaccount.fieldbyname('id').asinteger]);
begin
DataMod_CARDS.rbs_tax_accounts.Delete;
DataMod_CARDS.rbs_tax_accounts.Session.commit;
DataMod_CARDS.rbs_tax_accounts.Close;
DataMod_CARDS.rbs_tax_accounts.Open;
end;

end;
procedure TRbsTaxFileAccsett.FormActivate(Sender: TObject);
begin
dBGrid1.DataSource.DataSet.Close;
dBGrid1.DataSource.DataSet.open;
end;

procedure TRbsTaxFileAccsett.valutecomboCloseUp(Sender: TObject);
begin
DataMod_CARDS.rbs_tax_accounts.Close;
 DataMod_CARDS.rbs_tax_accounts.SetVariable('fil',filialcombo.KeyValue);
DataMod_CARDS.rbs_tax_accounts.SetVariable('valu',valutecombo.KeyValue);
DataMod_CARDS.rbs_tax_accounts.Open;
end;

end.
