unit Uniybuysellwares;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, ImgList, ToolWin, Grids, DBGrids;

type
  TFormbuysellwares = class(TForm)
    ImageList1: TImageList;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    RadioGroup1: TRadioGroup;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    procedure RadioGroup1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formbuysellwares: TFormbuysellwares;
    vbyors :integer;
implementation

uses UnitDat, UnitData;


{$R *.dfm}

procedure TFormbuysellwares.RadioGroup1Click(Sender: TObject);
begin
case RadioGroup1.ItemIndex of
    0:
      begin
                  DataModWares.OracleDatabuy.Close;
                  DataModWares.OracleDatabuy.Open;
                 DBGrid1.DataSource:=DataModWares.DataSourcebuy;
                 DataModWares.OracleDatabuy.Refresh;
                 vbyors:= 0;
      end;

    1:
      begin
        DataModWares.OracleDataSetsell.Close;
                  DataModWares.OracleDataSetsell.Open;
                 DBGrid1.DataSource:=DataModWares.DataSourcesell;
                 DataModWares.OracleDataSetsell.Refresh;
                 vbyors:= 1;
      end;

end;
end;

procedure TFormbuysellwares.ToolButton1Click(Sender: TObject);
VAR AmountStr: string;
  v_amount: DOUBLE;
begin


  AmountStr := InputBox('Məbləğ Daxil edin',
                        '',
                        '0');

  if (AmountStr = '') or  (AmountStr = '0') then
  begin
    ShowMessage('Məbləğ daxil edilməyib!!!!');
    Exit;
  end
   ELSE

   if not TryStrToFloat(AmountStr, v_amount) then
   begin
            ShowMessage('Məbləğ daxil edilməyib!!!!');
    Exit;
   end else
   DataModWares.SB_MAIN_RESOURCE.CallProcedure('settransaction_buy_sell',[
                           DBGrid1.DataSource.DataSet.FieldByName('wares_id').AsInteger,
                        v_amount,
                        vbyors

                  ]);


end;

end.
