unit Unit155;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Grids, DBGrids, NLSLocalizer;

type
  TPROVS = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    NLSLocalizer1: TNLSLocalizer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PROVS: TPROVS;

implementation

uses U9, applicationpas, atmendpos, balans, balhs, banksettings, CARDS_TLB,
  cfilepas, comp, crdtype, creditinfopas, customers, datclose, domesticbank,
  dpforms, filialaccounts, MAINFORMImpl1, newcard, payment, poscomission,
  rezform, setac, sms, Unit18, UnitDxxx, Unitintfile, UnitRvisa,SBTranslateProc,sboapiDataModuleImpl;

{$R *.DFM}

procedure TPROVS.Button1Click(Sender: TObject);
begin
DataMod_CARDS.mainpacket.CallProcedure('insert_noprovs',[edit1.text]);
DataMod_CARDS.noprov.Refresh;
end;

procedure TPROVS.Button2Click(Sender: TObject);
begin
//DataMod_CARDS.noprov.Edit;

DataMod_CARDS.noprov.Delete;
DataMod_CARDS.noprov.Session.Commit;
DataMod_CARDS.noprov.Refresh;
end;

procedure TPROVS.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

end.
