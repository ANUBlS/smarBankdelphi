unit FDATE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, LDialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls,sboapiDataModuleImpl, Db,
  OracleData;

type
  TFORMDATE = class(TForm)
    Panel1: TPanel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    OracleDataSet1: TOracleDataSet;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FORMDATE: TFORMDATE;

implementation
uses Data_Unit;
{$R *.DFM}

procedure TFORMDATE.BitBtn2Click(Sender: TObject);
begin
  FORMDATE.Close;
end;

procedure TFORMDATE.BitBtn1Click(Sender: TObject);
var
    date1, date2: TDateTime;
    ferq: Integer;
begin
  

date1 := DateTimePicker1.DateTime;
date2 := DateTimePicker2.DateTime;
ferq := trunc(date1) - trunc(date2);


  IF ferq<0 then begin
                        ShowMessage('Ê‏שםÿ עאנטץÿ הÿיטרלÿך מכלאח');
                        exit;
                      end;


 DataMod.Ins.CallProcedure('xs_change_date',[DataMod.XS_BATCHS.fieldbyname('ID').asinteger,date1]);
 formdate.Close;
 DataMod.XS_BATCHS.Refresh;
 DataMod.XS_BENEFICIARY.Refresh;
end;

procedure TFORMDATE.FormCreate(Sender: TObject);
begin
  OracleDataSet1.open;
  DateTimePicker1.DateTime:=OracleDataSet1.fieldbyname('tek_dat').AsDateTime;
  DateTimePicker2.DateTime:=OracleDataSet1.fieldbyname('tek_dat').AsDateTime;
end;

procedure TFORMDATE.FormDestroy(Sender: TObject);
begin
  OracleDataSet1.close;
end;

end.
