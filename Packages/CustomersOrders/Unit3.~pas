unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Grids, DBGrids, ExtCtrls;

type
  Tall_orders = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    searchbox: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  all_orders: Tall_orders;

implementation

uses CustomersordersImpl1, CustomersordersProj1_TLB, Unit4;

{$R *.DFM}

procedure Tall_orders.SpeedButton3Click(Sender: TObject);
begin



   if searchbox.Visible=false then
     searchbox.Visible:=true else
     searchbox.Visible:=false    ;
end;

end.
