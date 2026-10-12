unit UMKAccesories;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, DBCtrls, StdCtrls, Buttons, DB;

type
  TfrmAccessories = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    DBNavigator2: TDBNavigator;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAccessories: TfrmAccessories;

implementation

uses UMKDataMod, UMKBlank;

{$R *.DFM}

procedure TfrmAccessories.BitBtn1Click(Sender: TObject);
begin
  with InsMKDataMod, ODSAccessories do
     if State in [dsEdit, dsInsert] then
     begin
        ODSAccessoriesCid.Value:=ODSMotorKaskoID.Value;
        Post;
     end;
end;

end.
