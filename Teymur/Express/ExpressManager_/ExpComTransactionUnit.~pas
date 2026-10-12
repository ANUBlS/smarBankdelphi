unit ExpComTransactionUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, ComCtrls, DBCtrls, StdCtrls,Db;

type
  TExpComTransactionForm = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    StatusBar1: TStatusBar;
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ExpComTransactionForm: TExpComTransactionForm;

implementation
uses ExpDataModuleUnit;

{$R *.DFM}

procedure TExpComTransactionForm.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button=nbpost then   ExpDataModule.ExpComissionDataSet.Refresh;
end;
procedure TExpComTransactionForm.DBGrid2KeyPress(Sender: TObject;
  var Key: Char);
begin
   with ExpDataModule,ExpComissionDataSet do
   begin
     if UpdateStatus in [usInserted, usModified] then
     begin
       if DBGrid2.SelectedIndex = 2 then
       begin
         if FieldByName('amount').AsFloat>0 then FieldByName('percent').AsFloat:= 0; end
         else if DBGrid2.SelectedIndex = 3 then  FieldByName('amount').AsFloat:= 0;
       end;
     end;
   end;

end.
