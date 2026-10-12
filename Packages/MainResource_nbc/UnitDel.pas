unit UnitDel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, CMExcelExport, Grids, DBGrids;

type
  TFrmDel = class(TForm)
    Label1: TLabel;
    DTPDel: TDateTimePicker;
    BitDel: TBitBtn;
    ProgressBar1: TProgressBar;
    CMExcelExport1: TCMExcelExport;
    DBGrid2: TDBGrid;
    procedure BitDelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDel: TFrmDel;

implementation

uses MainResourceImpl, UnitData;

{$R *.DFM}

procedure TFrmDel.BitDelClick(Sender: TObject);
  var v_del_date :TDateTime;
begin

  v_del_date:= Integer(Trunc(DTPDel.DateTime));


    with DataModWares.ODSDel do begin
          Close;
          SetVariable('del_date',v_del_date);
          Open;

  end;

          with CMExcelExport1 do
   begin
      Connect;
      ExportDataset( DataModWares.ODSDel,'Silinenler',True);
      Disconnect;

   end;
end;

end.
