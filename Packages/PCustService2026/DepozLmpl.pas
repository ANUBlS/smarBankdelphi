unit DepozLmpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  LDialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, XFSCtrls, XDBGrids,
  DBGridEhGrouping, GridsEh;

type
  TDepozitFrm = class(TForm)
    XFPanel1: TXFPanel;
    TimerButton: TXFButton;
    XFButton1: TXFButton;
    XFButton4: TXFButton;
    XFButton2: TXFButton;
    XFButton3: TXFButton;
    MainGrid: TXDBGrid;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure XFButton4Click(Sender: TObject);
    procedure XFButton1Click(Sender: TObject);
    procedure XFButton2Click(Sender: TObject);
    procedure TimerButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MainGridTitleClick(Column: TXColumn);
    procedure XFButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DepozitFrm: TDepozitFrm;

implementation

uses UnitDataModPCustService,PCustServiceFormImpl1, Newcommondeclsimpl,SBTranslateProc, sboapiDataModuleImpl;
{$R *.dfm}

procedure TDepozitFrm.FormCreate(Sender: TObject);
begin
  CommonApplication := Application;
  CommonGrid := MainGrid;
  SBTranslateProc.TranslateAllCompForms(Self, sboapiDataModule.OrPack_SL);
end;

procedure TDepozitFrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = 27 then
    close;
end;

procedure TDepozitFrm.FormShow(Sender: TObject);
begin
 with DataModPCustService, DepozDset do
  begin
    close;
   SetVariable('CUSTID',tacc);
    open;
  end;
end;

procedure TDepozitFrm.MainGridTitleClick(Column: TXColumn);
begin
  with DataModPCustService, DepozDset do
  begin
    close;
    if Column.Title.MarkerIndex = 2 then
      SetVariable('OrderField', Column.FieldName + ' ' + 'ASC')
    else
      SetVariable('OrderField', Column.FieldName + ' ' + 'DESC');
    open;
  end;
end;

procedure TDepozitFrm.TimerButtonClick(Sender: TObject);
begin
  LoadPlugin('NewDepositsExtractMoney.bpl', '');
end;

procedure TDepozitFrm.XFButton1Click(Sender: TObject);
begin
  LoadPlugin('NewDepositsContract.bpl', 'EditContract');
end;

procedure TDepozitFrm.XFButton2Click(Sender: TObject);
begin
  LoadPlugin('NewDepositsApplyMoney.bpl', '');
end;

procedure TDepozitFrm.XFButton3Click(Sender: TObject);
begin
  LoadPlugin('NewDepositsWreport.bpl', '');
end;

procedure TDepozitFrm.XFButton4Click(Sender: TObject);
begin
  LoadPlugin('NewDepositsContract.bpl', 'InsertContract');
end;

end.
