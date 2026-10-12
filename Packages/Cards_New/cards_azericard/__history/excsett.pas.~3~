unit excsett;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, dblookup, CMDBSearchEdit, ExtCtrls, Grids, DBGrids,
  DBCtrls, SearchEdit;

type
  TExchangesettings = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    contract_num: TEdit;
    nameofatm: TEdit;
    BitBtn1: TBitBtn;
    filialcombo: TDBLookupComboBox;
    BitBtn2: TBitBtn;
    Searchatmazn: TSearchEdit;
    Searchvdmazn: TSearchEdit;
    Searchvdmusd: TSearchEdit;
    Searchatmusd: TSearchEdit;
    Searchvdmeur: TSearchEdit;
    Searchatmeur: TSearchEdit;
    Searchvdmincome: TSearchEdit;
    Searchara: TSearchEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure filialcomboCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Exchangesettings: TExchangesettings;



implementation

uses Unit18,SBTranslateProc,sboapiDataModuleImpl;

{$R *.dfm}

procedure TExchangesettings.BitBtn1Click(Sender: TObject);
begin
//showMessage(inttostr(DBLookupaznatm.KeyValue));

DataMod_CARDS.mainpacket.CallProcedure('addexchangeacc',[Searchatmazn.text,
                                                          Searchvdmazn.text,
                                                          Searchatmusd.text,
                                                          Searchvdmusd.text,
                                                          Searchatmeur.text,
                                                          Searchvdmeur.text,
                                                          filialcombo.KeyValue,
                                                          Searchara.text,
                                                          Searchvdmincome.text,
                                                          contract_num.text,
                                                          nameofatm.Text]);

DBGrid1.DataSource.DataSet.Refresh;


end;

procedure TExchangesettings.filialcomboCloseUp(Sender: TObject);
begin
 DataMod_CARDS.exchange_acc.Close;
  DataMod_CARDS.exchange_acc.SetVariable('fil',filialcombo.KeyValue);
  DataMod_CARDS.exchange_acc.open;
end;

procedure TExchangesettings.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
DataMod_CARDS.filial.Open;
DBGrid1.DataSource.DataSet.Open;

end;

end.
