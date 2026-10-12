unit RezImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, DBGridEhGrouping, GridsEh,
  DBGridEh;

type
  TRezFrm = class(TForm)
    DBNavigator1: TDBNavigator;
    DBGridEh1: TDBGridEh;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RezFrm: TRezFrm;

implementation
  uses DmImpl;
{$R *.dfm}

procedure TRezFrm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize:=false;
end;

procedure TRezFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
GurDm.OracleDataSet2.Open;
GurDm.MainDSetREZERVEAMMOUNT.AsFloat:= GurDm.OracleDataSet2.FieldByName('AMMOUNT').AsFloat;
GurDm.OracleDataSet2.close;
end;

end.
