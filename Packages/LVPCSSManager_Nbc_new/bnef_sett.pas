unit bnef_sett;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Data_Unit, Menus, StdCtrls, ExtCtrls, Grids, DBGrids;

type
  TBn_Sett = class(TForm)
    grid_opcodes: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    PopupMenu1: TPopupMenu;
    S1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure grid_opcodesTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Bn_Sett: TBn_Sett;

implementation

{$R *.dfm}

procedure TBn_Sett.Button1Click(Sender: TObject);
var value1,value2 : string;
begin
InputQuery('Əməliyyat Kodları', 'Əməliyyatın kodu', value1)  ;
InputQuery('Əməliyyat Təsnifatı', 'Əməliyyat Təsnifatı', value2)  ;


datamod.bn_package.CallProcedure('bn_opcodes_ins',[value1,value2]);
ShowMessage('Əməliyyatın kodu və təsnifatı əlavə olundu');
grid_opcodes.DataSource.DataSet.Refresh;

end;

procedure TBn_Sett.FormActivate(Sender: TObject);
begin
DataMod.opcodes.CloseAll;
DataMod.opcodes.open;
end;

procedure TBn_Sett.grid_opcodesTitleClick(Column: TColumn);
var
   TitleName :string;
   SortPosition: word;
begin
try
begin

DataMod.opcodes.sql[3]:='';
 if Column.Field.Calculated then Exit;
  Screen.Cursor := crSQLWait;
  TitleName :=Column.FieldName;
  try
   with DataMod.opcodes do
    begin
    close;
    sql[3]:='order by  a.'+TitleName;
     //Refresh;
     open;
    end;
  finally
   Screen.Cursor := crDefault;
  end;
end;
except
on e:Exception do
    ShowMessage(e.Message);

end;

end;

procedure TBn_Sett.S1Click(Sender: TObject);
begin
 case MessageDlg('Əməliyyat Kodu silinsin ?', mtConfirmation,[mbyes,mbno], 0) of
                   mryes: begin
                     datamod.bn_package.CallProcedure('bn_opcodes_del',[grid_opcodes.DataSource.DataSet.fieldbyName('id').asinteger]);
                   end;
 end;
 grid_opcodes.DataSource.DataSet.Refresh;
end;

end.
