unit AddHolidayLmpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, DBCtrls, DBGridEh, StdCtrls, Buttons;

type
  TAddHoliday = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBNavigator2: TDBNavigator;
    DBGridEh1: TDBGridEh;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddHoliday: TAddHoliday;

implementation

uses CalendarDatamodLmpl,sboapiDataModuleImpl,SBTranslateProc;
{$R *.DFM}

procedure TAddHoliday.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self, sboapiDataModule.OrPack_SL);
CalendarDataMod.OracleDataSet3.open;


end;

procedure TAddHoliday.BitBtn1Click(Sender: TObject);
var
bb:Tdatetime;
cc:string;
begin


CalendarDataMod.OraclePackage1.CallProcedure('add_calendar_stand',[]) ;
CalendarDataMod.OracleDataSet1.refresh;
end;

end.
