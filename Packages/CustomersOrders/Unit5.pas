unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Grids, DBGrids, ExtCtrls;

type
  Tarxiv_orders = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    searchbox: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    DBGrid1: TDBGrid;
    Edit5: TEdit;
    procedure SpeedButton3Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  arxiv_orders: Tarxiv_orders;

implementation

{$R *.DFM}

procedure Tarxiv_orders.SpeedButton3Click(Sender: TObject);
begin



  if searchbox.Visible=false then
  begin

     dbgrid1.Height:=dbgrid1.Height-36;
     searchbox.Visible:=true end else
    begin
     searchbox.Visible:=false    ;
     dbgrid1.Height:=dbgrid1.Height+36;
     end;

end;

procedure Tarxiv_orders.Edit1Exit(Sender: TObject);
begin
  (Sender as tedit).text :='';
end;

procedure Tarxiv_orders.Edit1Change(Sender: TObject);
begin
 { if noedit.Text<>'' then
 datamodule1.arxiv_order.Locate
  ('pnum',noedit.Text,[]);
       DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
}       

end;

procedure Tarxiv_orders.Edit2Change(Sender: TObject);
begin
 {  if innedit.Text<>'' then
 datamodule1.arxiv_order.Locate
  ('acc_inn',innedit.Text,[]);
       DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
       }
       end;


procedure Tarxiv_orders.Edit3Change(Sender: TObject);
begin
   {if nameedit.Text<>'' then
 datamodule1.arxiv_order.Locate
  ('c_name',nameedit.Text,[]);
       DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
    }
end;

end.
